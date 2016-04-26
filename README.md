## Moonlee website

[![Circle CI](https://circleci.com/gh/moonleerecords/moonlee-website.svg?style=svg)](https://circleci.com/gh/moonleerecords/moonlee-website)

### Setup 

#### Install gems

```
$ bundle install
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

```
$ bundle exec rspec spec
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

TODO: there is no production server at this point

### TODO

* check all the TODO's (env files etc)
* seeds

### Sections

#### Records

[www.moonleerecords.com](www.moonleerecords.com)

#### Booking

[booking.moonleerecords.com](booking.moonleerecords.com)
