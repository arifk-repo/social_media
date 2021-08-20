require './db/db_connector'

class Comment
  attr_accessor :id, :id_post, :username, :comment, :date_created, :attachment, :hashtag

  def initialize(param)
    @id = param[:id]
    @id_post = param[:id_post]
    @username = param[:username]
    @comment = param[:comment]
    @attachment = param[:attachment]
    @hashtag = param[:hashtag]
    @date_created = param[:date_created]
  end

  def save
    return false unless valid?
    client = connect_database
    begin
      if @attachment.nil?
        if @hashtag.nil?
          client.query("insert into comment(id_post,username,comment) value(#{@id_post},'#{@username}','#{@comment}')")
        else
          client.query("insert into comment(id_post,username,comment,hashtag) value(#{@id_post},'#{@username}','#{@comment}','#{@hashtag.downcase}')")
        end
      else
        if @hashtag.nil?
          client.query("insert into comment(id_post,username,comment,attachment) value(#{@id_post},'#{@username}','#{@comment}','#{@attachment}')")
        else
          client.query("insert into comment(id_post,username,comment,attachment,hashtag) value(#{@id_post},'#{@username}','#{@comment}','#{@attachment}','#{@hashtag.downcase}')")
        end
      end
      if 200
        {
          "success" => true,
          "message" => "Success Add Data"
        }.to_json
      end
    rescue StandardError
      {
        "success" => false,
        "message" => "Cant find user id"
      }.to_json
    end
  end

  def self.get_comment_by_hashtag(hashtag)
    client = connect_database
    post = client.query("select * from comment where hashtag='#{hashtag}'")
    convert_sql_to_json(post)
  end

  def self.convert_sql_to_json(result)
    comments = Array.new
    result.each do |data|
      user = Comment.new({
                        id: data['id'],
                        id_post: data['id_post'],
                        username: data['username'],
                        comment: data['comment'],
                        attachment: data['attachment'],
                        hashtag: data['hashtag'],
                        date_created: data['date_created']
                      })
      comments << user
    end
    to_json(comments)
  end

  def self.to_json(result)
    data = Hash.new
    posts = []
    result.each do |data|
      hash = {}
      hash[:id] = data.id
      hash[:id_post] = data.id_post
      hash[:username] = data.username
      hash[:comment] = data.comment
      hash[:attachment] = data.attachment
      hash[:hashtag] = data.hashtag
      hash[:date_created] = data.date_created
      posts << hash
    end
    if result.length > 1
      data[:comment] = posts
    else
      data[:comment] = posts.first
    end
    data
  end

  def valid?
    return false if @username.nil?
    return false if @id_post.nil?
    return false if @comment.nil?
    true
  end

end