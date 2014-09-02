require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require './config/environments'
require './models'

# {
#     collection: {
#         href: "http://mytodoapp.com/todos",
#         items: [
#             {
#                 href: "/todos/yours/abc123",
#                 data: [
#                     {
#                         name: "title",
#                         value: "Get organized"
#                     },
#                     {
#                         name: "status",
#                         value: "incomplete"
#                     }
#                 ]
#             },
#             {
#                 href: "/todos/xyz456",
#                 data: [
#                     {
#                         name: "title",
#                         value: "eat more steak"
#                     },
#                     {
#                         name: "status",
#                         value: "complete"
#                     }
#                 ]
#             },
#         ],
#         template: {
#             data: [
#                 {
#                     prompt: "What needs doing?",
#                     name: "title",
#                     value: ""
#                 }
#             ]
#         }
#     }
# }

# To do (heh):
# * Content negotiation: https://github.com/mbklein/rack-conneg
# * Custom MIME types: http://stackoverflow.com/questions/3309752

get '/todos' do
    # Just collection+json for now.
    todos = Todo.order("created_at DESC")
    representation = {
        collection: {
            href: "http://mytodoapp.com/todos",
            items: generate_items(todos),
            template: resource_template()
        }
    }
    response.headers["Content-Type"] = "application/vnd.collection+json;profile=http://www.michaelharrison.ws/todoapi/profile.alps.xml"
    JSON.generate(representation)

end

# To do
# * Work out how a detail view should work

get "/todos/:todo_id" do
    todo = Todo.find(todo_id)
    todo
end

post '/todos' do
    request_body = JSON.parse request.body.read
    attributes = request_body["template"]["data"]
    title_attr = attributes.detect {|a| a["name"] == "title"}
    Todo.create(value: title_attr["value"], completed: false)

    redirect "/todos"
end

get '/hi' do
  "Hello World!"
end

def resource_template
    {
        data: [
            {
                prompt: "What needs doing?",
                name: "title",
                value: ""
            }
        ]
    }
end

def generate_items(models)
    models.map do |model|
        {
            href: "/todos/#{model.id}",
            data: [
                {
                    name: "title",
                    value: "#{model.value}"
                },
                {
                    name: "status",
                    value: model.completed ? "complete" : "incomplete"
                }
            ]
        }
    end
end

after do
    # Close the connection after the request is done so that we don't
    # deplete the ActiveRecord connection pool.
    ActiveRecord::Base.connection.close
end
