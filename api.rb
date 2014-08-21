require 'sinatra'
require 'json'

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
