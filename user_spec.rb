require 'simplecov'
SimpleCov.start
require './models/user'

describe User do
  describe '#valid?' do

    context 'when add new user' do
      it 'should return true' do
        user = User.new({
                          username: "thomas12",
                          email: "thomas12@gmail.com",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.save).to eq(true)
      end
    end

    context 'user update' do
      it 'should return true' do
        user = User.update_user({
                                  id: 2,
                                  username: "thomas13",
                                  email: "thomas12@gmail.com",
                                  bio: "thomas adalah teman arif"
                                })
        expect(user).to eq(true)
      end
    end

    context 'delete user by id' do
      it 'should return true' do
        user = User.delete(2)
        expect(user).to eq(true)
      end
    end

    context 'get user by id' do
      it 'should return not nil' do
        user = User.get_user_by_id(1)
        expect(user).not_to be_nil
      end
    end

    context 'get all user' do
      it 'should return not nil' do
        user = User.get_all_user
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
        user = User.new({
                            username: "thomas12",
                            bio: "thomas adalah teman arif"
                          })
        expect(user.valid?).to eq(false)
      end
    end
  end
end