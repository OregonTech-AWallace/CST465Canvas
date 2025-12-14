# Authentication and Authorization
These two terms are related, and may seem interchangeable, but they are NOT the same.

**Authentication** – The process by which user credentials are verified and the identity of the user is confirmed

**Authorization** – The process by which access to resources for an authenticated user is determined.

## The Beer Tent Example
This is a common analogy that I cannot claim credit for, but does an excellent job of illustrating the concepts of Authentication and Authorization.

Suppose you go to a music festival and decide that you would like an adult beverage.  

1. You go to the beer tent.

    ![Music Festival Beer Tent](../Images/8/beer-tent.jpg)

    Having just shown up, they deny selling you a beverage and direct you to the wristband tent.

    YOU ARE NOT AUTHENTICATED OR AUTHORIZED

1. You go to the wristband tent
    You show them your drivers license and they give you a wristband that shows you are 21+ years old.  

    ![Music Festival Wristband](../Images/8/wristband.jpg)
    
    THIS IS AUTHENTICATION

1. You return to the beer tent and show them your wristband.  You do not need to show them your drivers license because you have already been authenticated at the wristband tent where you were given a token that is proof of your permissions....err....age.  You are now allowed to purchase a beverage.

    ![Beer Bottle](../Images/8/bottle.jpg)

    THIS IS AUTHORIZATION