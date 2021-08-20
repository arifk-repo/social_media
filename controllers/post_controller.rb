require './models/post'

class PostController
  def check_hashtag(hastag)
    str = hastag.split(" ")
    data = str.select{|food| food.match(/^#/)}
    data
  end

  def create_post(param)
    hashtag = check_hashtag(param[:caption])
    if param['file'].nil?
      if hashtag.length>0
        post = Post.new({
                          caption: param['caption'],
                          user_id: param['user_id'],
                          hashtag: hashtag[0]
                        })
      else
        post = Post.new({
                          caption: param['caption'],
                          user_id: param['user_id']
                        })
      end
    else
      if hashtag.length>0
        post = Post.new({
                          caption: param['caption'],
                          attachment: "./media/#{param[:file][:filename]}",
                          user_id: param['user_id'],
                          hashtag: hashtag[0]
                        })
      else
        post = Post.new({
                          caption: param['caption'],
                          attachment: "./media/#{param[:file][:filename]}",
                          user_id: param['user_id']
                        })
      end
      @filename = param[:file][:filename]
      file = param[:file][:tempfile]
      File.open("./media/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
    end
    post.save
  end

  def get_post_by_hashtag(hashtag)
    data = Hash.new
    posts = Post.get_post_by_hashtag(hashtag)
    comments = Comment.get_comment_by_hashtag(hashtag)
    data[:hashtag] = hashtag
    data[:posts] = posts[:post]
    data[:comments] = comments[:comment]
    data.to_json
  end

  def get_trendings
    trendings = Post.get_trendings
    trendings
  end

  def get_all_post
    post = Post.get_post
  end

  def get_post_by_user(id)
    post = Post.get_post_by_user_id(id)
  end
end
