## Honstagram

https://honsta-gram.com/

トップページからログインボタンを押しゲストユーザーとしてログインが可能です。

## 概要

## 目指している課題解決
あなたは本を買う時、紙で買いますか？それとも電子版を買いますか？

私自身は最近は電子書籍で買うことが多いです。本を保管するスペースの必要が無いからです。

紙の本は買えば買うほど量が多くなって、本棚に置く場所がなくなり処分をする経験がよくありました。

しかし電子版で買うようになってから今までは本で埋まっていた本棚が寂しく感じられるようにもなりました。

自分が読んだ本やお気に入りの本を本棚に保管でき、視覚的にも楽しめるのは、紙の本ならでは良さだと思います。

このアプリはそういった紙で読む人も電子版で読む人でも,自分のお気に入りの本が詰まった本棚を共有できるようなプラットフォームを作れたら良いなと思い制作をしています。

## アプリケーション機能
### トップページ
![93d0559a2a9ce81fb2939809f4d6f5c6](https://user-images.githubusercontent.com/72905756/105474624-cce6b200-5ce1-11eb-800a-3bf56192b68f.jpg)

トップページには新規投稿とランキングが表示されます。

ログイン時のヘッダーからはマイページ、お気に入り一覧、通知一覧、ダッシュボードへ遷移することができます。

### ユーザーページ
![honsta_user](https://user-images.githubusercontent.com/72905756/103166116-449bfb00-4862-11eb-959e-ff08b15bf1b6.jpg)

ユーザーページではユーザーが投稿した本が表示されます。ユーザーの投稿に加え、フォローしている、されているユーザーやお気に入りした投稿を確認することも可能です。

### 投稿一覧ページ
![f7981244a7c14901f230e75a93499abb](https://user-images.githubusercontent.com/72905756/103166282-eff97f80-4863-11eb-94f9-33afc56a9d07.jpg)

投稿一覧ページでは全ての投稿やタイトル・著者で検索した投稿が表示されます。

### 投稿詳細ページ
![honsta_book](https://user-images.githubusercontent.com/72905756/103166132-6b5a3180-4862-11eb-9634-385b36354bb4.jpg)

投稿の詳細ページでは投稿した本の内容や投稿者のコメントを確認できます。

このページからレビューの投稿と確認が可能です。またお気に入り登録ボタンを押すと自分のマイページのお気に入り一覧に追加することができます。

## 開発環境
Ruby on Rails ver 6.0.0 / MariaDB

AWS EC2 / S3 / Route53 / ALB

## 今後の実装予定
ソート機能 / 非同期での投稿機能 / ユーザー検索機能 / 結合テスト

## DB設計
<img width="828" alt="248199ce6fb5d3fa288ed9c7c95bb03d" src="https://user-images.githubusercontent.com/72905756/103166346-80d05b00-4864-11eb-9108-27abefd29485.png">
