require 'simplecov'
SimpleCov.start
require './models/post'

describe Post do
  describe '#return data?' do
    context 'when initializerd with valid input' do
      it 'should return true' do
        post = Post.new({
                          caption: "Saya akan semangat",
                          user_id: 1,
                          hastag: "#GenerasiGIGIH",
                          attachment: "./media/data.csv"
                        })
        expect(post.save).to eq({
                                  "success" => true,
                                  "message" => "Success Add Data"
                                }.to_json)
      end
    end

    context 'when get post by user id' do
      it 'should return all post created by user' do
        post = Post.get_post_by_user_id(1)
        expect(post[:post]).not_to be_nil
      end

      it 'should return nil' do
        post = Post.get_post_by_user_id(3)
        expect(post[:post]).to be_nil
      end
    end

    context 'when get trending' do
      it 'should return all trendings' do
        post = Post.get_trendings
        expect(post[:trendings]).not_to be_nil
      end
    end

    context 'when get post' do
      it 'should return all post' do
        post = Post.get_post
        expect(post[:post]).not_to be_nil
      end
    end

    context 'when get post by hastag' do
      it 'should return post related to hastag' do
        post = Post.get_post_by_hashtag('#gigih')
        expect(post[:post]).not_to be_nil
      end
    end

  end


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
