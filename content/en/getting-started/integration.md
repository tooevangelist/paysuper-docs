---
title: Manual Integration
linktitle: Manual Integration
description: You can start accepting payments through PaySuper on your website after a few simple steps.
date: 2019-10-10
publishdate: 2019-10-10
lastmod: 2019-10-10
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

## Steps of the integration process:

1. To initiate a payment you can send a request with a secure string of an order parameters by **[POST /api/v1/tokens](https://docs.stg.pay.super.com/api-reference/token/#endpoints)** or key-value parameters about your Project and Products without a user information by **[POST /api/v1/order](https://docs.stg.pay.super.com/api-reference/orders/#endpoints)**.

2. After a customer initiates a payment retreive from a response a parameter **`payment_form_url`** - the payment form URL.

3. Now you need to display a Payment Form. 

    You can open a payment form in a new browser window by URL payment_form_url.
    
    Likewise, you can integrate a payment form as an iframe on your website:

    {{< highlight javascript >}}
    <iframe src="{payment_form_url}"></iframe>
    {{< /highlight >}}

4. Пример кода как обработать получение вебхука
