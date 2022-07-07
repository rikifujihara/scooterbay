<h2><a href='https://mighty-brook-03737.herokuapp.com/'>ScooterBay.com</a></h2>

# ScooterBay - Two Sided Marketplace Application

## The problem ScooterBay solves
E-Scooters have exploded in popularity over the past few years, especially with the adoption of E-Scooter renting services such as Lime making the EV mainstream. Many people are buying these E-Scooters brand new, and as it stands there is no two-sided-marketplace specifically dedicated to E-Scooters.

## Why it's a problem that needs solving
Consumers want to see what it's like to use an E-Scooter without buying brand new and without having to rent for an extended period. For example, if someone wants to see what it's like to commute to work on an E-Scooter every day for a month, they would either have to buy one brand new at a brand new price, or try renting through a service like Lime everyday (which would be very expensive over a month). A two-sided-marketplace will reduce this cost.

Many E-Scooters are being bought as impulse purchases. A two-sided-marketplace will reduce the cost of those impulse purchases (as they will be second hand), and allow those same purchases to be sold back to others.

Too many brand-new E-Scooters being purchased is also worse for sustainability than if more second-hand scooters are being bought as that will mean less scooters in landfill over the long term.

### link to GitHub repo <a href='https://github.com/rikifujihara/scooterbay'>here</a>

## Description of ScooterBay

### Purpose
The purpose of ScooterBay is to bring connect buyers and sellers of second-hand E-Scooters in order to save consumers money and help with sustainability.

### Functionality
ScooterBay allows users to sign up and edit their profile with contact details, a bio and a profile picture. Users can also create, edit and destroy listings, add others' listings to their watchlist and submit and receive offers on listings. Addresses can be specified to listings so they can be searched for via postcode. Categories are also assigned to listings so that they can be filtered. Conditional logic in the erb pages render relevant information depending on the user's access rights and relationship to the given listing or other entity. User can see when they've been a user since, and how long ago they've made/received offers.

### Features
- Authentication
- Authorisation
- Image uploading capability
- Searching and filtering capability
- Administrability

### Sitemap
<img src="app/assets/images/scooterbay-sitemap.jpg">

## Screenshots
<img src='app/assets/images/screenshots/profile-min.png' style="height: 600px">
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/root-min.png'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/index-min.png'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/listing-min.png' style='height: 800px'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/listing-show2-min.png' style='height: 800px'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/watchlist-min.png'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/offer-show-min.png' style='height: 800px'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/offer-edit-min.png' style='height: 800px'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/offers-in-min.png'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/offers-out-min.png'>
<br>
<hr>
<br>
<img src='app/assets/images/screenshots/edit-address-min.png'>

### Target Audience
The target audience of ScooterBay is those wishing to save money on the cost of aquiring an E-Scooter and those wanting to sell their E-Scooters.

### Tech Stack

- Ruby on Rails
- HTML
- CSS/SCSS (BootStrap)
- Heroku
- AWS S3 Storage

ScooterBay is built on Ruby on Rails as its overarching framework. The view consists of html.erb files rendered by the browser. Scss adds styling to the html pages and the site is deployed to Heroku. Image uploads and static images are stored and accessed using AWS S3.

## User Stories

### Browsing listings by category
Scooter buyers want to browse listings by category so that they can find the specific type of scooter that they are interesting in buying.

### Browsing listings by postcode
Scooter buyers want to browse listings by postcode so that they can find scooters that are geographically close to them.

### Editing profile - profile picture
ScooterBay users want to set their profile pictures so that they can express their individuality to the other users on the site and add credibility to their profile.

### Editing profile - bio
ScooterBay users want to add bios to their profiles so that they can express their individuality to the other users on the site and show some of their personality.

### Editing profile - deleting account
ScooterBay users want to have the option to delete their account so that if they no longer need to use ScooterBay, they can rest assured that all of their data is not kept on ScooterBay's storage services.

### Listings - creating listings
E-Scooter sellers want to create listings so that they can be found by potential buyers.

### Listings - editing listings
E-Scooter sellers want to attach an image to their listings so that buyers can see the scooter visually to aid the model and description.


E-Scooter sellers want to specify an address for their listing so that they can increase the chance for their listing to be found by nearby buyers.

### Listings - deleting listings
E-Scooter sellers want to delete their listings so that they don't receive enquiries on listings that they've sold in person or no longer wish to sell.

### Watchlist - adding to watchlist
E-Scooter buyers want to add listings to their watchlist so that they can save listings that they are interested in without making an offer.

### Watchlist - adding to watchlist
E-Scooter buyers want to remove listings from their watchlist so that they can get rid of listings that they are no longer interested in.

### Offers - making offers
E-Scooter buyers want to make offers on other people's listings so that they can create the opportunity to suggest a price along with a message, so they can buy the listing at the listing price or at a bargain if the buyer agrees.

### Offers - editing offers
E-Scooter buyers want to edit offers they have made on others' listings so that they can edit the message or offer price on their offer in case they change their mind.

### Offers - deleting offers
E-Scooter buyers want the option to delete their offers in case they change their minds and no longer want to purchase the listing.

### Offers - receiving offers
E-Scooter sellers want to receive offers on their listings so they can see who is interested in buying their listing.

## Wireframes
### Profile Page
<img src='app/assets/images/wireframes/Account.png'>

### Edit Listing Page
<img src='app/assets/images/wireframes/Edit page.png'>

### Home Page
<img src='app/assets/images/wireframes/home.png'>

### New Listing Page
<img src='app/assets/images/wireframes/New page.png'>

### Search Page
<img src='app/assets/images/wireframes/search_index (1).png'>

### Show Page
<img src='app/assets/images/wireframes/Show page.png'>

### Watchlist Page
<img src='app/assets/images/wireframes/Watchlist.png'>

## ERD
<img src='app/assets/images/ERD.jpg'>

## Third party services
### Devise
Devise is a ruby gem developed to handle user authentication in Rails apps. Devise is modular - Scooterbay utilises database authentication and input validations. Devise fits in perfectly with Rails' MVC architecture and handles much of the abstractions of user authentication. The views for user authentication such as login and signup pages can be generated in order to edit and use them. These views are already linked to a controller which is not accessible by default, although ScooterBay's source code accesses the User controller in order to add some custom functionality. Devise was used to create the User model which formed the basis of the user experience and allowed greater ease of development. 

### Bootstrap
ScooterBay is styled using Bootstrap. The Bootstrap components were accessed via their open-source website <a href='https://getbootstrap.com/'>here</a>. The stylesheets and JavaScript script are accessed via a CDN (content delivery network) instead of a bundled gem or NPM. CSS classes are then applied to various elements to apply the Bootstrap styles. The use of Bootstrap greatly improved speed of development as it allowed more time to focus on the logic of the views rather than the specific visual attributes of elements such as borders, padding, margin and the like.

### Bootstrap
ScooterBay is styled using Bootstrap. The Bootstrap components were accessed via their open-source website <a href='https://getbootstrap.com/'>here</a>. The stylesheets and JavaScript script are accessed via a CDN (content delivery network) instead of a bundled gem or NPM. CSS classes are then applied to various elements to apply the Bootstrap styles. The use of Bootstrap greatly improved speed of development as it allowed more time to focus on the logic of the views rather than the specific visual attributes of elements such as borders, padding, margin and the like.

### AWS S3


## High Level Components (Abstractions)
### MVC architecture and inheritance
What is MVC?:

Explain the concept of inheritance:

How inheritance takes place in a rails application:

How does the above link in with MVC?

## Model relations
"has_one", or "has_many", etc

## Database relations
0 or 1 etc, one to many etc

## Database Schema design

## How tasks are allocated and tracked in the project

### link to Trello board <a href='https://trello.com/invite/b/KVZvpHL0/9aacbe6e24c654b43d825dc38447d555/scooterbay'>here</a>