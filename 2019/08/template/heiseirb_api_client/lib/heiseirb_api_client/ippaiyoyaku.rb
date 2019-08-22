require "heiseirb_api_client/core"

module HeiseirbApiClient
  class Ippaiyoyaku < Core

    def initialize
      @conn = Faraday.new(url: URL)  do |config|
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

    def ippaiyoyaku(yoyaku_count: 10, event_schedule_id: 2532)
      yoyaku_count.times do
        @conn.post do |req|
          req.url "/client/event_schedules/#{event_schedule_id}/lottery"
          req.headers = HEADRS
        end
      end
    end

    def ippaimoushikomi(moushikomi_count: 10, event_schedule_id: 2532)
      moushikomi_count.times do
        @conn.post do |req|
          req.url "/client/event_schedules/#{event_schedule_id}/apply"
          req.headers = HEADRS
        end
      end
    end
  end
end
