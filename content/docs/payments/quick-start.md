---
title: Quick start
bookToc: false
---

# Payments Flow

***

## User Flow

{{< figure src="/images/user-flow.png">}}

## Integration Flow

{{< figure src="/images/integration-flow.png">}}

***

## Quick start

### <span style="color:#2e00a8;">Step 1.</span> [Register](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform) a PaySuper Merchant account.

### <span style="color:#2e00a8;">Step 2.</span> [Set up a Project](https://paysupermgmt.tst.protocol.one/projects/)

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

### <span style="color:#2e00a8;">Step 3.</span> Create a Token or Order ID

You can obtain a Token to integrate with the Checkout Form. The Token is a secure string that encrypts all order parameters which identifies a user and project.

**Token-based features:**

* **Instantly redirect from anywhere of your game application**: You can create a token after a user registered or logged in your game and instantly redirect the user to Checkout form when the user intent a payment.
* **The pre-filled information in a payment form**: Token can encrypt all required information about your user intent to pay. Checkout form is pre-filled in this case.

### To create a Token:

Send the request **`POST /api/v1/tokens`**. Both the request and the response are in JSON format.

    {
        "user": {
            "id": "400001000053548996",
            "email": {
                "value": "mikhail.kirpa16_1@protocol.one",
                "verified": true
            },
            "phone": {
                "value": "380991234567",
                "verified": true
            },
            "name": {
                "value": "mikhail.kirpa16"
            },
            "ip": {
                "value": "80.91.180.90"
            },
            "locale": {
                "value": "en"
            },
            "address": {
                "country": "UA",
                "city": "string",
                "postal_code": "string",
                "state": "string"
            },
            "metadata": {}
        },
        "settings": {
            "project_id": "5cda856f38e0e20001769886",
            "return_url": {
                "success": "https://success",
                "fail": "https://fail"
            },
            "currency": "EUR",
            "amount": 120,
            "items": [
                {
                    "sku": "string",
                    "amount": 0,
                    "currency": "string"
                }
            ],
            "description": "string",
            "metadata": {}
        }
    }

You can find the full list of parameters in the [API Reference]().

**Order-based features:**

* **Request a payment order on-demand:**  It is best suited for e-store where a user creates a product cart.

### To create a payment Order ID:

Send the request **`POST /api/v1/order`**. Both the request and the response are in JSON format.

    curl -X POST "https://p1payapi.tst.protocol.one/api/v1/order" \
    -H "accept: application/json" \
    -H "Content-Type: application/json" \
    -d "{ \"account\": \"string\", \"amount\": 10, \"currency\": \"USD\", \"description\": \"string\", \"order_id\": \"string\", \"other\": {}, \"payer_email\": \"string\", \"payer_ip\": \"string\", \"payer_phone\": \"string\", \"payment_method\": \"string\", \"project\": \"5daf6b125c8256000117d86f\", \"region\": \"string\", \"signature\": \"string\", \"url_fail\": \"string\", \"url_notify\": \"string\", \"url_success\": \"string\", \"url_verify\": \"string\"}"

ССЫЛКА НА страницу simple.md

ССЫЛКА НА страницу typed.md

You can find the full list of parameters in the [API Reference]().

### <span style="color:#2e00a8;">Step 4.</span> Set up the payment form

Checkout Form has a flexible integration on all your available platforms.

Embedded by API, SDK
Modal window by API
New window by SDK

### <span style="color:#2e00a8;">Step 5.</span> Set up webhook handling

Handle actions and transaction states after the payment.

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