# Travel Plans

## The Travel Planning App is built with a Ruby on Rails REST API backend and a javascript frontend. It helps you find the best vacation packages for your travel plans.

The goals for this project:
* Design and architect features across frontend and backend
* Integrate JavaScript and Rails
* Debug issues in small- to medium-sized projects
* Build and iterate on a project MVP
* Communicate in a technical environment

The features of this application:
* Add a new traveler to the travel group
* Remove travelers from the travel group
* View all of the tours that are offered by tour providers
* Like a tour by clicking on the like button to increase the total like count
* Add a new travel plan for a traveler

## Rails API Backend Setup 

Create a folder called travel-project. Inside the travel-project folder make two seperate directories: js, rails.

Inside the rails directory, build a rails API:

	rails new travel_plans --database=postgresql --api

Build models and controllers in the Rails API for providers, offers, travelers, plans.
	
From your terminal, run: 
	rails g model Traveler name passion

Then run: 
	rails db:create && rails db:migrate

There are two different one-to-many relationships between the models: each traveler has many travel plans, each provider has many tour offers.

Things we need to do for the traveler controller:
* We're rendering all travelers in the form of JSON.
* We're creating a new traveler based on whatever traveler_params we get from our frontend.
* We're setting out traveler_params to permit a parameter named name and a parameter named passion. These must be included in the body of the POST requests we will be making with JS fetch.

After the Rails Backend is completed, we can check the four working endpoints, or routes that it exposes to the public. To see all the travelers, for example, we could navigate to http://localhost:3000/api/v1/travelers.

## Javascript Frontend Setup

This is a Singla Page Application(SPA), we want to build one HTML page. We will name the file for home page index.html. 

In the frontend, we use classes and functions to organize our code into reusable pieces. We translate JSON responses into JavaScript model objects. We want to build a class called Traveler to encapsulate Traveler related data and behavior. We will name the file for Traveler class traveler.js.

We also want to create a class whose only responsibility is to communicate with the Rails API, we can name this class Adapter and save it in the file adapter.js.

In the adapter.js file, we want to use fetch to handle Client-Server Communications. All interactions between the client and the server should be handled asynchronously (AJAX) and use JSON as the communication format. 

#### Get Offers and Travelers

When a user loads the page, the app will make a 'GET' request to fetch all the offer data. With the response data, the app makes a list item for each offer and adds it to the offers list. Then it makes the second 'GET' request to fetch all the traveler data, make a div element for each traveler and add it to the main section of the page.

#### Add a New Traveler

When a user clicks on the add traveler button, a POST request is sent to http://localhost:3000/api/v1/travelers with the new traveler's data in JSON format, the new traveler is added to the travelers table in the backned, and the new traveler in rendered on the DOM.

#### Delete a Traveler

When a user clicks on the delete traveler button, a DELETE request is sent to http://localhost:3000/api/v1/travelers/id with the JSON data that has the id of the traveler to be deleted, the traveler is deleted from the travelers table in the backend, and removed from the DOM in the frontend.

#### Update the Like Count of an Offer

When a user clicks on a tour offer's like button, two things will happen: the number of likes on the page will increase by 1, and a 'PATCH' request is sent to the server at http://localhost:3000/api/v1/offers/:id to update the number of likes that the specific offer has in the offers table.
