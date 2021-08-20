require './db/db_connector'

class Post
  attr_accessor :id, :caption, :attachment, :user_id, :date_created
  def initialize(param)
    @id = param[:id]
    @caption = param[:caption]
    @attachment = param[:attachment]
    @user_id = param[:user_id]
    @date_created = param[:date_created]
  end

  def save
    client = connect_database
    begin
      if @attachment.nil?
        client.query("insert into post(caption,user_id) value('#{@caption}',#{@user_id})")
      else
        client.query("insert into post(caption,attachment,user_id) value('#{@caption}','#{@attachment}',#{@user_id})")
      end
      if 200
        {
          "success" => true,
          "message" => "Success Add Data"
        }.to_json
      end
    rescue StandardError
      {
        "success" => false ,
        "message" => "Cant find user id"
      }.to_json
    end
  end

  def self.get_post
    client = connect_database
    post = client.query("select * from post")
    convert_sql_to_json(post)
  end

  def self.get_post_by_user_id(id)
    puts id
    client = connect_database
    post = client.query("select * from post where user_id=#{id}")
    convert_sql_to_json(post)
  end

  def self.convert_sql_to_json(result)
    users = Array.new
    result.each do |data|
      user = Post.new({
                        id: data['id'],
                        caption: data['caption'],
                        attachment: data['attachment'],
                        user_id: data['user_id'],
                        date_created: data['date_created']
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
      hash[:caption] = data.caption
      hash[:attachment] = data.attachment
      hash[:user_id] = data.user_id
      hash[:date_created] = data.date_created
      users << hash
    end
    if result.length > 1
      data[:post] = users
    else
      data[:post] = users.first
    end
    data
  end

  def valid
    return false if @caption.nil?
    return false if @user_id.nil?
    true
  end
end