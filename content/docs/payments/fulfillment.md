---
title: After the payment
bookToc: true
---

# After the payment
***

When your customers successfully complete payments they are redirected to the success URL page that you passed in a request parameter. Typically, this is a page on your website that informs your customer that their payment was successful.

At a later point, you may want to fulfill the customer’s purchase and deliver the goods or services they paid for. There are a few ways to do this:

[**Fulfilling manually**](/docs/payments/fulfillment/#fulfilling-purchases-with-the-dashboard)

[**Fulfilling automatically**](/docs/payments/fulfillment/#fulfilling-purchases-with-webhooks)

[**Payment or refund receipts**](/docs/payments/fulfillment/#automatically-send-payment-or-refund-receipts)

## Fulfilling purchases with the Dashboard

You can manually handle actions on the [Transactions page](https://paysupermgmt.tst.protocol.one/transactions) after your customer completes their payment.

{{< figure src="/images/transactions.png">}}

## Fulfilling purchases with webhooks

PaySuper can send the `payment.success` webhook event to your server to notify you when a customer successfully completes the payment. You can configure webhooks on the Project Webhooks page.

A webhook handler is a script on your server that handles the PaySuper events such as `payment.success` or `payment.cancel`.

## Payment or refund receipts

PaySuper automatically sends email receipts to your customers after successful payments or refunds.

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