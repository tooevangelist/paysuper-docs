---
title: Notifications
linktitle: Notifications
description: A Payout object represents the request to receive funds from PaySuper, or request status when you initiate a payout to either a bank account.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
categories: []
keywords: []
menu:
  docs:
    parent: "api-reference"
    weight: 90
weight: 90
sections_weight: 90
draft: false
toc: true
---

Notifications help you to stay informed on everything that is going on with your transactions. The PaySuper system can send younotifications for a set of events during the flow, such as creating new accounts or transaction flow, making payouts, and so on.

These notifications are sent as webhooks to the corresponding URLs configured on your server.

In most cases, webhooks are triggered by user actions on your website or back-end related events like refund a payment, notification about dispute and other.

## Notification types

Type|Payload|Description
---|---|---
**payment.success**|Order|Sent when a user completes a payment.
**payment.chargeback**|Order|Sent when a payment must be canceled for chargeback.
**payment.refund**|Order|Sent when a payment must be canceled for refund for any reasons.
**payment.fraud**|Order|Sent when a payment must be canceled for fraud protection system.
**payment.cancel**|Order|Sent when a payment must be canceled for cancel for any reasons.
**item.replace**|Order|Sent when a item of processed order must be replaced for any reasons.
**user.validation**|User|Check if a user exists in the external system.
**payout.created**|Payout|Sent when a payout report created by PaySuper.
**payout.status**|Payout|Sent when a payout request change they status for any reasons.

## Sign Requests

{{< oai-spec url="/api/v1/api-notifications.json" >}}