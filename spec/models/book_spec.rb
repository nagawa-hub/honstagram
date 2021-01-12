require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本の投稿機能' do
    context "本が投稿できる場合" do
      it "book_image、title、author、discription、genre_idがあれば投稿できる" do
        expect(@book).to be_valid
      end
    end
    context "本が投稿できない場合" do
      it "book_imageが空では投稿できない" do
        @book.book_image = nil
        @book.valid?
        expect(@book.errors.full_messages).to include "Book imageを入力してください"
      end
      it "titleが空では投稿できない" do
        @book.title = ""
        @book.valid?
        expect(@book.errors.full_messages).to include "Titleを入力してください"
      end
      it "authorが空では投稿できない" do
        @book.author = ""
        @book.valid?
        expect(@book.errors.full_messages).to include "Authorを入力してください"
      end
      it "descriptionが空では投稿できない" do
        @book.description = ""
        @book.valid?
        expect(@book.errors.full_messages).to include "Descriptionを入力してください"
      end
      it "genre_idが空では投稿できない" do
        @book.genre_id = ""
        @book.valid?
        expect(@book.errors.full_messages).to include "Genreを入力してください"
      end
      it "ユーザーが紐付いていなければ投稿できない" do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
