---
title: Pagination
linktitle: Pagination
description: All top-level PaySuper API resources have support for bulk fetches **`list`** API methods.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
categories: []
keywords: []
menu:
  docs:
    parent: "api-reference"
    weight: 20
weight: 20
sections_weight: 20
draft: false
toc: true
---

For instance, you can list users, list orders. 

Like Stripe, PaySuper uses cursor-based pagination using the parameter **`starting_after`**. Pass **`starting_after`** parameter at the previous page last object id value to determine where to start in the list.

## Attributes

Attribute|Type|Description
---|---|---
**limit**|**integer** optional|A limit on the number of objects to be returned. Must be included between 1 and 100
**starting_after**|**string** optional|A cursor for use in pagination. **`starting_after`** is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with **`obj_foo`**, your subsequent call can include **`starting_after=obj_foo`** in order to fetch the next page of the list.
**ending_before**|**string** optional|A cursor for use in pagination. **`ending_before`** is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with **`obj_bar`**, your subsequent call can include **`ending_before=obj_bar`** in order to fetch the previous page of the list.

## List response format

Attribute|Type|Description
---|---|---
**object** | **string, value is "list"**|
**data** | **array**| An array containing the actual response elements, paginated by any request parameters.
**has_more** | **boolean**| Whether or not there are more elements available after this page. If **`false`**, this page is the end of the list.
**has_before** | **boolean**| Whether or not there are more elements available before this page. If **`false`**, this page is the beginning of the list.
**total_count** | **boolean**| The total count of all recipients that match your filters, as if there was no pagination.

## Example request

{{< highlight shell >}}
$ curl https://api.paysuper.io/payouts?limit=3 -u tkHCYYOUVrYyY5rBFZxNzgtt:
{{< /highlight >}}

## Example response

{{< highlight json >}}
{
  "object": "list",
  "has_more": true,
  "has_before": false,
  "total_count": 240,
  "data": [
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
    },
    {...},
    {...}
  ]
}
{{< /highlight >}}
