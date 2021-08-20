require './models/user'
require './models/post'

class UserController
  def create_user(param)
    user = User.new({
                      username: param['name'],
                      email: param['email'],
                      bio: param['bio']
                    })
    user.save
  end

  def get_all_users
    users = User.get_all_user
  end

  def get_user_by_id(id)
    users = User.get_user_by_id(id)
    users
  end

  def get_user_post(id)
    users = User.get_user_by_id(id)
    post = Post.get_post_by_user_id(id)
    users = users[:user]
    users[:post] = post[:post]
    users
  end

  def update_user(param)
    users = User.update_user(param)
    if users
      {
        "message" => "successful update data"
      }
    end
  end

  def delete_user(id)
    users = User.delete(id)
  end

  def register_user(param)
    user = User.new({
                      username: param['username'],
                      email: param['email'],
                      bio: param['bio']
                    })
    if user.save
      {
        "message" => "successful add data"
      }
    else
      {
        "message" => "failed add data"
      }
    end
  end

end
