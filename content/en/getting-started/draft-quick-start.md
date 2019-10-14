---
title: Draft - Quick Start
linktitle: Draft - Quick Start
description: PaySuper is an open-source payment toolkit that enables secure online payments on the web and mobile devices.
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

**PaySuper was designed with developers in mind:**

* The source code is available on the [PaySuper GitHub](https://github.com/paysuper), so you can follow the development process and see how everything actually works.
* PaySuper can be integrated into different platforms like a website, an online store or a game.
* [The PaySuper Form]() loads near instantly and designed to boost your paying conversion rate.
* PaySuper supports all payment methods necessary to accept payments from users anywhere in the world.


## 1. You have to  onboard first
[The PaySuper Onboarding](/getting-started/onboarding/) is necessary for a [Payment Form]() to work. You have to complete the onboarding before you can make use of this guide.

## 2. Add your Projects and Products
Fill in all applicable information for your [Projects and Products](/getting-started/project-products/#set-up-your-project-and-products) (Game keys, Virtual items or Virtual currency) in [PaySuper Admin]().

## 3. Create a Payment Form
You can use PaySuper JavaScript SDK to make a [Payment Form]() with just a few lines of code. [PaySuper SJ SDK](https://github.com/paysuper/paysuper-js-sdk) is open source with the source code available on github.

> Check out the [example code snippet](https://github.com/paysuper/paysuper-js-sdk#usage) to get started with PaySuper JS SDK. 

Be sure to include your own order parameters. Notice that some parameters are of strings type. You should generate secure strings with [Tokens API](/api-reference/token/#endpoints).

You may want to learn about [the Payment Form customization options](https://github.com/paysuper/paysuper-js-sdk#paysuper-options) to ensure Payment Form looks and feels according to your user expectations.

{{% tip %}}
If you want to integrate a [Payment Form]() in a game client or cannot use PaySuper SJ SDK for other reasons, you can follow our [PaySuper API quickstart guide](/getting-started/integration/).
{{% /tip %}}

## 4. Test the payment
We recommend you test the payment experience in [Paysuper Sandbox](/getting-started/testing/) before going live.


## 5. Process payment status or other events

PaySuper system sends [Webhooks](/api-reference/notifications/#set-up-webhooks) to your server for a set of events about transactions and user actions. Thus you can notify a customer about a successful purchase.

You can configure Webhooks endpoints on the [Project Settings page]() for all [event types](/api-reference/notifications/#notification-types).

## 6. Send us feedback or request a feature
We are always happy to help with code, improve the guide or consider a feature that you this is may be missing. You're welcome to raise an issue on a corresponding repo on our GitHub:
* [PaySuper JS SDK](https://github.com/paysuper/paysuper-js-sdk)
* [PaySuper Payment Form](https://github.com/paysuper/paysuper-payment-form)
* [PaySuper REST API](https://github.com/paysuper/paysuper-management-api)
* [PaySuper Documentation](https://github.com/paysuper/paysuper-docs)
