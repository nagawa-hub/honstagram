crumb :root do
  link "Top", root_path
end

# user
crumb :current_user do |user|
  link "マイページ", user_path(user)
end

crumb :user do |user|
  link "#{user.user_name}", user_path(user)
end

crumb :following do |user|
  link "フォロー", following_user_user_path(user)
  parent :user, user
end

crumb :followed do |user|
  link "フォロワー", followed_user_user_path(user)
  parent :user, user
end

crumb :user_edit do |user|
  link "編集", edit_user_path(user)
  parent :current_user, user
end

crumb :favorite do |user|
  link "お気に入り一覧", user_favorites_path(user)
  parent :current_user, user
end

# book

crumb :book_new do
  link "投稿する", new_book_path
end

crumb :book do |book|
  link "#{book.title}", book_path(book)
end