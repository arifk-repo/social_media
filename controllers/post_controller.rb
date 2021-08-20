require './models/post'

class PostController
  def create_post(param)
    if param['file'].nil?
      post = Post.new({
                        caption: param['caption'],
                        user_id: param['user_id']
                      })
    else
      post = Post.new({
                        caption: param['caption'],
                        attachment: "./media/#{param[:file][:filename]}",
                        user_id: param['user_id']
                      })
      @filename = param[:file][:filename]
      file = param[:file][:tempfile]
      File.open("./media/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
    end
    post.save
  end

  def get_all_post
    post = Post.get_post
  end

  def get_post_by_user(id)
    post = Post.get_post_by_user_id(id)
  end
end
