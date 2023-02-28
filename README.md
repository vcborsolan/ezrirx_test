# README

The purposed challange:

Simple Rails App
Let’s build a simple marketplace web app using Rails. This app should allows seller to choose from a predefined product list, and post it for sale at the price they want. The predefined products could be anything from fruits: `Orange`, `Apple`, `Banana` or mobile phones like `Apple Iphone 12`, `Samsung Galaxy S21`, `Google Pixel 4`.

This app should consists 2 types of users: Buyer and Seller. Buyer and seller can be specified at a simple signup form, along with name, email, password, and state (US states). 

After signup (or login), depend on the user type: seller will be redirect to a product page, where they can CRUD the `Product` model, with some basic fields like:  `sku`, `price`, `quantity` along with its selected predefined product. And buyer will be redirect to a product listing page, where they can browse the products from the sellers that come from same state like them, for example: New York buyers will only be able to view New York's seller products, along with the lowest price for every item, and we should be able to sort this listing page by the lowest price too.

You are free to use any gems and DB to get the job done. Writting tests is required, and be able to containerize it with Docker and deploy the app to Heroku is a big plus.


Add bellow instructions to run, how to deploy it, where to consume it (heroku link), what where the decisions and whys.

It was made a rails 7 backend api only.

About the user roles and authentication, it was decided to use JWT token and user -> seller or buyer STI. It was created some examples of postman requests which it can be imported from the file ezrirx_test.postman_collection.json

A buyer can only get buyer index, in case of a seller trying to request buyer index AKA root, it will be redirected to seller index. The seller product controller (the controller which a seller can CRUD on samples of products) also validates if the current user is a seller, otherwise it will be forbiden the usage.

For buyers the index filters by user state, based on a model method.

If a seller would like to create a new selling product, first he has to get product_controller#index to get the list of products.

It was created minimun seeds for usage, not having the possibility of creating a base product is proposital.

A user need to have at least a valid us state, his username has to be unique, an have at least 6 to 32 characters. It also has to have a unique valid email.

The project was deployed in heroku and the app can be accessed on: https://tranquil-stream-66380.herokuapp.com/