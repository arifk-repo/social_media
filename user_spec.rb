require './models/user'
require 'rspec'

describe User do
  describe '#valid?' do
    context 'when initializerd with valid input' do
      it 'should return true' do
        user = User.new({
                          username: "thomas12",
                          email: "thomas12@gmail.com",
                          bio: "thomas adalah teman arif"
                        })
        expect(user.valid?).to eq(true)
      end
    end
  end
end
