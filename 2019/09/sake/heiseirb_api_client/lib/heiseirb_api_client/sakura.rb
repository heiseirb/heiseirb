require "heiseirb_api_client/core"

module HeiseirbApiClient
  class Sakura < Core
    def initialize
      @conn = Faraday.new(url: URL) do |config|
        config.request :json
        config.response :json
        config.adapter Faraday.default_adapter
      end
    end

    def create_sakura(num)
      num.times do |i|
        Thread.new do
          randam = SecureRandom.hex(i)
          name = "tashiro_#{randam}"
          email = "example-#{randam}@gmail.com"
          role = "owner"
          password = "hogehoge#{randam}"
          HeiseirbApiClient::User.new.create_user(name, email, role, password)
        end
      end
    end
  end
end