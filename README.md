[ ![Codeship Status for latter-jacob/couch_potatoes](https://codeship.com/projects/96440210-42b4-0133-b560-0a794f3732af/status?branch=master)](https://codeship.com/projects/103851) ![Code Climate](https://codeclimate.com/github/latter-jacob/couch_potatoes.png) [![Coverage Status](https://coveralls.io/repos/latter-jacob/couch_potatoes/badge.svg?branch=master&service=github)](https://coveralls.io/github/latter-jacob/couch_potatoes?branch=master)

# Couch Potatoes
Review TV show theme songs. This app is intended for having while rating
your favorite TV show theme songs! You can see a video of the song,
its title, and review as you watch. Later you can vote on reviews by others.

## Live app hosted on Heroku
[Couch Potatoes](couch-potatoes.herokuapp.com)

## ER Diagrams and Schema structure
This will soon appear, because it is being modified!

## Ruby version
2.1.5

## System dependencies
* gem 'mailcatcher'

Mail catcher is not included in the Gem file and instead should be added via your console:

```
$ gem install mailcatcher && mailcatcher
```

Please include in your development.rb
```
# config/development.rb
Rails.application.configure do
 # mailcatcher config
 #   to view emails generated in development:
 #   `gem install mailcatcher && mailcatcher`
 config.action_mailer.delivery_method = :smtp

 config.action_mailer.smtp_settings = {
   address: "localhost",
   port: 1025
 }

 config.action_mailer.default_url_options = {
   host: "localhost",
   port: 3000
 }
end
```

## Get Started
1. Bundle the gems

  ```Bundle```

2. Bootup the database:

  ```rake db:create```

3. Bring in your migrations

  ```rake db:migrate```

4. Run the test suite

  ```rake```

## Deployment
On a clean Master branch, run:

  ```
  git push heroku master
  ```
