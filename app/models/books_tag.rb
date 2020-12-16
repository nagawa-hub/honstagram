# Formオブジェクト
class BooksTag
  include ActiveModel::Model
  attr_accessor(
    :title,
    :book_image,
    :author,
    :description,
    :score,
    :genre_id,
    :publisher,
    :user_id,
    :tag_name
  )

  # validation
  with_options presence: true do
    validates :title
    validates :book_image
    validates :author
    validates :description
    validates :score
    validates :genre_id
  end

  def save
    book = Book.create(
      title: title,
      book_image: book_image,
      author: author,
      description: description,
      score: score,
      genre_id: genre_id,
      publisher: publisher,
      user_id: user_id
    )
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    BookTagRelation.create(
      book_id: book.id,
      tag_id: tag.id
    )
  end

end
