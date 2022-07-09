# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.2

* System dependencies

* Creation & Initialization with Rails
    
    - rails db:create

    - rails db:migrate

    - bundle install      

* Run test of integration/unitary with Rails
    
    - bundle exec rspec
    
    - bundle exec rspec spec/features/posts_spec.rb
    
    - bundle exec rspec spec/models/post_spec.rb
    
* Creation & Initialization with Docker 
    
    - docker compose build

    - docker compose run web bin/rails db:create

    - docker compose run web bin/rails db:migrate

    - docker compose up

NOTE: 
   
   - All commands must be run inside the project path

* ...