---
title: Webhooks
bookToc: true
---

# Webhooks
***

The PaySuper system can send you notifications for a set of events during the flow, such as creating new accounts or transaction flow, making payouts, and so on.

These notifications are sent as webhooks to the corresponding URL configured on your Project Webhook page.

In most cases, webhooks are triggered by user actions on your website or by back-end related events like a successful payment, a refund payment and other.

## Setting up a webhook

**1.** Add the URL of the server that will receive the webhook requests in the Functional URL section on the Project Webhooks page.

**2.** [Verify the webhook request](/docs/webhooks/#verifying-a-webhook).

**3.** Respond with HTTP code 200 without a message body to acknowledge the receipt a webhook. 

## Webhook event types

Type|Payload|Description
---|---|---
`payment.success`|Order|Sent when a customer successfully completes a payment.
`payment.chargeback`|Order|Sent when a payment must be cancelled for a chargeback.
`payment.refund`|Order|Sent when a payment must be cancelled for refund for any reasons.
`payment.cancel`|Order|Sent when a payment must be cancelled for cancel for any reasons.

## The Webhook object

Attribute|Type|Description
---|---|---
`id`|string| The unique identifier for the object.
`type`|string| The string representing the webhook's type.
`event`|string| The string representing the event's type.
`live`|boolean| Equals to `true` if notification originated from a live environment.
`created_at`|DateTime|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when the event has been created.
`expires_at`|DateTime|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when the event stops trying to deliver.
`delivery_try`|integer|The current delivery try for the event.
`object`|object| The object representing the payload of the event with a given type. Objects of the same type share the same value.

## The Webhook object example

For instance, this is the base object representing the webhook event `payment.success`:

{{< highlight json >}}
{
  "id": "5d23426ab8b1eea163304202653796fa801081e739d506615ddac583019045f3",
  "type": "notification",
  "event": "payment.success",
  "live": false,
  "created_at": "2019-11-16T05:41:05Z",
  "expires_at": "",
  "delivery_try": 0,
  "object": {
    "id": "726d9e07-1dc8-4159-8d52-f95941066bc8",
    "transaction": "2978077",
    "object": "order",
    "status": "created",
    "description": "A summary for the purchase",
    "created_at": {
      "seconds": 1573882679,
      "nanos": 69000000
    },
    "canceled_at": {
      "seconds": -62135596800
    },
    "canceled": false,
    "cancellation": null,
    "refunded": false,
    "refunded_at": {
      "seconds": -62135596800
    },
    "receipt_email": "user.email@example.com",
    "receipt_phone": "",
    "receipt_number": "",
    "receipt_url": "https://dashboard.pay.super.com/receipt/purchase/efefc5d3-c2e2-4157-8789-4bfb7c1eec34/726d9e07-1dc8-4159-8d52-f95941066bc8",
    "agreement_version": "",
    "agreement_accepted": false,
    "notify_sale": false,
    "notify_sale_email": "",
    "issuer": {
      "url": "https://domain.com",
      "embedded": false,
      "reference": "",
      "reference_type": "",
      "utm_source": "",
      "utm_medium": "",
      "utm_campaign": "",
      "referrer_host": "domain.com"
    },
    "amount": 595,
    "currency": "RUB",
    "user": {
      "id": "5dcf8b24b5a6990001bac2b6",
      "object": "user",
      "external_id": "0000000000001",
      "name": "User Name",
      "email": "user.email@example.com",
      "email_verified": true,
      "phone": "0639597531",
      "phone_verified": true,
      "ip": "79.137.163.2",
      "locale": "ru-RU",
      "address": {
        "country": "RU",
        "city": "Moscow",
        "postal_code": "127221",
        "state": "MOW"
      },
      "metadata": {
        "user.param1": "user.val1",
        "user.param2": "user.val2",
        "user.param3": "user.val3"
      },
      "notify_new_region": false,
      "notify_new_region_email": ""
    },
    "billing_address": {
      "country": "DE"
    },
    "tax": {
      "type": "vat",
      "rate": 0.19,
      "amount": 95,
      "currency": "RUB"
    },
    "method": {
      "title": "Bank card",
      "external_id": "BANKCARD",
      "payment_system_id": "5be2d0b4b0b30d0007383ce5",
      "saved": false,
      "card": {
        "first6": "400000",
        "last4": "0002",
        "masked": "400000...0002",
        "expiry_month": "11",
        "expiry_year": "2023",
        "brand": "VISA",
        "fingerprint": "$2a$04$9VRouYlBC.qMYQrLpmlXOeGbL2WFZDGGq/KdTeeHSfWkosgJgrWw2",
        "secure3d": true
      },
      "wallet": null,
      "crypto_currency": null,
      "refund_allowed": true
    },
    "items": null,
    "refund": null,
    "metadata": {
      "param1": "val1",
      "param2": "val2",
      "param3": "val3"
    },
    "original_amount": 500,
    "country": "DE",
    "type": "simple",
    "platform_id": "",
    "receipt_id": "efefc5d3-c2e2-4157-8789-4bfb7c1eec34",
    "virtual_currency_amount": 0,
    "is_buy_for_virtual_currency": false
  }
}
{{< /highlight >}}

## Verifying a webhook

PaySuper signs webhook events that it sends to your endpoint allowing you to validate that they were not sent by a third-party and prevent any unauthorised actions.

The PaySuper API uses a Secret key to check the notification request.

{{< hint warning >}}
Your Secret keys carry many privileges, so be sure to keep them secure! Do not share your Secret API keys in any publicly accessible areas such as GitHub, client-side code, and so forth.
{{< /hint >}}

**To check a digital signature:**

**1.** Concatenate the request's JSON body with your Project's Secret key found on the Project webhooks page.

**2.** Apply SHA-256 hashing to the resulting string. 

**3.** Compare the digital signature with [Authorization](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) HTTP Header value in the received notification:

> All API requests must be made over HTTPS. Calls made over a plain HTTP will fail. API requests without the authentication will also fail.

{{< highlight http >}}
POST /your_endpoint HTTP/1.1
Host: your.host
Accept: application/json
Content-Type: application/json
Authorization: Signature sh9b1r69bjqie88n5uizqcrerhee50dypsp195mh
{{< /highlight >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}