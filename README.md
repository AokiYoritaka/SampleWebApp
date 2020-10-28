# School Review
URL: https://www.school-review.com/start
<img width="1651" alt="SchoolReviewTop" src="https://user-images.githubusercontent.com/61875210/96544396-75e7d000-12e1-11eb-98ea-7abf927fcb88.png">

<img width="1618" alt="LocalPlan_Readme1" src="https://user-images.githubusercontent.com/61875210/95303819-a9c4fd80-08be-11eb-8967-f1abff31a11b.png">


## 概要
School Reviewは、留学エージェントの**Local Plan 合同会社**より依頼を受け開発したアプリです。

フィリピン／オーストラリアにおける数十にも及ぶ語学学校のレビューを閲覧・投稿することができます。

語学学校で留学を経験した方々の生の声を聞いて情報を集め、より素晴らしい留学ライフを送りませんか？

[Local Plan 合同会社 ホームページ](https://local-plan.com/) 

## 機能一覧
- ユーザー新規登録、ログイン、ログアウト
- ゲストユーザーログイン
- Twitter OAuthログイン
- プロフィール、登録情報編集
- CSVデータインポート機能
- GoogleMap APIによる地図表示機能
- ページネーション
- 学校のレビュー投稿のCRUD機能
- ActiveStorageによる画像保存機能
- レビューの画像投稿
- レビューへのコメント登録・削除(Ajax 非同期通信)
- レビューへのいいね登録・解除(Ajax 非同期通信)
- レビューへのタグ付け機能(タグに関連するレビュー一覧表示)
- レビューへのカテゴリー機能(カテゴリーに関連するレビュー一覧表示)
- レビューの検索機能
- 登録学校の検索機能
- コメント、いいねの通知機能

## 使用技術
- バックエンド
  - Ruby 2.6.2
  - Ruby on Rails 5.2.4
  - MySQL 5.7.29
- フロントエンド
  - HTML
  - CSS
  - JavaScript
  - jQuery
  - Ajax
  - bootstrap
- サーバー
  - Nginx
  - Unicorn
- インフラストラクチャー
  - AWS
  - EC2
  - RDS
  - S3
  - VPC
  - Route53
  - ALB
  - IAM
- その他
  - Git
  - GitHub
  - Google API
  - TWITTER API
  - ActiveStorage

## ER図
![SampleWebApp_ER](https://user-images.githubusercontent.com/61875210/95586375-8e532180-0a7b-11eb-918a-15acb316fe74.png)

## 開発者／コメント
青木亮隆 Aoki Yoritaka 
開発者である私自身も、フィリピン・マクタン島において1年間の英語学校インターンと留学を経験しています。
渡航する前に、フィリピン留学を経験した人の生の声を聞いてみたかったのですが、そのような機会が無くインターン先や留学先を見つけることに苦労しました。
本アプリを通じて、これから留学を行いたい方が現地の正しい情報を入手し、最適な留学先を見つけていただきたいと思っております

## お問い合わせ先
Email: y.aoki.job@gmail.com 
