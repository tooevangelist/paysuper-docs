---
title: Project and Products
linktitle: Project and Products
description: A single company can have an unlimited number of projects configured in PaySuper.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: []
keywords: [usage,livereload,command line,flags]
menu:
  docs:
    parent: "getting-started"
    weight: 30
weight: 30
sections_weight: 30
draft: false
aliases: [/overview/usage/,/extras/livereload/,/doc/usage/,/usage/]
toc: true
---

## The project-level management approach

It allows you to independently configure PaySuper for use in various contexts: 

* different games
* sites with different payment logic
* specialized solutions for a particular region or a specific cohort of users. 

Any information about payments in this configuration can be reflected in the reports and analytics both cumulatively and separately. 

## Modes of operation in project

### Simple checkout

In this mode, you transfer the payment sum for each specific transaction to Pay One. You can select the base currency, and the payment amount for the end user will be calculated according to its exchange rate. Or you can transfer the currency each time a payment is made. 

This option can be useful in the following cases:

* Quick integration for a store with a small amount of products.
* Test integration with a store that uses its own e-commerce engine for product management.

Pay One in Simple checkout mode can send you the data on a user’s region for applying regional prices from your system. 

### Store

In this mode, you manage the products and their regional prices directly within Pay One or use more advanced mechanisms of [Qilin](https://drive.google.com/a/protocol.one/open?id=1DexhXSLhbd3tFXDjP8WV4KqcKnv8PXe8mDgJuMOwVLI) or other external service. 

In this case, the “one-to-many” structure is also retained within the project.

![Project store mode](/project-products.png)

## Products in project

A project can contain an unlimited number of products. Each can have independently configurable regional prices or a base price in any currency. 

Pay One determines the user’s region and applies the appropriate regional price. If a regional price is not specified, Pay One calculates the price for the end user by converting the base price into the currency of this user. 

Apart from the price, a product may have a name, a short and full description, images, an icon and a text template. Pay One supports downloading products via API or from files for synchronization with your e-commerce system.