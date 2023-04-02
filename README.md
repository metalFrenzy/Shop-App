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

![shopAuth](https://user-images.githubusercontent.com/70327788/229384556-b121c41a-3e67-4620-8a78-9cb7a79b8e33.png)

![overview](https://user-images.githubusercontent.com/70327788/229384652-8c8f45b6-4185-492f-bfaa-b691ac286398.png)

![shopDrawer](https://user-images.githubusercontent.com/70327788/229384632-e3589fa7-0401-48dd-a03f-365ef1729b58.png)

![cart](https://user-images.githubusercontent.com/70327788/229384698-12119a56-76fe-4333-88af-be25a727f469.png)

![orders](https://user-images.githubusercontent.com/70327788/229384717-0981e150-8f7d-4d85-a89c-ea30c8a8fa9a.png)


![New Picture (1)](https://user-images.githubusercontent.com/70327788/229384733-64c56805-1290-4f5a-8b76-9add07805cbc.png)







