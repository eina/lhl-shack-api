# shack API

This is the API for [shack](https://github.com/thelittleblacksmith/lhl-shack), an app for a more harmonious roommate experience built as a capstone project for Lighthosue Labs.

## Details

- Ruby 2.3.5
- Rails 4.2.6
- PostgreSQL 9.5.19

## Getting Started

1. create a user and a password with postgres, connect to that with `psql -U [your chosen username]`
1. create a database called `shack_api` and set yourself as the user using the username you chose

```sql
CREATE DATABASE midterm OWNER labber;
```

1. create an `.env` file by copying `.env.example` and filling it out with your details above
1. update `database.yml` with your database details
1. run `bundle install` to install gems
1. run `bin/rake reset` to reset + seed the database
1. run `bin/rails s -b 0.0.0.0` to start the server
