---
title: Server-side payment initialization
bookToc: true
---

# Payment initialization on the server-side
***

The server-side payment initialization makes it possible to integrate a Checkout Form into your website or game client using PaySuper API. It’s easy to get a Checkout Form URL using an Order API request and render a payment form in a browser.

You can use PaySuper JS SDK for the [client-side payment initialization](/docs/payments/sdk-integration/) to integrate a Checkout Form into your website only on the client-side.

***

## **Step 1.** Create a Checkout order on your server

Send the [POST /api/v1/order](/docs/api/#tag/Payment-Order) to receive an Order ID. Learn more about the [full list of parameters](/docs/api/#tag/Payment-Order/paths/~1api~1v1~1order/post) that can be used for instance the redirect URLs for successful and failed payments.

### **Simple Checkout**

To collect one-time payments it's enough to have a [Project ID](/docs/payments/quick-start/#step-2-set-up-a-project) and an acceptable amount with currency.

Use this sample code to create an Order ID with the required parameters for a simple checkout:

{{< runkit >}}simple-checkout-order-api{{< /runkit >}}

{{< highlight bash >}}
curl -X POST -H 'Content-Type: application/json' -d '{
    "project": "YOUR_PROJECT_ID",
    "amount": 10,
    "currency": "USD",
    "type": "simple"
}' 'https://p1payapi.tst.protocol.one/api/v1/order'
{{< /highlight >}}

{{< hint warning >}}
Remember to use your IDs for the project and products. You can find your IDs in your merchant account on [the PaySuper Projects](https://paysupermgmt.tst.protocol.one/projects/). Open your Project settings page, select the Product tab and click on the Product name. Copy the Project and Product IDs from the page URL.
{{< /hint >}}

### **Products Checkout**

If you're selling products such as [key-activated products, virtual items or in-game currency](/docs/payments/quick-start/#step-2-set-up-a-project), you can use this sample code with a defined product parameter:

{{< tabs "products_id" >}}

{{< tab "Game Key" >}}

{{< runkit >}}game-key-checkout-order-api{{< /runkit >}}

{{< highlight bash >}}
curl -X POST -H 'Content-Type: application/json' -d '{
    "project": "YOUR_PROJECT_ID",
    "products": ["YOUR_GAME_KEY_ID"],
    "platform_id": "gog",
    "type": "key"
}' 'https://p1payapi.tst.protocol.one/api/v1/order'
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual Item" >}}

{{< runkit >}}items-checkout-order-api{{< /runkit >}}

{{< highlight bash >}}
curl -X POST -H 'Content-Type: application/json' -d '{
    "project": "YOUR_PROJECT_ID",
    "products": ["YOUR_VIRTUAL_ITEM_ID_1", "YOUR_VIRTUAL_ITEM_ID_2"],
    "type": "product"
}' 'https://p1payapi.tst.protocol.one/api/v1/order'
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual Currency" >}}
RUNKIT

{{< highlight bash >}}
{{< /highlight >}}

{{< /tab >}}

{{< /tabs >}}

## **Step 2.** Display a Checkout Form

{{< tabs "server_form_id" >}}

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