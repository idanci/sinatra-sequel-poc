## Project setup

### Create & migrate database
1. `$ createdb users_api_dev`
2. `$ sequel -m db/migrations postgres://localhost/users_api_dev`

### Run the app
1. `$ rackup`
2. visit `http://localhost:9292`

### Debug
1. `$ bundle exec irb -r irb/completion -r ./boot.rb`
