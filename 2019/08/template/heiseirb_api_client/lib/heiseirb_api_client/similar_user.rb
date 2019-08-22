require "heiseirb_api_client/core"

module HeiseirbApiClient
  class SimilarUser < Core
    
    def initialize
      @conn = Faraday.new(url: URL)  do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end

    def similar_users(user_id, limit = 3)
      event_schedule_ids = fetch_event_schedule_ids_by_target_user(user_id)
      similar_user_ids = []
      event_schedule_ids.each do |id|
        response = @conn.get do |req|
          req.url "/client/event_schedules/#{id}"
          req.headers = HEADRS
        end
        similar_user_ids.concat(response.body['data']['attributes']['users']['confirmed_user_ids'])
      end
      puts limit
      puts similar_user_ids.tally.invert.sort {|a, b| b <=> a }.reject {|_key, value| value == user_id }.map {|_key, value| value}
      similar_user_ids.tally.invert.sort {|a, b| b <=> a }.reject {|_key, value| value == user_id }.map {|_key, value| value}.take(limit)
    end

    private
    def fetch_event_schedule_ids_by_target_user(user_id)
      response = @conn.get do |req|
        req.url "/client/users/#{user_id}"
        req.headers = HEADRS
      end

      response.body["data"]["relationships"]["join_schedules"]["data"].map {|es| es["id"].to_i }
    end
  end
end
