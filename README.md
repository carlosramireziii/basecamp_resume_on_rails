# Basecamp Resume on Rails 

A mini Basecamp clone to demonstrate why I've loved using Rails all these years: I can create full-featured web applications as a solo developer efficiently and with ease. 

## Ruby Version

The Ruby version is specified in the `.ruby-version` file.

## Setup

To set up a new local environment, run the `bin/setup` command.

## Test Suite

To run the test suite use `bin/rails test`.

## Deployment Instructions

The app is hosted on Heroku.

### Automatic Deploys

The `staging` app is setup to automatically deploy any code which is merged to the `master` branch of the connected Github repository.

Deployment to the `production` app can be done by promoting the latest `staging` release.

### Manual Deploys

If necessary, you can deploy manually by push to the `staging` or `production` Git remote endpoints which were added during setup.

## Components

### File Storage

Files are stored using the ActiveStorage framework and hosted on Amazon S3. Credentials are encrypted and stored by Rails.
