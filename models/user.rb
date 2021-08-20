require './db/db_connector'

class User
  attr_accessor :id, :username, :email, :bio, :post

  def initialize(param)
    @id = param[:id]
    @username = param[:username]
    @email = param[:email]
    @bio = param[:bio]
    @post = []
  end

  def self.get_all_user
    client = connect_database
    user = client.query("select * from user")
    convert_sql_to_json(user)
  end

  def self.get_user_by_id(id)
    client = connect_database
    begin
      user = client.query("select * from user where id=#{id}")
      convert_sql_to_json(user)
    rescue
      {
        :"message" => "No user found"
      }
    end
  end


  def self.update_user(param)
    client = connect_database
    id = param['id'].to_i
    username = param['username'].to_s
    email = param['email'].to_s
    bio = param['bio'].to_s
    client.query("update user set username='#{username}',email='#{email}',bio='#{bio}' where id=#{id}")
    true
  end

  def self.delete(id)
    client = connect_database
    client.query("delete from user where id=#{id.to_i}")
  end

  def self.convert_sql_to_json(result)
    users = Array.new
    result.each do |data|
      user = User.new({
                        id: data['id'],
                        username: data['username'],
                        email: data['email'],
                        bio: data['bio']
                      })
      users << user
    end
    to_json(users)
  end

  def self.to_json(result)
    data = Hash.new
    users = []
    result.each do |data|
      hash = {}
      hash[:id] = data.id
      hash[:username] = data.username
      hash[:email] = data.email
      hash[:bio] = data.bio
      users << hash
    end
    if result.length > 1
      data[:user] = users
    else
      data[:user] = users.first
    end
    data
  end

  def save
    return false unless valid?
    client = connect_database
    begin
      client.query("insert into user(username,email,bio) value('#{@username}','#{@email}','#{@bio}')")
      true
    rescue StandardError
      false
    end
  end

  def valid?
    return false if @username.nil?
    return false if @email.nil?
    return false if @bio.nil?
    true
  end
end
