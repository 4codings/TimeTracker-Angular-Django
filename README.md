# The Morning T
The Morning T is a review site for MBTA stops. It was built during Launch Academy cohort 24 (spring 2019) by John Armstrong, Eric Francis, Ross Daly, and Shardly Romelus. It is primarily a react frontend sitting on a Rails back end. It uses devise for authentication, carrierwave and s3 for image upload and storage, and foundation 6 for styling.

You can see a demo version running at [https://themorningt.herokuapp.com/](https://themorningt.herokuapp.com/)

* Ruby version 2.4.5

* System dependencies
  
  * fog
  
  * carrierwave
  
  * minimagick
  
  * fontAwesome

* Startup

  * run two processes from the project root `yarn run start` and `rails s`

* Db Configuration

  * running `rake db:create; rake db:migrate; rake db:seed` should get your db set up.

* How to run the test suite

  * You can run enzyme tests with `yarn run test`

  * You can run rspec tests with `bundle exec rspec`

* Deployment instructions

  * This pushed to heroku cleanly. Be sure to give heroku your env values.
  
  * `heroku config:set AWS_ACCESS_KEY_ID=YOURKEYIDHERE`
  * `heroku config:set AWS_SECRET_ACCESS_KEY=YOURSECRETKEYHERE`
  * `heroku config:set S3_BUCKET=yourS3BucketHere`

[![Codeship Status for myYearOfCode/the_morning_T](https://app.codeship.com/projects/5eed1dd0-474f-0137-cd63-3a91933c600e/status?branch=master)](https://app.codeship.com/projects/337453)
