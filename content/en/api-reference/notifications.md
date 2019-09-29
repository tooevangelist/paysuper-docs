---
title: Notifications
linktitle: Notifications
description: Notifications help you to stay informed on everything that is going on with your transactions.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
layout: single
menu:
  docs:
    parent: "api-reference"
    weight: 22
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

The PaySuper system can send you notifications for a set of events during the flow, such as creating new accounts or transaction flow, making payouts, and so on.

These notifications are sent as webhooks to the corresponding URLs configured on your server.

In most cases, webhooks are triggered by user actions on your website or back-end related events like refund a payment, notification about dispute and other.

## Notification types

Type|Payload|Description
---|---|---
**payment.success**|**Order**|Sent when a user completes a payment.
**payment.chargeback**|**Order**|Sent when a payment must be canceled for chargeback.
**payment.refund**|**Order**|Sent when a payment must be canceled for refund for any reasons.
**payment.fraud**|**Order**|Sent when a payment must be canceled for fraud protection system.
**payment.cancel**|**Order**|Sent when a payment must be canceled for cancel for any reasons.
**item.replace**|**Order**|Sent when a item of processed order must be replaced for any reasons.
**user.validation**|**User**|Check if a user exists in the external system.
**payout.created**|**Payout**|Sent when a payout report created by PaySuper.
**payout.status**|**Payout**|Sent when a payout request change they status for any reasons.

## The Notification object

Attribute|Type|Description
---|---|---
**id**|**string**| Unique identifier for the object.
**type**|**string**| String representing the web hook’s type.
**event**|**string**| String representing the event`s type.
**live**|**boolean**| True is notification originated from the live environment.
**created_at**|**DateTime**|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when an event has been created.
**expires_at**|**DateTime**|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when the event stops trying to deliver.
**delivery_try**|**integer**|The current delivery try for this event
**object**|**object**| The object representing payload of event with given type. Objects of the same type share the same value.

The base object representing the webhook event `"payment.success"` from PaySuper system.

{{< highlight json >}}
{
  "id": "22d6d597-000f-5000-9000-145f6df21d6f",
  "type": "notification",
  "event": "payment.success",
  "live": true,
  "created_at": "2018-07-10T14:27:54.691Z",
  "expires_at": null,
  "delivery_try": 1,
  "object": {}
}
{{< /highlight >}}

##  Check notification request

The PaySuper API uses secret keys to check notification requests. 

{{% warning %}}
Your secret keys carry many privileges, so be sure to keep them secure! Do not share your secret API keys in publicly accessible areas such as GitHub, client-side code, and so forth.
{{% /warning %}}

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.

#### To check the digital signatures you should: 

1. Concatenate the request's JSON body with your project's secret key. The secret key should be added to end of JSON body.
2. Apply SHA-256 hashing to the resulting string. 
3. Compare the digital signatures with Authorization http header value.

{{< highlight text >}}
POST /your_endpoint HTTP/1.1
Host: your.host
Accept: application/json
Content-Type: application/json
Authorization: Signature sh9b1r69bjqie88n5uizqcrerhee50dypsp195mh
{{< /highlight >}}