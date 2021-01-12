require 'rails_helper'

RSpec.describe "Books", type: :request do
  before do
    @book = FactoryBot.create(:book)
  end

  describe "GET #top" do
    it "topアクションにリクエストすると正常にレスポンスが返ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "topアクションにリクエストするとレスポンスに投稿済のタイトルが存在する" do
      get root_path
      expect(response.body).to include @book.title
    end
    it "topアクションにリクエストするとレスポンスに投稿済の画像URLが存在する" do
      get root_path
      expect(response.body).to include "test_image.png"
    end
    it "topアクションにリクエストするとレスポンスに検索フォームが存在する" do
      get root_path
      expect(response.body).to include "本 / 著者で検索する"
    end
  end
end
