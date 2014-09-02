require "minitest/autorun"
require "./api"
require "rack/test"

class TestGetTodos < Minitest::Test
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_post_with_params_ok
        to_do_value = "Random String TBD"
        params = { "template" => { "data" => [
            {
                "name" => "title",
                "value" => to_do_value
            }
        ]}}
        post "/todos", JSON.dump(params)
        follow_redirect!

        assert last_response.ok?
    end

end

