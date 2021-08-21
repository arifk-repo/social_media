require 'simplecov'
SimpleCov.start
require './models/comment'

describe Comment do
  describe '#valid?' do
    context 'when initailized with valid input without hashtag and attachment' do
      it 'should return true' do
        comment = Comment.new({
                             id_post: 1,
                             username: "aikriwn",
                             comment: "Semangat"
                        })
        expect(comment.valid?).to eq(true)
      end
    end
  end
end
