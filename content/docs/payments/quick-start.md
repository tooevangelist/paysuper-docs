---
title: Quick start
bookToc: true
---

# Payments Flow

***

## User Flow

{{< figure src="/images/user-flow.png">}}

## Integration Flow

{{< figure src="/images/integration-flow.png">}}

# Quick start
***

## <span style="color:#2e00a8;">Step 1.</span> Register a PaySuper account

[Sign up](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform) and complete [The PaySuper Onboarding](/getting-started/onboarding/) is necessary for a new PaySuper Merchant account.

## <span style="color:#2e00a8;">Step 2.</span> Set up a Project

Having a single project is enough to start selling. 

{{< expand "Create a project  >" " " >}}

**To create a project:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Click the **Create Project** button.
3. Enter a **Project Name**. 
4. Click **Create** to redirect to the Project Settings page.
5. Fill the required information in an appropriate localization:

    * **Full description**
    * **Short description**
    * **Secret key**: Generate a secret key to set up correct integration with PaySuper platform.
    * **Currency**: by default is equal to **USD**.
6. Optional information:

    * **Localization**: you can choose the complete set of supported languages for the project and products descriptions
    * **Logotype**

7. Click **Save**.

{{< /expand >}}

If you want to sell products (as Game keys, Virtual items, Virtual currency) then easily add the necessary sales information about your products to the project.

{{< expand "Add a Game key to the project  >" " " >}}

**To add a Game key:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

{{< expand "Add a Virtual item to the project  >" " " >}}

**To add a Virtual item:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

{{< expand "Add a Virtual currency to the project  >" " " >}}

**To add a Virtual currency:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

## <span style="color:#2e00a8;">Step 3.</span> Create a Token or Order ID

You can obtain a Token to integrate with the Checkout Form. The Token is a secure string that encrypts all order parameters which identifies a user and project.

**Token-based features:**

* **Instantly redirect from anywhere of your game application**: You can create a token after a user registered or logged in your game and instantly redirect the user to the Checkout Form when the user intent a payment.
* **The pre-filled information in a payment form**: Token can encrypt all required information about your user intent to pay. The Checkout Form is pre-filled in this case.

**To create a Token:**

Send the request **`POST /api/v1/tokens`**. Both the request and the response are in JSON format.

ПРИМЕР ТОКЕНА с обязательными параметрами для ключа и пользователя Вставьте сюда https://runkit.com/home пример с созданием токена

**Order-based features:**

* **Request a payment order on-demand:**  It is best suited for e-store where a user creates a product cart.

**To create a payment Order ID:**

Send the request **`POST /api/v1/order`**. Both the request and the response are in JSON format.

ПОКАЗАТЬ ПРИМЕР С ПАРАМЕТРАМИ для type=key

## <span style="color:#2e00a8;">Step 4.</span> Set up a Checkout Form

Checkout Form has a flexible integration on all your available platforms:

* **Iframe**
* **Embedded** (only for the integration with [PaySuper JS SDK](https://github.com/paysuper/paysuper-js-sdk))
* **New window** (only for the integration with [PaySuper API](/docs/api/))

### Integration with PaySuper JS SDK

You can use PaySuper JavaScript SDK to create an instance of a Payment Form with just a few lines of code.

**Step 1.** To get started, include the following script tag on your website - always load it directly from `https://cdn.pay.super.com`:

{{< highlight html >}}
<script src="https://cdn.pay.super.com/paysdk/latest/paysuper.js"></script>
{{< /highlight >}}

**Step 2.** Create an instance of the PaySuper form to initiate the payment process:

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185'
    });

    paySuper.renderModal();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

[Full list of PaySuper parameters](https://github.com/paysuper/paysuper-js-sdk/tree/master#paysuper-options)

See the sample codes of the Checkout Form for a Simple Checkout or products:

* [Simple Checkout form parameters](/docs/payments/simple/#client-integration-with-js-sdk)
* [Typed Checkout form parameters](/docs/payments/typed/#client-integration-with-js-sdk)

**Step 3.** Display the form in a modal window or iframe:

**Display the Checkout form in a modal window anywhere of your platform**

{{< highlight javascript >}}
paySuper.renderModal();
{{< /highlight >}}

**Display the Checkout form in an iframe**

{{< highlight javascript >}}
paySuper.renderPage();
{{< /highlight >}}

**Step 4.** Handle the purchase events

{{< highlight javascript >}}
paySuper.on('paymentCompleted', function() {
      // You can show a message about payment is completed
})
{{< /highlight >}}

[Full events list in the expected order of execution](https://github.com/paysuper/paysuper-js-sdk#paysuper-events)

***

### Integration with PaySuper API

You can follow these steps if you want to integrate the Checkout Form without PaySuper SJ SDK for other reasons.

**Step 1.** Send a HTTP request to initiate a payment [POST /api/v1/order](ССЫЛКА НА API метод в redoc) and retrieve a response parameter **`payment_form_url`** - URL of PaySuper Checkout form.

See the sample codes of the Checkout Form for a Simple Checkout or products:

* [Simple Checkout form parameters](/docs/payments/simple/#server-integration-with-paysuper-api)
* [Types Checkout form parameters](/docs/payments/typed/#server-integration-with-paysuper-api)

**Step 2.** Embed as an iframe or open the received URL in a browser as a new window.

**Sample code of embedded form:**

{{< highlight html >}}
<iframe src="{payment_form_url}"></iframe>
{{< /highlight >}}

## <span style="color:#2e00a8;">Step 5.</span> Set up a webhook handling

The PaySuper system can send webhooks to your server for a set of events about transactions and user actions. Types of events described in [the list notification types](ССЫлка на апи вебхуков).

**Set up webhooks for your project:**

1. Configure URLs for all event types:

    СКРИНШОТ

2. PaySuper signs the webhook events it sends to your endpoint, allowing you to validate that they were not sent by a third-party and prevent hacker attacks.
To verify a webhook request, generate a signature and compare that to the value of the Authorization header.

    [Learn more about how to check a digital signature.](ССЫЛКА НА API webhook)

3. Respond with HTTP code 200 without a message body to acknowledge the receipt a webhook.

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

## Questions?

{{< columns >}}

#### [Sales](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform)

Our salespeople are pleasant and friendly. Leave your contact details, and we'll be back to you in no time. 

<--->

#### [Support](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform)

We are always happy to help with a code, improve a guide or consider a feature.

<--->

#### [GitHub](https://github.com/paysuper)

The PaySuper Checkout form, the JS SDK and even the server are available as a source code on our GitHub. You're welcome to explore the code and help us make PaySuper even better.

{{< /columns >}}