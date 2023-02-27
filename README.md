# README

The purposed challange:

Simple Rails App
Let’s build a simple marketplace web app using Rails. This app should allows seller to choose from a predefined product list, and post it for sale at the price they want. The predefined products could be anything from fruits: `Orange`, `Apple`, `Banana` or mobile phones like `Apple Iphone 12`, `Samsung Galaxy S21`, `Google Pixel 4`.

This app should consists 2 types of users: Buyer and Seller. Buyer and seller can be specified at a simple signup form, along with name, email, password, and state (US states). 

After signup (or login), depend on the user type: seller will be redirect to a product page, where they can CRUD the `Product` model, with some basic fields like:  `sku`, `price`, `quantity` along with its selected predefined product. And buyer will be redirect to a product listing page, where they can browse the products from the sellers that come from same state like them, for example: New York buyers will only be able to view New York's seller products, along with the lowest price for every item, and we should be able to sort this listing page by the lowest price too.

You are free to use any gems and DB to get the job done. Writting tests is required, and be able to containerize it with Docker and deploy the app to Heroku is a big plus.


Add bellow instructions to run, how to deploy it, where to consume it (heroku link), what where the decisions and whys.