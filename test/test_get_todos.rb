require "minitest/autorun"
require "./api"
require "rack/test"

class TestGetTodos < Minitest::Test
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_endpoint_ok
        get '/todos'
        assert last_response.ok?
    end

end
