# Logbook

## Description

An electronic logbook that pilots can use to keep track of their flight time. List of features coming soon!

## Rails Version

This application was built and runs on Rails 4.2.0

## Setup

In order to set up your own development environment for this application you need to do the following:

* Clone this repository from git

* Install [rails](http://rubyonrails.org)

* Install all required gems by running `$ bundle install` from the project's root directory

* Create a **secrets.yml** file in the **config** folder with the following information. `$ rake secret` can be used to generate new secret keys.

```ruby
development:
  secret_key_base:

test:
  secret_key_base:

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

* Run the server with `$ rails server`.

## Testing

This project has unit tests that can be run with the `$ rake test:all` command.

## Resetting the database

The database can be reset with the `$ rake db:reset` command.
