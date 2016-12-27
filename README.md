## Moonlee website

[![Circle CI](https://circleci.com/gh/moonleerecords/moonlee-website.svg?style=svg)](https://circleci.com/gh/moonleerecords/moonlee-website)
[![Code Climate](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/gpa.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)
[![Test Coverage](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/coverage.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website/coverage)
[![Issue Count](https://codeclimate.com/github/moonleerecords/moonlee-website/badges/issue_count.svg)](https://codeclimate.com/github/moonleerecords/moonlee-website)

### Setup 

#### Prerequisites 

- [Node and NPM](https://docs.npmjs.com/getting-started/installing-node)
- [jspm](http://jspm.io/docs/getting-started.html)
- [PhantomJS](http://phantomjs.org/)

#### Install gems

```
$ bundle install
```

#### Setup assets

We are using npm and jspm to take care of the frontend packages. npm mostly for CSS libraries and to install jspm, and jspm in order to install and use JavaScript (ES6) libraries.

```
$ npm install
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
$ rubocop -R -D
```

#### Run

```
$ rails s
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
* Songkick
* Mailchimp

### Sections

#### Records

[www.moonleerecords.com](www.moonleerecords.com)

#### Booking

[booking.moonleerecords.com](booking.moonleerecords.com)

### Credits

Frontend and backend development: [Dražen Perić](https://echobehind.wordpress.com/)

Design: [Antonio Karača](https://www.behance.net/antoniokaraca)

### TODO

* paperclip compression -> https://github.com/emrekutlu/paperclip-compression
* paperclip optimizer -> https://github.com/janfoeh/paperclip-optimizer
* tiny png (500 images month) -> https://tinypng.com/developers/reference/ruby
* javascript dualtone -> http://www.mattkandler.com/blog/duotone-image-filter-javascript-rails
* paperclip dualtone