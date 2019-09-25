---
title: External Reports
linktitle: External Reports
description: In case you want to create more complex reports or use an external BI system for reports, we have Data API.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
layout: single
menu:
  docs:
    parent: "getting-started"
    weight: 60
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

When internal reports are not enough, you can connect an **external analytics tool** (for example, [tableau](https://www.tableau.com/) or [slemma](https://slemma.com/)) or your own data visualization tool. 

You can access the data or, using the API, upload data to your storage. We adhere to the OLAP cube structure. 

**Dimensions:**

* Project
* Product
* Geography
* Payment currency
* Payment method
* Payment date
* Return date
* User agent 

**Measures:**

* The sum in payment currency
* The sum in payout currency
* Number of transactions
