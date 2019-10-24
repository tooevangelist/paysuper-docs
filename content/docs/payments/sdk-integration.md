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

## **Step 1.** Embed the PaySuper Form

To get started, include the following script tag on your website - always load it directly from `https://cdn.pay.super.com`:

{{< highlight html >}}
<script src="https://cdn.pay.super.com/paysdk/latest/paysuper.js"></script>
{{< /highlight >}}

## **Step 2.** Provide parameters

### **Simple Checkout**

Create a Checkout Form to collect one-time payments. It's enough to have a project ID to initiate a payment with a acceptable amount.

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5624a06ae110001509186',
    amount: 50,
    currency: 'USD'
});
{{< /highlight >}}

### **[Token-based](/docs/payments/token) Checkout**

{{< highlight javascript >}}
const paySuper = new PaySuper({
    token: '5cd5620f06ae110001509185'
});
{{< /highlight >}}

### **[Products](/docs/payments/quick-start/#step-2-set-up-a-project) Checkout**

{{< tabs "uniqueid" >}}
{{< tab "Game key" >}}

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5620f06ae110001509185',
    products: ['5d7baee015ff7d0001b986a8'],
    platform_id: 'gog',
    type: 'key'
});
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual item" >}}

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5620f06ae110001509185',
    products: ['5d848f484dd6a50001970479', '5d8c7a219e362100013de214'],
    type: 'product'
});
{{< /highlight >}}

{{< /tab >}}

{{< tab "Virtual currency" >}}

ПРИМЕР КОДА ПРОСИТЬ У ДИМЫ или АНДРЕЯ кода реализуют

{{< highlight javascript >}}
const paySuper = new PaySuper({
    project: '5cd5620f06ae110001509185',
    products: ['5d848f484dd6a50001970479', '5d8c7a219e362100013de214'],
    type: 'virtual_currency'
});
{{< /highlight >}}

{{< /tab >}}
{{< /tabs >}}

[Full list of PaySuper parameters](https://github.com/paysuper/paysuper-js-sdk/tree/master#paysuper-options)

> Use your IDs for the Project and Products found in your merchant account on [the PaySuper Projects](https://paysupermgmt.tst.protocol.one/projects/). To get the Project and Product IDs: open your Project settings page, select the product tab and click on the Product name. Copy the Project and Product IDs from an opened page URL.

## **Step 3.** Display a form

When your customer is ready to pay, call create an instance of the PaySuper and render it:

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185'
    });

    // Embed a form as a modal window
    paySuper.renderModal();
    
    // Embed a form as an iframe
    // paySuper.renderPage();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

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
[**Testig the Checkout**](/docs/payments/testing/)
{{< /hint >}}

{{< hint info >}}
[**After the payment**](/docs/payments/live/)
{{< /hint >}}

{{< hint info >}}
[**Customizing Checkout**](/docs/payments/customization/)
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}