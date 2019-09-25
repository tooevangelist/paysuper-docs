---
title: Payouts
linktitle: Payouts
description: A Payout object represents the request to receive funds from PaySuper, or request status when you initiate a payout to either a bank account.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
layout: single
menu:
  docs:
    parent: "api-reference"
    weight: 20
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

## Failure codes

Payouts can fail for a variety of reasons. The reason a given payout failed is available in a Payout object's **`failure_code`** attribute.

Name|Description
---|---
**account_closed**|The bank account has been closed.
**account_frozen**|The bank account has been frozen.
**could_not_process**|The bank could not process this payout.
**declined**|The bank has declined this transfer. Please contact the bank before retrying.
**invalid_account_number**|The account number is invalid.
**incorrect_account_holder_name**|Your bank notified us that the bank account holder name on file is incorrect.
**invalid_currency**|The bank was unable to process this payout because of its currency. This is probably because the bank account cannot accept payments in that currency.
**no_account**|The bank account details on file are probably incorrect. No bank account could be located with those details.

## Example object

{{< highlight json >}}
{
  "id": "po_1ED765CmSJsu7cy1iQZUkPKz",
  "object": "payout",
  "type": "bank_account",  
  "status": "in_transit",
  "created_at": "2018-07-10T14:27:54.691Z",
  "arrival_date": "2018-07-10T14:27:54.691Z",
  "amount": "2.00",
  "currency": "USD",
  "payout_url": "https://pay.super.com/receipts/long-id-string-for-receipt",
  "automatic": true,
  "description": "PAYSUPER PAYOUT",
  "destination": "ba_1ED765CmSJsu7cy1ZufOeBtW",
  "failure_balance_transaction": null,
  "failure_code": null,
  "failure_message": null,
  "live": false,
  "metadata": {}
}
{{< /highlight >}}