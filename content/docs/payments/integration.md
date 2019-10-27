---
title: Client-Server Integration
bookToc: true
---

# Client-Server Integration with PaySuper API
***

If your sales use cases are not suited [the client-only integration](/docs/payments/sdk-integration/), use the client-server integration with PaySuper API instead.

***

## **Step 1.** Create a Checkout Order ID on your server

Send the [POST /api/v1/order](ССЫЛКА) to receive an Order ID. Learn more about [the full list of parameters](ССЫЛКА) that can be used for instance the redirect URLs for successful and failed payments.

### **Simple Checkout**

To collect one-time payments it's enough to have a [Project ID](/docs/payments/quick-start/#step-2-set-up-a-project) and an acceptable amount with currency.

Use this sample code to create an Order ID with the required parameters for a simple checkout:

{{< runkit "id1" >}}
{{< /runkit >}}

{{< highlight bash >}}
curl -X POST -H 'Content-Type: application/json' -d '{
    "project": "5db16ae811bf0d0001fdfbd1",
    "amount": 10,
    "currency": "USD",
    "type": "simple"
}' 'https://p1payapi.tst.protocol.one/api/v1/order'
{{< /highlight >}}

### **Products Checkout**

In case of using the sales methods for products such as [key-activated products, virtual items or in-game currency](/docs/payments/quick-start/#step-2-set-up-a-project) implement this sample code for a specific product:

{{< tabs "products_id" >}}

{{< tab "Game key" >}}
RUNKIT

{{< highlight bash >}}
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual item" >}}
RUNKIT

{{< highlight bash >}}
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual currency" >}}
RUNKIT

{{< highlight bash >}}
{{< /highlight >}}

{{< /tab >}}

{{< /tabs >}}

{{< hint warning >}}
Note to use your IDs for the Project and Products found in your merchant account on [the PaySuper Projects](https://paysupermgmt.tst.protocol.one/projects/). To get the Project and Product IDs: open your Project settings page, select the product tab and click on the Product name. Copy the Project and Product IDs from an opened page URL.
{{< /hint >}}

## **Step 2.** Display a Checkout Form

From the previous step retrieve the response parameter **`payment_form_url`** - the URL of PaySuper-hosted payment form.

When your customer is ready to intent a payment you can use this URL in two ways:

* **Redirect the user to URL in a new browser window**

* **Embed PaySuper Form as an inline iframe by URL**

{{< highlight html >}}
<iframe src="{payment_form_url}"></iframe>
{{< /highlight >}}

***

## Next steps

{{< hint info >}}
[**After the payment**](/docs/payments/live/)

After a successful payment, you have to fulfil the customer’s purchase. You can use [webhooks](ССЫЛКА) or the [Transaction log](ССЫЛКА) to accomplish the purchase.
{{< /hint >}}

{{< hint info >}}
[**Testing the Checkout**](/docs/payments/testing/)

Check your integration with PaySuper Checkout works correctly. Test cards can be used to create payments that produce successful and particular responses.
{{< /hint >}}

{{< hint info >}}
[**Customizing Checkout**](/docs/payments/customization/)

Learn about the different ways you can customize your Checkout.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}