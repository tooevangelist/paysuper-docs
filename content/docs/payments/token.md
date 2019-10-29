---
title: Payment initialization with token
bookToc: true
---

# Payment initialization with token
***

A token is an encrypted string that represents certain details of your customer, such as the user id, game and purchase parameters.

You can create a token before your customer intents to pay and use it in the future payments. For instance, you can create the token after a user has signed up or has logged in to your website or a game client. When your customer wants to pay for something you instantly redirect them to the PaySuper-hosted Checkout Form to instantly complete a purchase.

## Token-based features

* **Instantly redirect to a Checkout Form**: Once you have created a token that stores the necessary customer data, you don't need to request that data again from the customer. Instead you can display the PaySuper Checkout Form so the customer can conveniently confirm the purchase. This is useful when you can identify a customer in your system.

* **The pre-filled information in a Checkout Form**: The Checkout Form is pre-filled with the applicable information about your customer that it can get from the token.

***

You can follow these steps to create a Checkout Form:

## **Step 1.** Create a token on your server

Send the [POST /api/v1/tokens](ССЫЛКА) to receive an encrypted string. Learn more about [the full list of parameters](ССЫЛКА).

{{< runkit "token-client" >}}
{{< /runkit >}}

{{< hint warning >}}
Setting up the `type` parameter in a token is required for all of the sales options.
{{< /hint >}}

{{< highlight bash >}}
curl -X POST -H 'X-API-SIGNATURE: YOUR_SIGNATURE' -d '{
 "settings": {
    "project_id": "5db16ae811bf0d0001fdfbd1",
    "amount": 10,
    "currency": "USD",
    "type": "simple"
 },
 "user": {
   "id": "58799f2c2564296bd2cb",
   "address": {
      "city": "Almere",
      "country": "NL",
      "postal_code": "1326 PA",
      "state": "Flevoland"
   },
   "email": {
      "value": "user.email@example.com",
      "verified": true
   }
 }
}' 'https://p1payapi.tst.protocol.one/api/v1/tokens'
{{< /highlight >}}

{{< hint warning >}}
Remember to replace the value with a [sha512 hash](ССЫЛКА НА АПИ СПЕКУ как передавать хедер с авторизацией must contain a sha512 hash of concatenation request body and the project secret key) in the Header `X-API-SIGNATURE` and your Project ID in the `project_id` parameter.
{{< /hint >}}

## **Step 2.** Create a Checkout Form with a token

### **client-side payment initialization**

To integrate a Checkout Form you can follow the [client-side payment initialization](/docs/payments/sdk-integration/) but instead pass a token parameter when creating a PaySuper object.

If your token contains [user and order parameters](ССЫЛКА НА АПИ СПЕКУ параметры tokens) then you can create a Checkout Form instance with just a single parameter:

{{< highlight javascript >}}
const paySuper = new PaySuper({
   token: '5cd5620f06ae110001509185'
});
{{< /highlight >}}

If your token encrypts only the [user data](ССЫЛКА НА АПИ СПЕКУ параметры tokens) then you can create a Checkout Form instance passing the token and also the order parameters:

{{< highlight javascript >}}
const paySuper = new PaySuper({
   token: '5cd5620f06ae110001509185'
   project: '5cd5624a06ae110001509186',
   amount: 10,
   currency: 'USD'
});
{{< /highlight >}}

{{< hint warning >}}
Note that the parameters used in the `POST /api/v1/tokens` request override the corresponding parameters in a PaySuper object if they exist.
{{< /hint >}}

***

## Next steps

{{< hint info >}}
[**After the payment**](/docs/payments/live/)

After a successful payment, you have to fulfil the customer’s purchase. You can use [webhooks](ССЫЛКА) or the [Transaction log](ССЫЛКА) to accomplish the purchase.
{{< /hint >}}

{{< hint info >}}
[**Testing the Checkout**](/docs/payments/testing/)

Verify that your integration with PaySuper Checkout works correctly. Our offered test cards can be used to create payments that produce defined responses for you to test your integration code.
{{< /hint >}}

{{< hint info >}}
[**Customizing the Checkout**](/docs/payments/customization/)

Learn about the different ways you can customize your Checkout.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}