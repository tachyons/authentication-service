# Authentication Service [![Build Status](https://travis-ci.org/tachyons/authentication-service.svg?branch=master)](https://travis-ci.org/tachyons/authentication-service)

Authentication microservice written in Rails with JWT.

## Developer Setup

1. Install Ruby 2.5. (It is suggested to use a Ruby version manager such as [rbenv](https://github.com/rbenv/rbenv#installation) and then to [install Ruby 2.5](https://github.com/rbenv/rbenv#installing-ruby-versions)).
1. Install Bundler to manager dependencies: `gem install bundler`
1. Setup the database: `bundle exec rake db:migrate`
1. Setup key pair
```
  openssl genrsa  -out config/private.pem 2048
  openssl rsa -in config/private.pem -outform PEM -pubout -out config/public.pem
```
5. Start the application: `bundle exec rails s`

## Commands
- `bundle exec rubocop` - Run the full suite of linters on the codebase.

## Deployment Instructions
