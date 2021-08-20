require './models/comment'

class CommentController
  def check_hashtag(hastag)
    str = hastag.split(" ")
    data = str.select { |food| food.match(/^#/) }
    data
  end

  def create_comment(param)
    hashtag = check_hashtag(param[:comment])
    puts hashtag
    if param['file'].nil?
      if hashtag.length > 0
        comment = Comment.new({
                                id_post: param['id_post'],
                                username: param['username'],
                                comment: param['comment'],
                                hashtag: hashtag[0]
                              })
      else
        comment = Comment.new({
                                id_post: param['id_post'],
                                username: param['username'],
                                comment: param['comment']
                              })
      end
    else
      if hashtag.length > 0
        comment = Comment.new({
                                id_post: param['id_post'],
                                username: param['username'],
                                comment: param['comment'],
                                attachment: "./media/#{param[:file][:filename]}",
                                hashtag: hashtag[0]
                              })
      else
        comment = Comment.new({
                                id_post: param['id_post'],
                                username: param['username'],
                                comment: param['comment'],
                                attachment: "./media/#{param[:file][:filename]}"
                              })
      end
      @filename = param[:file][:filename]
      file = param[:file][:tempfile]
      File.open("./media/#{@filename}", 'wb') do |f|
        f.write(file.read)
      end
    end
    comment.save
  end
end