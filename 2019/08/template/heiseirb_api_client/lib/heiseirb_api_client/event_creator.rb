require "heiseirb_api_client/core"

module HeiseirbApiClient
  class EventCreator < Core

    def initialize
      @conn = Faraday.new(url: URL)  do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end


    def post_events(user_id:, place:, description:, start_date:, capacity:, times = 1)
      @user_id = user_id
      @place = place
      @description = description
      @start_date = start_date
      @capacity = capacity
      @times = times

      validate_request
      post
    end

    private

    attr_reader :user_id, :place, :description, :start_date, :capacity, :times

    def validate_request
    end

    def post
      post_event
      post_event_schedules
    end

    def post_event
      response = @conn.post do |req|
        req.url '/client/events'
        req.headers = HEADRS
        req.body = {
          event: {
            owner_id: owner_id,
            place: place,
            description: description
          }
        }
      end
      response.body
    end

    def post_event_schedules
      # TODO: dates.map do |date|
      times.time do |i|
        @conn.post do |req|
          req.url '/client/post_event_schedules'
          req.headers = HEADRS
          req.body = {
            event_schedule: {
              # TODO: event_idはpost_eventから取得
              event_id: event_id,
              date: date,
              capacity: capacity
            }
          }
        end
      end
    end
  end
end
