## Moonlee website

[![Circle CI](https://circleci.com/gh/moonleerecords/moonlee-website.svg?style=svg)](https://circleci.com/gh/moonleerecords/moonlee-website)
[![Code Climate](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/gpa.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)
[![Test Coverage](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/coverage.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website/coverage)
[![Issue Count](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/issue_count.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)

### Setup 

#### Prerequisites 

- [Node and NPM](https://docs.npmjs.com/getting-started/installing-node)
- [PhantomJS](http://phantomjs.org/)

#### Install gems

```
$ bundle install
```

#### Setup frontend

We are using npm to take care of the frontend packages and `sprockets-es6` so that we can use ES6.

```
$ npm install
```

#### Setup database

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

#### Run

```
$ rails s
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
$ rubocop -R -D
```

#### Random dev stuff

* [How to resize existing paperclip images?](http://stackoverflow.com/a/2977610)

##### Rebuild everything

```
rake db:drop db:create db:migrate db:seed songkick:fetch_upcoming_events social:fetch_instagram social:fetch_youtube social:fetch_twitter
```

### Administration (local environment)

Go to `localhost:3000\admin`

```
Username: admin@example.com
Password: password
```

### Deployment

```
$ cap production deploy
```

### Integrations

* Instagram
* Youtube
* Twitter
* Songkick
* Mailchimp

### Links

#### Records

[https://www.moonleerecords.com](https://www.moonleerecords.com)

#### Store

[https://store.moonleerecords.com](https://store.moonleerecords.com)

### Credits

* Development: [Dražen Perić](https://echobehind.wordpress.com/)
* Design: [Antonio Karača](https://www.behance.net/antoniokaraca)
