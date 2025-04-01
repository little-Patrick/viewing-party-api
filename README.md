# Viewing Part API - Solo Project

This is the base repo for the Viewing Party Solo Project for Module 3 in Turing's Software Engineering Program. 

## About this Application

Viewing Party is an application that allows users to explore movies and create a Viewing Party Event that invites users and keeps track of a host. Once completed, this application will collect relevant information about movies from an external API, provide CRUD functionality for creating a Viewing Party and restrict its use to only verified users. 

## Requests

### Root Route:
  https://viewing-party-api-apfh.onrender.com


GET All Users
  Route:  /api/v1/users
  Description: Get all of the users from the users table

#### Get User Parties Host

  Route: /api/v1/users/:id
  
  Description: Get the viewing party for a user.ZQ

#### GET Top Movies

  Route: /api/v1/movie/top_movies
  
  Description: Get the top rated movies from the database
  
#### GET Movie Details
  Route: /api/v1/movie/details/:id
  Description: Get the details for a specific movie (using the movies id)
  
#### GET Movie Search

  Route: /api/v1/movie/search
  
  Description: Search for a movie title that contains a query snippet.

#### Post Viewing Party

  Route: /api/v1/movie/viewing_parties
  
  Description: Create a viewing party
  
  Example Json Body:
  
    {
      "name": "Sci-Fi Marathon",
      "start_time": "2025-04-01 18:00:00",
      "end_time": "2025-04-01 23:00:00",
      "movie_id": 1,
      "movie_title": "Interstellar",
      "host_id": 13,
      "invitees": [13, 14]
    }
  
#### Patch Viewing Party

  Route: /api/v1/viewing_parties/:id
  
  Description: Update an existing viewing party (using viewing_party id)
  
  Example Json Body:
  
    {
      "invitees_user_id": 16
    }

