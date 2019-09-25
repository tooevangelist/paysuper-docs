---
title: PaySuper Integration
linktitle: PaySuper Integration
description: You can start accepting payments through PaySuper on your website after a few simple steps.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
layout: single
menu:
  docs:
    parent: "getting-started"
    weight: 20
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

In the case of basic payment acceptance, the integration process takes just a few minutes.

Steps of the integration process:

![PaySuper integration schema](/images/integration.png)

## PaySuper website signup

To begin, we need only basic information about your company: 

* name 
* jurisdiction, 
* website address. 

You can get started immediately and use PaySuper in test mode. 

**API access keys** will be generated automatically and can be changed later. 

Along with the next steps, you’ll need to go through the KYC procedure and sign the contract with an e-signature. 

## Project configuration

This includes configuring technical parameters of the payment interface integration and choosing one of the payment acceptance options. 

Further on we will examine in detail what PaySuper projects are and why they are necessary, as well as talk about advanced project settings, such as product management. 

## Payment interface integration

You can choose one of the integration methods, depending on the technologies you use and your preferences. 

In the basic version, you will need to add only one line to the page code. To integrate server interaction with PaySuper, you can use one of the PaySuper SDKs available on GitHub. 

## Webhook settings

PaySuper can send client and server notifications about the transaction progress and user actions in the form. You can configure non-standard events, as well as the processing of such events on your side, if necessary. 

## Testing

Technical integration testing is fully automatic. In a special interface, you can run a set of integration tests and get detailed results for each: description, expected result, passed or not, query text, answer text. 

## Launch

If all tests are passed, then you only need to press one button to start.
