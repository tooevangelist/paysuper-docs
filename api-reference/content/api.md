---
title: PaySuper API Reference
language_tabs:
  - shell: cURL
toc_footers: []
includes: []
search: false
highlight_theme: darkula
headingLevel: 2

---

# Order

You can create a payment order with details about your customer and sales option data.

> The Order object example:

```json
{
  "id": "726d9e07-1dc8-4159-8d52-f95941066bc8",
  "transaction": "2978077",
  "object": "order",
  "status": "created",
  "description": "A summary for the purchase",
  "created_at": {
      "seconds": 1573882679,
      "nanos": 69000000
  },
  "canceled_at": {
      "seconds": -62135596800
  },
  "canceled": false,
  "cancellation": null,
  "refunded": false,
  "refunded_at": {
      "seconds": -62135596800
  },
  "receipt_email": "user.email@example.com",
  "receipt_phone": "",
  "receipt_number": "",
  "receipt_url": "https://dashboard.pay.super.com/receipt/purchase/efefc5d3-c2e2-415",
  "agreement_version": "",
  "agreement_accepted": false,
  "notify_sale": false,
  "notify_sale_email": "",
  "issuer": {
      "url": "https://domain.com",
      "embedded": false,
      "reference": "",
      "reference_type": "",
      "utm_source": "",
      "utm_medium": "",
      "utm_campaign": "",
      "referrer_host": "domain.com"
  },
  "amount": 595,
  "currency": "RUB",
  "user": {
      "id": "5dcf8b24b5a6990001bac2b6",
      "object": "user",
      "external_id": "0000000000001",
      "name": "User Name",
      "email": "user.email@example.com",
      "email_verified": true,
      "phone": "0639597531",
      "phone_verified": true,
      "ip": "79.137.163.2",
      "locale": "ru-RU",
      "address": {
        "country": "RU",
        "city": "Moscow",
        "postal_code": "127221",
        "state": "MOW"
      },
      "metadata": {
        "user.param1": "user.val1",
        "user.param2": "user.val2",
        "user.param3": "user.val3"
      },
      "notify_new_region": false,
      "notify_new_region_email": ""
  },
  "billing_address": {
      "country": "DE"
  },
  "tax": {
      "type": "vat",
      "rate": 0.19,
      "amount": 95,
      "currency": "RUB"
  },
  "method": {
      "title": "Bank card",
      "external_id": "BANKCARD",
      "payment_system_id": "5be2d0b4b0b30d0007383ce5",
      "saved": false,
      "card": {
        "first6": "400000",
        "last4": "0002",
        "masked": "400000...0002",
        "expiry_month": "11",
        "expiry_year": "2023",
        "brand": "VISA",
        "fingerprint": "$2a$04$9VRouYlBC.qMYQrLpmlXOeGbL2WFZDGGq/KdTeeHSfWkosgJgrWw2",
        "secure3d": true
      },
      "wallet": null,
      "crypto_currency": null,
      "refund_allowed": true
  },
  "items": null,
  "refund": null,
  "metadata": {
      "param1": "val1",
      "param2": "val2",
      "param3": "val3"
  },
  "original_amount": 500,
  "country": "DE",
  "type": "simple",
  "platform_id": "",
  "receipt_id": "efefc5d3-c2e2-4157-8789-4bfb7c1eec34",
  "virtual_currency_amount": 0,
  "is_buy_for_virtual_currency": false
}
```

### Statuses
|Name|Description|
|---|---|
|`created`|The order created but is not processed yet.|
|`processed`|The order was processed in payment system.|
|`canceled`|The order was canceled and money refunded to user.|
|`rejected`|The order was rejected by a payment system with any reasons.|
|`refunded`||
|`chargeback`||

### The Order object:

|Attribute|Type|Description|
|---|---|---|
|**id** <br><p style="color: red;">required</p>|string||
|**transaction**|||
|**object** <br><p style="color: red;">required</p>|string|order|
|**status**|string|Enum: created|
|**description**|||
|**created_at**|||
|-- **seconds**|||
|-- **nanos**|||
|**canceled_at**|||
|-- **seconds**|||
|**canceled**|boolean||
|**cancellation**|||
|**refunded**|boolean||
|**refunded_at**|||
|-- **seconds**|||
|**receipt_email**|string||
|**receipt_phone**|||
|**receipt_number**|||
|**receipt_url**|||
|**agreement_version**|||
|**agreement_accepted**|boolean||
|**notify_sale**|boolean||
|**notify_sale_email**|string||
|**issuer**|||
|-- **url**|string||
|-- **embedded**|boolean||
|-- **reference**|string||
|-- **reference_type**|string||
|-- **utm_source**|||
|-- **utm_medium**|||
|-- **utm_campaign**|||
|-- **referrer_host**|string||
|**amount**|||
|**currency**|||
|**user**|||
|-- **id**|||
|-- **object**|||
|-- **external_id**|||
|-- **name**|||
|-- **email**|||
|-- **email_verified**|boolean||
|-- **phone**|||
|-- **phone_verified**|||
|-- **ip**|||
|-- **locale**|||
|-- **address**|||
|---- **country**|||
|---- **city**|||
|---- **postal_code**|||
|---- **state**|||
|-- **metadata**|||
|-- **notify_new_region**|||
|-- **notify_new_region_email**|||
|**billing_address**|||
|-- **country**|||
|**tax**|||
|-- **type**|||
|-- **rate**|||
|-- **amount**|||
|-- **currency**|||
|**method**|||
|-- **title**|||
|-- **external_id**|||
|-- **payment_system_id**|||
|-- **saved**|||
|-- **card**|||
|---- **first6**|||
|---- **last4**|||
|---- **masked**|||
|---- **expiry_month**|||
|---- **expiry_year**|||
|---- **brand**|||
|---- **fingerprint**|||
|---- **secure3d**|||
|-- **wallet**|||
|-- **crypto_currency**|||
|-- **refund_allowed**|||
|**items**|||
|**refund**|||
|**metadata**|||
|**original_amount**|||
|**country**|||
|**type**|||
|**platform_id**|||
|**receipt_id**|||
|**virtual_currency_amount**|||
|**is_buy_for_virtual_currency**|||

## Create a payment order

> Code samples

```shell
curl -X POST /api/v1/order \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

### POST /api/v1/order

Create a payment order with details about your customer and sales option data.

> Body parameter

```json
{
  "account": "string",
  "amount": 0,
  "currency": "string",
  "description": "string",
  "order_id": "string",
  "project": "string",
  "url_fail": "string",
  "url_success": "string",
  "type": "simple",
  "products": [
    "string"
  ],
  "platform_id": "steam",
  "token": "string",
  "user": {
    "external_id": "string",
    "name": "string",
    "email": "string",
    "email_verified": true,
    "phone": "string",
    "phone_verified": true,
    "ip": "string",
    "locale": "string",
    "address": {
      "country": "string",
      "city": "string",
      "postal_code": "string",
      "state": "string"
    },
    "metadata": {}
  }
}
```

|PARAMETERS|TYPE|DESCRIPTION|
|---|---|---|
|body  <br><p style="color: red;">required</p> ||Order create data  |
|- account | string |The user unique account in the Project.  |
|- amount | number |The order amount as a positive number. It is required for a simple checkout payment.  |
|- currency | string |The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.  |
|- description | string |The arbitrary order description.  |
|- order_id | string |The unique order identifier on the merchant side. This field is not required, but we recommend sending this field always.  |
|- project  <br><p style="color: red;">required</p> | string |The ID of the Project found in your merchant account in the PaySuper Dashboard.  |
|- url_fail | string |The redirect URL for the failed payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.  |
|- url_success | string |The redirect URL for the successful payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.  |
|- type  <br><p style="color: red;">required</p> | string |The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type. <br>**Enum values:** <br>simple<br>product<br>key |
|- products | [string] |The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.  |
|- platform_id | string |The default platform identifier for which customer buys the in-game key. This field used only for a payment type 'key'. <br>**Enum values:** <br>steam<br>gog<br>uplay<br>origin<br>psn<br>xbox<br>nintendo<br>itch<br>egs |
|- token | string |An encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.  The token encrypted parameters override the corresponding parameters in an order object even the required parameters.  |
|- user ||   |
|-- external_id | string |The user unique identifier on the merchant side.  |
|-- name | string |The user's name.  |
|-- email | string |The user's email address.  |
|-- email_verified | boolean |Whether the user's email address has been verified on the merchant side.  |
|-- phone | string |The user's phone number.  |
|-- phone_verified | boolean |Whether the user’s phone number has been verified on the merchant side.  |
|-- ip | string |The user's IP address.  |
|-- locale | string |The user's locale name. Two-letter language code by ISO 639-1, in lowercase.  |
|-- address ||   |
|--- country | string |The user's country. Two-letter language code by ISO 3166-1, in lowercase.  |
|--- city | string |The user's city.  |
|--- postal_code | string |The user's postal code.  |
|--- state | string |The user's state code by ISO 3166-2.  |
|-- metadata | object |A string-value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.  |

### Responses

> Example responses

> 200 Response

```json
{
  "id": "string",
  "payment_form_url": "string"
}
```

### 200 Object which contain data to render payment form

||||
|---|---|---|
|- id |string|The unique identifier for the order.  |
|- payment_form_url |string|The PaySuper-hosted URL of payment form.  |

### 400 Object with error message

||||
|---|---|---|
|- message |string|A description of the error.  |
|- code |string|A status code of the error.  |

### 500 Object with error message

||||
|---|---|---|
|- message |string|A description of the error.  |
|- code |string|A status code of the error.  |

# Token

A token is an encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.

## Create a token

> Code samples

```shell
curl -X POST /api/v1/tokens \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

### POST /api/v1/tokens

Create a token that encrypts certain details of your customer, a game and purchase parameters.

> Body parameter

```json
{
  "user": {
    "id": "string",
    "email": {
      "value": "string",
      "verified": true
    },
    "phone": {
      "value": "string",
      "verified": true
    },
    "name": {
      "value": "string"
    },
    "ip": {
      "value": "string"
    },
    "locale": {
      "value": "string"
    },
    "address": {
      "country": "string",
      "city": "string",
      "postal_code": "string",
      "state": "string"
    },
    "metadata": {}
  },
  "settings": {
    "project_id": "string",
    "return_url": {
      "success": "string",
      "fail": "string"
    },
    "currency": "string",
    "amount": 0,
    "products_ids": [
      "string"
    ],
    "description": "string",
    "type": "simple",
    "metadata": {}
  }
}
```

|PARAMETERS|TYPE|DESCRIPTION|
|---|---|---|
|body  <br><p style="color: red;">required</p> ||Data to process a payment.  |
|- user  <br><p style="color: red;">required</p> ||   |
|-- id  <br><p style="color: red;">required</p> | string |The user unique identifier on the merchant side.  |
|-- email ||   |
|--- value  <br><p style="color: red;">required</p> | string |The parameter value.  |
|--- verified | boolean |Whether the value has been verified on the merchant side.  |
|-- phone ||   |
|-- name ||   |
|--- value  <br><p style="color: red;">required</p> | string |The parameter value.  |
|-- ip ||   |
|-- locale ||   |
|-- address ||   |
|--- country | string |The user's country. Two-letter language code by ISO 3166-1, in lowercase.  |
|--- city | string |The user's city.  |
|--- postal_code | string |The user's postal code.  |
|--- state | string |The user's state code by ISO 3166-2.  |
|-- metadata | object |A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.  |
|- settings  <br><p style="color: red;">required</p> ||   |
|-- project_id  <br><p style="color: red;">required</p> | string |The ID of the Project found in your merchant account in the PaySuper Dashboard.  |
|-- return_url ||   |
|--- success | string |The redirect URL for the successful payment.  |
|--- fail | string |The redirect URL for the failed payment.  |
|-- currency | string |The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.  |
|-- amount | number |The order amount as a positive number. It is required for a simple checkout payment.  |
|-- products_ids | [string] |The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.  |
|-- description | string |The arbitrary order description.  |
|-- type  <br><p style="color: red;">required</p> | string |The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type. <br>**Enum values:** <br>simple<br>product<br>key |
|-- metadata | object |A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.  |

### Responses

> Example responses

> 200 Response

```json
{
  "token": "string",
  "payment_form_url": "string"
}
```

### 200 The Token is successfully generated.

||||
|---|---|---|
|- token  <br><p style="color: red;">required</p> |string|A secure string which contains encrypted information about your customer and sales option data.  |
|- payment_form_url |string|The PaySuper-hosted URL of payment form.  |

### 400 Invalid request data

||||
|---|---|---|
|- message |string|A description of the error.  |
|- code |string|A status code of the error.  |

### 404 Object not found

||||
|---|---|---|
|- message |string|A description of the error.  |
|- code |string|A status code of the error.  |

### 500 Some unknown error on server side

||||
|---|---|---|
|- message |string|A description of the error.  |
|- code |string|A status code of the error.  |

