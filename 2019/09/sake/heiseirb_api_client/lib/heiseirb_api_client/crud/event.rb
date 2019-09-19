require "heiseirb_api_client/core"
require "date"

module HeiseirbApiClient
  class Event < Core
    def initialize
      @conn = Faraday.new(url: URL) do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end

    def get_events(page = 1)
      response = @conn.get do |req|
        req.url '/client/events'
        req.headers = HEADRS
        req.params['page'] = page
      end
      response.body
    end

    def get_event(event_id)
      response = @conn.get do |req|
        req.url "/client/events/#{event_id}"
        req.headers = HEADRS
      end
      response.body
    end

    def post_events(user_id:, place:, description:, start_date:, capacity:, times: 1)
      # ok
      # def post_events(user_id: 136, place: "medpeer", description: "happy hack!", start_date: "2019-08-22", capacity: 10000, times: 1)

      # def post_events(user_id: 136, place: "medpeer", description: "happy hack!", start_date: "neko-chan", capacity: 10000, times: 1)
      # def post_events(user_id: 136, place: "medpeer", description: "happy hack!", start_date: "2019-08-22", capacity: 10000, times: -1)
      @user_id = user_id
      @plac = place
      @description = description
      @start_date = start_date
      @capacity = capacity
      @times = times

      validate_request!
      post
    end

    private

    attr_reader :user_id, :place, :description, :start_date, :capacity, :times

    def validate_request!
      # 変な日付
      Date.parse(start_date)
      # 変な件数
      raise ArgumentError if (0..10).include?(times)

      response = @conn.get do |req|
        req.url "/client/users/#{user_id}"
        req.headers = HEADRS
      end
      # テメェはオーナーなのか！！
      raise ArgumentError if response.body["data"]["attributes"]["role"] != 'owner'

      # TODO: user_id のバリデーション
    end

    def post
      response = post_event
      post_event_schedules(event_id: response["data"]["id"])
    end

    def post_event
      response = @conn.post do |req|
        req.url "/client/events"
        req.headers = HEADRS
        req.body = {
          event: {
            owner_id: user_id,
            place: place,
            description: description,
          },
        }
      end
      response.body
    end

    def post_event_schedules(event_id:)
      responses = []

      times.times do |i|
        responses.push @conn.post do |req|
          req.url "/client/post_event_schedules"
          req.headers = HEADRS
          req.body = {
            event_schedule: {
              event_id: event_id,
              date: Date.parse(start_date) + i * 7,
              capacity: capacity,
            },
          }
        end
      end

      responses
    end
  end
end
