require 'sinatra'
require 'sinatra/activerecord'
require 'json'

require './config/environments'

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


get '/todos' do
    response.headers["Content-Type"] = "application/vnd.collection+json;profile=http://www.michaelharrison.ws/todoapi/profile.alps.xml"
    JSON.generate({
    collection: {
        href: "http://mytodoapp.com/todos",
        items: [
            {
                href: "/todos/yours/abc123",
                data: [
                    {
                        name: "title",
                        value: "Get organized"
                    },
                    {
                        name: "status",
                        value: "incomplete"
                    }
                ]
            },
            {
                href: "/todos/xyz456",
                data: [
                    {
                        name: "title",
                        value: "eat more steak"
                    },
                    {
                        name: "status",
                        value: "complete"
                    }
                ]
            },
        ],
        template: {
            data: [
                {
                    prompt: "What needs doing?",
                    name: "title",
                    value: ""
                }
            ]
        }
    }
})

end
get '/hi' do
  "Hello World!"
end

after do
    # Close the connection after the request is done so that we don't
    # deplete the ActiveRecord connection pool.
    ActiveRecord::Base.connection.close
end
