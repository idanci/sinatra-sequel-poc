## Project setup

### Create & migrate database
1. `$ createdb users_api_dev`
2. `$ sequel -m db/migrations postgres://localhost/users_api_dev`

### Run the app
1. `$ rackup`
2. visit `http://localhost:9292`

### Debug

#### Interactive console:
`$ bundle exec irb -r irb/completion -r ./boot.rb`

#### Create some users via console:
```ruby
User.create(first_name: 'John', last_name: 'Smith', email_address: 'john.smith@example.com', country: 'United States')
```
