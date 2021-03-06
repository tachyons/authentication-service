# Authentication Service
[![Build Status](https://travis-ci.org/tachyons/authentication-service.svg?branch=master)](https://travis-ci.org/tachyons/authentication-service)
[![Maintainability](https://api.codeclimate.com/v1/badges/3adc43f3947f68b4f44b/maintainability)](https://codeclimate.com/github/tachyons/authentication-service/maintainability)

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

## TODO

## Documentation

[Apiary](https://authservice16.docs.apiary.io)

## Features

  * [x] User creation from admin role
  * [x] Login using email and password
  * [x] Authenticate using auth token
  * [x] Endpont for public key
  * [ ] Refresh token
  * [ ] Revoking refresh token
  * [ ] Broadcast auth events like user deletion
  * [ ] Support key rotation
