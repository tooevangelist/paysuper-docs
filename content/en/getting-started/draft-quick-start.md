---
title: Draft - Quick Start
linktitle: Draft - Quick Start
description: PaySuper is an open-source payment toolkit that allows securely accepting online payments on the web and mobile devices in a gaming industry.
date: 2019-10-10
publishdate: 2019-10-10
lastmod: 2019-10-10
layout: single
menu:
  docs:
    parent: "getting-started"
    weight: 2
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

Our mission is to maximize profits for developers, publishers, and platforms. We’re focused on keeping conversion rates high and costs low – including those related to integration and maintenance.

**PaySuper makes a payment process simple:**

* Supports all payment methods necessary to accept payments from users anywhere in the world.
* PaySuper Form loads near instantly and designed to boost your paying conversion rate.
* PaySuper service can be integrated into different platforms like a site, online store or game.
* All of our code is available on [PaySuper GitHub](https://github.com/paysuper), so you can follow our development process, enjoy the beauty of our technical solutions, and see how everything actually works. 

## Getting started

Before a Payment Form integration, it assumes you have completed the [PaySuper Onboarding](/getting-started/onboarding/).

## Adding your Project with Products

Easily add the required information for a payment about your [Project and Products](/getting-started/project-products/#set-up-your-project-and-products) (Game keys, Virtual items or Virtual currency) in the PaySuper Admin.

## Integrating a Payment Form
All you need to receive payments is to add [PaySuper JS SDK](https://github.com/paysuper/paysuper-js-sdk#usage) a code snippet into your service including order parameters as a secure string generated with [Tokens API](https://docs.stg.pay.super.com/api-reference/token/#endpoints) or just as a key-value parameters.
We recommend you to test a payment in [Paysuper Sandbox](/getting-started/testing/) before going live.

[Learn about a Payment Form customization.](https://github.com/paysuper/paysuper-js-sdk#paysuper-options)

If you need to integrate a Payment Form in a gaming process without our Javascript library follow our [development quickstart integration](/getting-started/integration/) with [PaySuper API](https://docs.stg.pay.super.com/api-reference/paysuper-api/).

## Receiving payment statuses

PaySuper system sends [Webhooks](https://docs.stg.pay.super.com/api-reference/notifications/#set-up-webhooks) to your server for a set of events about transactions and user actions. Thus you can notify a customer about a successful purchase.

You can configure Webhooks endpoints on the Project Settings page for all [event types](https://docs.stg.pay.super.com/api-reference/notifications/#notification-types).

**We are always happy to help with code or any questions you have.**
