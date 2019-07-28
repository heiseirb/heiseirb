## Gemに関して
### やること
 - 下記APIに対してRequestをしたり
、Responseをイイカンジに加工するgemを作って下さい。
 - gem readmeのusageはしっかり記述してください。発表はそちらを元に行っていただきます。
 - 時間が少ないのでテストは後回しでOKです
 - 実際の公開まではしなくて大丈夫です。やってみたい人は帰ったらやって下さい。
 - APIにバグが有るようでしたら言って下さい。その場で直します。
 - APIのResponseが遅いとかは言わないで下さい。Heroku 1台で動いてます。

### ヒント
 - bin/consoleでgemがrequireされた状態でirbを起動することが出来ます。debugで使ってください。
 - 一つの概念に特化するAPIでもOKです。
 - めちゃめちゃdeleteを叩きまくれるgemとかおもしろそう。
 - 他のgemの使用もOKです。
 - DoS攻撃をしかけてサーバをダウンさせるgemとかとか作るチームいたら嬉しい。ex. HeiseirbApiClient::BreakeDown.execute(10000) #10000RequestのDoS攻撃を仕掛ける
 - http clientとしてfaradayをいれてあります。

## APIに関して
### 説明
 - イベント管理が出来る簡単なRails APIです。
 - テーブル設計
   - user(owner) has_many events
   - event has_many event_schedules
   - user(normal) many_to_many event_schedules 
 - ユーザは権限ownerとnormalどちらかで作製することが出来、ownerの場合はイベント作製をすることが出来ます。
 - ユーザはイベントに対して予約することが出来、イベント側は設けられたスケジュールと定員を元に抽選をすることが来ます。
 - API RequestのHeaderには指定のtokenを入れて下さい。
```
 - endpoint: https://heiseirb-demo-api.herokuapp.com
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