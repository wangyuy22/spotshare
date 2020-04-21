# Project Proposal
* Name (PennKey): wangyuy
* Project Name: SpotShare

## Description

This is a web app that allows users to create playlists with their favorite songs. 
Users can search and add songs to a playlist using the RSpotify gem and the Spotify Api.
Users can also view other users' playlists and play them.

## Database Schema

I was not sure how to insert images so here are the tables. The references will just take the id's of whichever class the references is from.

| users |
| ------ |
| id (int) |
| username (string) | 
| password_hash (string) |

| playlists |
| ------ |
| id (int) |
| title (string) | 
| user (refrences) |
| num_songs (int) |
| total_hours (int) |

| registrations |
| ------ |
| playlist (refrences) |
| song (references) | 

| song |
| ------ |
| id (int) |
| title (string) | 
| artist (string) |
| length_mins (int) |

## Third Party Utilities
##### Gem(s)
RSpotify
BCrypt
ActiveStorage

##### API(s) 
Spotify API

## Build Plan
### Step 1: First create the user class just as we did in HW3. Implement the sign up/log in as well as allowing for profile pictures.

### Step 2: Create the other models playlists, registrations, and songs.

### Step 3: Work on allowing users to first create playlists, and then adding songs to the playlist by searching for them using the API.

### Step 4: Work on the finishing touches such as displaying all the information and configuring the routes.


