require './db/db_connector'

class Post
  attr_accessor :id, :caption, :attachment, :user_id, :date_created, :hashtag
  def initialize(param)
    @id = param[:id]
    @caption = param[:caption]
    @attachment = param[:attachment]
    @user_id = param[:user_id]
    @date_created = param[:date_created]
    @hashtag = param[:hashtag]
  end

  def save
    return false unless valid?
    client = connect_database
    begin
      if @attachment.nil?
        if @hashtag.nil?
          client.query("insert into post(caption,user_id) value('#{@caption}',#{@user_id})")
        else
          client.query("insert into post(caption,user_id,hashtag) value('#{@caption}',#{@user_id},'#{@hashtag.downcase!}')")
        end
      else
        if @hashtag.nil?
          client.query("insert into post(caption,attachment,user_id) value('#{@caption}','#{@attachment}',#{@user_id})")
        else
          client.query("insert into post(caption,attachment,user_id,hashtag) value('#{@caption}','#{@attachment}',#{@user_id},'#{@hashtag.downcase!}')")
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

  def self.get_trendings
    client = connect_database
    trending = client.query("SELECT COUNT(hashtag) as total, hashtag FROM(SELECT hashtag FROM post WHERE hashtag IS NOT NULL UNION ALL SELECT hashtag FROM comment WHERE hashtag IS NOT NULL) as hashtag GROUP BY hashtag ORDER BY hashtag LIMIT 5")
    posts = []
    data = Hash.new
    trending.each do |data|
      hash = {}
      hash[:count_tweet] = data['total']
      hash[:hashtag] = data['hashtag']
      posts << hash
    end
    data[:status] = "Five Trending Hashtag"
    data[:trendings] = posts
    data.to_json
  end

  def self.get_post_by_hashtag(hashtag)
    client = connect_database
    post = client.query("select * from post where hashtag='#{hashtag}'")
    convert_sql_to_json(post)
  end

  def self.get_post_by_user_id(id)
    client = connect_database
    post = client.query("select * from post where user_id=#{id}")
    convert_sql_to_json(post)
  end

  def self.convert_sql_to_json(result)
    posts = Array.new
    result.each do |data|
      user = Post.new({
                        id: data['id'],
                        caption: data['caption'],
                        attachment: data['attachment'],
                        user_id: data['user_id'],
                        date_created: data['date_created']
                      })
      posts << user
    end
    to_json(posts)
  end

  def self.to_json(result)
    data = Hash.new
    posts = []
    result.each do |data|
      hash = {}
      hash[:id] = data.id
      hash[:caption] = data.caption
      hash[:attachment] = data.attachment
      hash[:user_id] = data.user_id
      hash[:date_created] = data.date_created
      posts << hash
    end
    if result.length > 1
      data[:post] = posts
    else
      data[:post] = posts.first
    end
    data
  end

  def valid?
    return false if @caption.nil?
    return false if @user_id.nil?
    true
  end
end