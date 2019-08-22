require "heiseirb_api_client/core"

module HeiseirbApiClient
  class Example < Core
    
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

    def get_users(page = 1)
      response = @conn.get do |req|
        req.url '/client/users'
        req.headers = HEADRS
        req.params['page'] = page
      end
      response.body
    end

    def create_user(name, email, role, password)
      response = @conn.post do |req|
        req.url '/client/users'
        req.headers = HEADRS
        req.body = {
          user: {
            name: name,
            email: email,
            role: role,
            password: password,
            password_confirmation: password
          }
        }
      end
      response.body
    end

    def delete(type, id)
      response = @conn.delete do |req|
        req.url "/client/#{type}/#{id}"
        req.headers = HEADRS
      end
      response.status
    end
  end
end
