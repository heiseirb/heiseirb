require 'faraday'
require 'faraday_middleware'
require 'json'
# faradayの使い方はこちら
# https://www.rubydoc.info/gems/faraday

module HeiseirbApiClient
  class Core
    API_TOKEN = '4D6(E7{zeeKkfu;'
    API_SECRET_TOKEN = 'password'
    URL = 'https://heiseirb-demo-api.herokuapp.com'
    HEADRS = {
      'Content-Type' => 'application/json',
          'X-Token' => API_TOKEN,
          'X-TokenSecret' => API_SECRET_TOKEN,
    }

    class Error < StandardError; end
  end
end