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

      it 'should return false when not have params comment' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn"
                              })
        expect(comment.valid?).to eq(false)
      end

      it 'should return true when add hashtag' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn",
                                comment: "semangat",
                                hastag: "#pastibisa"
                              })
        expect(comment.valid?).to eq(true)
      end

    end
  end
end
