##Rory Example Application

The purpose of this app is to better understand the Rory framework and document how to use the framework.
_________
###Setup:

Clone the repository and get your terminal prompt to the example_rory folder.

```
git clone https://github.com/adammcfadden/rory.git
cd rory/example_rory
```
Bundle to make sure all gems are installed:
```
bundle
```

Create your databases: (*you can replace "rory_dev" or "rory_test" with anything you want, but it needs to match what you have in your database.yml file*)
Running the following command will create your dev and test databases.
```
createdb rory_dev rory_test
```
Run your migration:
```
bundle exec rake db:migrate
```
Start the app:

```
thin start
```
Navigate to http://localhost:3000
_________

###Using the API:

Curl for test json file:
 ```
 curl -H "X-API-TOKEN:test-token" http://localhost:3000/retrieve_test_json
 ```

 Curl for all posts in database:
 ```
 curl -H "X-API-TOKEN:test-token" http://localhost:3000/retrieve
 ```
_________
###Adding new posts:

Navigate to http://localhost:3000/posts/new

Enter post information, and click submit. Your new post will now be returned if you curl for all posts in database.

_________
###TO-DO
* Add walkthrough of how to set up app. step-by-step
* Add validations to posts
* Add comments and set up database relations
* Add a way to post to the database using an api call
