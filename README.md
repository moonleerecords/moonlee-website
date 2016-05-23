## Moonlee website

[![Circle CI](https://circleci.com/gh/moonleerecords/moonlee-website.svg?style=svg)](https://circleci.com/gh/moonleerecords/moonlee-website)
[![Code Climate](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/gpa.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)
[![Test Coverage](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/coverage.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website/coverage)
[![Issue Count](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/issue_count.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)

### Setup 

#### Prerequisites 

- [Node and NPM](https://docs.npmjs.com/getting-started/installing-node)
TODO: 
- [Bower](http://bower.io)
- [jspm](http://jspm.io/docs/getting-started.html)
- [PhantomJS](http://phantomjs.org/)

#### Install gems

```
$ bundle install
```

#### Setup assets

TODO: describe what we are using on the frontend - jspm, bower and ...
TODO: and why (bower css, jspm javascript)

```
$ npm install
$ bower install
$ jspm install
```

#### Setup database

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

#### Config file

There is a `application.yml.dist` file in `config` directory. Be sure you rename it to `application.yml` and then set parameters according to your local environment.

#### Debugging

Simply drop

    byebug

wherever you want to start debugging and the execution will stop there.

#### Tests

##### Backend tests

Run all the tests

```
$ bundle exec rspec spec
```

Or, run a single test

```
$ bundle exec rspec /home/drazen/dev/moonlee-website/spec/controllers/booking/artists_controller_spec.rb
```

##### Frontend/Javascript tests

```
rake teaspoon
```

Tests are also running on each build (Circle CI).

#### Rubocop

We use Rubocop in order to find code inconsistency. Rubocop runs on every build (Circle CI) but you can also run it locally.

```
$ rubocop -R
```

#### Run

```
$ rails s
```

### Administration (local environment)

Go to `localhost:3000\admin`

TODO: add fixtures for these

```
Username: admin@example.com
Password: password
```

### Deployment

```
$ cap production deploy
```

### Sections

#### Records

[www.moonleerecords.com](www.moonleerecords.com)

#### Booking

[booking.moonleerecords.com](booking.moonleerecords.com)

#### TODO: jspm

* TODO: setup jspm for capistrano 
* frontend tests on circleci -> rake teaspoon
* prepare for production - bundle it into one file -> http://jspm.io/docs/production-workflows.html
* FOR PRODUCTION: jspm bundle-sfx --minify src/main bundle.min.js
* jspm bundle-sfx --minify javascripts/records/app.js assets/javascripts/records/app.min.js
