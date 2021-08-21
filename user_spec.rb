require 'simplecov'
SimpleCov.start
require './models/user'
require './models/post'
require './db/db_connector'

describe User do
  describe '#valid?' do
    context 'update user' do
      it 'should not raise error' do
        user = User.update_user({
                                  id: 2,
                                  username: "thomas13",
                                  email: "thomas12@gmail.com",
                                  bio: "thomas adalah teman arif"
                                })
        expect(user).to eq(true)
      end
    end

    context 'get user by id' do
      it 'should return not nil' do
        user = User.get_user_by_id(1)
        expect(user).not_to be_nil
      end

    end
    context 'when initializerd with valid input' do
      it 'should return update' do
        user = User.new({
                          username: "thomas12",
                          email: "thomas12@gmail.com",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.valid?).to eq(true)
      end
    end

    context 'when initializerd with invalid username' do
      it 'should return false' do
        user = User.new({
                          email: "thomas12@gmail.com",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.valid?).to eq(false)
      end
    end

    context 'when initializerd with invalid email' do
      it 'should return false' do
        user = User.new({
                          username: "thomas12",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.valid?).to eq(false)
      end
    end

    context 'when initializerd with invalid bio' do
      it 'should return false' do
        user = User.new({
                          username: "thomas12",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.valid?).to eq(false)
      end
    end

    context 'when initializerd with invalid email' do
      it 'should return false' do
        client = connect_database
        user2 =
          user = User.new({
                            username: "thomas12",
                            bio: "thomas adalah teman arif"
                          })
        expect(user.valid?).to eq(false)
      end
    end
  end
end

describe Post do
  describe '#valid?' do
    context 'when initializerd with valid input without attachment and hastag' do
      it 'should return true' do
        post = Post.new({
                          caption: "Saya akan semangat",
                          user_id: 1
                        })
        expect(post.valid?).to eq(true)
      end
    end

    context 'when initializerd with valid input without attachment' do
      it 'should return true' do
        post = Post.new({
                          caption: "Saya akan semangat",
                          user_id: 1,
                          hastag: "#GenerasiGIGIH"
                        })
        expect(post.valid?).to eq(true)
      end
    end

    context 'when initializerd with valid input' do
      it 'should return true' do
        post = Post.new({
                          caption: "Saya akan semangat",
                          user_id: 1,
                          hastag: "#GenerasiGIGIH",
                          attachment: "./media/data.csv"
                        })
        expect(post.valid?).to eq(true)
      end
    end
  end
end