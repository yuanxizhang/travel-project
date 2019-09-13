# README

## Travel Plans: a Rails application that helps you find vacation package offers and pricing for your travel plans

Things you might need to build an app like this:

* Ruby version: 2.6

* Rails version: 6.0

* Database: PostgreSQL

##Instructions to craete the front-end and backend of the application

###Step 1: build a Rails REST API backend. 

####In your terminal enter the following command:

rails new travel_plans --database=postgresql --api

####Create the models: Plan, Offer, Provider

rails g model Plan place, budget
rails g model Provider name, website
rails g model Offer tour_name, about, departs, length, price_from

####Create the serializers: 

rails g serializer plan
rails g serializer provider
rails g serializer offer

####Create the controllers: 

rails g controller api/v1/Plans
rails g controller api/v1/Providers
rails g controller api/v1/Offers

####Define routes in config/routes.rb:

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :plans, only: [:index, :new, :show, :update]
      resources :providers, only: [:index, :show, :update]
      resources :offers, only: [:index, :new, show, :update]
    end
  end
end

####create migration tables

rails db:create && rails db:migrate


