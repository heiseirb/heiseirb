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

    def similar_users(user_id)

    end
  end
end
