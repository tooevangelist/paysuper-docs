---
title: Payment initialization with token
bookToc: true
---

# Payment initialization with token
***

A token is an encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.

You can create a token before your customer intents to pay and use it in the future payments. For instance, you can create the token after a user has signed up or has logged in to your website or a game client. When your customer wants to pay for something you redirect them to the PaySuper-hosted Checkout Form to instantly complete a purchase.

## Token-based features

* **Instantly redirect to a Checkout Form**: Once you have created a token that stores the necessary customer data, you don't need to request that data again from the customer. Instead you can display the PaySuper Checkout Form so the customer can conveniently confirm the purchase. This is useful when you can identify a customer in your system.

* **The pre-filled information in a Checkout Form**: The Checkout Form is pre-filled with the applicable information about your customer that it can get from the token.

***

You can follow these steps to create a Checkout Form:

## **Step 1.** Create a token on your server

Send the [POST /api/v1/tokens](ССЫЛКА) to receive an encrypted string. Learn more about the [full list of parameters](ССЫЛКА).

{{< hint warning >}}
Remember to add a Header **X-API-SIGNATURE** with a **sha512 hash** value that is a concatenation the request body and the Project Secret key found on the Project Webhooks page. Notice, the JSON format of the request body and in the hash must be the same.
{{< /hint >}}

{{< runkit >}}token-simple-checkout{{< /runkit >}}

{{< highlight bash >}}
curl -X POST -H 'X-API-SIGNATURE: YOUR_SIGNATURE' -d '{
 "settings": {
    "project_id": "YOUR_PROJECT_ID",
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

## **Step 2.** Create a Checkout Form with a token

### **Open a Checkout Form by URL**

{{< tabs "token_form_id" >}}

{{< tab "New browser window" >}}

Retrieve the response parameter `payment_form_url` from the previous step. It is the URL of PaySuper-hosted payment form.

When your customer is ready to start a payment you can redirect the user to an URL in a new browser window.

{{< /tab >}}

{{< tab "Iframe" >}}

Retrieve the response parameter `payment_form_url` from the previous step. It is the URL of PaySuper-hosted payment form.

Embed the Checkout Form as an inline iframe by URL:

{{< highlight html >}}
<iframe src="{payment_form_url}"></iframe>
{{< /highlight >}}

{{< /tab >}}

{{< tab "Standalone web-page" >}}

Retrieve the response parameter with **`id`** from the previous step. It is the ID of the created order.

Use this code sample to open the Checkout Form as a standalone web-page with [PaySuper JS SDK](/docs/payments/sdk-integration/#step-1-embed-the-checkout-form) and replace `YOUR_ORDER_ID` in the `formUrl` with `id` value.:

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        formUrl: 'https://order.pay.super.com/?order_id=YOUR_ORDER_ID'
    });

    paySuper.renderPage();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

{{< /tab >}}

{{< /tabs >}}

***

{{< hint info >}}
Note that the parameters used in the `POST /api/v1/tokens` request override the corresponding parameters in an order object.
{{< /hint >}}

### **Client-side payment initialization**

To integrate a Checkout Form you can follow the [client-side payment initialization](/docs/payments/sdk-integration/) but instead pass a token parameter when creating a PaySuper object.

If your token contains [user and order parameters](/docs/api/#tag/Token) then you can create a Checkout Form instance with just a single parameter:

{{< highlight javascript >}}
const paySuper = new PaySuper({
   token: '5cd5620f06ae110001509185'
});
{{< /highlight >}}

If your token encrypts the [user data](/docs/api/#tag/Token) then you can create a Checkout Form instance passing the token and also the order parameters:

{{< highlight javascript >}}
const paySuper = new PaySuper({
   token: '5cd5620f06ae110001509185'
   project: '5cd5624a06ae110001509186',
   amount: 10,
   currency: 'USD'
});
{{< /highlight >}}

### **Server-side payment initialization**

To integrate a Checkout Form you can follow the [server-side payment initialization](/docs/payments/integration/) with the `token` parameter.

If your token contains the [user and order parameters](/docs/api/#tag/Token) then you can request a Checkout Form URL with just a single parameter:

{{< runkit >}}{{< /runkit >}}
ПРИМЕР CURL и RUNKIT ТОЛЬКО параметр token в /api/v1/order

You can predefine a user and/or an order parameters in a token and pass the other parameters in an order request:

{{< runkit >}}{{< /runkit >}}

ПРИМЕР CURL и RUNKIT в /api/v1/order какие параметры???

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