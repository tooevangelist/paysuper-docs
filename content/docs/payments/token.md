---
title: Token-based Checkout
bookToc: true
---

# Token-based Checkout
***

A Token is a secure string that represents the details of your user, game and purchase parameters. It's You can create the Token when your customer wants to pay for something. After redirecting your customer to a Checkout Session, Stripe presents a payment form where your customer can complete their purchase.

**Token-based features:**

* **Instantly redirect from anywhere of your game application**: You can create a token after a user registered or logged in your game and instantly redirect the user to the Checkout Form when the user intent a payment.
* **The pre-filled information in a payment form**: Token can encrypt all required information about your user intent to pay. The Checkout Form is pre-filled in this case.

**To create a Token:**

Send the request **`POST /api/v1/tokens`**. Both the request and the response are in JSON format.

ПРИМЕР ТОКЕНА с обязательными параметрами для ключа и пользователя Вставьте сюда https://runkit.com/home пример с созданием токена
