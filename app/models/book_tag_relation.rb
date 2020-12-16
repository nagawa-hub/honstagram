class BookTagRelation < ApplicationRecord
  # 中間テーブル
  belongs_to :book
  belongs_to :tag
end
