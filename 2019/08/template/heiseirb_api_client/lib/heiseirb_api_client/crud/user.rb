require "heiseirb_api_client/core"
require "securerandom"
require "heiseirb_api_client/models/user"
require 'json'

module HeiseirbApiClient
  class User < Core
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

    def get_event(event_id)
      response = @conn.get do |req|
        req.url "/client/events/#{event_id}"
        req.headers = HEADRS
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

    def get_user(user_id)
      response = @conn.get do |req|
        req.url "/client/users/#{user_id}"
        req.headers = HEADRS
      end
      User.new(response.body['data']['attributes'])
    end

    def update_user(user_id, params: {})
      response = @conn.patch do |req|
        req.url "/client/users/#{user_id}"
        req.headers = HEADRS
        req.body = {
          user: {
            name: "hogehgoe",
            password: "password",
            password_confirmation: "password"
          }
        }
      end
      puts response
      # User.new(response.body['data']['attributes'])
      response.body
    end

    def bulk_create_users(num)
      num.times do
        Thread.new do
          num.times do |i|
            randam = SecureRandom.hex(i)
            name = "tashiro_#{randam}"
            email = "example-#{randam}@gmail.com"
            role = "owner"
            password = "hogehoge#{randam}"
            create_user(name, email, role, password)
          end
        end
      end
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
