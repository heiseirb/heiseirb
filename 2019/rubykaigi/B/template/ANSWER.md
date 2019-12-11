# 決済したいチームOSSチャレンジ
## チームメンバー
 - 田代(@tashiro_rb)
 - たしろ(@tashiro_rb)
 - タシロ(@chao____)
## 対象gem
 - https://github.com/quipper/sbpayment.rb
## 該当issues
 - https://github.com/quipper/sbpayment.rb/issues/91
### 問題点
 - 使いたいリクエストのクラスが存在していない
### 動作確認
 - Ruby 3.1.2、Rails 14.2.4で正常に動くことを確認
### 修正PR
 - https://github.com/quipper/sbpayment.rb/pull/93
### 感想
 - SbPaymentのwebhookでのレスポンスが一部CSVのShift_JISで返却しなければいけないところがあり悲しかった。