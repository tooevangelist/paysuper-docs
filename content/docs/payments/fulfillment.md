---
title: After the payment
bookToc: true
---

# After the payment
***

When your customers successfully complete payments they are redirected to the success URL page that you passed in a request parameter . Typically, this is a page on your website that informs your customer that their payment was successful.

To fulfil the customer’s purchase you can make it in several ways:

[**Fulfilling purchases manually with the PaySuper Dashboard**](/docs/payments/fulfillment/#fulfilling-purchases-with-the-dashboard)

[**Fulfilling purchases automatically with webhooks**](/docs/payments/fulfillment/#fulfilling-purchases-with-webhooks)

[**Email receipts**](/docs/payments/fulfillment/#payment-or-refund-receipts)

## Fulfilling purchases with the PaySuper Dashboard

You can manually handle actions on the [Transactions page](https://paysupermgmt.tst.protocol.one/transactions) after your customer completes their payment.

{{< figure src="/images/transactions.png">}}

You can manually handle actions on the [Transactions page](https://paysupermgmt.tst.protocol.one/transactions) after your customer completes their payment.

## Fulfilling purchases with webhooks

PaySuper can send the `payment.success` webhook event to your server to notify you when a customer successfully completes the payment. You can configure webhooks on the Project webhooks page.

A webhook handler is a script on your server that handles the PaySuper events such as `payment.success` or `payment.cancel`.

## Email receipts

**Payment or refund receipts**

PaySuper automatically sends email receipts to your customers whenever they make a successful payment or refunded purchase. 

It's required for user to fill in an email field on the Checkout form. Besides, you can pass a customer's email address when making the [API Tokens](/docs/api/#tag/Token) or [API Order](/docs/api/#tag/Payment-Order) requests for payment initiation.

**Key-product receipts**

For a [key-activated product](/docs/payments/#products-checkout) purchase, your customer gets an email with the receipt and an extra email with a purchased product key.

If your customer has purchased several game keys for different DRM platforms, he gets an email per DRM platform with a game key and instructions on how to activate the key on the target DRM store.

***

## Next steps

{{< hint info >}}
[**Testing the Checkout**](/docs/payments/testing/)

Verify that your integration with PaySuper Checkout works correctly. Our offered test cards can be used to create payments that produce defined responses for you to test your integration code.
{{< /hint >}}

{{< hint info >}}
[**Going live checklist**](/docs/payments/live/)

You can inspect this checklist before going live to ensure you've implemented all the significant setup steps.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}