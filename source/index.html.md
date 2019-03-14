---
title: PaySuper API Documentation

language_tabs:
  - shell: curl

toc_footers:

includes:
  - sections/orders
  - sections/products
  - sections/users
  - sections/payouts
  - sections/notifications

search: true
---

# Introduction
```global
API Endpoint
https://api.paysuper.io
```

The PaySuper API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and to use 
HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP verbs, which can be understood 
by off-the-shelf HTTP clients.

JSON will be returned in all responses from the API, including errors.

Authentication is performed through HTTP Basic Auth. Credentials can be found on your PaySuper project dashboard, in 
the "API Keys" section.

# Authentication

```shell
# Example request
$ curl https://api.paysuper.io/orders \
   -u tkHCYYOUVrYyY5rBFZxNzgtt:

# curl uses the -u flag to pass basic auth credentials
# (adding a colon after your secret API key will prevent it
# from asking you for a password).
```

Authentication to the API occurs via HTTP Basic Auth. Provide your API secret key as the basic auth username. You do 
not need to provide a password.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. You must authenticate for all requests.
You can manage your API keys from your account. Your API keys carry many privileges, so be sure to keep them secret!

# Errors
```global
HTTP status codes summary

200 OK - Everything worked as expected.

201 Created - Resource has been successfully created

202 Accepted - Request has been accepted, but requires asynchronous work to be fully performed

400 Bad Request - Request failed due to a combination of errors

401 Unauthorized - No valid API credentials provided.

402 Payment Required - Your request was in livemode while your account is not activated for live requests yet.

403 Forbidden - You are not authorized to access the requested item.

404 Not Found - The requested item doesn't exist.

406 Unacceptable - Your request format was not supported. Use JSON.

409 Conflict - The data you submitted is in conflict with existing data.

422 Unprocessable Entity - Often missing a required parameter.

429 Too Many Requests - You sent us too many API requests in a row. Please retry later.

500, 502, 503, 504 Server errors - something went wrong on PaySupers's end.

```
PaySuper uses conventional HTTP response codes to indicate success or failure of an API request. In general, codes in 
the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from the provided information
(e.g. a required parameter was missing, a charge failed, etc.), and codes in the 5xx range indicate an error with 
PaySupers's servers.


# Versioning

PaySuper is developed incrementally. We use [semantic versioning](https://semver.org/) and approach to release new 
versions of the specification. 

The content of each release is the result of the work of the project team located on github. All changes and additions 
to each version of this specification are publicly discussed by the PaySuper working group.

While making requests in PaySuper using HTTPS, the version is passed as a special HTTP header, which makes it easier to 
choose the correct implementation of objects on the receiving and transmitting side. The version passed is specified as 
major and minor of the version using semantic versioning. For the transmission version must use the header 
`“x-paysuper-api-version: 1.0”`.
 
# Compression

The amount of data transferred with notifications can be huge, and endpoints are required to support data compression 
to reduce the amount and speed of data transfer over the network.  

Endpoints that send HTTP 1.1 messages are required to send gzip-compressed data by specifying the appropriate value
in the HTTP [Accept-Encoding header](https://tools.ietf.org/html/rfc7231#section-5.3.4).

Receiving hosts are required to support gzip and respond to requests by passing an HTTP [Content-Encoding](https://tools.ietf.org/html/rfc7231#section-3.1.2.2) header.

# Pagination
```shell
# Example request
$ curl https://api.paysuper.io/payouts?limit=3 \
   -u tkHCYYOUVrYyY5rBFZxNzgtt:

# Example response
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
```

All top-level PaySuper API resources have support for bulk fetches "list" API methods. For instance, you can list users, list orders.
Like Stripe, PaySuper uses cursor-based pagination using the parameter `starting_after`. Pass `starting_after` parameter 
at the previous page last object id value to determine where to start in the list.

### Attributes
Attribute | Type
--------- | -----------
**limit** | **integer optional**  A limit on the number of objects to be returned. Must be included between 1 and 100
**starting_after** | **string optional** A cursor for use in pagination. `starting_after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the next page of the list.
**ending_before** | **string optional** A cursor for use in pagination. `ending_before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the previous page of the list.

### List response format
Attribute | Type
--------- | -----------
**object** | **string, value is "list"**
**data** | **array** An array containing the actual response elements, paginated by any request parameters.
**has_more** | **boolean** Whether or not there are more elements available after this page. If `false`, this page is the end of the list.
**has_before** | **boolean** Whether or not there are more elements available before this page. If `false`, this page is the beginning of the list.
**total_count** | **boolean** The total count of all recipients that match your filters, as if there was no pagination.
