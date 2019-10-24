---
title: After the payment
bookToc: true
---

Your customer gets an email with the receipt and an extra email with the purchased Product or Products as soon as the transaction is complete. If your customer has purchased several game-keys for different DRM platforms, they get an email per DRM platform with a game key and instructions on how to activate the key on the target DRM store. At the same time you see that transaction on the Dashboard in PaySuper Admin.

You can handle actions after your customer completes their payment.

## Fulfilling purchases with webhooks
PaySuper can send the `payment.success` webhook event to your server to notify you when a customer completes the payment. You can configure webhooks for your Projects in PaySuper Admin and handle them on your server. 

A webhook handler is a script on your server that handles the PaySuper events such as `payment.success` or `payment.cancel`. See all event types in [PaySuper API reference]().

These webhook events are signed to protect you from fraudlent activities. You can validate our signed webhooks by generating a signature and comparing it to the value of the Authorization http header value.

** Webhook object can look like this:
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

Name|Type|Description
---|---|---
id|string| Unique identifier for the object.
type|string| String representing the web hook’s type.
event|string| String representing the event`s type.
live|boolean| True is notification originated from the live environment.
created_at|DateTime|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when an event has been created.
expires_at|DateTime|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when the event stops trying to deliver.
delivery_try|integer|The current delivery try for this event
object|object| The object representing payload of event with given type. Objects of the same type share the same value.
