---
title: Payment Form
linktitle: Payment Form
description: PaySuper payment forms are optimized for each region both in terms of the final payment methods, and at the level of UX and color gamut.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
layout: single
menu:
  docs:
    parent: "payments"
    weight: 20
categories: []
keywords: []
aliases: []
draft: false
toc: false
---

Payment forms are optimized for display on a wide range of mobile devices (tablets and smartphones). The display logic takes into account the device-specific touch controls and the use of an on-screen keyboard. 

You can customize the form yourself, setting up both general properties and regional features. PaySuper offers a variety of pre-made templates. The solution provides personalized recommendations for using templates based on user conversions in stores similar to yours. The longer you use PaySuper, the more accurate these recommendations will be. 

## Form configuration

The payment form can be configured independently for each project.

![Payment form](/images/payment-form.png)

## User identification

There are also two options for user identification. 

It can take place:

* **On the side of the Store.** 
  The store submits to the form all user information necessary for the transaction. For example, UserID and email. 
* **On the side of the Form.** The store submits to the form part of the information necessary for the transaction, and the order of steps. For example, “ask for user email on the payment success screen.” The number and type of fields and place of interaction are highly customizable. 

The payment form determines the user’s country and chooses the appropriate localization language and price currency. 

Elements of payment forms support event sending. You can use built-in basic mechanisms or external services, such as Google Analytics or [Uttu](https://drive.google.com/a/protocol.one/open?id=1DexhXSLhbd3tFXDjP8WV4KqcKnv8PXe8mDgJuMOwVLI), to track conversions. Detailed conversion funnels will allow you to better analyze traffic and search for optimization points. 

## Interaction with form

A common case of interaction between the user, store, form and PaySuper backend is shown in the chart below:

![Payment interaction form](/images/form-iteraction.png)

1. The user interacts with the store page.
2. The page calls the form.
3. The form requests product parameters.
4. The form receives product parameters 
5. The payment form is shown to the user. 
6. The user enters details of their card or other means of payment. 
7. Validation on the side of PaySuper. 
8. The form receives the PaySuper server’s reply. 
9. The form shows the user the result of the operation. 
10. The user fills in additional fields in the form. 
11. The form submits additional parameters. 
12. The page receives the PaySuper server’s reply. 
13. The merchant sends additional information to include in the check to the payment solution server. For instance, a key. 
14. The store interacts with the user in accordance with the payment results. 
15. PaySuper delivers the check to the user.

## Embed Options

You can embed the PaySuper payment form into your store or software solution in one of the following ways: 

* Embedded form 
* Payment opening a separate page in the browser 
* Form embedded into a client app
* Form embedded into a mobile app 

All embed options are equal, configured from a single interface and generate uniform events and internal analytics reports on conversions.