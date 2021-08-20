require 'mysql2'

def connect_database
  Mysql2::Client.new(
    host: 'localhost',
    username: ENV['DB_USERNAME'],
    password: '',
    database: ENV['DB_NAME']
  )
end
