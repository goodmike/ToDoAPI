configure :development, :production do
    db = URI.parse(ENV['DATABASE_URL'])
    ActiveRecord::Base.establish_connection(
       :adapter  => 'postgresql',
       :host     => db.host,
       :username => db.user,
       :password => db.password,
       :database => db.path[1..-1],
       :encoding => 'utf8'
     )
end

configure :test do
    db = URI.parse(ENV['TEST_DATABASE_URL'])
    ActiveRecord::Base.establish_connection(
       :adapter  => 'postgresql',
       :host     => db.host,
       :username => db.user,
       :password => db.password,
       :database => db.path[1..-1],
       :encoding => 'utf8'
     )
end

