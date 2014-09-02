require "test_helper"

class TestGetTodos < Minitest::Test
    include Rack::Test::Methods

    def setup
        DatabaseCleaner.start
        Todo.create({ description: "To do first", completed: false })
        Todo.create({ description: "To do second", completed: false })
    end

    def teardown
        DatabaseCleaner.clean
    end

    def app
        Sinatra::Application
    end

    def test_endpoint_ok
        get '/todos'
        assert last_response.ok?
    end

    def test_endpoint_contains_todos
        get '/todos'
        response_json = JSON.parse(last_response.body)
        assert_equal 2, response_json["collection"]["items"].length
    end

end
