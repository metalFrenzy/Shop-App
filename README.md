# Lonely Shop 

It is a shop app that allows users to view products and them to the cart view their past orders and also mark them as favorites. 

## Main Functionalities of the App

* Users can view products and their details 
* Users can mark a products as favorite 
* Users can add products to the cart 
* Users can view their orders that they have done 
* Users can add their own products and manage them


## Main packages and services I have used 

I have developed this app using flutter and used Firebase Real-time database and the Firebase Auth REST Api for developing the authentication part of the app. I have used the provider package for state management, it helps me to handle the data of the app like product data, order data, and cart data. Furthermore, I have used the http package to send and handle http requests to get and post data to the database. Last but not least I have used the shared_preferences package to store authentication data on the device storage so I can automatically log in users and log them out after the token expires.

## Animations that I have used

I have used AnimatedContainer which helped me to automatically animate between the old and new values of properties when they change I have used it in the authentication form to add a nice transition between signing up and logging in. Moreover, I used the hero widget and the customScrollView combined with SliverList and SliverAppBar, for having nice animation between the appbar and the product image. and the hero widget provided me with a nice animation when navigating to the product detail screen.

## Screenshots from the App 

![slogin](https://github.com/metalFrenzy/Shop-App/assets/70327788/529d9937-b8a3-40f7-a379-3d193372f03b)
![soverview](https://github.com/metalFrenzy/Shop-App/assets/70327788/29a9583e-8473-494a-b200-4686c8612245)
![draw](https://github.com/metalFrenzy/Shop-App/assets/70327788/8dbda6da-5ed7-4c08-9431-6050618a2c4d)

![manage](https://github.com/metalFrenzy/Shop-App/assets/70327788/20ed9069-669b-430c-972b-57f67ce798d0)
![edit](https://github.com/metalFrenzy/Shop-App/assets/70327788/8b218f81-2ebf-48ac-af34-091e89015d28)

![cart](https://github.com/metalFrenzy/Shop-App/assets/70327788/2d247ff2-24e3-4587-9542-927d80bcb261)
![orders](https://github.com/metalFrenzy/Shop-App/assets/70327788/b15bbbfd-273b-443c-97c0-9b8f0121d2c4)








