# Sinatra with Sequel
This was created as part of a Google Cloud Platform (GCP) learning project. The goal was to deploy a simple web application with a database. And along the way, appreciate the differences between AWS and GCP.

## [Sinatra](http://sinatrarb.com/)

Ruby web application built using the Sinatra framework. Sinatra is a lighter web framework compared to [Rails](https://rubyonrails.org/).

## [Sequel](https://github.com/jeremyevans/sequel)

Sequel is a simple, flexible, and powerful SQL database access toolkit for Ruby. It also includes a comprehensive ORM layer for mapping records to Ruby objects and handling associated records.

## Local development environment

### Prerequisite
- Ruby 3.1.1
  - You could probably use a lower version. But you will need to update `Gemfile` and `.ruby-gemset`
  - If you are new to Ruby, I would recommend you to use [Ruby Version Manager](https://rvm.io/) to install and manage your Ruby versions. RVM uses the `.ruby-* files.`
  - If you prefer [asdf](https://github.com/asdf-vm/asdf), feel free to add `.tool-versions` accordingly.
- [Bundler](https://bundler.io/)
- Run `bundle` to install the gems dependencies

### Start
Run `bundle exec ruby app.rb`
