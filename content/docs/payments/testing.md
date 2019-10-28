---
title: Testing Checkout
bookToc: true
---

# Testing the Payment Process
***

The Payment Form integration should be tested in the Sandbox before [going live](/docs/payments/live/).

The Sandbox provides full functionality but it only emulates processing, no actual bank transactions are made.

When using the PaySuper JS SDK ensure that:

* [Handlers for the events](/docs/payments/sdk-integration/#step-4-handle-the-purchase-events) are displayed properly.
* The PaySuper object created with all required parameters or your token contains all desired parameters.

Incase of using the PaySuper API in your server-side code ensure that:

* [Authentication to the API](ссылка на апи спеку про авторизацию sha512) provided with your Project API secret key.
* [API errors](ССЫЛКА НА апи спеку про типы ошибок) are handled accurately.
* [Webhooks](ссылка на апи спеку про запрос с вебхуками) contains properly URLs for all events types.

## Testing in the Sandbox

**To test a bank card payment:**

**Step 1** Open the PaySuper Checkout Form.

**Step 2** Choose the Bank card of payment methods and enter on of the following card PANs:

**3-D Secure**

3-D Secure is emulated with a page that doesn’t require any password but only shows 2 buttons. One button is for successful authentication, another is for failed authentication. 

**`4000 0000 0000 0002`** **CONFIRMED**

**`5555 5555 5555 4444`** **DECLINED**

**`4000 0000 0000 0044`** **AUTHORIZED** cards must be used only to test antifraud system reaction with compulsory transfer payment to preauthorization.

**Non 3-D Secure**

**`4000 0000 0000 0077`** **CONFIRMED**

**`5555 5555 5555 4477`** **DECLINED**

**`4000 0000 0000 0051`** **AUTHORIZED** cards must be used only to test antifraud system reaction with compulsory transfer payment to preauthorization.

**Step 3** Enter arbitrary expiry date (the format is MM/YY), a Secure code (CVC/CVV, the format is 3 digits) and a cardholder name (the format is firstname lastname).

{{< hint info >}}
The Sandbox bank card payments can be made in the following currencies: USD, EUR, GBP, RUB, BRL, JPY, IDR, MYR, PHP, SGD, THB, VND, KRW, TRY, MXN, CAD, AUD, NZD, NOK, PLN, CHF, CNY, INR, CLP, PEN, COP, ZAR, HKD, TWD, SAR, AED, ARS, ILS, KZT, QAR, CRC, HRK, CZK, RSD, RON, EGP, DKK, HUF, BHD, SEK.
{{< /hint >}}

{{< hint warning >}}
You can also specify incorrect details (card number, expiration date, or CVV) in order to generate an error.
{{< /hint >}}

**Step 4** You will be redirected to the Sandbox page to select of the desired results the success or failed. After you click the result button the current page will be closed and you will be redirected to the Checkout Form to view the purchase status.

{{< hint warning >}}
Note, that when Merchant chooses to fail authentication, payment is always declined, no matter what PAN has been used.
{{< /hint >}}

***

## Next steps

{{< hint info >}}
[**After the payment**](/docs/payments/live/)

After a successful payment, you have to fulfil the customer’s purchase. You can use [webhooks](ССЫЛКА) or the [Transaction log](ССЫЛКА) to accomplish the purchase.
{{< /hint >}}

{{< hint info >}}
[**Customizing Checkout**](/docs/payments/customization/)

Learn about the different ways you can customize your Checkout.
{{< /hint >}}

{{< hint info >}}
[**Going live checklist**](/docs/payments/live/)

Before going live inspect this checklist to ensure you've implemented all the significant setup steps.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}