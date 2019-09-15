require "heiseirb_api_client/core"

module HeiseirbApiClient
  class Curry < Core
    def initialize
      @conn = Faraday.new(url: URL)  do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end

    def create_user(name, email, role, password)
      name += '_カレー大好き♡'
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

    def create_event(owner_id, place, description)
      description += '_カレー大好き♡'
      place += '_インド♡'
      response = @conn.post do |req|
        req.url '/client/events'
        req.headers = HEADRS
        req.body = {
          event: {
            owner_id: owner_id,
            place: place,
            description: description,
          }
        }
      end
      response.body
    end

    def every_body_user_love_curry
      page = 1
      while true do
        response = get_users(page)
        data = response["data"]

        break if data.empty?

        data.each do |user|
          id   = user["id"]
          attributes = user['attributes']
          name = attributes["name"]
          email = attributes['email']
          role = attributes['role']
          edit_user_curry(id, name, email, role, 'ILoveCurry')
        end

        page += 1
        end
    end

    def edit_user_curry(id, name, email, role, password)
      name += '_カレー大好き♡'
      response = @conn.patch do |req|
        req.url "/client/users/#{id}"
        req.headers = HEADRS
        req.body = {
          user: {
            name: name,
            email: email,
            role: role,
            password: password
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
