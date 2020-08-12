require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with content' do
        expect(build(:comment, image: nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:comment, content: nil)).to be_valid
      end

      it 'is valid with content and image' do
        expect(build(:comment)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content and image' do
        comment = build(:comment, content: nil, image: nil)
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end

      it 'is invalid without room_id' do
        comment = build(:comment, room_id: nil)
        comment.valid?
        expect(comment.errors[:room]).to include("を入力してください")
      end

      it 'is invalid without supporter_id' do
        comment = build(:comment, supporter_id: nil)
        comment.valid?
        expect(comment.errors[:supporter]).to include("を入力してください")
      end
    end
  end
end