# **Trips API**

A basic REST API to perform CRUD functions. Uses Sqlite by default for simplicity

# Required Tasks:

All tasks were met

- [x] CRUD for the trip.
- [x] Update trip status validation.
- [x] full location history of the trip.

# Bonus Tasks:

All bonus tasks were met

- [x] Caching.
- [x] Background jobs (Workers).
- [x] Serializing.
- [x] Automated testing using Rspec framework

## INSTALL DEPENDENCIES
```bash
$ bundle install
$ sudo apt-get install redis-server
```

## RUN DB SEEDING
Populating the database with fake data using 'Faker' gem

```bash
$ rails db:seed
```

## RUN MIGRATION
```bash
$ rails db:migrate
```

## RUN Tests
```bash
$ bundle exec rspec
```

## RUN SERVER
```bash
$ rails s
```

## NOTES

In general the KISS principle was followed, so i kept it as simple as possible.

- The driver could have been a seprated model but kept it as string for simplicity

- the location history could have a seprated model with one-to-many relation,
 but for optmization i made a primative serialization by making so now you will get the whole history but can't query on it

- Rspec was used for testing as after researching i saw that this the best suited for Api with no user interface

- Sidekiq with Redis were used for simple background process (Report Worker)

- mem-cached caching was used

- Active Model Serializer used for serializing the json response (only showing driver, location, state)

## HOW TO IMPROVE

- the json responses should follow more json:api spec

- Adding error serializer

- improving the location history data-structure by converting to hash