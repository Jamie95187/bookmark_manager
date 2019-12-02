## User stories

As a time-pressed user,
So that I can quickly go to the web sites I regularly visit
I'd like the webpage to show the list of bookmarks

Object | Messages
---|---
webpage | show
bookmark |

## Domain Model

Here's our domain model:

![DomainModel](./images/bookmark_manager_1.png)

* the client does a get request to the Controller (app.rb)
* then the controller asks for the list of bookmarks from the Model (Bookmark)
* the Model returns a array of bookmarks
* the Controller sends the list to the view
* the View sends back the HTML
* the Controller sends back and renders the response to the Client
