# HeiseirbApiClient

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/heiseirb_api_client`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heiseirb_api_client'
And then execute:
   $ bundle
Or install it yourself as:
   $ gem install heiseirb_api_client
```

## Usage

```ruby

HeiseirbApiClient::CRUD::User#get_user(user_id)
#=> User(name:, email:, password, :role)

HeiseirbApiClient::CRUD::Event.new.post_events(user_id: 136, place: "medpeer", description: "happy hack!", start_date: "2019-08-22", capacity: 10000, times: 1)
```

- user_id: string or integer, owner user id
- place: only string value, where event are held.
- description: only string value. what kind of event.
- start_date: string date. format like ‘yyyy-mm-dd’.
- capacity: only integer. How many people are able to join this event.
- times: only integer. limited from 1 to 10.

## Development

After checking out the repo, run bin/setup to install dependencies. Then, run rake spec to run the tests. You can also run bin/console for an interactive prompt that will allow you to experiment.
To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and tags, and push the .gem file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heiseirb_api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HeiseirbApiClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/heiseirb_api_client/blob/master/CODE_OF_CONDUCT.md).
