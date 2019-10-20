---
title: Quick Start
linktitle: Quick Start
description: PaySuper is a payment service with [an open source multifunctional toolkit](https://github.com/paysuper) that provides secure and immediate online payment transactions for the games industry.
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
* [The PaySuper Form](/getting-started/glossary/#payment-form) loads near instantly and designed to boost your paying conversion rate.
* PaySuper supports all popular payment methods necessary to accept payments from users anywhere in the world.


## 1. Complete the onboarding first
[The PaySuper Onboarding](/getting-started/onboarding/) is necessary for a [Payment Form](/getting-started/glossary/#payment-form) and PaySuper itself to work with your data. Be sure to complete the onboarding before you can make use of this guide.

## 2. Add your Project and Products
Fill in all applicable information for your [Project and Products](/getting-started/project-products/#set-up-your-project-and-products) (Game keys, Virtual items or Virtual currency) in PaySuper Admin. Having a single Project and a single Product is enough to start.

## 3. Create a Payment Form instance
You can use PaySuper JavaScript SDK to create an instance of a Payment Form with just a few lines of code. [PaySuper SJ SDK](https://github.com/paysuper/paysuper-js-sdk) is open source with the source code available on GitHub.

You should generate a secure string of order and user parameters with [Tokens API](/api-reference/token/#endpoints).

> Check out the [example code snippet](https://github.com/paysuper/paysuper-js-sdk#usage) to get started with PaySuper JS SDK. 
> Be sure to include your own order parameters. Notice that some parameters are of string type.

[The Payment Form has a wide range of customization options](https://github.com/paysuper/paysuper-js-sdk#paysuper-options) that you may use to customize the looks and feels.

{{% tip %}}
You can follow our [PaySuper API quickstart guide](/getting-started/integration/) if you want to integrate a [Payment Form](/getting-started/glossary/#payment-form) in a game client or cannot use PaySuper SJ SDK for other reasons.
{{% /tip %}}

## 4. Test the payment
We recommend you test the payment experience in [Paysuper Sandbox](/getting-started/testing/) before going live.

## 5. Process payment status or other events
PaySuper system sends [Webhooks](/api-reference/notifications/#set-up-webhooks) to your server for a set of events about transactions and user actions. Thus you can notify a customer about a successful purchase.

You can configure Webhooks endpoints on the Project Settings page for all [event types](/api-reference/notifications/#notification-types).

## Feel free to send us feedback or request a feature
We are always happy to help with code, improve the guide or consider a feature that you this is may be missing. You're welcome to raise an issue on a corresponding repo on our GitHub:

* [PaySuper JS SDK](https://github.com/paysuper/paysuper-js-sdk)
* [PaySuper Payment Form](https://github.com/paysuper/paysuper-payment-form)
* [PaySuper REST API](https://github.com/paysuper/paysuper-management-api)
* [PaySuper Documentation](https://github.com/paysuper/paysuper-docs)
