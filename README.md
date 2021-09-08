# Melp
Clone this repo, then run:
1. Install the gems </br> `bundle install`
2. Create the db </br>  `rails db:create`
3. Add the PostGIS extension </br>  `rails db:gis:setup`
4. Run the migrations </br>  `rails db:migrate`
5. Run the seed data </br>  `rails db:seed`

## Public API

The app should expose an API in `/restaurant` 

- Have a CRUD operations
- Have a endpoint to restaurants statistics `restaurants/statistics?latitude=x&longitude=y&radius=z`
- Have a simple test for CRUD operation

## Resources 
- Restaurant (id, name, rating, site, email, phone, street, city, state, lat, lng)

## Postman collection
- if you have postman, you could import the collection from this link: `https://www.getpostman.com/collections/e5f04fdf19ff6ff4c52d`
