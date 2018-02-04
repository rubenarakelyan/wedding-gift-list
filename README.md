# Joanna and Ruben's Wedding Gift List

This is the gift list app for our wedding website. It's a simple Rails app that allows guests to choose and buy wedding gifts. It also allows part-payment towards gifts. All payments are handled by Stripe.

## Ruby version

This app uses Ruby 2.5.0. I use `rbenv` to manage Ruby versions.

## System dependencies

All dependencies are listed in the `Gemfile`.

## Configuration

Environment variables that should be defined:

* `STRIPE_PUBLISHABLE_KEY`: your Stripe publishable key for accepting payments
* `STRIPE_SECRET_KEY`: your Stripe secret key for accepting payments
* `SECRET_KEY_BASE`: a random string for the default Rails secret key

## Tests

To be written!

## Deployment instructions

This app can be deployed to Heroku.
