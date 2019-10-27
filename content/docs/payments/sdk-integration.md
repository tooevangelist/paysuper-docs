---
title: Client-Only Integration
bookToc: true
---

# Client-Only Integration with PaySuper JS SDK
***

{{< columns >}}

It’s easy to embed [PaySuper JS SDK](https://github.com/paysuper/paysuper-js-sdk) on any platform to display a Payment Form with just a few lines of code.

<--->

**HOW IT WORKS**

Try out [the payment sample](ССЫЛКА НА ПРИМЕР ФОРМЫ, та же что выше) or see [the code on GitHub](ПРИМЕР КОДА и КАК ЕГО ЗАПУСКАТЬ).
{{< /columns >}}

***

## **Step 1.** Embed the Checkout Form

To get started, include the following script tag on your website - always load it directly from `https://cdn.pay.super.com`:

{{< highlight html >}}
<script src="https://cdn.pay.super.com/paysdk/latest/paysuper.js"></script>
{{< /highlight >}}

## **Step 2.** Provide parameters

### **Simple Checkout**

To create a Checkout Form to collect one-time payments it's enough to have a [Project ID](/docs/payments/quick-start/#step-2-set-up-a-project) and an acceptable amount with currency.

Use this sample code to create an instance of the Checkout object with the required parameters for a simple checkout:

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5624a06ae110001509186',
    amount: 10,
    currency: 'USD'
});
{{< /highlight >}}

### **Products Checkout**

In case of using the sales methods for products such as [key-activated products, virtual items or in-game currency](/docs/payments/quick-start/#step-2-set-up-a-project) implement this sample code for a specific product:

{{< tabs "products_id" >}}
{{< tab "Game key" >}}

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5624a06ae110001509186',
    products: ['5d7baee015ff7d0001b986a8'],
    platform_id: 'gog',
    type: 'key'
});
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual item" >}}

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5624a06ae110001509186',
    products: ['5d848f484dd6a50001970479', '5d8c7a219e362100013de214'],
    type: 'product'
});
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual currency" >}}

ПРИМЕР КОДА ПРОСИТЬ У ДИМЫ или АНДРЕЯ кода реализуют

{{< highlight javascript >}}
const paySuper = new PaySuper({
    
});
{{< /highlight >}}

{{< /tab >}}
{{< /tabs >}}

[Full list of PaySuper parameters](https://github.com/paysuper/paysuper-js-sdk/tree/master#paysuper-options)

> Use your IDs for the Project and Products found in your merchant account on [the PaySuper Projects](https://paysupermgmt.tst.protocol.one/projects/). To get the Project and Product IDs: open your Project settings page, select the product tab and click on the Product name. Copy the Project and Product IDs from an opened page URL.

## **Step 3.** Display the Checkout Form

This is a brief example usage of a sample code how to call a method to display the Checkout Form when user intent to buy in particular clicking on a payment button.

{{< tabs "embed_id" >}}

{{< tab "Embed as a modal window" >}}

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        project: '5cd5624a06ae110001509186',
        amount: 10,
        currency: 'USD'
    });

    paySuper.renderModal();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

{{< /tab >}}

{{< tab "Embed as an iframe" >}}

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        project: '5cd5624a06ae110001509186',
        amount: 10,
        currency: 'USD'
    });

    paySuper.renderPage();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

{{< /tab >}}

{{< /tabs >}}

## **Step 4.** Handle the purchase events

{{< highlight javascript >}}
paySuper.on('paymentCompleted', function() {
      // You can show a message about payment is completed
})
{{< /highlight >}}

[Full events list in the expected order of execution](https://github.com/paysuper/paysuper-js-sdk#paysuper-events)

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