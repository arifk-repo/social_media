require 'simplecov'
SimpleCov.start
require './models/comment'

describe Comment do
  describe '#data operation'do
    context 'when add a comment' do
      it 'should return 200 and success status ' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn",
                                comment: "semangat",
                                hashtag: "#pastibisa",
                                attachment: "./media/data.csv"
                              })
        expect(comment.save).to eq({
                                     "success" => true,
                                     "message" => "Success Add Data"
                                   }.to_json)
      end

      it 'should return 200 and success status ' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn",
                                comment: "semangat",
                                attachment: "./media/data.csv"
                              })
        expect(comment.save).to eq({
                                     "success" => true,
                                     "message" => "Success Add Data"
                                   }.to_json)
      end

      it 'should return 200 and success status ' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn",
                                comment: "semangat"
                              })
        expect(comment.save).to eq({
                                     "success" => true,
                                     "message" => "Success Add Data"
                                   }.to_json)
      end


      it 'should return comment related to hashtag' do
        comment = Comment.get_comment_by_hashtag('#gigih')
        expect(comment[:comment]).not_to be_nil
      end
    end
  end
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
                                hashtag: "#pastibisa"
                              })
        expect(comment.valid?).to eq(true)
      end

      it 'should return true when add hashtag and attachment' do
        comment = Comment.new({
                                id_post: 1,
                                username: "aikriwn",
                                comment: "semangat",
                                hastag: "#pastibisa",
                                attachment: "./media/data.csv"
                              })
        expect(comment.valid?).to eq(true)
      end
    end
  end
end
