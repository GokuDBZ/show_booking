# MY MOVIES

## MY MOVIES is a prototype of movie ticketing system like bookmyshow.

## Ruby version : 2.5.8
## Rails version: 5.2.1

## Used RSpec for writing unit test cases.
 * rspec spec/

* Database -
  ### Sqlite on local
  ### PgSQL on prodcution

* Run Migrations
  ### rake db:migrate

* Seed Databse
 ### rake db:seed

* Run Server
 ###  rails s

## Authnetication is being done using devise with no customization

## localhost:3000 or https://booking-show.herokuapp.com/ will bring you to Sign UP page

## After sign up , user will be redirected to movies page where user can see which movies are active.

## Once user click on any movie they will get to know shows of movies with their corresponding cinema and show times.

## After selecting particular show, user will be able to select seats of theri choice.

## Once seats are chosen , user can click on book seats button to place the order.

## In last user will see the order details.

