## 平成.rb 9月回
## やること
まずは皆さんで挨拶をしましょう
その後以下課題から1つ選んでモブプロ形式で勧めて下さい。

```
 - heisei_api_clientにrubocopを入れる
 - heisei_api_clientの設計方針(Dir階層等)を考えリファクタする
 - heisei_api_clientの追加実装を行う
 - heiseirb-demo-apiの追加実装、修正を行う
```

## やり方
```
[gem]
 1. git clone git@github.com:heiseirb/heiseirb.git # gitからcloneする
 2. cp -r heiseirb/2019/09/template heiseirb/2019/09/YOUR_TEAM_NAME # テンプレートをコピーして作業用のDirを作る
 3. cd heiseirb/2019/09/YOUR_TEAM_NAME # 作業ディレクトリに移動
 5. bin/console # とりあえず動かしてみる
 4. git checkout team/YOUR_TEAM_NAME # 自分用のブランチを切って作業開始
 5. push出来ない場合はgithubに招待してもらう
 6. readmeはしっかり記述する

[api]
 1. git clone git@github.com:heiseirb/event_api.git # gitからcloneする
 2. 環境構築頑張る
 3. git checkout team/YOUR_TEAM_NAME #作業開始
 4. readmeはしっかり記述する
```

## GEM
### 説明
 - gem readmeのusageはしっかり記述してください。発表はそちらを元に行っていただきます。
 - 時間が少ないのでテストは後回しでOKです
 - 実際の公開まではしなくて大丈夫です。
 - APIにバグが有るようでしたら言って下さい。その場で直します。
 - APIのResponseが遅いとかは言わないで下さい。Heroku 1台で動いてます。

### ヒント
 - bin/consoleでgemがrequireされた状態でirbを起動することが出来ます。debugで使ってください。
 - 一つの概念に特化するAPIでもOKです。
 - めちゃめちゃdeleteを叩きまくれるgemとかおもしろそう。
 - 他のgemの使用もOKです。
 - DoS攻撃をしかけてサーバをダウンさせるgemとかとか作るチームいたら嬉しい。ex. HeiseirbApiClient::BreakeDown.execute(10000) #10000RequestのDoS攻撃を仕掛ける
 - http clientとしてfaradayをいれてあります。

## API <= review app作りました！！PR毎に環境作れるようにしたので、欲しい方は田代に言ってください。
### 説明
 - イベント管理が出来る簡単なRails APIです。細かい使用は[ソースコード](https://github.com/heiseirb/event_api)を読んでね
 - テーブル設計
   - user(owner) has_many events
   - event has_many event_schedules
   - user(normal) many_to_many event_schedules 
 - ユーザは権限ownerとnormalどちらかで作製することが出来、ownerの場合はイベント作製をすることが出来ます。
 - ユーザはイベントに対して予約することが出来、イベント側は設けられたスケジュールと定員を元に抽選をすることが来ます。
 - API RequestのHeaderには指定のtokenを入れて下さい。
```
[production]
 - endpoint: https://heiseirb-demo-api.herokuapp.com
 - code: https://github.com/heiseirb/event_api
 - header:
  - X-Token: 4D6(E7{zeeKkfu;
  - X-TokenSecret: password
```
### user_api
※パラメータはコードを読んでね
```
password_client_user  PUT    /client/users/:id/password(.:format)                         client/users#password 
client_users          GET    /client/users(.:format)                                      client/users#index 
                      POST   /client/users(.:format)                                      client/users#create 
client_user           GET    /client/users/:id(.:format)                                  client/users#show 
                      PATCH  /client/users/:id(.:format)                                  client/users#update 
                      PUT    /client/users/:id(.:format)                                  client/users#update 
                      DELETE /client/users/:id(.:format)                                  client/users#destroy 
```
### event_api
※パラメータはコードを読んでね
```
client_events         GET    /client/events(.:format)                                     client/events#index 
                      POST   /client/events(.:format)                                     client/events#create 
client_event          GET    /client/events/:id(.:format)                                 client/events#show 
                      PATCH  /client/events/:id(.:format)                                 client/events#update 
                      PUT    /client/events/:id(.:format)                                 client/events#update 
                      DELETE /client/events/:id(.:format)                                 client/events#destroy 
```
### schedule_api
※lottery: イベントの抽選をするAPI

※apply: イベント予約をするAPI
```
client_event_schedules POST   /client/event_schedules(.:format)                           client/event_schedules#create 
client_event_schedule PATCH  /client/event_schedules/:id(.:format)                        client/event_schedules#update 
                      PUT    /client/event_schedules/:id(.:format)                        client/event_schedules#update 
                      DELETE /client/event_schedules/:id(.:format)                        client/event_schedules#destroy 
                      POST   /client/event_schedules/:event_schedule_id/lottery(.:format) client/event_schedules#lottery
                      POST   /client/event_schedules/:event_schedule_id/apply(.:format)   client/event_schedules#apply
```
