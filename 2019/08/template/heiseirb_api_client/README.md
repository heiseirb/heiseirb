# HeiseirbApiClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/heiseirb_api_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heiseirb_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heiseirb_api_client

## Usage

抽選の申し込みをいっぱいできるよ
デフォルトでid:2532のスケジュールに対して、10回予約をするよ！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaiyoyaku
```
予約回数を変えたい場合は、yoyaku_countを引数に渡してね！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaiyoyaku(yoyaku_count: 1000000000)
```
予約するイベントを指定する場合は、event_schedule_idを引数に渡してね！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaiyoyaku(event_schedule_id: 13)
```

いっぱい申し込みできるよ
デフォルトでid:2532のスケジュールに対して、10回申し込みするよ！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaitosen
```
申し込み回数を変えたい場合は、tosen_countを引数に渡してね！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaitosen(tosen_count: 1000000000)
```
申し込みするイベントを指定する場合は、event_schedule_idを引数に渡してね！
```
HeiseirbApiClient::Ippaiyoyaku.new.ippaitosen(event_schedule_id: 13)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heiseirb_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HeiseirbApiClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/heiseirb_api_client/blob/master/CODE_OF_CONDUCT.md).
