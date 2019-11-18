---
title: Protocol One payment solution swagger documentation
language_tabs:
  - shell: cURL
toc_footers: []
includes: []
search: false
highlight_theme: darkula
headingLevel: 2

---

# Protocol One payment solution swagger documentation v1.0

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

This is a Protocol One payment solution service.

Base URLs:

* <a href="//p1payapi.tst.protocol.one">//p1payapi.tst.protocol.one</a>

<a href="http://swagger.io/terms/">Terms of service</a>
Email: <a href="mailto:support@swagger.io">API Support</a> Web: <a href="http://www.swagger.io/support">API Support</a> 
License: <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache 2.0</a>

# Authentication

* API Key (XAPISignatureHeader)
    - Parameter Name: **X-API-SIGNATURE**, in: header. must contain project secret key

# Country

## Get list of countries

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/country \
  -H 'Accept: application/json'

```

`GET /api/v1/country`

Get full list of currencies or get list of currencies filtered by name

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|name|query|string|false|name or symbolic ISO 3166-1 code of country|

> Example responses

> 200 Response

```json
[
  {
    "code_a2": "string",
    "code_a3": "string",
    "code_int": 0,
    "created_at": "string",
    "is_active": true,
    "name": {
      "en": "string",
      "ru": "string"
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[model.Country](#schemamodel.country)]|false|none|none|
|» code_a2|string|false|none|2 chars ISO 3166-1 country code|
|» code_a3|string|false|none|3 chars ISO 3166-1 country code|
|» code_int|integer|false|none|numeric ISO 3166-1 country code|
|» created_at|string|false|none|date of create country in system|
|» is_active|boolean|false|none|is country active|
|» name|[model.Name](#schemamodel.name)|false|none|none|
|»» en|string|false|none|english name|
|»» ru|string|false|none|russian name|

<aside class="success">
This operation does not require authentication
</aside>

## Get country by numeric ISO 3166-1 code

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/country/{id} \
  -H 'Accept: application/json'

```

`GET /api/v1/country/{id}`

Get country object by numeric ISO 3166-1 code

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|integer|true|numeric ISO 3166-1 country code|

> Example responses

> 200 Response

```json
{
  "code_a2": "string",
  "code_a3": "string",
  "code_int": 0,
  "created_at": "string",
  "is_active": true,
  "name": {
    "en": "string",
    "ru": "string"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[model.Country](#schemamodel.country)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Payment Order

## Create order with json request

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/order \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /api/v1/order`

Create a payment order use POST JSON request

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
  },
  "is_buy_for_virtual_currency": true
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[model.OrderScalar](#schemamodel.orderscalar)|true|Order create data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "payment_form_url": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Object which contain data to render payment form|[model.JsonOrderCreateResponse](#schemamodel.jsonordercreateresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create payment

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/payment \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /api/v1/payment`

Create payment by order

> Body parameter

```json
{
  "address": "string",
  "card_holder": "string",
  "cvv": 0,
  "ewallet": "string",
  "month": 0,
  "order_id": "string",
  "pan": "string",
  "payment_method_id": "string",
  "year": 0
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[model.OrderCreatePaymentRequest](#schemamodel.ordercreatepaymentrequest)|true|data to create payment|

> Example responses

> 200 Response

```json
{
  "error": "string",
  "redirect_url": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|contain url to redirect user|[payment_system.PaymentResponse](#schemapayment_system.paymentresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|contain error description about data validation error|[payment_system.PaymentResponse](#schemapayment_system.paymentresponse)|
|402|[Payment Required](https://tools.ietf.org/html/rfc7231#section-6.5.2)|contain error description about error on payment system side|[payment_system.PaymentResponse](#schemapayment_system.paymentresponse)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|contain error description about error on PSP (P1) side|[payment_system.PaymentResponse](#schemapayment_system.paymentresponse)|

<aside class="success">
This operation does not require authentication
</aside>

## Create order with HTML form

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/order/create?PP_PROJECT_ID=string&PP_AMOUNT=0&PP_ACCOUNT=string \
  -H 'Accept: text/html'

```

`POST /order/create`

Create a payment order use GET or POST HTML form

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|PP_PROJECT_ID|query|string|true|Project unique identifier in Protocol One payment solution|
|PP_AMOUNT|query|number|true|Order amount|
|PP_ACCOUNT|query|string|true|User unique account in project|
|PP_ORDER_ID|query|string|false|Unique order identifier in project. This field not required, BUT we're recommend send this field always|
|PP_PAYMENT_METHOD|query|string|false|Payment method identifier in Protocol One payment solution|
|PP_DESCRIPTION|query|string|false|Order description. If this field not send in request, then we're create standard order description|
|PP_CURRENCY|query|string|false|Order currency by ISO 4217 (3 chars). If this field send, then we're process amount in this currency|
|PP_REGION|query|string|false|User (payer) region code by ISO 3166-1 (2 chars) for check project packages. If this field not send, then user region will be get from user ip|
|PP_PAYER_EMAIL|query|string|false|User (payer) email|
|PP_PAYER_PHONE|query|string|false|User (payer) phone|
|PP_URL_VERIFY|query|string|false|URL for payment data verification request to project. This field can be send if it allowed in project admin panel|
|PP_URL_NOTIFY|query|string|false|URL for payment notification request to project. This field can be send if it allowed in project admin panel|
|PP_URL_SUCCESS|query|string|false|URL for redirect user after successfully completed payment. This field can be send if it allowed in project admin panel|
|PP_URL_FAIL|query|string|false|URL for redirect user after failed payment. This field can be send if it allowed in project admin panel|
|PP_SIGNATURE|query|string|false|Signature of request to verify that the data has not been changed. This field not required, BUT we're recommend send this field always|
|Other|query|string|false|Any fields on the project side that do not match the names of the reserved fields|

> Example responses

> 302 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|302|[Found](https://tools.ietf.org/html/rfc7231#section-6.4.3)|Redirect user to form entering payment requisites|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Redirect user to page with error description|string|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Redirect user to page with error description|string|

<aside class="success">
This operation does not require authentication
</aside>

# Order

## Get orders

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/order \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/order`

Get orders list

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|query|string|false|order unique identifier|
|project[]|query|string|false|query array of list of projects to get orders filtered by they|
|payment_method[]|query|string|false|query array of list of payment methods to get orders filtered by they|
|country[]|query|string|false|query array of list of payer countries to get orders filtered by they|
|status[]|query|integer|false|query array of list of orders statuses to get orders filtered by they|
|account|query|string|false|payer account on the any side of payment process. for example it may be account in project, account in payment system, payer email and etc|
|pm_date_from|query|integer|false|start date when payment was closed to get orders filtered by they|
|pm_date_to|query|integer|false|end date when payment was closed to get orders filtered by they|
|project_date_from|query|integer|false|start date when payment was created to get orders filtered by they|
|project_date_to|query|integer|false|end date when payment was closed in project to get orders filtered by they|
|limit|query|integer|false|maximum number of returning orders. default value is 100|
|offset|query|integer|false|offset from which you want to return the list of orders. default value is 0|
|sort[]|query|string|false|query array of fields list for sorting|
|quick_search|query|string|false|multiple field search string - order unique identifier, user external identifier, project order identifier, project name, payment method name|
|merchant|query|array[string]|false|query array of merchant identifier list|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "uuid": "string",
      "total_payment_amount": 0,
      "currency": "string",
      "project": {
        "id": "string",
        "merchant_id": "string",
        "url_success": "string",
        "url_fail": "string",
        "send_notify_email": true,
        "notify_emails": [
          "string"
        ],
        "secret_key": "string",
        "url_check_account": "string",
        "url_process_payment": "string",
        "callback_protocol": "string"
      },
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "transaction": "string",
      "transaction_date": {
        "seconds": 0,
        "nanos": 0
      },
      "payment_method": {
        "title": "string",
        "external_id": "string",
        "payment_system_id": "string",
        "saved": true,
        "card": {
          "first6": "string",
          "last4": "string",
          "masked": "string",
          "expiry_month": "string",
          "expiry_year": "string",
          "brand": "string",
          "fingerprint": "string",
          "secure3d": true
        },
        "wallet": {
          "brand": "string",
          "account": "string"
        },
        "crypto_currency": {
          "brand": "string",
          "address": "string"
        }
      },
      "country_code": "string",
      "merchant_id": "string",
      "locale": "string",
      "status": "string",
      "user": {
        "id": "string",
        "object": "string",
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
        "metadata": {},
        "notify_new_region": true,
        "notify_new_region_email": "string"
      },
      "billing_address": {
        "country": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string"
      },
      "type": "string",
      "is_vat_deduction": true,
      "gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "method_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_fixed_fee": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "net_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "method_refund_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "merchant_refund_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_reverse_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "items": [
        {
          "id": "string",
          "object": "string",
          "sku": "string",
          "name": "string",
          "description": "string",
          "amount": 0,
          "currency": "string",
          "images": [
            "string"
          ],
          "url": null,
          "metadata": {},
          "code": "string",
          "created_at": {
            "seconds": 0,
            "nanos": 0
          },
          "updated_at": {
            "seconds": 0,
            "nanos": 0
          },
          "platform_id": "string"
        }
      ],
      "issuer": {
        "url": "string",
        "embedded": true,
        "reference": "string",
        "reference_type": "string",
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string",
        "referrer_host": "string"
      },
      "merchant_payout_currency": "string",
      "parent": {
        "id": "string",
        "uuid": "string"
      },
      "refund": {
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "code": "string",
        "receipt_number": "string",
        "receipt_url": "string"
      },
      "cancellation": {
        "reason": "string",
        "code": "string"
      },
      "operating_company_id": "string",
      "refund_allowed": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.list.public](#schemaorder.list.public)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get order data

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/order/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/order/{id}`

Get full object with order data

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Order unique identifier|

> Example responses

> 200 Response

```json
{
  "uuid": "string",
  "total_payment_amount": 0,
  "currency": "string",
  "project": {
    "id": "string",
    "merchant_id": "string",
    "url_success": "string",
    "url_fail": "string",
    "send_notify_email": true,
    "notify_emails": [
      "string"
    ],
    "secret_key": "string",
    "url_check_account": "string",
    "url_process_payment": "string",
    "callback_protocol": "string"
  },
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "transaction": "string",
  "transaction_date": {
    "seconds": 0,
    "nanos": 0
  },
  "payment_method": {
    "title": "string",
    "external_id": "string",
    "payment_system_id": "string",
    "saved": true,
    "card": {
      "first6": "string",
      "last4": "string",
      "masked": "string",
      "expiry_month": "string",
      "expiry_year": "string",
      "brand": "string",
      "fingerprint": "string",
      "secure3d": true
    },
    "wallet": {
      "brand": "string",
      "account": "string"
    },
    "crypto_currency": {
      "brand": "string",
      "address": "string"
    }
  },
  "country_code": "string",
  "merchant_id": "string",
  "locale": "string",
  "status": "string",
  "user": {
    "id": "string",
    "object": "string",
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
    "metadata": {},
    "notify_new_region": true,
    "notify_new_region_email": "string"
  },
  "billing_address": {
    "country": "string",
    "city": "string",
    "postal_code": "string",
    "state": "string"
  },
  "type": "string",
  "is_vat_deduction": true,
  "gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "method_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_fixed_fee": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "net_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "method_refund_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "merchant_refund_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_reverse_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "items": [
    {
      "id": "string",
      "object": "string",
      "sku": "string",
      "name": "string",
      "description": "string",
      "amount": 0,
      "currency": "string",
      "images": [
        "string"
      ],
      "url": null,
      "metadata": {},
      "code": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "platform_id": "string"
    }
  ],
  "issuer": {
    "url": "string",
    "embedded": true,
    "reference": "string",
    "reference_type": "string",
    "utm_source": "string",
    "utm_medium": "string",
    "utm_campaign": "string",
    "referrer_host": "string"
  },
  "merchant_payout_currency": "string",
  "parent": {
    "id": "string",
    "uuid": "string"
  },
  "refund": {
    "amount": 0,
    "currency": "string",
    "reason": "string",
    "code": "string",
    "receipt_number": "string",
    "receipt_url": "string"
  },
  "cancellation": {
    "reason": "string",
    "code": "string"
  },
  "operating_company_id": "string",
  "refund_allowed": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.public](#schemaorder.public)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Change platform for order

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/orders/{id}/platform \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /api/v1/orders/{id}/platform`

Change platform for order

> Body parameter

```json
{
  "platform": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Order unique identifier|
|body|body|object|false|platform change request|
|» platform|body|string|false|none|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get list of refunds to order

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/order/{order_id}/refunds?limit=string&offset=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/order/{order_id}/refunds`

Get list of refunds to order

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|order_id|path|string|true|order identifier|
|limit|query|string|true|count of records to need to return|
|offset|query|string|true|number of record which must be first in listing|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "order_id": "string",
    "external_id": "string",
    "amount": 0,
    "creator_id": "string",
    "reason": "string",
    "currency": "string",
    "status": 0,
    "created_at": 0,
    "updated_at": 0
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[order.Refund](#schemaorder.refund)]|false|none|none|
|» id|string|false|none|refund unique identifier|
|» order_id|string|false|none|order unique identifier for which the refund was created|
|» external_id|string|false|none|refund unique identifier on payment system side|
|» amount|number|false|none|refund amount|
|» creator_id|string|false|none|user identifier who created refund|
|» reason|string|false|none|reason to refund|
|» currency|string|false|none|refund currency|
|» status|integer|false|none|refund status. available statuses: 0 - refund was created; 1 - refund rejected on payment system side; 2 - refund in processing on payment system side; 3 - refund successfully completed;|
|» created_at|integer|false|none|dete of create notification in unix timestamp format|
|» updated_at|integer|false|none|dete of last update notification in unix timestamp format|

<aside class="success">
This operation does not require authentication
</aside>

## Create new refund to order

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/order/{order_id}/refunds \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/order/{order_id}/refunds`

Create new refund to order

> Body parameter

```json
{
  "amount": 0,
  "reason": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|order_id|path|string|true|order identifier|
|body|body|[order.Refund.CreateRequest](#schemaorder.refund.createrequest)|true|refund data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "order_id": "string",
  "external_id": "string",
  "amount": 0,
  "creator_id": "string",
  "reason": "string",
  "currency": "string",
  "status": 0,
  "created_at": 0,
  "updated_at": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.Refund](#schemaorder.refund)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get refund data

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/order/{order_id}/refunds/{refund_id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/order/{order_id}/refunds/{refund_id}`

Get refund data

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|order_id|path|string|true|order identifier|
|refund_id|path|string|true|refund identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "order_id": "string",
  "external_id": "string",
  "amount": 0,
  "creator_id": "string",
  "reason": "string",
  "currency": "string",
  "status": 0,
  "created_at": 0,
  "updated_at": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.Refund](#schemaorder.refund)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Replaces activation code in order

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/order/{order_id}/replace_code \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/order/{order_id}/replace_code`

Replaces activation code in order

> Body parameter

```json
{
  "key_product_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|order_id|path|string|true|order identifier|
|body|body|object|true|Order change request|
|» key_product_id|body|string|false|none|

> Example responses

> 200 Response

```json
{
  "uuid": "string",
  "total_payment_amount": 0,
  "currency": "string",
  "project": {
    "id": "string",
    "merchant_id": "string",
    "url_success": "string",
    "url_fail": "string",
    "send_notify_email": true,
    "notify_emails": [
      "string"
    ],
    "secret_key": "string",
    "url_check_account": "string",
    "url_process_payment": "string",
    "callback_protocol": "string"
  },
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "transaction": "string",
  "transaction_date": {
    "seconds": 0,
    "nanos": 0
  },
  "payment_method": {
    "title": "string",
    "external_id": "string",
    "payment_system_id": "string",
    "saved": true,
    "card": {
      "first6": "string",
      "last4": "string",
      "masked": "string",
      "expiry_month": "string",
      "expiry_year": "string",
      "brand": "string",
      "fingerprint": "string",
      "secure3d": true
    },
    "wallet": {
      "brand": "string",
      "account": "string"
    },
    "crypto_currency": {
      "brand": "string",
      "address": "string"
    }
  },
  "country_code": "string",
  "merchant_id": "string",
  "locale": "string",
  "status": "string",
  "user": {
    "id": "string",
    "object": "string",
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
    "metadata": {},
    "notify_new_region": true,
    "notify_new_region_email": "string"
  },
  "billing_address": {
    "country": "string",
    "city": "string",
    "postal_code": "string",
    "state": "string"
  },
  "type": "string",
  "is_vat_deduction": true,
  "gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "method_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_fixed_fee": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "net_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "method_refund_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "merchant_refund_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_reverse_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "items": [
    {
      "id": "string",
      "object": "string",
      "sku": "string",
      "name": "string",
      "description": "string",
      "amount": 0,
      "currency": "string",
      "images": [
        "string"
      ],
      "url": null,
      "metadata": {},
      "code": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "platform_id": "string"
    }
  ],
  "issuer": {
    "url": "string",
    "embedded": true,
    "reference": "string",
    "reference_type": "string",
    "utm_source": "string",
    "utm_medium": "string",
    "utm_campaign": "string",
    "referrer_host": "string"
  },
  "merchant_payout_currency": "string",
  "parent": {
    "id": "string",
    "uuid": "string"
  },
  "refund": {
    "amount": 0,
    "currency": "string",
    "reason": "string",
    "code": "string",
    "receipt_number": "string",
    "receipt_url": "string"
  },
  "cancellation": {
    "reason": "string",
    "code": "string"
  },
  "operating_company_id": "string",
  "refund_allowed": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.public](#schemaorder.public)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get data for rendering payment form

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/order/{id} \
  -H 'Accept: application/json'

```

`GET /api/v1/order/{id}`

Get data for rendering payment form

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Order unique identifier|

> Example responses

> 200 Response

```json
{
  "account": "string",
  "has_vat": true,
  "vat": 0,
  "amount": 0,
  "total_amount": 0,
  "currency": "string",
  "user_address_data_required": true,
  "id": "string",
  "payment_methods": [
    {
      "account_regexp": "string",
      "group_alias": "string",
      "icon": "string",
      "id": "string",
      "name": "string",
      "type": "string"
    }
  ],
  "project": {
    "name": "string",
    "url_fail": "string",
    "url_success": "string"
  },
  "token": "string",
  "user_ip_data": {
    "country": "string",
    "city": "string",
    "zip": "string"
  },
  "items": [
    {
      "id": "string",
      "object": "string",
      "sku": "string",
      "name": "string",
      "description": "string",
      "amount": 0,
      "currency": "string",
      "images": [
        "string"
      ],
      "url": null,
      "metadata": {},
      "code": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "platform_id": "string"
    }
  ],
  "cookie": "string",
  "email": "string",
  "description": "string",
  "country_payments_allowed": true,
  "country_change_allowed": true,
  "platforms": [
    "string"
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[model.PaymentFormDataResponse](#schemamodel.paymentformdataresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Project

## List projects

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/projects \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/projects`

Get list of project for authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|query|string|false|merchant identifier|
|quick_search|query|string|false|string to quick search by project name|
|status|query|array[integer]|false|array of project statuses|
|sort|query|array[string]|false|fields list for sorting|
|limit|query|integer|false|maximum number of returning records. default value is 100|
|offset|query|integer|false|offset from which you want to return the list of records. default value is 0|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "merchant_id": "string",
    "image": "string",
    "callback_currency": "string",
    "callback_protocol": "string",
    "create_invoice_allowed_urls": [
      "string"
    ],
    "status": 0,
    "allow_dynamic_notify_urls": true,
    "allow_dynamic_redirect_urls": true,
    "limits_currency": "string",
    "max_payment_amount": 0,
    "min_payment_amount": 0,
    "name": {},
    "notify_emails": [
      "string"
    ],
    "is_products_checkout": true,
    "secret_key": "string",
    "send_notify_email": true,
    "url_check_account": "string",
    "url_process_payment": "string",
    "url_redirect_fail": "string",
    "url_redirect_success": "string",
    "products_count": 0,
    "created_at": {},
    "updated_at": {},
    "localizations": [
      "string"
    ],
    "full_description": {
      "property1": "string",
      "property2": "string"
    },
    "short_description": {
      "property1": "string",
      "property2": "string"
    },
    "cover": {
      "images": {
        "en": "en_image",
        "ru": "ru_image"
      },
      "use_one_for_all": true
    },
    "virtual_currency": {
      "logo": "string",
      "name": {
        "en": "Some name",
        "ru": "Какое то имя"
      },
      "success_message": {
        "en": "Thanks!",
        "ru": "Спасибо!"
      },
      "min_purchase_value": 0,
      "max_purchase_value": 0,
      "sell_count_type": "fractional",
      "prices": [
        {
          "amount": 0,
          "currency": "string",
          "region": "string",
          "is_virtual_currency": true
        }
      ]
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[model.Project](#schemamodel.project)]|false|none|none|
|» id|string|false|none|unique project identifier|
|» merchant_id|string|false|none|project merchant id|
|» image|string|false|none|url to project logo|
|» callback_currency|string|false|none|currency to send payment notification|
|» callback_protocol|string|false|none|protocol identifier to send payment notification. Now available: default, empty|
|» create_invoice_allowed_urls|[string]|false|none|list of urls rom which you can send a request to create an order|
|» status|integer|false|none|project status. now available: 0 - new project; 1 - project successfully complete integration tests; 2 - project fail one or more integration test; 3 - project in production; 4 - project deleted|
|» allow_dynamic_notify_urls|boolean|false|none|is allow send dynamic notification urls in request to create an order|
|» allow_dynamic_redirect_urls|boolean|false|none|is allow send dynamic user's redirect urls in request to create an order|
|» limits_currency|string|false|none|currency for amount's limit|
|» max_payment_amount|number|false|none|maximal amount allowed for create order|
|» min_payment_amount|number|false|none|minimal amount allowed for create order|
|» name|object|false|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|» notify_emails|[string]|false|none|list of emails to send notifications about successfully completed payment operations|
|» is_products_checkout|boolean|false|none|is allow create order only with amounts from products list|
|» secret_key|string|false|none|secret key for create check hash for request about order statuses changes|
|» send_notify_email|boolean|false|none|is allow send notifications about successfully completed payment operations to user's emails|
|» url_check_account|string|false|none|default url to send request for verification payment data to project|
|» url_process_payment|string|false|none|default url to send request for notification about successfully completed payment to project|
|» url_redirect_fail|string|false|none|default url to redirect user after failed payment|
|» url_redirect_success|string|false|none|default url to redirect user after successfully completed payment|
|» products_count|integer|false|none|count of project's products|
|» created_at|object|false|none|date of create merchant in system in unix timestamp|
|» updated_at|object|false|none|date of update merchant in system in unix timestamp|
|» localizations|[string]|false|none|languages for product to localize|
|» full_description|object|false|none|localized full description for product|
|»» **additionalProperties**|string|false|none|none|
|» short_description|object|false|none|localized short description for product|
|»» **additionalProperties**|string|false|none|none|
|» cover|object|false|none|none|
|»» images|object|false|none|none|
|»»» **additionalProperties**|string|false|none|none|
|»» use_one_for_all|boolean|false|none|none|
|» virtual_currency|[model.VirtualCurrency](#schemamodel.virtualcurrency)|false|none|none|
|»» logo|string|false|none|none|
|»» name|string|false|none|none|
|»»» **additionalProperties**|string|false|none|none|
|»» success_message|string|false|none|none|
|»»» **additionalProperties**|string|false|none|none|
|»» min_purchase_value|number(double)|false|none|none|
|»» max_purchase_value|number(double)|false|none|none|
|»» sell_count_type|string|false|none|none|
|»» prices|[[product.Price](#schemaproduct.price)]|false|none|none|
|»»» amount|number|false|none|price|
|»»» currency|string|false|none|currency|
|»»» region|string|false|none|region|
|»»» is_virtual_currency|boolean|false|none|virtual currency flag|

#### Enumerated Values

|Property|Value|
|---|---|
|sell_count_type|fractional|
|sell_count_type|integral|

<aside class="success">
This operation does not require authentication
</aside>

## Create project

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/projects \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/projects`

Create new project for authenticated merchant

> Body parameter

```json
{
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[projects.CreateRequest](#schemaprojects.createrequest)|true|Creating project data|

> Example responses

> 201 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "status": 0,
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string",
  "products_count": 0,
  "created_at": {},
  "updated_at": {},
  "localizations": [
    "string"
  ],
  "full_description": {
    "property1": "string",
    "property2": "string"
  },
  "short_description": {
    "property1": "string",
    "property2": "string"
  },
  "cover": {
    "images": {
      "en": "en_image",
      "ru": "ru_image"
    },
    "use_one_for_all": true
  },
  "virtual_currency": {
    "logo": "string",
    "name": {
      "en": "Some name",
      "ru": "Какое то имя"
    },
    "success_message": {
      "en": "Thanks!",
      "ru": "Спасибо!"
    },
    "min_purchase_value": 0,
    "max_purchase_value": 0,
    "sell_count_type": "fractional",
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string",
        "is_virtual_currency": true
      }
    ]
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|OK|[model.Project](#schemamodel.project)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete project

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/projects/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/projects/{id}`

Deactivation project for authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Project identifier|

> Example responses

> 200 Response

```json
"string"
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get project

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/projects/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/projects/{id}`

"Get data about project"

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Project identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "status": 0,
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string",
  "products_count": 0,
  "created_at": {},
  "updated_at": {},
  "localizations": [
    "string"
  ],
  "full_description": {
    "property1": "string",
    "property2": "string"
  },
  "short_description": {
    "property1": "string",
    "property2": "string"
  },
  "cover": {
    "images": {
      "en": "en_image",
      "ru": "ru_image"
    },
    "use_one_for_all": true
  },
  "virtual_currency": {
    "logo": "string",
    "name": {
      "en": "Some name",
      "ru": "Какое то имя"
    },
    "success_message": {
      "en": "Thanks!",
      "ru": "Спасибо!"
    },
    "min_purchase_value": 0,
    "max_purchase_value": 0,
    "sell_count_type": "fractional",
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string",
        "is_virtual_currency": true
      }
    ]
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[model.Project](#schemamodel.project)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Project not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update project

> Code samples

```shell
# You can also use wget
curl -X PATCH /p1payapi.tst.protocol.one/admin/api/v1/projects/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PATCH /admin/api/v1/projects/{id}`

Update project for authenticated merchant

> Body parameter

```json
{
  "id": "string",
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "status": 0,
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string",
  "products_count": 0,
  "created_at": {},
  "updated_at": {},
  "localizations": [
    "string"
  ],
  "full_description": {
    "property1": "string",
    "property2": "string"
  },
  "short_description": {
    "property1": "string",
    "property2": "string"
  },
  "cover": {
    "images": {
      "en": "en_image",
      "ru": "ru_image"
    },
    "use_one_for_all": true
  },
  "virtual_currency": {
    "logo": "string",
    "name": {
      "en": "Some name",
      "ru": "Какое то имя"
    },
    "success_message": {
      "en": "Thanks!",
      "ru": "Спасибо!"
    },
    "min_purchase_value": 0,
    "max_purchase_value": 0,
    "sell_count_type": "fractional",
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string",
        "is_virtual_currency": true
      }
    ]
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Project identifier|
|body|body|[model.Project](#schemamodel.project)|true|Project object with new data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "status": 0,
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string",
  "products_count": 0,
  "created_at": {},
  "updated_at": {},
  "localizations": [
    "string"
  ],
  "full_description": {
    "property1": "string",
    "property2": "string"
  },
  "short_description": {
    "property1": "string",
    "property2": "string"
  },
  "cover": {
    "images": {
      "en": "en_image",
      "ru": "ru_image"
    },
    "use_one_for_all": true
  },
  "virtual_currency": {
    "logo": "string",
    "name": {
      "en": "Some name",
      "ru": "Какое то имя"
    },
    "success_message": {
      "en": "Thanks!",
      "ru": "Спасибо!"
    },
    "min_purchase_value": 0,
    "max_purchase_value": 0,
    "sell_count_type": "fractional",
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string",
        "is_virtual_currency": true
      }
    ]
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[model.Project](#schemamodel.project)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Check sku+project unique

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/projects/{id}/sku \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/projects/{id}/sku`

Update project for authenticated merchant

> Body parameter

```json
{
  "sku": "my_awesome_sku_001"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Project identifier|
|body|body|object|true|Project object with new data|
|» sku|body|string|false|none|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Payment Method

## Create a payment method for payment system

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/payment_method \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`POST /api/v1/payment_method`

Create a payment method for payment system

> Body parameter

```json
{
  "name": "string",
  "group_alias": "string",
  "external_id": "string",
  "currencies": [
    0
  ],
  "min_payment_amount": 0,
  "max_payment_amount": 0,
  "type": "string",
  "account_regexp": "string",
  "is_active": true,
  "payment_system_id": "string",
  "test_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ],
  "production_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ]
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[payment_method.PostProductMethod](#schemapayment_method.postproductmethod)|false|product method properties|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodResponse](#schemapayment_method.changepaymentmethodresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Update a payment method for payment system

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/api/v1/payment_method/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`PUT /api/v1/payment_method/{id}`

Update a payment method for payment system

> Body parameter

```json
{
  "id": "string",
  "name": "string",
  "group_alias": "string",
  "external_id": "string",
  "currencies": [
    0
  ],
  "min_payment_amount": 0,
  "max_payment_amount": 0,
  "type": "string",
  "account_regexp": "string",
  "is_active": true,
  "payment_system_id": "string",
  "test_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ],
  "production_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ]
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|paymentmethod identifier|
|body|body|[payment_method.PutProductMethod](#schemapayment_method.putproductmethod)|false|product method properties|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodResponse](#schemapayment_method.changepaymentmethodresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Add production settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/production \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`POST /api/v1/payment_method/{id}/production`

Add production settings to the payment method

> Body parameter

```json
{
  "id": "string",
  "payment_system_id": "string",
  "params": {
    "currency": "string",
    "terminal_id": "string",
    "secret": "string",
    "secret_callback": "string"
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|paymentmethod identifier|
|body|body|[payment_method.UpdatePaymentMethodParams](#schemapayment_method.updatepaymentmethodparams)|false|payment method params|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Update production settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/production \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`PUT /api/v1/payment_method/{id}/production`

Update production settings to the payment method

> Body parameter

```json
{
  "id": "string",
  "payment_system_id": "string",
  "params": {
    "currency": "string",
    "terminal_id": "string",
    "secret": "string",
    "secret_callback": "string"
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payment method identifier|
|body|body|[payment_method.UpdatePaymentMethodParams](#schemapayment_method.updatepaymentmethodparams)|false|payment method params|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Get production settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/production \
  -H 'Accept: text/html'

```

`GET /api/v1/payment_method/{id}/production`

Get production settings to the payment method

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payment method identifier|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|none|
|» currency|string|true|none|none|
|» terminal_id|string|false|none|none|
|» secret|string|false|none|none|
|» secret_callback|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Delete production settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/production?currency_a3=string \
  -H 'Accept: text/html'

```

`DELETE /api/v1/payment_method/{id}/production`

Delete production settings to the payment method

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payment method identifier|
|currency_a3|query|string|true|code of currency|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Add test settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/test \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`POST /api/v1/payment_method/{id}/test`

Add test settings to the payment method

> Body parameter

```json
{
  "id": "string",
  "payment_system_id": "string",
  "params": {
    "currency": "string",
    "terminal_id": "string",
    "secret": "string",
    "secret_callback": "string"
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|paymentmethod identifier|
|body|body|[payment_method.UpdatePaymentMethodParams](#schemapayment_method.updatepaymentmethodparams)|false|payment method params|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Update test settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/test \
  -H 'Content-Type: application/json' \
  -H 'Accept: text/html'

```

`PUT /api/v1/payment_method/{id}/test`

Update test settings to the payment method

> Body parameter

```json
{
  "id": "string",
  "payment_system_id": "string",
  "params": {
    "currency": "string",
    "terminal_id": "string",
    "secret": "string",
    "secret_callback": "string"
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|paymentmethod identifier|
|body|body|[payment_method.UpdatePaymentMethodParams](#schemapayment_method.updatepaymentmethodparams)|false|payment method params|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

## Get test settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/test \
  -H 'Accept: text/html'

```

`GET /api/v1/payment_method/{id}/test`

Get test settings to the payment method

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payment method identifier|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|none|
|» currency|string|true|none|none|
|» terminal_id|string|false|none|none|
|» secret|string|false|none|none|
|» secret_callback|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Delete test settings to the payment method

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/api/v1/payment_method/{id}/test?currency_a3=string \
  -H 'Accept: text/html'

```

`DELETE /api/v1/payment_method/{id}/test`

Delete test settings to the payment method

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payment method identifier|
|currency_a3|query|string|true|code of currency|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[payment_method.ChangePaymentMethodParamsResponse](#schemapayment_method.changepaymentmethodparamsresponse)]|false|none|none|
|» status|integer|true|none|status as result of operation|
|» message|string|false|none|string description for error message|

<aside class="success">
This operation does not require authentication
</aside>

# Price group

## Get region and currency by country

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/price_group/country?country=string \
  -H 'Accept: application/json'

```

`GET /api/v1/price_group/country`

Get region and currency by country

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|country|query|string|true|two-letter code of country|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "region": "string",
    "currency": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.CurrencyRegion](#schemaprice_group.currencyregion)]|false|none|none|
|» id|string|false|none|price group identifier|
|» region|string|false|none|name of region|
|» currency|string|false|none|code of currency|

<aside class="success">
This operation does not require authentication
</aside>

## Get a list of all currencies with regions and countries in them

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/price_group/currencies \
  -H 'Accept: application/json'

```

`GET /api/v1/price_group/currencies`

Get a list of all currencies with regions and countries in them

> Example responses

> 200 Response

```json
[
  {
    "regions": {
      "currency": "string",
      "region": {
        "region": "string",
        "country": [
          null
        ]
      }
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.CurrencyListResponse](#schemaprice_group.currencylistresponse)]|false|none|none|
|» regions|object|false|none|none|
|»» currency|string|false|none|name of currency|
|»» region|object|false|none|none|
|»»» region|string|false|none|name of region|
|»»» country|[any]|false|none|list of countries|

<aside class="success">
This operation does not require authentication
</aside>

## Get currency for a region and a list of countries in it

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/price_group/region?region=string \
  -H 'Accept: application/json'

```

`GET /api/v1/price_group/region`

Get currency for a region and a list of countries in it

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|region|query|string|true|name of region|

> Example responses

> 200 Response

```json
[
  {
    "regions": {
      "currency": "string",
      "region": {
        "region": "string",
        "country": [
          null
        ]
      }
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.CurrencyListResponse](#schemaprice_group.currencylistresponse)]|false|none|none|
|» regions|object|false|none|none|
|»» currency|string|false|none|name of currency|
|»» region|object|false|none|none|
|»»» region|string|false|none|name of region|
|»»» country|[any]|false|none|list of countries|

<aside class="success">
This operation does not require authentication
</aside>

# Pricing

## Get recommended prices for regions by price groups

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/pricing/recommended/steam \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`GET /api/v1/pricing/recommended/steam`

Calculation of recommended prices based on price ranges as in Steam, taking into account regional factors.

> Body parameter

```json
{
  "amount": 0,
  "currency": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[Data](#schemadata)|true|Request param|
|» amount|body|integer|false|none|
|» currency|body|string|false|none|

> Example responses

> 200 Response

```json
[
  {
    "recommended_price": {
      "region": "string",
      "currency": "string",
      "amount": 0
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.RecommendedPriceResponse](#schemaprice_group.recommendedpriceresponse)]|false|none|none|
|» recommended_price|object|false|none|none|
|»» region|string|false|none|name of region|
|»» currency|string|false|none|name of currency|
|»» amount|number|false|none|recommended amount|

<aside class="success">
This operation does not require authentication
</aside>

## Get recommended prices for regions by currency conversion

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/pricing/recommended/conversion \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`GET /api/v1/pricing/recommended/conversion`

Calculation of recommended prices based on exchange rates.

> Body parameter

```json
{
  "amount": 0,
  "currency": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[Data](#schemadata)|true|Request param|
|» amount|body|integer|false|none|
|» currency|body|string|false|none|

> Example responses

> 200 Response

```json
[
  {
    "recommended_price": {
      "region": "string",
      "currency": "string",
      "amount": 0
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.RecommendedPriceResponse](#schemaprice_group.recommendedpriceresponse)]|false|none|none|
|» recommended_price|object|false|none|none|
|»» region|string|false|none|name of region|
|»» currency|string|false|none|name of currency|
|»» amount|number|false|none|recommended amount|

<aside class="success">
This operation does not require authentication
</aside>

## Get table of recommended prices for currency

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/api/v1/pricing/recommended/table \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`GET /api/v1/pricing/recommended/table`

Get table of recommended prices for currency.

> Body parameter

```json
{
  "currency": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|Request param|
|» currency|body|string|false|none|

> Example responses

> 200 Response

```json
[
  {
    "ranges": {
      "from": 0.99,
      "to": 1.99
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Error description|string|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[price_group.RecommendedPriceTableResponse](#schemaprice_group.recommendedpricetableresponse)]|false|none|none|
|» ranges|object|false|none|none|
|»» from|integer|false|none|start point of range|
|»» to|integer|false|none|end point of range|

<aside class="success">
This operation does not require authentication
</aside>

# Onboarding

## Get list of merchants

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants`

Get list of merchants

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|quick_search|query|string|false|string to quick search by merchant name or user owner email|
|name|query|string|false|merchant name|
|is_signed|query|boolean|false|query parameter to return merchants with full signed agreement|
|last_payout_date_from|query|integer|false|start date to filter merchants by last payout date. parameter format must be a unix timestamp|
|last_payout_date_to|query|integer|false|end date to filter merchants by last payout date. parameter format must be a unix timestamp|
|last_payout_amount|query|integer|false|last payout amount|
|status|query|array[integer]|false|array of merchant statuses|
|limit|query|integer|false|maximum number of returning orders. default value is 100|
|offset|query|integer|false|offset from which you want to return the list of orders. default value is 0|
|sort[]|query|string|false|fields list for sorting|
|registration_date_from|query|integer|false|start date to filter merchants by owner regiatration date. unix timestamp value in seconds|
|registration_date_to|query|integer|false|end date to filter merchants by owner regiatration date. unix timestamp value in seconds|
|received_date_from|query|integer|false|start date to filter merchants by date when licanse agreement was signed by merchant owner. unix timestamp value in seconds|
|received_date_to|query|integer|false|end date to filter merchants by date when licanse agreement was signed by merchant owner. unix timestamp value in seconds|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "company": {
      "name": "string",
      "alternative_name": "string",
      "website": "string",
      "country": "string",
      "state": "string",
      "zip": "string",
      "city": "string",
      "address": "string",
      "address_additional": "string",
      "registration_number": "string",
      "tax_id": "string"
    },
    "contacts": {
      "authorized": {
        "name": "string",
        "email": "string",
        "phone": "string",
        "position": "string"
      },
      "technical": {
        "name": "string",
        "email": "string",
        "phone": "string"
      }
    },
    "banking": {
      "name": "string",
      "address": "string",
      "account_number": "string",
      "swift": "string",
      "details": "string",
      "correspondent_account": "string"
    },
    "status": 0,
    "created_at": 0,
    "updated_at": 0,
    "first_payment_at": 0,
    "last_payout": {
      "date": 0,
      "amount": 0
    },
    "is_signed": true,
    "payment_methods": {},
    "agreement_type": 0,
    "agreement_sent_via_mail": true,
    "mail_tracking_link": "string",
    "signature_request": {
      "signer_type": 0
    },
    "agreement_template": "string",
    "received_date": {
      "seconds": 0,
      "nanos": 0
    },
    "status_last_updated_at": {
      "seconds": 0,
      "nanos": 0
    },
    "has_projects": true,
    "user": {
      "id": "string",
      "email": "string",
      "first_name": "string",
      "last_name": "string",
      "profile_id": "string",
      "registration_date": {
        "seconds": 0,
        "nanos": 0
      }
    },
    "mcc_code": "string",
    "operating_company_id": "string",
    "tariff": {
      "home_region": "asia"
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[onboarding.Merchant](#schemaonboarding.merchant)]|false|none|none|
|» id|string|false|none|merchant unique identifier in system|
|» company|object|false|none|none|
|»» name|string|true|none|name|
|»» alternative_name|string|true|none|brand|
|»» website|string|true|none|website url|
|»» country|string|true|none|destination country 2 letter code by ISO 3166-1|
|»» state|string|true|none|destination state or region|
|»» zip|string|true|none|destination zip code|
|»» city|string|true|none|destination city|
|»» address|string|true|none|destination address|
|»» address_additional|string|false|none|additional company address|
|»» registration_number|string|false|none|company registration number|
|»» tax_id|string|false|none|company tax identifier|
|» contacts|object|false|none|none|
|»» authorized|object|true|none|none|
|»»» name|string|true|none|person full name|
|»»» email|string|true|none|person email|
|»»» phone|string|true|none|person contact phone|
|»»» position|string|true|none|person position in company|
|»» technical|object|true|none|none|
|»»» name|string|true|none|person full name|
|»»» email|string|true|none|person email|
|»»» phone|string|true|none|person contact phone|
|»» banking|object|false|none|none|
|»»» name|string|true|none|bank name|
|»»» address|string|true|none|bank address|
|»»» account_number|string|true|none|merchant accounting number in bank|
|»»» swift|string|true|none|bank SWIFT code|
|»»» details|string|false|none|any details abount merchant accounting bank|
|»»» correspondent_account|string|false|none|bank correspondent account|
|»» status|integer|false|none|merchant status in system|
|»» created_at|integer|false|none|date of create merchant in system in unix timestamp|
|»» updated_at|integer|false|none|date of update merchant in system in unix timestamp|
|»» first_payment_at|integer|false|none|date when was first payment by some merchant project in system in unix timestamp|
|»» last_payout|object|false|none|none|
|»»» date|integer|false|none|date in unix timestamp when was last payout to merchant|
|»»» amount|number|false|none|last payout amount to merchant|
|»» is_signed|boolean|false|none|agreement between merchant and system fully signed|
|»» payment_methods|object|false|none|list of payment methods activated to merchant|
|»» agreement_type|integer|false|none|type of agreement which merchant selected. possible values: 0 - type not select; 1 - paper agreement; 2 - e-sign agreement;|
|»» agreement_sent_via_mail|boolean|false|none|mark agreement as sent via post|
|»» mail_tracking_link|string|false|none|link to tracking package with agreement in post|
|»» signature_request|object|false|none|none|
|»»» signer_type|integer|true|none|type of signer which request a signing license agreement. possible values: 0 - merchant owner; 1 - paysuper admin|
|»» agreement_template|string|false|none|license agreement template identifier in hellosign|
|»» received_date|object|false|none|none|
|»»» seconds|integer|false|none|time in unix timestamp|
|»»» nanos|integer|false|none|time nano seconds|
|»» status_last_updated_at|object|false|none|none|
|»» has_projects|boolean|false|none|true is merchant has created projects|
|»» user|object|false|none|none|
|»»» id|string|false|none|user identifier|
|»»» email|string|false|none|user email|
|»»» first_name|string|false|none|user first name|
|»»» last_name|string|false|none|user last name|
|»»» profile_id|string|false|none|user primary onboarding profile identifier|
|»»» registration_date|object|false|none|none|
|»» mcc_code|string|false|none|mcc code value, for which this cost is applicable|
|»» operating_company_id|string|false|none|id of operation company for which this cost is applicable|
|»» tariff|object|false|none|none|
|»»» home_region|string|false|none|merchant tariff home region|

#### Enumerated Values

|Property|Value|
|---|---|
|home_region|asia|
|home_region|europe|
|home_region|latin_america|
|home_region|russia_and_cis|
|home_region|worldwide|

<aside class="success">
This operation does not require authentication
</aside>

## Get merchant by identifier

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}`

Get list of merchants

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Change merchant information

> Code samples

```shell
# You can also use wget
curl -X PATCH /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PATCH /admin/api/v1/merchants/{id}`

Change merchant agreement information

> Body parameter

```json
{
  "has_psp_signature": true,
  "has_merchant_signature": true
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Merchant.ChangeAgreementDataRequest](#schemaonboarding.merchant.changeagreementdatarequest)|true|data for change|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get user merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/user \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/user`

Get user merchant

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Change merchant status

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/change-status \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/change-status`

Change merchant status

> Body parameter

```json
{
  "status": 0,
  "message": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Merchant.ChangeStatus](#schemaonboarding.merchant.changestatus)|true|Data required to change status|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Enable merchant manual payouts

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/manual_payout/enable \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/manual_payout/enable`

Enable merchant manual payouts

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Disable merchant manual payouts

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/manual_payout/disable \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/manual_payout/disable`

Disable merchant manual payouts

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get list of notifications to merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{merchant_id}/notifications \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{merchant_id}/notifications`

Get list of notifications to merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant identifier|
|user|query|string|false|user who sent notification|
|is_system|query|integer|false|flag to filter return notification: 0 - return only notification; 1 - return only history|
|limit|query|integer|false|limit of returning records|
|offset|query|integer|false|offset of returning records|

> Example responses

> 200 Response

```json
[
  {
    "count": 0,
    "items": {
      "id": "string",
      "title": "string",
      "message": "string",
      "merchant_id": "string",
      "user_id": "string",
      "is_system": true,
      "is_read": true,
      "statuses": {
        "from": 0,
        "to": 0
      },
      "created_at": 0,
      "updated_at": 0
    }
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[onboarding.Merchant.Notifications](#schemaonboarding.merchant.notifications)]|false|none|none|
|» count|integer|false|none|total number of filtered notifications|
|» items|object|false|none|none|
|»» id|string|false|none|notification unique identifier in system|
|»» title|string|false|none|notification title|
|»» message|string|false|none|notification message|
|»» merchant_id|string|false|none|merchant identifier who must recieve notification|
|»» user_id|string|false|none|user identifier who send notification|
|»» is_system|boolean|false|none|notification generated automaticaly|
|»» is_read|boolean|false|none|receiver read notification|
|»» statuses|object|false|none|none|
|»»» from|integer|false|none|status before changes|
|»»» to|integer|false|none|status after changes|
|»» created_at|integer|false|none|dete of create notification in unix timestamp format|
|»» updated_at|integer|false|none|dete of last update notification in unix timestamp format|

<aside class="success">
This operation does not require authentication
</aside>

## Create new notification

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/merchants/{merchant_id}/notifications \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/merchants/{merchant_id}/notifications`

Create new notification

> Body parameter

```json
{
  "title": "string",
  "message": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant identifier|
|body|body|[onboarding.Merchant.Notification.CreateRequest](#schemaonboarding.merchant.notification.createrequest)|true|Notification data|

> Example responses

> 201 Response

```json
{
  "id": "string",
  "title": "string",
  "message": "string",
  "merchant_id": "string",
  "user_id": "string",
  "is_system": true,
  "is_read": true,
  "statuses": {
    "from": 0,
    "to": 0
  },
  "created_at": 0,
  "updated_at": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|OK|[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get notification by identifier

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{merchant_id}/notifications/{notification_id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{merchant_id}/notifications/{notification_id}`

Get notification by identifier

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant identifier|
|notification_id|path|string|true|notification identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "title": "string",
  "message": "string",
  "merchant_id": "string",
  "user_id": "string",
  "is_system": true,
  "is_read": true,
  "statuses": {
    "from": 0,
    "to": 0
  },
  "created_at": 0,
  "updated_at": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Mark notification as readed

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{merchant_id}/notifications/{notification_id}/mark-as-read \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{merchant_id}/notifications/{notification_id}/mark-as-read`

Mark notification as readed

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant identifier|
|notification_id|path|string|true|notification identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "title": "string",
  "message": "string",
  "merchant_id": "string",
  "user_id": "string",
  "is_system": true,
  "is_read": true,
  "statuses": {
    "from": 0,
    "to": 0
  },
  "created_at": 0,
  "updated_at": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set merchant agreement type

> Code samples

```shell
# You can also use wget
curl -X PATCH /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/agreement-type \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PATCH /admin/api/v1/merchants/{id}/agreement-type`

Set merchant agreement type

> Body parameter

```json
{
  "agreement_type": 0
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Merchant.ChangeAgreementType.Request](#schemaonboarding.merchant.changeagreementtype.request)|true|data to change agreement type|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Generate agreement

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/agreement \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}/agreement`

Generate agreement for merchant and return data about printable agreement

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "url": "string",
  "metadata": {
    "name": "string",
    "extension": "string",
    "content_type": "string",
    "size": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant.PrintableAgreementData.Response](#schemaonboarding.merchant.printableagreementdata.response)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Download merchant agreement

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/agreement/document \
  -H 'Accept: application/pdf'

```

`GET /admin/api/v1/merchants/{id}/agreement/document`

Download merchant agreement

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Upload merchant agreement

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/agreement/document \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/merchants/{id}/agreement/document`

Upload new version of merchant agreement

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "url": "string",
  "metadata": {
    "name": "string",
    "extension": "string",
    "content_type": "string",
    "size": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant.PrintableAgreementData.Response](#schemaonboarding.merchant.printableagreementdata.response)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get data to sign agreement

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/agreement/signature \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/agreement/signature`

Get data to sign license agreement with hellosign api

> Body parameter

```json
{
  "signer_type": 0
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier for which creating signature request|
|body|body|[onboarding.merchant.signatureRequest](#schemaonboarding.merchant.signaturerequest)|true|body|

> Example responses

> 200 Response

```json
{
  "sign_url": "string",
  "expires_at": {
    "seconds": 0,
    "nanos": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.merchant.signatureResponse](#schemaonboarding.merchant.signatureresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set company information

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/company \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/company`

Set company information

> Body parameter

```json
{
  "name": "string",
  "alternative_name": "string",
  "website": "string",
  "country": "string",
  "state": "string",
  "zip": "string",
  "city": "string",
  "address": "string",
  "address_additional": "string",
  "registration_number": "string",
  "tax_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Company](#schemaonboarding.company)|true|request body|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set contacts information

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/contacts \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/contacts`

Set contacts information

> Body parameter

```json
{
  "authorized": {
    "name": "string",
    "email": "string",
    "phone": "string",
    "position": "string"
  },
  "technical": {
    "name": "string",
    "email": "string",
    "phone": "string"
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Contacts](#schemaonboarding.contacts)|true|request body|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set banking information

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/banking \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/merchants/{id}/banking`

Set banking information

> Body parameter

```json
{
  "name": "string",
  "address": "string",
  "account_number": "string",
  "swift": "string",
  "details": "string",
  "correspondent_account": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Banking](#schemaonboarding.banking)|true|request body|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get tariff rates

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/tariffs?region=string&merchant_operations_type=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/tariffs`

Get tariff rates

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|region|query|string|true|merchant home region name. possible values: asia, europe, latin_america, russia_and_cis, worldwide|
|payer_region|query|string|false|payer possible region name. possible values: asia, europe, latin_america, russia_and_cis, worldwide|
|min_amount|query|number|false|payment min amount|
|max_amount|query|number|false|payment max amount|
|merchant_operations_type|query|string|true|merchant operations type. possible values are low-risk, high-risk|

> Example responses

> 200 Response

```json
[
  {
    "payment": {
      "min_amount": 0,
      "max_amount": 0,
      "method_name": "string",
      "method_percent_fee": 0,
      "method_fixed_fee": 0,
      "method_fixed_fee_currency": "string",
      "ps_percent_fee": 0,
      "ps_fixed_fee": 0,
      "ps_fixed_fee_currency": "string",
      "merchant_home_region": "string",
      "payer_regions": "string"
    },
    "refund": {
      "method_percent_fee": 0,
      "method_fixed_fee": 0,
      "method_fixed_fee_currency": "string",
      "is_paid_by_merchant": true
    },
    "chargeback": {
      "method_percent_fee": 0,
      "method_fixed_fee": 0,
      "method_fixed_fee_currency": "string",
      "is_paid_by_merchant": true
    },
    "payout": {
      "RUB": {
        "method_percent_fee": 0,
        "method_fixed_fee": 1000,
        "method_fixed_fee_currency": "RUB",
        "is_paid_by_merchant": true
      },
      "USD": {
        "method_percent_fee": 0,
        "method_fixed_fee": 10,
        "method_fixed_fee_currency": "USD",
        "is_paid_by_merchant": true
      }
    },
    "minimal_payout": {
      "RUB": 10000,
      "USD": 100
    },
    "mcc_code": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[onboarding.Tariff](#schemaonboarding.tariff)]|false|none|none|
|» payment|object|false|none|none|
|»» min_amount|number|false|none|min payment amount|
|»» max_amount|number|false|none|max payment amount|
|»» method_name|string|false|none|payment method name|
|»» method_percent_fee|number|false|none|payment method fee in percents|
|»» method_fixed_fee|number|false|none|payment method fixed fee in particular currency|
|»» method_fixed_fee_currency|string|false|none|currency of payment method fixed fee.  letters code by ISO 4217|
|»» ps_percent_fee|number|false|none|paysuper fee in percents|
|»» ps_fixed_fee|number|false|none|paysuper fixed fee in particular currency|
|»» ps_fixed_fee_currency|string|false|none|currency of paysuper fixed fee.  letters code by ISO 4217|
|»» merchant_home_region|string|false|none|merchant region name|
|»» payer_regions|string|false|none|payer region name|
|» refund|object|false|none|none|
|»» method_percent_fee|number|false|none|payment method fee in percents|
|»» method_fixed_fee|number|false|none|payment method fixed fee in particular currency|
|»» method_fixed_fee_currency|string|false|none|currency of payment method fixed fee.  letters code by ISO 4217|
|»» is_paid_by_merchant|boolean|false|none|if true than commission will to take from merchant|
|» chargeback|object|false|none|none|
|» payout|object|false|none|payout tariff|
|»» **additionalProperties**|object|false|none|none|
|» minimal_payout|object|false|none|minimal payout amount|
|»» **additionalProperties**|number|false|none|none|
|» mcc_code|string|false|none|mcc code value, for which this cost is applicable|

<aside class="success">
This operation does not require authentication
</aside>

## Set tariff rates to merchant

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/tariffs \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/merchants/{id}/tariffs`

Set tariff rates to merchant

> Body parameter

```json
{
  "home_region": "string",
  "merchant_operations_type": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|body|body|[onboarding.Tariff.Set.Request](#schemaonboarding.tariff.set.request)|true|request body|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get data fill status

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/status \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}/status`

Get data fill status

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "status": "string",
  "steps": {
    "company": true,
    "contacts": true,
    "banking": true,
    "tariff": true
  },
  "complete_steps_count": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.merchant.fillStatus](#schemaonboarding.merchant.fillstatus)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get all system costs for payments

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/system/all \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/channel/system/all`

Get all system costs for payments

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "region": "string",
      "country": "string",
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string",
      "operating_company_id": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.system.all](#schemaonboarding.cost.payment.system.all)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get all merchant costs for payments operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/merchant/{id}/all \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/channel/merchant/{id}/all`

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "id": "string",
      "merchant_id": "string",
      "name": "string",
      "payout_currency": "string",
      "min_amount": 0,
      "region": "string",
      "country": "string",
      "method_percent": 0,
      "method_fix_amount": 0,
      "method_fix_amount_currency": "string",
      "ps_percent": 0,
      "ps_fixed_fee": 0,
      "ps_fixed_fee_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.merchant.all](#schemaonboarding.cost.payment.merchant.all)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get all system costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/system/all \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/money_back/system/all`

Get all system costs for money back operations

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "payout_currency": "string",
      "undo_reason": "string",
      "region": "string",
      "country": "string",
      "days_from": 0,
      "payment_stage": 0,
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string",
      "operating_company_id": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.system.all](#schemaonboarding.cost.money_back.system.all)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get all merchant costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/merchant/{id}/all \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/money_back/merchant/{id}/all`

Get all merchant costs for money back operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "id": "string",
      "merchant_id": "string",
      "name": "string",
      "payout_currency": "string",
      "undo_reason": "string",
      "region": "string",
      "country": "string",
      "days_from": 0,
      "payment_stage": 0,
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "is_paid_by_merchant": true,
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.merchant.all](#schemaonboarding.cost.money_back.merchant.all)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get system costs for payment operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/system?name=string&region=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/channel/system`

Get system costs for payment operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|name|query|string|true|payment method name|
|region|query|string|true|region name. possible values: CIS, Russia, West Asia, EU, North America, Central America, South America, United Kingdom, Worldwide, South Pacific|
|country|query|string|false|two-letter country code by ISO 3166-1|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create system costs for payments operations

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/system \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payment_costs/channel/system`

Create system costs for payments operations

> Body parameter

```json
{
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[onboarding.cost.payment.system.create](#schemaonboarding.cost.payment.system.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get merchant costs for payment operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/merchant/{id}?name=string&region=string&payout_currency=string&amount=0 \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/channel/merchant/{id}`

Get merchant costs for payment operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|name|query|string|true|payment method name|
|region|query|string|true|region name. possible regions: CIS, Russia, West Asia, EU, North America, Central America, South America, United Kingdom, Worldwide, South Pacific|
|country|query|string|false|two-letter country code by ISO 3166-1|
|payout_currency|query|string|true|payout currency. 3 lettre code by ISO 4217|
|amount|query|number|true|min payment amount|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create merchant costs for payments operations

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/merchant/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payment_costs/channel/merchant/{id}`

Create merchant costs for payments operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "mcc_code": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|body|body|[onboarding.cost.payment.merchant.create](#schemaonboarding.cost.payment.merchant.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete merchant costs for payment operations

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/merchant/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/payment_costs/channel/merchant/{id}`

Delete merchant costs for payment operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant cost identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get system costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/system?name=string&payout_currency=string&undo_reason=string&region=string&days=0 \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/money_back/system`

Get system costs for money back operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|name|query|string|true|payment method name|
|payout_currency|query|string|true|payout currency. 3 lettre code by ISO 4217|
|undo_reason|query|string|true|money back type. available values: refund, reversal, chargeback|
|region|query|string|true|region name|
|country|query|string|false|two-letter country code by ISO 3166-1|
|days|query|number|true|number of days after payment operation|
|payment_stage|query|number|false|payment stage|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create system costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/system \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payment_costs/money_back/system`

Create system costs for money back operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[onboarding.cost.money_back.system.create](#schemaonboarding.cost.money_back.system.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get merchant costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/merchant/{id}?name=string&payout_currency=string&undo_reason=string&region=string&days=0 \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_costs/money_back/merchant/{id}`

Get merchant costs for money back operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|name|query|string|true|payment method name|
|payout_currency|query|string|true|payout currency. 3 lettre code by ISO 4217|
|undo_reason|query|string|true|money back type. available values: refund, reversal, chargeback|
|region|query|string|true|region name|
|country|query|string|false|two-letter country code by ISO 3166-1|
|days|query|number|true|number of days after payment operation|
|payment_stage|query|number|false|payment stage|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create merchant costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/merchant/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payment_costs/money_back/merchant/{id}`

Create merchant costs for money back operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "mcc_code": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|body|body|[onboarding.cost.money_back.merchant.create](#schemaonboarding.cost.money_back.merchant.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete merchant costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/merchant/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/payment_costs/money_back/merchant/{id}`

Delete merchant costs for money back operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant cost identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update system costs for payment operations

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/system/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/payment_costs/channel/system/{id}`

Update system costs for payment operations

> Body parameter

```json
{
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|cost record identifier|
|body|body|[onboarding.cost.payment.system.create](#schemaonboarding.cost.payment.system.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete system costs for payment operations

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/system/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/payment_costs/channel/system/{id}`

Delete system costs for payment operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|system cost identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update system costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/system/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/payment_costs/money_back/system/{id}`

Update system costs for money back operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|system cost identifier|
|body|body|[onboarding.cost.money_back.system.create](#schemaonboarding.cost.money_back.system.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete system costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/system/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/payment_costs/money_back/system/{id}`

Delete system costs for money back operations

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|system cost identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update merchant costs for payments operations

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/channel/merchant/{merchant_id}/{cost_id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/payment_costs/channel/merchant/{merchant_id}/{cost_id}`

Create merchant costs for payments operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "mcc_code": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant unique identifier|
|cost_id|path|string|true|cost record unique identifier|
|body|body|[onboarding.cost.payment.merchant.create](#schemaonboarding.cost.payment.merchant.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update merchant costs for money back operations

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/payment_costs/money_back/merchant/{merchant_id}/{cost_id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/payment_costs/money_back/merchant/{merchant_id}/{cost_id}`

Update merchant costs for money back operations

> Body parameter

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "mcc_code": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant unique identifier|
|cost_id|path|string|true|cost record unique identifier|
|body|body|[onboarding.cost.money_back.merchant.create](#schemaonboarding.cost.money_back.merchant.create)|true|data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set merchant operating company

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/set_operating_company \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/merchants/{id}/set_operating_company`

Set merchant operating company

> Body parameter

```yaml
operating_company_id: string

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant id|
|body|body|object|false|status|
|» operating_company_id|body|string|false|id of operation company for which this cost is applicable|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[onboarding.Merchant](#schemaonboarding.merchant)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Tax

## List all available tax rates in the system

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/taxes \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/taxes`

List all available tax rates in the system

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|country|query|string|false|country to filter response|
|city|query|string|false|city to filter response|
|state|query|string|false|state to filter response|
|zip|query|string|false|zip to filter response|
|limit|query|integer|false|maximum number of returning orders. default value is 100|
|offset|query|integer|false|offset from which you want to return the list of orders. default value is 0|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "country": "string",
    "city": "string",
    "state": "string",
    "zip": "string",
    "rate": 0
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[taxes.TaxRate](#schemataxes.taxrate)]|false|none|none|
|» id|string|false|none|none|
|» country|string|true|none|none|
|» city|string|false|none|none|
|» state|string|false|none|none|
|» zip|string|false|none|none|
|» rate|number|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Upsert tax rate data.

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/taxes \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/taxes`

Create or update tax rate data.

> Body parameter

```json
{
  "id": "string",
  "country": "string",
  "city": "string",
  "state": "string",
  "zip": "string",
  "rate": 0
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[taxes.TaxRate](#schemataxes.taxrate)|true|Object to upsert|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "country": "string",
  "city": "string",
  "state": "string",
  "zip": "string",
  "rate": 0
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[taxes.TaxRate](#schemataxes.taxrate)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete tax rate object

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/taxes/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/taxes/{id}`

Mark tax rate object as deleted

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|tax rate object id|

> Example responses

> 200 Response

```json
"string"
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Token

## Create token

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/api/v1/tokens \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-API-SIGNATURE: API_KEY'

```

`POST /api/v1/tokens`

Create token for process payment token create

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
    "type": "string",
    "metadata": {},
    "is_buy_for_virtual_currency": true
  }
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[token.TokenRequest](#schematoken.tokenrequest)|true|Data to process payment|

> Example responses

> 200 Response

```json
{
  "token": "string",
  "payment_form_url": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[token.TokenResponse](#schematoken.tokenresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
XAPISignatureHeader
</aside>

# Products

## Get product prices

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/products/:id/prices?id=string \
  -H 'Accept: application/json' \
  -H 'X-API-SIGNATURE: API_KEY'

```

`GET /admin/api/v1/products/:id/prices`

Get product prices

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|query|string|true|id of product|

> Example responses

> 200 Response

```json
[
  {
    "amount": 0,
    "currency": "string",
    "region": "string",
    "is_virtual_currency": true
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[product.Price](#schemaproduct.price)]|false|none|none|
|» amount|number|false|none|price|
|» currency|string|false|none|currency|
|» region|string|false|none|region|
|» is_virtual_currency|boolean|false|none|virtual currency flag|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
XAPISignatureHeader
</aside>

## Set product prices

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/products/:id/prices \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-API-SIGNATURE: API_KEY'

```

`PUT /admin/api/v1/products/:id/prices`

Set product prices

> Body parameter

```json
{
  "id": "string",
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string",
      "is_virtual_currency": true
    }
  ]
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[product.PutPrice](#schemaproduct.putprice)|false|price properties|

> Example responses

> 200 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[model.Error](#schemamodel.error)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
XAPISignatureHeader
</aside>

## Get a list of products for a merchant in which the owner is an authorized user

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/products \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/products`

Get products list for authorised user

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|name|query|string|false|product name|
|sku|query|string|false|product sku|
|limit|query|integer|false|maximum number of returning products. default value is 100|
|offset|query|integer|false|offset products per page|
|project_id|query|string|false|project identifier for which need get products list|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "project_id": "string",
    "object": "string",
    "type": "string",
    "sku": "string",
    "name": {},
    "default_currency": "string",
    "enabled": true,
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string"
      }
    ],
    "description": {},
    "long_description": {},
    "created_at": {
      "seconds": 0,
      "nanos": 0
    },
    "updated_at": {
      "seconds": 0,
      "nanos": 0
    },
    "images": [
      "string"
    ],
    "url": "string",
    "metadata": {},
    "billing_type": "real"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[product](#schemaproduct)]|false|none|none|
|» id|string|false|none|product identifier|
|» project_id|string|false|none|project identifier for which created product|
|» object|string|false|none|system constant conteined returning object type. for product object always must be - product|
|» type|string|false|none|product type|
|» sku|string|false|none|product sku (simple slug name)|
|» name|object|false|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|» default_currency|string|false|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|» enabled|boolean|false|none|true is product is enabled|
|» prices|[[price](#schemaprice)]|false|none|array of available prices for product|
|»» amount|number|false|none|price amount|
|»» currency|string|false|none|price currency. three-letter ISO 4217 currency code, in uppercase.|
|»» region|string|false|none|region name for this price. available regions: oceania, eu, cis, north_europe, north_africa, polynesia, north_america, central_africa, south_europe, antarctica, south_america, south_asia, caribbean, west_asia, central_america, west_africa, southern_africa, southeast_asia, east_africa, east_asia, micronesia, west_europe, latin_america, melanesia, russia, sub_saharan_africa, south_africa|
|» description|object|false|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|» long_description|object|false|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|» created_at|object|false|none|none|
|»» seconds|integer|false|none|time in unix timestamp|
|»» nanos|integer|false|none|time nano seconds|
|» updated_at|object|false|none|none|
|» images|[string]|false|none|array of product images. if images not set then field can be null|
|» url|string|false|none|url to product on project side|
|» metadata|object|false|none|object can contain any other information about product. object must contain only string values|
|» billing_type|string|false|none|Type of billing|

#### Enumerated Values

|Property|Value|
|---|---|
|billing_type|real|
|billing_type|virtual|

<aside class="success">
This operation does not require authentication
</aside>

## Create product with json request

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/products \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/products`

Create product

> Body parameter

```json
{
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {}
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[product.create_or_update](#schemaproduct.create_or_update)|true|Product create data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {},
  "billing_type": "real"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Created product|[product](#schemaproduct)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a product by it's id for authorised user

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/products/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/products/{id}`

Get a product by it's id for authorised user

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Product identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {},
  "billing_type": "real"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[product](#schemaproduct)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update product with json request

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/products/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/products/{id}`

Update product

> Body parameter

```json
{
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {}
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Product identifier|
|body|body|[product.create_or_update](#schemaproduct.create_or_update)|true|Product create data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {},
  "billing_type": "real"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Updated product|[product](#schemaproduct)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete product

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/products/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/products/{id}`

Delete product by it's id for authorised user

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Product identifier|

> Example responses

> 401 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get products list for any merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/products/merchant/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/products/merchant/{id}`

Get products list for any merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant identifier|
|name|query|string|false|product name|
|sku|query|string|false|product sku|
|limit|query|integer|false|maximum number of returning products. default value is 100|
|offset|query|integer|false|offset products per page|
|project_id|query|string|false|project identifier for which need get products list|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "project_id": "string",
    "object": "string",
    "type": "string",
    "sku": "string",
    "name": {},
    "default_currency": "string",
    "enabled": true,
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string"
      }
    ],
    "description": {},
    "long_description": {},
    "created_at": {
      "seconds": 0,
      "nanos": 0
    },
    "updated_at": {
      "seconds": 0,
      "nanos": 0
    },
    "images": [
      "string"
    ],
    "url": "string",
    "metadata": {},
    "billing_type": "real"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[product](#schemaproduct)]|false|none|none|
|» id|string|false|none|product identifier|
|» project_id|string|false|none|project identifier for which created product|
|» object|string|false|none|system constant conteined returning object type. for product object always must be - product|
|» type|string|false|none|product type|
|» sku|string|false|none|product sku (simple slug name)|
|» name|object|false|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|» default_currency|string|false|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|» enabled|boolean|false|none|true is product is enabled|
|» prices|[[price](#schemaprice)]|false|none|array of available prices for product|
|»» amount|number|false|none|price amount|
|»» currency|string|false|none|price currency. three-letter ISO 4217 currency code, in uppercase.|
|»» region|string|false|none|region name for this price. available regions: oceania, eu, cis, north_europe, north_africa, polynesia, north_america, central_africa, south_europe, antarctica, south_america, south_asia, caribbean, west_asia, central_america, west_africa, southern_africa, southeast_asia, east_africa, east_asia, micronesia, west_europe, latin_america, melanesia, russia, sub_saharan_africa, south_africa|
|» description|object|false|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|» long_description|object|false|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|» created_at|object|false|none|none|
|»» seconds|integer|false|none|time in unix timestamp|
|»» nanos|integer|false|none|time nano seconds|
|» updated_at|object|false|none|none|
|» images|[string]|false|none|array of product images. if images not set then field can be null|
|» url|string|false|none|url to product on project side|
|» metadata|object|false|none|object can contain any other information about product. object must contain only string values|
|» billing_type|string|false|none|Type of billing|

#### Enumerated Values

|Property|Value|
|---|---|
|billing_type|real|
|billing_type|virtual|

<aside class="success">
This operation does not require authentication
</aside>

# User Profile

## Get user profile

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/user/profile \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/user/profile`

Get user profile

> Example responses

> 200 Response

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string",
  "centrifugo_token": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[userProfile.response](#schemauserprofile.response)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create or update user profile

> Code samples

```shell
# You can also use wget
curl -X PATCH /p1payapi.tst.protocol.one/admin/api/v1/user/profile \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PATCH /admin/api/v1/user/profile`

Create or update user profile

> Body parameter

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[userProfile.request](#schemauserprofile.request)|true|User profile information|

> Example responses

> 200 Response

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string",
  "centrifugo_token": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[userProfile.response](#schemauserprofile.response)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Confirm user email

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/api/v1/user/confirm_email \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`PUT /api/v1/user/confirm_email`

Confirm user email by token

> Body parameter

```yaml
token: string

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[user.confirmEmail.request](#schemauser.confirmemail.request)|true|object contained confirmation token|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get user profile by proifile identifier

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/user/profile/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/user/profile/{id}`

Get user profile by profile identifier

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|profile identifier|

> Example responses

> 200 Response

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string",
  "centrifugo_token": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[userProfile.response](#schemauserprofile.response)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create page review

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/user/feedback \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/user/feedback`

Create page feedback

> Body parameter

```json
{
  "review": "string",
  "url": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[pageReview.request](#schemapagereview.request)|true|review body|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Dashboard

## Get main reports data for dashboard

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/dashboard/main?period=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}/dashboard/main`

Get main reports dashboard block data, ie. next reports: gross revenue, total transactions, VAT, ARPU

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|period|query|string|true|period name. now possible next values: current_month, previous_month, current_quarter, previous_quarter, current_year, previous_year|

> Example responses

> 200 Response

```json
{
  "gross_revenue": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "vat": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "total_transactions": {
    "count_current": 0,
    "count_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "arpu": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[dashboard.main_reports](#schemadashboard.main_reports)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get revenue dynamic report for dashboard

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/dashboard/revenue_dynamics?period=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}/dashboard/revenue_dynamics`

Get revenue dynamic report for dashboard

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|period|query|string|true|period name. now possible next values: current_month, previous_month, current_quarter, previous_quarter, current_year, previous_year|

> Example responses

> 200 Response

```json
{
  "currency": "string",
  "items": [
    {
      "label": "string",
      "amount": 0,
      "count": 0
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[dashboard.revenue_dynamics](#schemadashboard.revenue_dynamics)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get base reports data for dashboard

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/merchants/{id}/dashboard/base?period=string \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/merchants/{id}/dashboard/base`

Get base reports dashboard block data, ie. next reports: revenue by country, sales today, sources

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|merchant unique identifier|
|period|query|string|true|period name. now possible next values: current_day, previous_day, current_week, previous_week, current_month, previous_month, current_quarter, previous_quarter, current_year, previous_year|

> Example responses

> 200 Response

```json
{
  "revenue_by_country": {
    "top": [
      {
        "country": "string",
        "amount": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "currency": "string",
    "chart": {
      "label": "string",
      "amount": 0
    }
  },
  "sales_today": {
    "top": [
      {
        "name": "string",
        "count": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "sources": {
    "top": [
      {
        "name": "string",
        "count": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[dashboard.base](#schemadashboard.base)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# ReportFile

## Create report file

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/report_file \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/report_file`

Create report file

> Body parameter

```json
{
  "merchant_id": "string",
  "file_type": "string",
  "report_type": "string",
  "template": "string",
  "params": {}
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[report_file.CreateReportFileParams](#schemareport_file.createreportfileparams)|false|report file params|

> Example responses

> 200 Response

```json
{}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» status|number|false|none|none|
|» message|string|false|none|none|
|» file_id|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Download report file

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/report_file/download/{file}?file=string \
  -H 'Accept: application/pdf'

```

`GET /admin/api/v1/report_file/download/{file}`

Download report file

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|file|path|string|true|filename|
|file|query|string|true|identity of file and file type|

> Example responses

> 200 Response

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Balance

## Get balance for current user's merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/balance \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/balance`

Get balance for current user's merchant

> Example responses

> 200 Response

```json
[
  {
    "merchant_id": "string",
    "currency": "string",
    "debit": 0,
    "credit": "string",
    "rolling_reserve": 0,
    "total": 0,
    "created_at": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[merchant_balance](#schemamerchant_balance)]|false|none|none|
|» merchant_id|string|false|none|merchant identificator|
|» currency|string|false|none|currency|
|» debit|number|false|none|balance debit|
|» credit|string|false|none|balance credit|
|» rolling_reserve|number|false|none|current rooling reserve balance|
|» total|number|false|none|total amount|
|» created_at|string|false|none|last update date|

<aside class="success">
This operation does not require authentication
</aside>

## Get balance for merchant with id passed in url

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/balance/{merchant_id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/balance/{merchant_id}`

Get balance for merchant with id passed in url

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|merchant_id|path|string|true|merchant identifier|

> Example responses

> 200 Response

```json
[
  {
    "merchant_id": "string",
    "currency": "string",
    "debit": 0,
    "credit": "string",
    "rolling_reserve": 0,
    "total": 0,
    "created_at": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[merchant_balance](#schemamerchant_balance)]|false|none|none|
|» merchant_id|string|false|none|merchant identificator|
|» currency|string|false|none|currency|
|» debit|number|false|none|balance debit|
|» credit|string|false|none|balance credit|
|» rolling_reserve|number|false|none|current rooling reserve balance|
|» total|number|false|none|total amount|
|» created_at|string|false|none|last update date|

<aside class="success">
This operation does not require authentication
</aside>

# Payouts

## Get list of payout documents, matched to filters (if any)

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payout_documents \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payout_documents`

Get list of payout documents, matched to filters (if any)

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payout_document_id|query|string|false|payout document unique identifier|
|status|query|array[string]|false|filter by document's status|
|merchant_id|query|string|false|filter by document's merchant|
|signed|query|boolean|false|filter only signed documents, if true|
|limit|query|number|false|limit documents per page|
|offset|query|string|false|offset documents per page|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "source_id": [
        "string"
      ],
      "transaction": "string",
      "total_fees": 0,
      "balance": 0,
      "currency": "string",
      "status": "string",
      "description": "string",
      "destination": {
        "name": "string",
        "address": "string",
        "account_number": "string",
        "swift": "string",
        "details": "string",
        "correspondent_account": "string"
      },
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "arrival_date": "2019-11-18T09:55:34Z",
      "failure_code": "string",
      "failure_message": "string",
      "failure_transaction": "string",
      "merchant_id": "string",
      "period_from": "2019-11-18T09:55:34Z",
      "period_to": "2019-11-18T09:55:34Z",
      "operating_company_id": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[payout_documents_list](#schemapayout_documents_list)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create a payout document POST JSON request

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payout_documents \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payout_documents`

Create a payout document POST JSON request

> Body parameter

```json
{
  "merchant_id": "string",
  "description": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[payout_documents_create](#schemapayout_documents_create)|false|merchant identificator to create payout document for|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "source_id": [
      "string"
    ],
    "transaction": "string",
    "total_fees": 0,
    "balance": 0,
    "currency": "string",
    "status": "string",
    "description": "string",
    "destination": {
      "name": "string",
      "address": "string",
      "account_number": "string",
      "swift": "string",
      "details": "string",
      "correspondent_account": "string"
    },
    "created_at": "2019-11-18T09:55:34Z",
    "updated_at": "2019-11-18T09:55:34Z",
    "arrival_date": "2019-11-18T09:55:34Z",
    "failure_code": "string",
    "failure_message": "string",
    "failure_transaction": "string",
    "merchant_id": "string",
    "period_from": "2019-11-18T09:55:34Z",
    "period_to": "2019-11-18T09:55:34Z",
    "operating_company_id": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[billingPayoutDocument](#schemabillingpayoutdocument)]|false|none|none|
|» id|string|false|none|document id|
|» source_id|[string]|false|none|royalty reports id|
|» transaction|string|false|none|transaction id|
|» total_fees|number(double)|false|none|total_fees|
|» balance|number(double)|false|none|amount|
|» currency|string|false|none|currency|
|» status|string|false|none|status, one of skip pending in_progress paid canceled failed|
|» description|string|false|none|description|
|» destination|object|false|none|none|
|»» name|string|true|none|bank name|
|»» address|string|true|none|bank address|
|»» account_number|string|true|none|merchant accounting number in bank|
|»» swift|string|true|none|bank SWIFT code|
|»» details|string|false|none|any details abount merchant accounting bank|
|»» correspondent_account|string|false|none|bank correspondent account|
|» created_at|string(date-time)|false|none|creation date|
|» updated_at|string(date-time)|false|none|update date|
|» arrival_date|string(date-time)|false|none|arrival date|
|» failure_code|string|false|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|» failure_message|string|false|none|failure message|
|» failure_transaction|string|false|none|failure transaction|
|» merchant_id|string|false|none|merchant identificator|
|» period_from|string(date-time)|false|none|payout period start|
|» period_to|string(date-time)|false|none|payout period end|
|» operating_company_id|string|false|none|operating company id|

<aside class="success">
This operation does not require authentication
</aside>

## Get payout document by id

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payout_documents/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payout_documents/{id}`

Get payout document by id

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payout document unique identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "source_id": [
    "string"
  ],
  "transaction": "string",
  "total_fees": 0,
  "balance": 0,
  "currency": "string",
  "status": "string",
  "description": "string",
  "destination": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "arrival_date": "2019-11-18T09:55:34Z",
  "failure_code": "string",
  "failure_message": "string",
  "failure_transaction": "string",
  "merchant_id": "string",
  "period_from": "2019-11-18T09:55:34Z",
  "period_to": "2019-11-18T09:55:34Z",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[billingPayoutDocument](#schemabillingpayoutdocument)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Update a payout document POST JSON request

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payout_documents/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payout_documents/{id}`

Update a payout document POST JSON request

> Body parameter

```json
{
  "transaction": "string",
  "status": "string",
  "failure_code": "string",
  "failure_message": "string",
  "failure_transaction": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|payout document unique identifier|
|body|body|[payout_documents_update](#schemapayout_documents_update)|false|update params|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "source_id": [
    "string"
  ],
  "transaction": "string",
  "total_fees": 0,
  "balance": 0,
  "currency": "string",
  "status": "string",
  "description": "string",
  "destination": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "arrival_date": "2019-11-18T09:55:34Z",
  "failure_code": "string",
  "failure_message": "string",
  "failure_transaction": "string",
  "merchant_id": "string",
  "period_from": "2019-11-18T09:55:34Z",
  "period_to": "2019-11-18T09:55:34Z",
  "operating_company_id": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[billingPayoutDocument](#schemabillingpayoutdocument)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Royalty reports

## Get a list of royalty reports, matching to filters

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/royalty_reports`

Get a list of royalty reports, matching to filters

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|period_from|query|string|false|period start date|
|period_to|query|string|false|period end date|
|limit|query|integer|false|maximum number of returning reports per page. default value is 100|
|offset|query|integer|false|offset reports per page|
|merchant_id|query|string|false|merchant id|
|status[]|query|array[string]|false|matching status list|

> Example responses

> 200 Response

```json
[
  {
    "count": 0,
    "items": [
      {
        "id": "string",
        "merchant_id": "string",
        "created_at": "2019-11-18T09:55:34Z",
        "updated_at": "2019-11-18T09:55:34Z",
        "payout_date": "2019-11-18T09:55:34Z",
        "status": "string",
        "period_from": "2019-11-18T09:55:34Z",
        "period_to": "2019-11-18T09:55:34Z",
        "accept_expire_at": "2019-11-18T09:55:34Z",
        "accepted_at": "2019-11-18T09:55:34Z",
        "totals": {
          "transactions_count": 0,
          "fee_amount": 0,
          "vat_amount": 0,
          "payout_amount": 0,
          "rolling_reserve_amount": 0,
          "correction_amount": 0
        },
        "currency": "string",
        "summary": {
          "products_items": [
            {
              "product": "string",
              "region": "string",
              "total_transactions": 0,
              "sales_count": 0,
              "gross_sales_amount": 0,
              "returns_count": 0,
              "gross_returns_amount": 0,
              "gross_total_amount": 0,
              "total_fees": 0,
              "total_vat": 0,
              "payout_amount": 0
            }
          ],
          "products_total": {
            "product": "string",
            "region": "string",
            "total_transactions": 0,
            "sales_count": 0,
            "gross_sales_amount": 0,
            "returns_count": 0,
            "gross_returns_amount": 0,
            "gross_total_amount": 0,
            "total_fees": 0,
            "total_vat": 0,
            "payout_amount": 0
          },
          "corrections": [
            {
              "accounting_entry_id": "string",
              "amount": 0,
              "currency": "string",
              "reason": "string",
              "entry_date": "2019-11-18T09:55:34Z"
            }
          ],
          "rolling_reserves": [
            {
              "accounting_entry_id": "string",
              "amount": 0,
              "currency": "string",
              "reason": "string",
              "entry_date": "2019-11-18T09:55:34Z"
            }
          ]
        },
        "dispute_reason": "string",
        "dispute_started_at": "2019-11-18T09:55:34Z",
        "dispute_closed_at": "2019-11-18T09:55:34Z",
        "is_auto_accepted": true,
        "payout_document_id": "string",
        "operating_company_id": "string"
      }
    ]
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[grpcRoyaltyReportsPaginate](#schemagrpcroyaltyreportspaginate)]|false|none|none|
|» count|integer(int32)|false|none|total items count|
|» items|[[billingRoyaltyReport](#schemabillingroyaltyreport)]|false|none|royalty reports|
|»» id|string|false|none|report id|
|»» merchant_id|string|false|none|merchant id|
|»» created_at|string(date-time)|false|none|date of report creation|
|»» updated_at|string(date-time)|false|none|date of report last update|
|»» payout_date|string(date-time)|false|none|date when report was paid|
|»» status|string|false|none|status of report|
|»» period_from|string(date-time)|false|none|start of report time period|
|»» period_to|string(date-time)|false|none|end of report time period|
|»» accept_expire_at|string(date-time)|false|none|date when report will be auto-accepted, if merchant didn't accept or start a dispute yet|
|»» accepted_at|string(date-time)|false|none|date when report was accepted|
|»» totals|[billingRoyaltyReportTotals](#schemabillingroyaltyreporttotals)|false|none|none|
|»»» transactions_count|integer(int32)|false|none|total transactions count (including sales and returns)|
|»»» fee_amount|number(double)|false|none|fees amount|
|»»» vat_amount|number(double)|false|none|vat amount|
|»»» payout_amount|number(double)|false|none|payput amount|
|»»» rolling_reserve_amount|number(double)|false|none|applied rolling reserve total amount|
|»»» correction_amount|number(double)|false|none|applied corrections total amount|
|»» currency|string|false|none|currency of report|
|»» summary|[billingRoyaltyReportSummary](#schemabillingroyaltyreportsummary)|false|none|none|
|»»» products_items|[[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)]|false|none|summary details for each product/project and country|
|»»»» product|string|false|none|product or project name|
|»»»» region|string|false|none|country ISO Alpha2 code|
|»»»» total_transactions|integer(int32)|false|none|total number of transactions for current product/project in current country (including sales and returns)|
|»»»» sales_count|integer(int32)|false|none|number of sales for current product/project in current country|
|»»»» gross_sales_amount|number(double)|false|none|gross amount of sales for current product/project in current country|
|»»»» returns_count|integer(int32)|false|none|number of returns for current product/project in current country|
|»»»» gross_returns_amount|number(double)|false|none|gross amount of returns for current product/project in current country|
|»»»» gross_total_amount|number(double)|false|none|resulting gross amount for current product/project in current country (sales minus returns)|
|»»»» total_fees|number(double)|false|none|fees amount for current product/project in current country|
|»»»» total_vat|number(double)|false|none|vat amount for current product/project in current country|
|»»»» payout_amount|number(double)|false|none|payout amount for current product/project in current country|
|»»» products_total|[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)|false|none|none|
|»»» corrections|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of corrections applied (if any)|
|»»»» accounting_entry_id|string|false|none|linked accounting entry id|
|»»»» amount|number(double)|false|none|amount of correction|
|»»»» currency|string|false|none|currency|
|»»»» reason|string|false|none|reason if correction|
|»»»» entry_date|string(date-time)|false|none|date of correction|
|»»» rolling_reserves|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of rolling reserves applied (if any)|
|»» dispute_reason|string|false|none|reason of dispute (if it was started)|
|»» dispute_started_at|string(date-time)|false|none|date of dispute beginning (if it was started)|
|»» dispute_closed_at|string(date-time)|false|none|date of dispute resolve (if it was started)|
|»» is_auto_accepted|boolean(boolean)|false|none|flag of auto-acceptance|
|»» payout_document_id|string|false|none|cross-link to payout invoice, that includes this royalty report|
|»» operating_company_id|string|false|none|operating company id|

<aside class="success">
This operation does not require authentication
</aside>

## Get an royalty reports by it's id

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/royalty_reports/{id}`

Get an royalty reports by it's id

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Report identifier|

> Example responses

> 200 Response

```json
[
  {
    "id": "string",
    "merchant_id": "string",
    "created_at": "2019-11-18T09:55:34Z",
    "updated_at": "2019-11-18T09:55:34Z",
    "payout_date": "2019-11-18T09:55:34Z",
    "status": "string",
    "period_from": "2019-11-18T09:55:34Z",
    "period_to": "2019-11-18T09:55:34Z",
    "accept_expire_at": "2019-11-18T09:55:34Z",
    "accepted_at": "2019-11-18T09:55:34Z",
    "totals": {
      "transactions_count": 0,
      "fee_amount": 0,
      "vat_amount": 0,
      "payout_amount": 0,
      "rolling_reserve_amount": 0,
      "correction_amount": 0
    },
    "currency": "string",
    "summary": {
      "products_items": [
        {
          "product": "string",
          "region": "string",
          "total_transactions": 0,
          "sales_count": 0,
          "gross_sales_amount": 0,
          "returns_count": 0,
          "gross_returns_amount": 0,
          "gross_total_amount": 0,
          "total_fees": 0,
          "total_vat": 0,
          "payout_amount": 0
        }
      ],
      "products_total": {
        "product": "string",
        "region": "string",
        "total_transactions": 0,
        "sales_count": 0,
        "gross_sales_amount": 0,
        "returns_count": 0,
        "gross_returns_amount": 0,
        "gross_total_amount": 0,
        "total_fees": 0,
        "total_vat": 0,
        "payout_amount": 0
      },
      "corrections": [
        {
          "accounting_entry_id": "string",
          "amount": 0,
          "currency": "string",
          "reason": "string",
          "entry_date": "2019-11-18T09:55:34Z"
        }
      ],
      "rolling_reserves": [
        {
          "accounting_entry_id": "string",
          "amount": 0,
          "currency": "string",
          "reason": "string",
          "entry_date": "2019-11-18T09:55:34Z"
        }
      ]
    },
    "dispute_reason": "string",
    "dispute_started_at": "2019-11-18T09:55:34Z",
    "dispute_closed_at": "2019-11-18T09:55:34Z",
    "is_auto_accepted": true,
    "payout_document_id": "string",
    "operating_company_id": "string"
  }
]
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[billingRoyaltyReport](#schemabillingroyaltyreport)]|false|none|none|
|» id|string|false|none|report id|
|» merchant_id|string|false|none|merchant id|
|» created_at|string(date-time)|false|none|date of report creation|
|» updated_at|string(date-time)|false|none|date of report last update|
|» payout_date|string(date-time)|false|none|date when report was paid|
|» status|string|false|none|status of report|
|» period_from|string(date-time)|false|none|start of report time period|
|» period_to|string(date-time)|false|none|end of report time period|
|» accept_expire_at|string(date-time)|false|none|date when report will be auto-accepted, if merchant didn't accept or start a dispute yet|
|» accepted_at|string(date-time)|false|none|date when report was accepted|
|» totals|[billingRoyaltyReportTotals](#schemabillingroyaltyreporttotals)|false|none|none|
|»» transactions_count|integer(int32)|false|none|total transactions count (including sales and returns)|
|»» fee_amount|number(double)|false|none|fees amount|
|»» vat_amount|number(double)|false|none|vat amount|
|»» payout_amount|number(double)|false|none|payput amount|
|»» rolling_reserve_amount|number(double)|false|none|applied rolling reserve total amount|
|»» correction_amount|number(double)|false|none|applied corrections total amount|
|» currency|string|false|none|currency of report|
|» summary|[billingRoyaltyReportSummary](#schemabillingroyaltyreportsummary)|false|none|none|
|»» products_items|[[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)]|false|none|summary details for each product/project and country|
|»»» product|string|false|none|product or project name|
|»»» region|string|false|none|country ISO Alpha2 code|
|»»» total_transactions|integer(int32)|false|none|total number of transactions for current product/project in current country (including sales and returns)|
|»»» sales_count|integer(int32)|false|none|number of sales for current product/project in current country|
|»»» gross_sales_amount|number(double)|false|none|gross amount of sales for current product/project in current country|
|»»» returns_count|integer(int32)|false|none|number of returns for current product/project in current country|
|»»» gross_returns_amount|number(double)|false|none|gross amount of returns for current product/project in current country|
|»»» gross_total_amount|number(double)|false|none|resulting gross amount for current product/project in current country (sales minus returns)|
|»»» total_fees|number(double)|false|none|fees amount for current product/project in current country|
|»»» total_vat|number(double)|false|none|vat amount for current product/project in current country|
|»»» payout_amount|number(double)|false|none|payout amount for current product/project in current country|
|»» products_total|[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)|false|none|none|
|»» corrections|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of corrections applied (if any)|
|»»» accounting_entry_id|string|false|none|linked accounting entry id|
|»»» amount|number(double)|false|none|amount of correction|
|»»» currency|string|false|none|currency|
|»»» reason|string|false|none|reason if correction|
|»»» entry_date|string(date-time)|false|none|date of correction|
|»» rolling_reserves|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of rolling reserves applied (if any)|
|» dispute_reason|string|false|none|reason of dispute (if it was started)|
|» dispute_started_at|string(date-time)|false|none|date of dispute beginning (if it was started)|
|» dispute_closed_at|string(date-time)|false|none|date of dispute resolve (if it was started)|
|» is_auto_accepted|boolean(boolean)|false|none|flag of auto-acceptance|
|» payout_document_id|string|false|none|cross-link to payout invoice, that includes this royalty report|
|» operating_company_id|string|false|none|operating company id|

<aside class="success">
This operation does not require authentication
</aside>

## Get a list of transactions, included in royalty report

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports/{id}/transactions \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/royalty_reports/{id}/transactions`

Get a list of transactions, included in royalty report

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Report identifier|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "uuid": "string",
      "total_payment_amount": 0,
      "currency": "string",
      "project": {
        "id": "string",
        "merchant_id": "string",
        "url_success": "string",
        "url_fail": "string",
        "send_notify_email": true,
        "notify_emails": [
          "string"
        ],
        "secret_key": "string",
        "url_check_account": "string",
        "url_process_payment": "string",
        "callback_protocol": "string"
      },
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "transaction": "string",
      "transaction_date": {
        "seconds": 0,
        "nanos": 0
      },
      "payment_method": {
        "title": "string",
        "external_id": "string",
        "payment_system_id": "string",
        "saved": true,
        "card": {
          "first6": "string",
          "last4": "string",
          "masked": "string",
          "expiry_month": "string",
          "expiry_year": "string",
          "brand": "string",
          "fingerprint": "string",
          "secure3d": true
        },
        "wallet": {
          "brand": "string",
          "account": "string"
        },
        "crypto_currency": {
          "brand": "string",
          "address": "string"
        }
      },
      "country_code": "string",
      "merchant_id": "string",
      "locale": "string",
      "status": "string",
      "user": {
        "id": "string",
        "object": "string",
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
        "metadata": {},
        "notify_new_region": true,
        "notify_new_region_email": "string"
      },
      "billing_address": {
        "country": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string"
      },
      "type": "string",
      "is_vat_deduction": true,
      "gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "method_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_fixed_fee": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "net_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "method_refund_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "merchant_refund_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_reverse_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "items": [
        {
          "id": "string",
          "object": "string",
          "sku": "string",
          "name": "string",
          "description": "string",
          "amount": 0,
          "currency": "string",
          "images": [
            "string"
          ],
          "url": null,
          "metadata": {},
          "code": "string",
          "created_at": {
            "seconds": 0,
            "nanos": 0
          },
          "updated_at": {
            "seconds": 0,
            "nanos": 0
          },
          "platform_id": "string"
        }
      ],
      "issuer": {
        "url": "string",
        "embedded": true,
        "reference": "string",
        "reference_type": "string",
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string",
        "referrer_host": "string"
      },
      "merchant_payout_currency": "string",
      "parent": {
        "id": "string",
        "uuid": "string"
      },
      "refund": {
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "code": "string",
        "receipt_number": "string",
        "receipt_url": "string"
      },
      "cancellation": {
        "reason": "string",
        "code": "string"
      },
      "operating_company_id": "string",
      "refund_allowed": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.list.public](#schemaorder.list.public)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Accept royalty report by merchant

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports/{id}/accept \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/royalty_reports/{id}/accept`

Accept royalty report by merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Report identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Start royalty report dispute

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports/{id}/decline \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/royalty_reports/{id}/decline`

Start royalty report dispute

> Body parameter

```yaml
dispute_reason: string

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Report identifier|
|body|body|object|false|dispute reason|
|» dispute_reason|body|string|false|none|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Change royalty report

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/royalty_reports/{id}/change \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/royalty_reports/{id}/change`

Change royalty report

> Body parameter

```yaml
status: string
reason: string
correction:
  amount: 0
  reason: string

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Report identifier|
|body|body|[grpcChangeRoyaltyReport](#schemagrpcchangeroyaltyreport)|false|changes|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Payment links

## Get a list of payment links for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks`

Get a list of payment links for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|limit|query|integer|false|maximum number of returning orders. default value is 100|
|offset|query|integer|false|offset from which you want to return the list of orders. default value is 0|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "object": "string",
      "products": [
        "string"
      ],
      "expires_at": "2019-11-18T09:55:34Z",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "merchant_id": "string",
      "project_id": "string",
      "name": "string",
      "is_expired": true,
      "visits": 0,
      "no_expiry_date": true,
      "products_type": "string",
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "conversion": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[grpcPaylinksPaginate](#schemagrpcpaylinkspaginate)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Create payment link with json request

> Code samples

```shell
# You can also use wget
curl -X PUT /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`PUT /admin/api/v1/paylinks/{id}`

Create payment link use POST JSON request

> Body parameter

```json
{
  "id": "string",
  "products": [
    "string"
  ],
  "expires_at": 0,
  "project_id": "string",
  "name": "string",
  "no_expiry_date": true,
  "products_type": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|body|body|[createPaylinkRequest](#schemacreatepaylinkrequest)|true|Payment link create data|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "object": "string",
  "products": [
    "string"
  ],
  "expires_at": "2019-11-18T09:55:34Z",
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "merchant_id": "string",
  "project_id": "string",
  "name": "string",
  "is_expired": true,
  "visits": 0,
  "no_expiry_date": true,
  "products_type": "string",
  "total_transactions": 0,
  "sales_count": 0,
  "returns_count": 0,
  "conversion": 0,
  "gross_sales_amount": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "transactions_currency": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Object which contain created payment link|[paylinkPaylink](#schemapaylinkpaylink)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a payment link by id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}`

Get a payment link by id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "object": "string",
  "products": [
    "string"
  ],
  "expires_at": "2019-11-18T09:55:34Z",
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "merchant_id": "string",
  "project_id": "string",
  "name": "string",
  "is_expired": true,
  "visits": 0,
  "no_expiry_date": true,
  "products_type": "string",
  "total_transactions": 0,
  "sales_count": 0,
  "returns_count": 0,
  "conversion": 0,
  "gross_sales_amount": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "transactions_currency": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkPaylink](#schemapaylinkpaylink)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Delete a payment link by id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id} \
  -H 'Accept: application/json'

```

`DELETE /admin/api/v1/paylinks/{id}`

Delete a payment link by id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Object with error message|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a payment link url by id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/url \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/url`

Get a payment link url by id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|

> Example responses

> 200 Response

```json
{
  "url": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

### Response Schema

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» url|string|false|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Get summary stat for a payment link by id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/dashboard/summary \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/dashboard/summary`

Get summary stat for a payment link by id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|period_from|query|number|false|period start date in unix timestamp format|
|period_to|query|number|false|period end date in unix timestamp format|

> Example responses

> 200 Response

```json
{
  "paylink_id": "string",
  "visits": 0,
  "total_transactions": 0,
  "sales_count": 0,
  "returns_count": 0,
  "gross_sales_amount": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "transactions_currency": "string",
  "conversion": 0,
  "country_code": "string",
  "date": "string",
  "referrer_host": "string",
  "utm": {
    "utm_source": "string",
    "utm_medium": "string",
    "utm_campaign": "string"
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkStatCommon](#schemapaylinkstatcommon)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a grouping stat by country for a payment link by its id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/dashboard/country \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/dashboard/country`

Get a grouping stat by country for a payment link by its id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|period_from|query|number|false|period start date in unix timestamp format|
|period_to|query|number|false|period end date in unix timestamp format|

> Example responses

> 200 Response

```json
{
  "top": [
    {
      "paylink_id": "string",
      "visits": 0,
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string",
      "conversion": 0,
      "country_code": "string",
      "date": "string",
      "referrer_host": "string",
      "utm": {
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string"
      }
    }
  ],
  "total": {
    "paylink_id": "string",
    "visits": 0,
    "total_transactions": 0,
    "sales_count": 0,
    "returns_count": 0,
    "gross_sales_amount": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "transactions_currency": "string",
    "conversion": 0,
    "country_code": "string",
    "date": "string",
    "referrer_host": "string",
    "utm": {
      "utm_source": "string",
      "utm_medium": "string",
      "utm_campaign": "string"
    }
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkGroupStatCommon](#schemapaylinkgroupstatcommon)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a grouping stat by referrer for a payment link by its id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/dashboard/referrer \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/dashboard/referrer`

Get a grouping stat by referrer for a payment link by its id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|period_from|query|number|false|period start date in unix timestamp format|
|period_to|query|number|false|period end date in unix timestamp format|

> Example responses

> 200 Response

```json
{
  "top": [
    {
      "paylink_id": "string",
      "visits": 0,
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string",
      "conversion": 0,
      "country_code": "string",
      "date": "string",
      "referrer_host": "string",
      "utm": {
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string"
      }
    }
  ],
  "total": {
    "paylink_id": "string",
    "visits": 0,
    "total_transactions": 0,
    "sales_count": 0,
    "returns_count": 0,
    "gross_sales_amount": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "transactions_currency": "string",
    "conversion": 0,
    "country_code": "string",
    "date": "string",
    "referrer_host": "string",
    "utm": {
      "utm_source": "string",
      "utm_medium": "string",
      "utm_campaign": "string"
    }
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkGroupStatCommon](#schemapaylinkgroupstatcommon)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a grouping stat by date for a payment link by its id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/dashboard/date \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/dashboard/date`

Get a grouping stat by date for a payment link by its id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|period_from|query|number|false|period start date in unix timestamp format|
|period_to|query|number|false|period end date in unix timestamp format|

> Example responses

> 200 Response

```json
{
  "top": [
    {
      "paylink_id": "string",
      "visits": 0,
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string",
      "conversion": 0,
      "country_code": "string",
      "date": "string",
      "referrer_host": "string",
      "utm": {
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string"
      }
    }
  ],
  "total": {
    "paylink_id": "string",
    "visits": 0,
    "total_transactions": 0,
    "sales_count": 0,
    "returns_count": 0,
    "gross_sales_amount": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "transactions_currency": "string",
    "conversion": 0,
    "country_code": "string",
    "date": "string",
    "referrer_host": "string",
    "utm": {
      "utm_source": "string",
      "utm_medium": "string",
      "utm_campaign": "string"
    }
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkGroupStatCommon](#schemapaylinkgroupstatcommon)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a grouping stat by utm for a payment link by its id for current authenticated merchant

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/paylinks/{id}/dashboard/utm \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/paylinks/{id}/dashboard/utm`

Get a grouping stat by utm for a payment link by its id for current authenticated merchant

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Payment link identifier|
|period_from|query|number|false|period start date in unix timestamp format|
|period_to|query|number|false|period end date in unix timestamp format|

> Example responses

> 200 Response

```json
{
  "top": [
    {
      "paylink_id": "string",
      "visits": 0,
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string",
      "conversion": 0,
      "country_code": "string",
      "date": "string",
      "referrer_host": "string",
      "utm": {
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string"
      }
    }
  ],
  "total": {
    "paylink_id": "string",
    "visits": 0,
    "total_transactions": 0,
    "sales_count": 0,
    "returns_count": 0,
    "gross_sales_amount": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "transactions_currency": "string",
    "conversion": 0,
    "country_code": "string",
    "date": "string",
    "referrer_host": "string",
    "utm": {
      "utm_source": "string",
      "utm_medium": "string",
      "utm_campaign": "string"
    }
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[paylinkGroupStatCommon](#schemapaylinkgroupstatcommon)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# VAT Reports

## Get a VAT reports dashboard

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/vat_reports \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/vat_reports`

Get a VAT reports dashboard

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "country": "string",
      "vat_rate": 0,
      "currency": "string",
      "transactions_count": 0,
      "gross_revenue": 0,
      "vat_amount": 0,
      "fees_amount": 0,
      "deduction_amount": 0,
      "correction_amount": 0,
      "status": "string",
      "country_annual_turnover": 0,
      "world_annual_turnover": 0,
      "amounts_approximate": true,
      "date_from": "2019-11-18T09:55:34Z",
      "date_to": "2019-11-18T09:55:34Z",
      "pay_until_date": "2019-11-18T09:55:34Z",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "paid_at": "2019-11-18T09:55:34Z",
      "operating_company_id": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[grpcVatReportsPaginate](#schemagrpcvatreportspaginate)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a VAT reports list by country

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/vat_reports/country/{country} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/vat_reports/country/{country}`

Get a VAT reports list by country

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|country|path|string|true|country code ISO A2|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "country": "string",
      "vat_rate": 0,
      "currency": "string",
      "transactions_count": 0,
      "gross_revenue": 0,
      "vat_amount": 0,
      "fees_amount": 0,
      "deduction_amount": 0,
      "correction_amount": 0,
      "status": "string",
      "country_annual_turnover": 0,
      "world_annual_turnover": 0,
      "amounts_approximate": true,
      "date_from": "2019-11-18T09:55:34Z",
      "date_to": "2019-11-18T09:55:34Z",
      "pay_until_date": "2019-11-18T09:55:34Z",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "paid_at": "2019-11-18T09:55:34Z",
      "operating_company_id": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[grpcVatReportsPaginate](#schemagrpcvatreportspaginate)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get a VAT report transaction

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/vat_reports/details/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/vat_reports/details/{id}`

Get a VAT report transaction

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|VAT report id|

> Example responses

> 200 Response

```json
{
  "count": 0,
  "items": [
    {
      "uuid": "string",
      "total_payment_amount": 0,
      "currency": "string",
      "project": {
        "id": "string",
        "merchant_id": "string",
        "url_success": "string",
        "url_fail": "string",
        "send_notify_email": true,
        "notify_emails": [
          "string"
        ],
        "secret_key": "string",
        "url_check_account": "string",
        "url_process_payment": "string",
        "callback_protocol": "string"
      },
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "transaction": "string",
      "transaction_date": {
        "seconds": 0,
        "nanos": 0
      },
      "payment_method": {
        "title": "string",
        "external_id": "string",
        "payment_system_id": "string",
        "saved": true,
        "card": {
          "first6": "string",
          "last4": "string",
          "masked": "string",
          "expiry_month": "string",
          "expiry_year": "string",
          "brand": "string",
          "fingerprint": "string",
          "secure3d": true
        },
        "wallet": {
          "brand": "string",
          "account": "string"
        },
        "crypto_currency": {
          "brand": "string",
          "address": "string"
        }
      },
      "country_code": "string",
      "merchant_id": "string",
      "locale": "string",
      "status": "string",
      "user": {
        "id": "string",
        "object": "string",
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
        "metadata": {},
        "notify_new_region": true,
        "notify_new_region_email": "string"
      },
      "billing_address": {
        "country": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string"
      },
      "type": "string",
      "is_vat_deduction": true,
      "gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "method_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_fixed_fee": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "net_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "method_refund_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "merchant_refund_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_reverse_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "items": [
        {
          "id": "string",
          "object": "string",
          "sku": "string",
          "name": "string",
          "description": "string",
          "amount": 0,
          "currency": "string",
          "images": [
            "string"
          ],
          "url": null,
          "metadata": {},
          "code": "string",
          "created_at": {
            "seconds": 0,
            "nanos": 0
          },
          "updated_at": {
            "seconds": 0,
            "nanos": 0
          },
          "platform_id": "string"
        }
      ],
      "issuer": {
        "url": "string",
        "embedded": true,
        "reference": "string",
        "reference_type": "string",
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string",
        "referrer_host": "string"
      },
      "merchant_payout_currency": "string",
      "parent": {
        "id": "string",
        "uuid": "string"
      },
      "refund": {
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "code": "string",
        "receipt_number": "string",
        "receipt_url": "string"
      },
      "cancellation": {
        "reason": "string",
        "code": "string"
      },
      "operating_company_id": "string",
      "refund_allowed": "string"
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[order.list.public](#schemaorder.list.public)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Change a VAT report status

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/vat_reports/status/{id} \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/vat_reports/status/{id}`

Change a VAT report status

> Body parameter

```yaml
status: string

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|VAT report id|
|body|body|object|false|status|
|» status|body|string|false|none|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Saved Card

## Remove customer saved card

> Code samples

```shell
# You can also use wget
curl -X DELETE /p1payapi.tst.protocol.one/api/v1/saved_card \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`DELETE /api/v1/saved_card`

Remove customer saved card

> Body parameter

```json
{
  "id": "string",
  "cookie": "string"
}
```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[saved_card.remove.request](#schemasaved_card.remove.request)|true|Remove saved card data|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Operating company

## Get operating companies list

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/operating_company \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/operating_company`

Get operating companies list

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "country": "string",
      "registration_number": "string",
      "registration_date": "string",
      "vat_number": "string",
      "address": "string",
      "vat_address": "string",
      "signatory_name": "string",
      "signatory_position": "string",
      "banking_details": "string",
      "payment_countries": [
        "string"
      ],
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      }
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[operating_company_list](#schemaoperating_company_list)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Add new operating company

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/operating_company/{id} \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/operating_company/{id}`

Add new operating company

> Body parameter

```yaml
id: string
name: string
country: string
registration_number: string
registration_date: string
vat_number: string
address: string
vat_address: string
signatory_name: string
signatory_position: string
banking_details: string
payment_countries:
  - string
created_at:
  seconds: 0
  nanos: 0
updated_at:
  seconds: 0
  nanos: 0

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|operating company id|
|body|body|[operating_company](#schemaoperating_company)|false|updating operating company params|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Get operating company

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/operating_company/{id} \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/operating_company/{id}`

Get operating company

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|operating company id|

> Example responses

> 200 Response

```json
{
  "id": "string",
  "name": "string",
  "country": "string",
  "registration_number": "string",
  "registration_date": "string",
  "vat_number": "string",
  "address": "string",
  "vat_address": "string",
  "signatory_name": "string",
  "signatory_position": "string",
  "banking_details": "string",
  "payment_countries": [
    "string"
  ],
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[operating_company](#schemaoperating_company)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Limits

## Get list of payment minimum limits system

> Code samples

```shell
# You can also use wget
curl -X GET /p1payapi.tst.protocol.one/admin/api/v1/payment_min_limit_system \
  -H 'Accept: application/json'

```

`GET /admin/api/v1/payment_min_limit_system`

Get list of payment minimum limits system

> Example responses

> 200 Response

```json
{
  "items": [
    {
      "currency": "string",
      "amount": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      }
    }
  ]
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[payment_min_limit_system_list](#schemapayment_min_limit_system_list)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Object with error message|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

## Set payment minimum limits system for currency

> Code samples

```shell
# You can also use wget
curl -X POST /p1payapi.tst.protocol.one/admin/api/v1/payment_min_limit_system \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: application/json'

```

`POST /admin/api/v1/payment_min_limit_system`

Set payment minimum limits system for currency

> Body parameter

```yaml
currency: string
amount: string
created_at:
  seconds: 0
  nanos: 0
updated_at:
  seconds: 0
  nanos: 0

```

### Parameters

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[payment_min_limit_system](#schemapayment_min_limit_system)|false|minimum limits system for currency|

> Example responses

> 400 Response

```json
{
  "message": "string",
  "code": "string"
}
```

### Responses

|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|OK|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Invalid request data|[model.Error](#schemamodel.error)|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|[model.Error](#schemamodel.error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Access denied|[model.Error](#schemamodel.error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Object not found|[model.Error](#schemamodel.error)|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Some unknown error on server side|[model.Error](#schemamodel.error)|

<aside class="success">
This operation does not require authentication
</aside>

# Schemas

## model.Country

<a id="schemamodel.country"></a>

```json
{
  "code_a2": "string",
  "code_a3": "string",
  "code_int": 0,
  "created_at": "string",
  "is_active": true,
  "name": {
    "en": "string",
    "ru": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|code_a2|string|false|none|2 chars ISO 3166-1 country code|
|code_a3|string|false|none|3 chars ISO 3166-1 country code|
|code_int|integer|false|none|numeric ISO 3166-1 country code|
|created_at|string|false|none|date of create country in system|
|is_active|boolean|false|none|is country active|
|name|[model.Name](#schemamodel.name)|false|none|list of country names|

## model.Error

<a id="schemamodel.error"></a>

```json
{
  "message": "string",
  "code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|message|string|false|none|text error description|
|code|string|false|none|error code|

## model.JsonOrderCreateResponse.user.address

<a id="schemamodel.jsonordercreateresponse.user.address"></a>

```json
{
  "country": "string",
  "city": "string",
  "zip": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|country|string|false|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city|string|false|none|user's city|
|zip|string|false|none|postal code|

## model.JsonOrderCreateResponse.item

<a id="schemamodel.jsonordercreateresponse.item"></a>

```json
{
  "id": "string",
  "object": "string",
  "sku": "string",
  "name": "string",
  "description": "string",
  "amount": 0,
  "currency": "string",
  "images": [
    "string"
  ],
  "url": null,
  "metadata": {},
  "code": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "platform_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|item identifier|
|object|string|false|none|item type|
|sku|string|false|none|item sku identifier|
|name|string|false|none|item name|
|description|string|false|none|item description|
|amount|number|false|none|item price|
|currency|string|false|none|item price currency. three-letter ISO 4217 currency code, in uppercase.|
|images|[string]|false|none|list of urls to item images|
|url|any|false|none|url to item on project site|
|metadata|object|false|none|object contain item metadata|
|code|string|false|none|item code|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when payment created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when payment updated at last time|
|platform_id|string|false|none|item platform identifier|

## model.JsonOrderCreateResponse

<a id="schemamodel.jsonordercreateresponse"></a>

```json
{
  "id": "string",
  "payment_form_url": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|order unique identifier|
|payment_form_url|string|false|none|url to payment form|

## model.PaymentFormDataResponse

<a id="schemamodel.paymentformdataresponse"></a>

```json
{
  "account": "string",
  "has_vat": true,
  "vat": 0,
  "amount": 0,
  "total_amount": 0,
  "currency": "string",
  "user_address_data_required": true,
  "id": "string",
  "payment_methods": [
    {
      "account_regexp": "string",
      "group_alias": "string",
      "icon": "string",
      "id": "string",
      "name": "string",
      "type": "string"
    }
  ],
  "project": {
    "name": "string",
    "url_fail": "string",
    "url_success": "string"
  },
  "token": "string",
  "user_ip_data": {
    "country": "string",
    "city": "string",
    "zip": "string"
  },
  "items": [
    {
      "id": "string",
      "object": "string",
      "sku": "string",
      "name": "string",
      "description": "string",
      "amount": 0,
      "currency": "string",
      "images": [
        "string"
      ],
      "url": null,
      "metadata": {},
      "code": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "platform_id": "string"
    }
  ],
  "cookie": "string",
  "email": "string",
  "description": "string",
  "country_payments_allowed": true,
  "country_change_allowed": true,
  "platforms": [
    "string"
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|account|string|false|none|user account, may be null|
|has_vat|boolean|false|none|flag to show VAT commission amount in payment form|
|vat|number|false|none|VAT amount|
|amount|number|false|none|order amount without VAT|
|total_amount|number|false|none|total order amount with VAT|
|currency|string|false|none|order currency|
|user_address_data_required|boolean|false|none|flag to get information about user real geo position|
|id|string|false|none|order unique identifier|
|payment_methods|[[model.PaymentMethodJsonOrderResponse](#schemamodel.paymentmethodjsonorderresponse)]|false|none|contain data about payment methods|
|project|[model.ProjectJsonOrderResponse](#schemamodel.projectjsonorderresponse)|false|none|contain data about project|
|token|string|false|none|access token to websocket private chanel|
|user_ip_data|[model.JsonOrderCreateResponse.user.address](#schemamodel.jsonordercreateresponse.user.address)|false|none|object contain information about user address get by user ip address|
|items|[[model.JsonOrderCreateResponse.item](#schemamodel.jsonordercreateresponse.item)]|false|none|list of buyed items in order|
|cookie|string|false|none|value to set to cookie for user identification. if user was identified by other data than value can be empty.|
|email|string|false|none|user email|
|description|string|false|none|order description|
|country_payments_allowed|boolean|false|none|true is payments from user country is allowed|
|country_change_allowed|boolean|false|none|true if user can change self country if payments from his country disallow|
|platforms|[string]|false|none|list of supported platforms if this payment with type key (for other types this field can be empty)|

## model.Name

<a id="schemamodel.name"></a>

```json
{
  "en": "string",
  "ru": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|en|string|false|none|english name|
|ru|string|false|none|russian name|

## model.OrderCreatePaymentRequest

<a id="schemamodel.ordercreatepaymentrequest"></a>

```json
{
  "address": "string",
  "card_holder": "string",
  "cvv": 0,
  "ewallet": "string",
  "month": 0,
  "order_id": "string",
  "pan": "string",
  "payment_method_id": "string",
  "year": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|address|string|false|none|user wallet address in crypto payment system. required only for crypto payment|
|card_holder|string|false|none|bank card card holder name. required only for bank card payment|
|cvv|integer|false|none|bank card cvv code. required only for bank card payment|
|ewallet|string|false|none|user account in ewallet payment system. required only for ewallet payment|
|month|integer|false|none|month of expire date of user bank card. required only for bank card payment|
|order_id|string|false|none|unique identifier of order on PSP (P1) side|
|pan|string|false|none|user bank card number. required only for bank card payment|
|payment_method_id|string|false|none|unique identifier of payment method by PSP (P1) classifier|
|year|integer|false|none|year of expire date of user bank card. required only for bank card payment|

## order.project

<a id="schemaorder.project"></a>

```json
{
  "id": "string",
  "merchant_id": "string",
  "url_success": "string",
  "url_fail": "string",
  "send_notify_email": true,
  "notify_emails": [
    "string"
  ],
  "secret_key": "string",
  "url_check_account": "string",
  "url_process_payment": "string",
  "callback_protocol": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|project unique identifier|
|merchant_id|string|false|none|project merchant unique identifier|
|url_success|string|false|none|url for redirect user after successfully completed payment|
|url_fail|string|false|none|url for redirect user after failed payment|
|send_notify_email|boolean|false|none|flag to send notification emails by "notify_emails" list after successfully completed payment|
|notify_emails|[string]|false|none|emails list to send notification email after successfully completed payment|
|secret_key|string|false|none|project secret key|
|url_check_account|string|false|none|callback url to check payment requisites|
|url_process_payment|string|false|none|callback url to send payment complete request|
|callback_protocol|string|false|none|type of callback notification protocol. now available next values: empty - notification request not send, order just mark as successfully complete; default - notification request send by PaySuper notification protocol;|

## order.payment_method.card

<a id="schemaorder.payment_method.card"></a>

```json
{
  "first6": "string",
  "last4": "string",
  "masked": "string",
  "expiry_month": "string",
  "expiry_year": "string",
  "brand": "string",
  "fingerprint": "string",
  "secure3d": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|first6|string|false|none|string representing the first 6 digits of the card. Available only for a card method|
|last4|string|false|none|string representing the last 4 digits of the card. Available only for a card method|
|masked|string|false|none|masked pan of bank card|
|expiry_month|string|false|none|month of expiration bank card|
|expiry_year|string|false|none|year of expiration bank card|
|brand|string|false|none|bank card brand|
|fingerprint|string|false|none|string representing the internal fingerprint for given card|
|secure3d|boolean|false|none|true is 3DS secure was used during payment|

## order.payment_method.wallet

<a id="schemaorder.payment_method.wallet"></a>

```json
{
  "brand": "string",
  "account": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|brand|string|false|none|name of payment system|
|account|string|false|none|payer wallet number in payment system|

## order.payment_method.crypto_currency

<a id="schemaorder.payment_method.crypto_currency"></a>

```json
{
  "brand": "string",
  "address": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|brand|string|false|none|name of crypto currency system|
|address|string|false|none|payer address in crypto cyrrency system|

## order.payment_method

<a id="schemaorder.payment_method"></a>

```json
{
  "title": "string",
  "external_id": "string",
  "payment_system_id": "string",
  "saved": true,
  "card": {
    "first6": "string",
    "last4": "string",
    "masked": "string",
    "expiry_month": "string",
    "expiry_year": "string",
    "brand": "string",
    "fingerprint": "string",
    "secure3d": true
  },
  "wallet": {
    "brand": "string",
    "account": "string"
  },
  "crypto_currency": {
    "brand": "string",
    "address": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|title|string|false|none|payment method name|
|external_id|string|false|none|payment method identifier in payment system|
|payment_system_id|string|false|none|payment system identifier|
|saved|boolean|false|none|true is payment method was saved by user for future usage|
|card|[order.payment_method.card](#schemaorder.payment_method.card)|false|none|object contain main information about requisites if payment was by bank card. may be null|
|wallet|[order.payment_method.wallet](#schemaorder.payment_method.wallet)|false|none|object contain main information about requisites if payment was by e-wallets. may be null|
|crypto_currency|[order.payment_method.crypto_currency](#schemaorder.payment_method.crypto_currency)|false|none|object contain main information about requisites if payment was by crypto currency. may be null|

## order.user.address

<a id="schemaorder.user.address"></a>

```json
{
  "country": "string",
  "city": "string",
  "postal_code": "string",
  "state": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|country|string|false|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city|string|false|none|user's city|
|postal_code|string|false|none|postal code|
|state|string|false|none|state name|

## order.user

<a id="schemaorder.user"></a>

```json
{
  "id": "string",
  "object": "string",
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
  "metadata": {},
  "notify_new_region": true,
  "notify_new_region_email": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|customer identity identifier|
|object|string|false|none|constant with object name|
|external_id|string|false|none|user identifier in project|
|name|string|false|none|user name|
|email|string|false|none|user email|
|email_verified|boolean|false|none|true is email was verified|
|phone|string|false|none|user phone|
|phone_verified|boolean|false|none|true is phone was verified|
|ip|string|false|none|user ip address|
|locale|string|false|none|user's locale. two-letter code in lowercase|
|address|[order.user.address](#schemaorder.user.address)|false|none|none|
|metadata|object|false|none|set of key-value pairs that attached to an object on create order state|
|notify_new_region|boolean|false|none|true is user wanting to receiving notification when paysuper will work in user's region|
|notify_new_region_email|string|false|none|user's email to send notification email when paysuper starting work in user's region|

## order.money

<a id="schemaorder.money"></a>

```json
{
  "amount": 0,
  "currency": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|false|none|entry amount|
|currency|string|false|none|entry currency. three-letter ISO 4217 currency code, in uppercase.|

## order.public

<a id="schemaorder.public"></a>

```json
{
  "uuid": "string",
  "total_payment_amount": 0,
  "currency": "string",
  "project": {
    "id": "string",
    "merchant_id": "string",
    "url_success": "string",
    "url_fail": "string",
    "send_notify_email": true,
    "notify_emails": [
      "string"
    ],
    "secret_key": "string",
    "url_check_account": "string",
    "url_process_payment": "string",
    "callback_protocol": "string"
  },
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "transaction": "string",
  "transaction_date": {
    "seconds": 0,
    "nanos": 0
  },
  "payment_method": {
    "title": "string",
    "external_id": "string",
    "payment_system_id": "string",
    "saved": true,
    "card": {
      "first6": "string",
      "last4": "string",
      "masked": "string",
      "expiry_month": "string",
      "expiry_year": "string",
      "brand": "string",
      "fingerprint": "string",
      "secure3d": true
    },
    "wallet": {
      "brand": "string",
      "account": "string"
    },
    "crypto_currency": {
      "brand": "string",
      "address": "string"
    }
  },
  "country_code": "string",
  "merchant_id": "string",
  "locale": "string",
  "status": "string",
  "user": {
    "id": "string",
    "object": "string",
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
    "metadata": {},
    "notify_new_region": true,
    "notify_new_region_email": "string"
  },
  "billing_address": {
    "country": "string",
    "city": "string",
    "postal_code": "string",
    "state": "string"
  },
  "type": "string",
  "is_vat_deduction": true,
  "gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "tax_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_total": {
    "amount": 0,
    "currency": "string"
  },
  "method_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "method_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_fixed_fee": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "net_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_gross_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "method_refund_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "merchant_refund_fixed_fee_tariff": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "paysuper_refund_tax_fee_currency_exchange_fee": {
    "amount": 0,
    "currency": "string"
  },
  "refund_reverse_revenue": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total": {
    "amount": 0,
    "currency": "string"
  },
  "refund_fees_total_local": {
    "amount": 0,
    "currency": "string"
  },
  "items": [
    {
      "id": "string",
      "object": "string",
      "sku": "string",
      "name": "string",
      "description": "string",
      "amount": 0,
      "currency": "string",
      "images": [
        "string"
      ],
      "url": null,
      "metadata": {},
      "code": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "platform_id": "string"
    }
  ],
  "issuer": {
    "url": "string",
    "embedded": true,
    "reference": "string",
    "reference_type": "string",
    "utm_source": "string",
    "utm_medium": "string",
    "utm_campaign": "string",
    "referrer_host": "string"
  },
  "merchant_payout_currency": "string",
  "parent": {
    "id": "string",
    "uuid": "string"
  },
  "refund": {
    "amount": 0,
    "currency": "string",
    "reason": "string",
    "code": "string",
    "receipt_number": "string",
    "receipt_url": "string"
  },
  "cancellation": {
    "reason": "string",
    "code": "string"
  },
  "operating_company_id": "string",
  "refund_allowed": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|uuid|string|false|none|order unique identifier|
|total_payment_amount|number|false|none|payment amount|
|currency|string|false|none|payment currency. three-letter ISO 4217 currency code, in uppercase.|
|project|[order.project](#schemaorder.project)|false|none|object contain main iformation about project|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when payment created|
|transaction|string|false|none|unique identifier for the transaction in payment system|
|transaction_date|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when payment processed in payment system|
|payment_method|[order.payment_method](#schemaorder.payment_method)|false|none|object contain information about payment method|
|country_code|string|false|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|merchant_id|string|false|none|project merchant unique identifier|
|locale|string|false|none|user's locale. two-letter code in lowercase|
|status|string|false|none|string representing the order current status. possible statuses: created - the order created but not processed yet; canceled - the order was canceled and money refunded to user; rejected - the order was rejected by payment system with any reasons; processed - the order was processed in payment system;|
|user|[order.user](#schemaorder.user)|false|none|object contain information about user|
|billing_address|[order.user.address](#schemaorder.user.address)|false|none|object contain information about user address by payment form|
|type|string|false|none|constant with object type|
|is_vat_deduction|boolean|false|none|true is vat deduction|
|gross_revenue|[order.money](#schemaorder.money)|false|none|object contain information about gross revenue|
|tax_fee|[order.money](#schemaorder.money)|false|none|object contain information about tax fee|
|tax_fee_currency_exchange_fee|[order.money](#schemaorder.money)|false|none|object contain information about tax fee currency exchange fee|
|tax_fee_total|[order.money](#schemaorder.money)|false|none|object contain information about tax fee total|
|method_fee_total|[order.money](#schemaorder.money)|false|none|object contain information about method fee total|
|method_fee_tariff|[order.money](#schemaorder.money)|false|none|object contain information about method fee tariff|
|method_fixed_fee_tariff|[order.money](#schemaorder.money)|false|none|object contain information about method fixed fee tariff|
|paysuper_fixed_fee|[order.money](#schemaorder.money)|false|none|object contain information about paysuper fixed fee|
|fees_total|[order.money](#schemaorder.money)|false|none|object contain information about fees total|
|fees_total_local|[order.money](#schemaorder.money)|false|none|object contain information about fees total local|
|net_revenue|[order.money](#schemaorder.money)|false|none|object contain information about net revenue|
|refund_gross_revenue|[order.money](#schemaorder.money)|false|none|object contain information about refund gross revenue|
|method_refund_fee_tariff|[order.money](#schemaorder.money)|false|none|object contain information about method refund fee tariff|
|merchant_refund_fixed_fee_tariff|[order.money](#schemaorder.money)|false|none|object contain information about merchant refund fixed fee tariff|
|refund_tax_fee|[order.money](#schemaorder.money)|false|none|object contain information about refund tax fee|
|refund_tax_fee_currency_exchange_fee|[order.money](#schemaorder.money)|false|none|object contain information about refund tax fee currency exchange fee|
|paysuper_refund_tax_fee_currency_exchange_fee|[order.money](#schemaorder.money)|false|none|object contain information about paysuper refund tax fee currency exchange fee|
|refund_reverse_revenue|[order.money](#schemaorder.money)|false|none|object contain information about refund reverse revenue|
|refund_fees_total|[order.money](#schemaorder.money)|false|none|object contain information about refund fees total|
|refund_fees_total_local|[order.money](#schemaorder.money)|false|none|object contain information about refund fees total local|
|items|[[model.JsonOrderCreateResponse.item](#schemamodel.jsonordercreateresponse.item)]|false|none|list of buyed items in order|
|issuer|[order.issuer](#schemaorder.issuer)|false|none|order issuer info|
|merchant_payout_currency|string|false|none|merchant payout currency|
|parent|[order.parent](#schemaorder.parent)|false|none|object contain information about parent order (for refunds only)|
|refund|[order.refund](#schemaorder.refund)|false|none|object contain information about refund|
|cancellation|[order.cancellation](#schemaorder.cancellation)|false|none|object contain information about order cancellation|
|operating_company_id|string|false|none|merchant operating company id|
|refund_allowed|string|false|none|refund allowed flag|

## order.parent

<a id="schemaorder.parent"></a>

```json
{
  "id": "string",
  "uuid": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|parent order id|
|uuid|string|false|none|parent order uuid|

## order.refund

<a id="schemaorder.refund"></a>

```json
{
  "amount": 0,
  "currency": "string",
  "reason": "string",
  "code": "string",
  "receipt_number": "string",
  "receipt_url": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|false|none|refund amount|
|currency|string|false|none|refund currency|
|reason|string|false|none|refund reason|
|code|string|false|none|refund code|
|receipt_number|string|false|none|refund receipt_number|
|receipt_url|string|false|none|refund receipt_url|

## order.cancellation

<a id="schemaorder.cancellation"></a>

```json
{
  "reason": "string",
  "code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|reason|string|false|none|refund reason|
|code|string|false|none|refund code|

## order.list.public

<a id="schemaorder.list.public"></a>

```json
{
  "count": 0,
  "items": [
    {
      "uuid": "string",
      "total_payment_amount": 0,
      "currency": "string",
      "project": {
        "id": "string",
        "merchant_id": "string",
        "url_success": "string",
        "url_fail": "string",
        "send_notify_email": true,
        "notify_emails": [
          "string"
        ],
        "secret_key": "string",
        "url_check_account": "string",
        "url_process_payment": "string",
        "callback_protocol": "string"
      },
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "transaction": "string",
      "transaction_date": {
        "seconds": 0,
        "nanos": 0
      },
      "payment_method": {
        "title": "string",
        "external_id": "string",
        "payment_system_id": "string",
        "saved": true,
        "card": {
          "first6": "string",
          "last4": "string",
          "masked": "string",
          "expiry_month": "string",
          "expiry_year": "string",
          "brand": "string",
          "fingerprint": "string",
          "secure3d": true
        },
        "wallet": {
          "brand": "string",
          "account": "string"
        },
        "crypto_currency": {
          "brand": "string",
          "address": "string"
        }
      },
      "country_code": "string",
      "merchant_id": "string",
      "locale": "string",
      "status": "string",
      "user": {
        "id": "string",
        "object": "string",
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
        "metadata": {},
        "notify_new_region": true,
        "notify_new_region_email": "string"
      },
      "billing_address": {
        "country": "string",
        "city": "string",
        "postal_code": "string",
        "state": "string"
      },
      "type": "string",
      "is_vat_deduction": true,
      "gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "tax_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_total": {
        "amount": 0,
        "currency": "string"
      },
      "method_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "method_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_fixed_fee": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "net_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_gross_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "method_refund_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "merchant_refund_fixed_fee_tariff": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "paysuper_refund_tax_fee_currency_exchange_fee": {
        "amount": 0,
        "currency": "string"
      },
      "refund_reverse_revenue": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total": {
        "amount": 0,
        "currency": "string"
      },
      "refund_fees_total_local": {
        "amount": 0,
        "currency": "string"
      },
      "items": [
        {
          "id": "string",
          "object": "string",
          "sku": "string",
          "name": "string",
          "description": "string",
          "amount": 0,
          "currency": "string",
          "images": [
            "string"
          ],
          "url": null,
          "metadata": {},
          "code": "string",
          "created_at": {
            "seconds": 0,
            "nanos": 0
          },
          "updated_at": {
            "seconds": 0,
            "nanos": 0
          },
          "platform_id": "string"
        }
      ],
      "issuer": {
        "url": "string",
        "embedded": true,
        "reference": "string",
        "reference_type": "string",
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string",
        "referrer_host": "string"
      },
      "merchant_payout_currency": "string",
      "parent": {
        "id": "string",
        "uuid": "string"
      },
      "refund": {
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "code": "string",
        "receipt_number": "string",
        "receipt_url": "string"
      },
      "cancellation": {
        "reason": "string",
        "code": "string"
      },
      "operating_company_id": "string",
      "refund_allowed": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|integer|false|none|total count of selected orders|
|items|[[order.public](#schemaorder.public)]|false|none|array of selected orders|

## order.issuer

<a id="schemaorder.issuer"></a>

```json
{
  "url": "string",
  "embedded": true,
  "reference": "string",
  "reference_type": "string",
  "utm_source": "string",
  "utm_medium": "string",
  "utm_campaign": "string",
  "referrer_host": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|url|string|false|none|referrer full url|
|embedded|boolean|false|none|flag of embedded form|
|reference|string|false|none|reference id|
|reference_type|string|false|none|reference type|
|utm_source|string|false|none|utm_source value|
|utm_medium|string|false|none|utm_medium value|
|utm_campaign|string|false|none|utm_campaign value|
|referrer_host|string|false|none|referrer host|

## order.create.request.user

<a id="schemaorder.create.request.user"></a>

```json
{
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

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|external_id|string|false|none|user identifier on project side|
|name|string|false|none|user name|
|email|string|false|none|user email|
|email_verified|boolean|false|none|user email was verified by project|
|phone|string|false|none|user phone|
|phone_verified|boolean|false|none|user phone was verified by project|
|ip|string|false|none|user ip address|
|locale|string|false|none|user's locale. two-letter code in lowercase|
|address|[order.BillingAddress](#schemaorder.billingaddress)|false|none|user address information|
|metadata|object|false|none|object can contain any other information about user. object must contain only string values.|

## model.OrderScalar

<a id="schemamodel.orderscalar"></a>

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
  },
  "is_buy_for_virtual_currency": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|account|string|false|none|user unique account in project|
|amount|number|false|none|order amount. if payment type is simple this field is required|
|currency|string|false|none|amount currency. three-letter ISO 4217 currency code, in uppercase. if payment type is simple this field is required|
|description|string|false|none|order description|
|order_id|string|false|none|unique order identifier on project side. this field not required, BUT we're recommend send this field always|
|project|string|true|none|project unique identifier in PaySuper|
|url_fail|string|false|none|url for redirect user after failed payment. this field can be send if it allowed in project admin panel|
|url_success|string|false|none|url for redirect user after successfully completed payment. this field can be send if it allowed in project admin panel|
|type|string|true|none|order type. now available next types: simple, product and key|
|products|[string]|false|none|list of products (or key products) of project which customer want to buy. if payment type is product or key this field is required.|
|platform_id|string|false|none|platform identifier for which customer buy key products. if payment type is key this field is required.|
|token|string|false|none|pre-created customer payment token. if sending pre-created token other request parameters not required.|
|user|[order.create.request.user](#schemaorder.create.request.user)|false|none|object may contain information about user. if project send this parameter in request than project must send authorisation header X-API-SIGNATURE|
|is_buy_for_virtual_currency|boolean|false|none|flag indicates that order should be processed using virtual currency|

#### Enumerated Values

|Property|Value|
|---|---|
|type|simple|
|type|product|
|type|key|
|type|virtual_currency|
|platform_id|steam|
|platform_id|gog|
|platform_id|uplay|
|platform_id|origin|
|platform_id|psn|
|platform_id|xbox|
|platform_id|nintendo|
|platform_id|itch|
|platform_id|egs|

## model.PaymentMethodJsonOrderResponse

<a id="schemamodel.paymentmethodjsonorderresponse"></a>

```json
{
  "account_regexp": "string",
  "group_alias": "string",
  "icon": "string",
  "id": "string",
  "name": "string",
  "type": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|account_regexp|string|false|none|regexp mask for check main requisite of payment method|
|group_alias|string|false|none|payment method group alias|
|icon|string|false|none|url to payment method icon|
|id|string|false|none|payment method unique identifier|
|name|string|false|none|payment method name|
|type|string|false|none|payment method type. allowed: bank_card, ewallet, crypto|

## model.Project

<a id="schemamodel.project"></a>

```json
{
  "id": "string",
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "status": 0,
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string",
  "products_count": 0,
  "created_at": {},
  "updated_at": {},
  "localizations": [
    "string"
  ],
  "full_description": {
    "property1": "string",
    "property2": "string"
  },
  "short_description": {
    "property1": "string",
    "property2": "string"
  },
  "cover": {
    "images": {
      "en": "en_image",
      "ru": "ru_image"
    },
    "use_one_for_all": true
  },
  "virtual_currency": {
    "logo": "string",
    "name": {
      "en": "Some name",
      "ru": "Какое то имя"
    },
    "success_message": {
      "en": "Thanks!",
      "ru": "Спасибо!"
    },
    "min_purchase_value": 0,
    "max_purchase_value": 0,
    "sell_count_type": "fractional",
    "prices": [
      {
        "amount": 0,
        "currency": "string",
        "region": "string",
        "is_virtual_currency": true
      }
    ]
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|unique project identifier|
|merchant_id|string|false|none|project merchant id|
|image|string|false|none|url to project logo|
|callback_currency|string|false|none|currency to send payment notification|
|callback_protocol|string|false|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls|[string]|false|none|list of urls rom which you can send a request to create an order|
|status|integer|false|none|project status. now available: 0 - new project; 1 - project successfully complete integration tests; 2 - project fail one or more integration test; 3 - project in production; 4 - project deleted|
|allow_dynamic_notify_urls|boolean|false|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls|boolean|false|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency|string|false|none|currency for amount's limit|
|max_payment_amount|number|false|none|maximal amount allowed for create order|
|min_payment_amount|number|false|none|minimal amount allowed for create order|
|name|object|false|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails|[string]|false|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout|boolean|false|none|is allow create order only with amounts from products list|
|secret_key|string|false|none|secret key for create check hash for request about order statuses changes|
|send_notify_email|boolean|false|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account|string|false|none|default url to send request for verification payment data to project|
|url_process_payment|string|false|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail|string|false|none|default url to redirect user after failed payment|
|url_redirect_success|string|false|none|default url to redirect user after successfully completed payment|
|products_count|integer|false|none|count of project's products|
|created_at|object|false|none|date of create merchant in system in unix timestamp|
|updated_at|object|false|none|date of update merchant in system in unix timestamp|
|localizations|[string]|false|none|languages for product to localize|
|full_description|object|false|none|localized full description for product|
|» **additionalProperties**|string|false|none|none|
|short_description|object|false|none|localized short description for product|
|» **additionalProperties**|string|false|none|none|
|cover|object|false|none|none|
|» images|object|false|none|none|
|»» **additionalProperties**|string|false|none|none|
|» use_one_for_all|boolean|false|none|none|
|virtual_currency|[model.VirtualCurrency](#schemamodel.virtualcurrency)|false|none|none|

## model.VirtualCurrency

<a id="schemamodel.virtualcurrency"></a>

```json
{
  "logo": "string",
  "name": {
    "en": "Some name",
    "ru": "Какое то имя"
  },
  "success_message": {
    "en": "Thanks!",
    "ru": "Спасибо!"
  },
  "min_purchase_value": 0,
  "max_purchase_value": 0,
  "sell_count_type": "fractional",
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string",
      "is_virtual_currency": true
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|logo|string|false|none|none|
|name|string|false|none|none|
|» **additionalProperties**|string|false|none|none|
|success_message|string|false|none|none|
|» **additionalProperties**|string|false|none|none|
|min_purchase_value|number(double)|false|none|none|
|max_purchase_value|number(double)|false|none|none|
|sell_count_type|string|false|none|none|
|prices|[[product.Price](#schemaproduct.price)]|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|sell_count_type|fractional|
|sell_count_type|integral|

## model.ProjectJsonOrderResponse

<a id="schemamodel.projectjsonorderresponse"></a>

```json
{
  "name": "string",
  "url_fail": "string",
  "url_success": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|false|none|project name|
|url_fail|string|false|none|url to redirect user after failed payment. may be NULL if not set in project settings|
|url_success|string|false|none|url to redirect user after successfully completed payment. may be NULL if not set in project settings|

## payment_system.PaymentResponse

<a id="schemapayment_system.paymentresponse"></a>

```json
{
  "error": "string",
  "redirect_url": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|error|string|false|none|none|
|redirect_url|string|false|none|none|

## taxes.TaxRate

<a id="schemataxes.taxrate"></a>

```json
{
  "id": "string",
  "country": "string",
  "city": "string",
  "state": "string",
  "zip": "string",
  "rate": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|none|
|country|string|true|none|none|
|city|string|false|none|none|
|state|string|false|none|none|
|zip|string|false|none|none|
|rate|number|true|none|none|

## report_file.CreateReportFileParams

<a id="schemareport_file.createreportfileparams"></a>

```json
{
  "merchant_id": "string",
  "file_type": "string",
  "report_type": "string",
  "template": "string",
  "params": {}
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|merchant_id|string|false|none|none|
|file_type|string|true|none|none|
|report_type|string|true|none|none|
|template|string|false|none|none|
|params|object|true|none|none|

## report_file.CreateReportFileResponse

<a id="schemareport_file.createreportfileresponse"></a>

```json
{
  "status": 0,
  "message": "string",
  "file_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|number|false|none|none|
|message|string|false|none|none|
|file_id|string|false|none|none|

## payment_method.PaymentMethodParams

<a id="schemapayment_method.paymentmethodparams"></a>

```json
{
  "currency": "string",
  "terminal_id": "string",
  "secret": "string",
  "secret_callback": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|currency|string|true|none|none|
|terminal_id|string|false|none|none|
|secret|string|false|none|none|
|secret_callback|string|false|none|none|

## payment_method.PostProductMethod

<a id="schemapayment_method.postproductmethod"></a>

```json
{
  "name": "string",
  "group_alias": "string",
  "external_id": "string",
  "currencies": [
    0
  ],
  "min_payment_amount": 0,
  "max_payment_amount": 0,
  "type": "string",
  "account_regexp": "string",
  "is_active": true,
  "payment_system_id": "string",
  "test_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ],
  "production_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|Name of method|
|group_alias|string|false|none|Name of group for currency type|
|external_id|string|true|none|External id|
|currencies|[integer]|false|none|List of currency int codes|
|min_payment_amount|integer|false|none|Minimal payment amount|
|max_payment_amount|integer|false|none|Maximum payment amount|
|type|string|false|none|Type of payment method|
|account_regexp|string|false|none|Regular expression for validation|
|is_active|boolean|false|none|Active or not|
|payment_system_id|string|true|none|Payment system identifier|
|test_settings|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|List of test settings|
|production_settings|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|List of production settings|

## payment_method.PutProductMethod

<a id="schemapayment_method.putproductmethod"></a>

```json
{
  "id": "string",
  "name": "string",
  "group_alias": "string",
  "external_id": "string",
  "currencies": [
    0
  ],
  "min_payment_amount": 0,
  "max_payment_amount": 0,
  "type": "string",
  "account_regexp": "string",
  "is_active": true,
  "payment_system_id": "string",
  "test_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ],
  "production_settings": [
    {
      "currency": "string",
      "terminal_id": "string",
      "secret": "string",
      "secret_callback": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|true|none|Payment method identifier|
|name|string|true|none|Name of method|
|group_alias|string|false|none|Name of group for currency type|
|external_id|string|true|none|External id|
|currencies|[integer]|false|none|List of currency int codes|
|min_payment_amount|integer|false|none|Minimal payment amount|
|max_payment_amount|integer|false|none|Maximum payment amount|
|type|string|false|none|Type of payment method|
|account_regexp|string|false|none|Regular expression for validation|
|is_active|boolean|false|none|Active or not|
|payment_system_id|string|true|none|Payment system identifier|
|test_settings|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|List of test settings|
|production_settings|[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|false|none|List of production settings|

## payment_method.UpdatePaymentMethodParams

<a id="schemapayment_method.updatepaymentmethodparams"></a>

```json
{
  "id": "string",
  "payment_system_id": "string",
  "params": {
    "currency": "string",
    "terminal_id": "string",
    "secret": "string",
    "secret_callback": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|true|none|Payment method identifier|
|payment_system_id|string|true|none|Payment system identifier|
|params|[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)|true|none|List of settings|

## onboarding.Contacts.Authorized

<a id="schemaonboarding.contacts.authorized"></a>

```json
{
  "name": "string",
  "email": "string",
  "phone": "string",
  "position": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|person full name|
|email|string|true|none|person email|
|phone|string|true|none|person contact phone|
|position|string|true|none|person position in company|

## onboarding.Contacts.Technical

<a id="schemaonboarding.contacts.technical"></a>

```json
{
  "name": "string",
  "email": "string",
  "phone": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|person full name|
|email|string|true|none|person email|
|phone|string|true|none|person contact phone|

## onboarding.Company

<a id="schemaonboarding.company"></a>

```json
{
  "name": "string",
  "alternative_name": "string",
  "website": "string",
  "country": "string",
  "state": "string",
  "zip": "string",
  "city": "string",
  "address": "string",
  "address_additional": "string",
  "registration_number": "string",
  "tax_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|name|
|alternative_name|string|true|none|brand|
|website|string|true|none|website url|
|country|string|true|none|destination country 2 letter code by ISO 3166-1|
|state|string|true|none|destination state or region|
|zip|string|true|none|destination zip code|
|city|string|true|none|destination city|
|address|string|true|none|destination address|
|address_additional|string|false|none|additional company address|
|registration_number|string|false|none|company registration number|
|tax_id|string|false|none|company tax identifier|

## onboarding.Contacts

<a id="schemaonboarding.contacts"></a>

```json
{
  "authorized": {
    "name": "string",
    "email": "string",
    "phone": "string",
    "position": "string"
  },
  "technical": {
    "name": "string",
    "email": "string",
    "phone": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|authorized|[onboarding.Contacts.Authorized](#schemaonboarding.contacts.authorized)|true|none|object contain information about merchant authorized person contacts|
|technical|[onboarding.Contacts.Technical](#schemaonboarding.contacts.technical)|true|none|object contain information about contacts of merchant tecnican|

## onboarding.Banking

<a id="schemaonboarding.banking"></a>

```json
{
  "name": "string",
  "address": "string",
  "account_number": "string",
  "swift": "string",
  "details": "string",
  "correspondent_account": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|bank name|
|address|string|true|none|bank address|
|account_number|string|true|none|merchant accounting number in bank|
|swift|string|true|none|bank SWIFT code|
|details|string|false|none|any details abount merchant accounting bank|
|correspondent_account|string|false|none|bank correspondent account|

## onboarding.Merchant.LastPayout

<a id="schemaonboarding.merchant.lastpayout"></a>

```json
{
  "date": 0,
  "amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|date|integer|false|none|date in unix timestamp when was last payout to merchant|
|amount|number|false|none|last payout amount to merchant|

## onboarding.Tariff.Item

<a id="schemaonboarding.tariff.item"></a>

```json
{
  "method_percent_fee": 0,
  "method_fixed_fee": 0,
  "method_fixed_fee_currency": "string",
  "is_paid_by_merchant": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|method_percent_fee|number|false|none|payment method fee in percents|
|method_fixed_fee|number|false|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency|string|false|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant|boolean|false|none|if true than commission will to take from merchant|

## onboarding.Tariff.Payment

<a id="schemaonboarding.tariff.payment"></a>

```json
{
  "min_amount": 0,
  "max_amount": 0,
  "method_name": "string",
  "method_percent_fee": 0,
  "method_fixed_fee": 0,
  "method_fixed_fee_currency": "string",
  "ps_percent_fee": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "merchant_home_region": "string",
  "payer_regions": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|min_amount|number|false|none|min payment amount|
|max_amount|number|false|none|max payment amount|
|method_name|string|false|none|payment method name|
|method_percent_fee|number|false|none|payment method fee in percents|
|method_fixed_fee|number|false|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency|string|false|none|currency of payment method fixed fee.  letters code by ISO 4217|
|ps_percent_fee|number|false|none|paysuper fee in percents|
|ps_fixed_fee|number|false|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency|string|false|none|currency of paysuper fixed fee.  letters code by ISO 4217|
|merchant_home_region|string|false|none|merchant region name|
|payer_regions|string|false|none|payer region name|

## onboarding.Tariff

<a id="schemaonboarding.tariff"></a>

```json
{
  "payment": {
    "min_amount": 0,
    "max_amount": 0,
    "method_name": "string",
    "method_percent_fee": 0,
    "method_fixed_fee": 0,
    "method_fixed_fee_currency": "string",
    "ps_percent_fee": 0,
    "ps_fixed_fee": 0,
    "ps_fixed_fee_currency": "string",
    "merchant_home_region": "string",
    "payer_regions": "string"
  },
  "refund": {
    "method_percent_fee": 0,
    "method_fixed_fee": 0,
    "method_fixed_fee_currency": "string",
    "is_paid_by_merchant": true
  },
  "chargeback": {
    "method_percent_fee": 0,
    "method_fixed_fee": 0,
    "method_fixed_fee_currency": "string",
    "is_paid_by_merchant": true
  },
  "payout": {
    "RUB": {
      "method_percent_fee": 0,
      "method_fixed_fee": 1000,
      "method_fixed_fee_currency": "RUB",
      "is_paid_by_merchant": true
    },
    "USD": {
      "method_percent_fee": 0,
      "method_fixed_fee": 10,
      "method_fixed_fee_currency": "USD",
      "is_paid_by_merchant": true
    }
  },
  "minimal_payout": {
    "RUB": 10000,
    "USD": 100
  },
  "mcc_code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|payment|[onboarding.Tariff.Payment](#schemaonboarding.tariff.payment)|false|none|payment tariffs|
|refund|[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|false|none|refund tariffs|
|chargeback|[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|false|none|chargeback tariffs|
|payout|object|false|none|payout tariff|
|» **additionalProperties**|[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|false|none|none|
|minimal_payout|object|false|none|minimal payout amount|
|» **additionalProperties**|number|false|none|none|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|

## onboarding.Tariff.Set.Request

<a id="schemaonboarding.tariff.set.request"></a>

```json
{
  "home_region": "string",
  "merchant_operations_type": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|home_region|string|false|none|merchant home region name. possible values: asia, europe, latin_america, russia_and_cis, worldwide|
|merchant_operations_type|string|false|none|merchant operations type. possible values are low-risk, high-risk|

## onboarding.Merchant.user

<a id="schemaonboarding.merchant.user"></a>

```json
{
  "id": "string",
  "email": "string",
  "first_name": "string",
  "last_name": "string",
  "profile_id": "string",
  "registration_date": {
    "seconds": 0,
    "nanos": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|user identifier|
|email|string|false|none|user email|
|first_name|string|false|none|user first name|
|last_name|string|false|none|user last name|
|profile_id|string|false|none|user primary onboarding profile identifier|
|registration_date|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when user email was confirm|

## onboarding.Merchant.tariffs

<a id="schemaonboarding.merchant.tariffs"></a>

```json
{
  "home_region": "asia"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|home_region|string|false|none|merchant tariff home region|

#### Enumerated Values

|Property|Value|
|---|---|
|home_region|asia|
|home_region|europe|
|home_region|latin_america|
|home_region|russia_and_cis|
|home_region|worldwide|

## onboarding.Merchant

<a id="schemaonboarding.merchant"></a>

```json
{
  "id": "string",
  "company": {
    "name": "string",
    "alternative_name": "string",
    "website": "string",
    "country": "string",
    "state": "string",
    "zip": "string",
    "city": "string",
    "address": "string",
    "address_additional": "string",
    "registration_number": "string",
    "tax_id": "string"
  },
  "contacts": {
    "authorized": {
      "name": "string",
      "email": "string",
      "phone": "string",
      "position": "string"
    },
    "technical": {
      "name": "string",
      "email": "string",
      "phone": "string"
    }
  },
  "banking": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "status": 0,
  "created_at": 0,
  "updated_at": 0,
  "first_payment_at": 0,
  "last_payout": {
    "date": 0,
    "amount": 0
  },
  "is_signed": true,
  "payment_methods": {},
  "agreement_type": 0,
  "agreement_sent_via_mail": true,
  "mail_tracking_link": "string",
  "signature_request": {
    "signer_type": 0
  },
  "agreement_template": "string",
  "received_date": {
    "seconds": 0,
    "nanos": 0
  },
  "status_last_updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "has_projects": true,
  "user": {
    "id": "string",
    "email": "string",
    "first_name": "string",
    "last_name": "string",
    "profile_id": "string",
    "registration_date": {
      "seconds": 0,
      "nanos": 0
    }
  },
  "mcc_code": "string",
  "operating_company_id": "string",
  "tariff": {
    "home_region": "asia"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|merchant unique identifier in system|
|company|[onboarding.Company](#schemaonboarding.company)|false|none|merchant company info|
|contacts|[onboarding.Contacts](#schemaonboarding.contacts)|false|none|contain information about contacts of merchant|
|banking|[onboarding.Banking](#schemaonboarding.banking)|false|none|contain information about merchan bank|
|status|integer|false|none|merchant status in system|
|created_at|integer|false|none|date of create merchant in system in unix timestamp|
|updated_at|integer|false|none|date of update merchant in system in unix timestamp|
|first_payment_at|integer|false|none|date when was first payment by some merchant project in system in unix timestamp|
|last_payout|[onboarding.Merchant.LastPayout](#schemaonboarding.merchant.lastpayout)|false|none|contain information about last payout to merchant|
|is_signed|boolean|false|none|agreement between merchant and system fully signed|
|payment_methods|object|false|none|list of payment methods activated to merchant|
|agreement_type|integer|false|none|type of agreement which merchant selected. possible values: 0 - type not select; 1 - paper agreement; 2 - e-sign agreement;|
|agreement_sent_via_mail|boolean|false|none|mark agreement as sent via post|
|mail_tracking_link|string|false|none|link to tracking package with agreement in post|
|signature_request|[onboarding.merchant.signatureRequest](#schemaonboarding.merchant.signaturerequest)|false|none|object contained signatire request data|
|agreement_template|string|false|none|license agreement template identifier in hellosign|
|received_date|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when merchant owner sign license agreement|
|status_last_updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when merchant status was updated at last time|
|has_projects|boolean|false|none|true is merchant has created projects|
|user|[onboarding.Merchant.user](#schemaonboarding.merchant.user)|false|none|object contain main information about merchant owner from primary onboarding profile|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|
|operating_company_id|string|false|none|id of operation company for which this cost is applicable|
|tariff|[onboarding.Merchant.tariffs](#schemaonboarding.merchant.tariffs)|false|none|merchant tariff information|

## onboarding.Merchant.ChangeStatus

<a id="schemaonboarding.merchant.changestatus"></a>

```json
{
  "status": 0,
  "message": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|integer|true|none|new status identifier of merchant. possible statuses: 5 - deleted, 6 - rejected|
|message|string|false|none|string description to new status|

## payment_method.ChangePaymentMethodResponse

<a id="schemapayment_method.changepaymentmethodresponse"></a>

```json
{
  "status": 0,
  "message": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|integer|true|none|status as result of operation|
|message|string|false|none|string description for error message|

## payment_method.ChangePaymentMethodParamsResponse

<a id="schemapayment_method.changepaymentmethodparamsresponse"></a>

```json
{
  "status": 0,
  "message": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|integer|true|none|status as result of operation|
|message|string|false|none|string description for error message|

## price_group.CurrencyRegion

<a id="schemaprice_group.currencyregion"></a>

```json
{
  "id": "string",
  "region": "string",
  "currency": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|price group identifier|
|region|string|false|none|name of region|
|currency|string|false|none|code of currency|

## price_group.CurrencyListResponse

<a id="schemaprice_group.currencylistresponse"></a>

```json
{
  "regions": {
    "currency": "string",
    "region": {
      "region": "string",
      "country": [
        null
      ]
    }
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|regions|[price_group.Regions](#schemaprice_group.regions)|false|none|list of currency|

## price_group.Regions

<a id="schemaprice_group.regions"></a>

```json
{
  "currency": "string",
  "region": {
    "region": "string",
    "country": [
      null
    ]
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|currency|string|false|none|name of currency|
|region|[price_group.Region](#schemaprice_group.region)|false|none|list of regions|

## price_group.Region

<a id="schemaprice_group.region"></a>

```json
{
  "region": "string",
  "country": [
    null
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|region|string|false|none|name of region|
|country|[any]|false|none|list of countries|

## price_group.RecommendedPriceResponse

<a id="schemaprice_group.recommendedpriceresponse"></a>

```json
{
  "recommended_price": {
    "region": "string",
    "currency": "string",
    "amount": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|recommended_price|[price_group.RecommendedPrice](#schemaprice_group.recommendedprice)|false|none|list of price|

## price_group.RecommendedPrice

<a id="schemaprice_group.recommendedprice"></a>

```json
{
  "region": "string",
  "currency": "string",
  "amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|region|string|false|none|name of region|
|currency|string|false|none|name of currency|
|amount|number|false|none|recommended amount|

## price_group.RecommendedPriceTableResponse

<a id="schemaprice_group.recommendedpricetableresponse"></a>

```json
{
  "ranges": {
    "from": 0.99,
    "to": 1.99
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|ranges|[price_group.RecommendedPriceTableItem](#schemaprice_group.recommendedpricetableitem)|false|none|list of price|

## price_group.RecommendedPriceTableItem

<a id="schemaprice_group.recommendedpricetableitem"></a>

```json
{
  "from": 0.99,
  "to": 1.99
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|from|integer|false|none|start point of range|
|to|integer|false|none|end point of range|

## onboarding.Merchant.Notification.Statuses

<a id="schemaonboarding.merchant.notification.statuses"></a>

```json
{
  "from": 0,
  "to": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|from|integer|false|none|status before changes|
|to|integer|false|none|status after changes|

## onboarding.Merchant.Notification

<a id="schemaonboarding.merchant.notification"></a>

```json
{
  "id": "string",
  "title": "string",
  "message": "string",
  "merchant_id": "string",
  "user_id": "string",
  "is_system": true,
  "is_read": true,
  "statuses": {
    "from": 0,
    "to": 0
  },
  "created_at": 0,
  "updated_at": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|notification unique identifier in system|
|title|string|false|none|notification title|
|message|string|false|none|notification message|
|merchant_id|string|false|none|merchant identifier who must recieve notification|
|user_id|string|false|none|user identifier who send notification|
|is_system|boolean|false|none|notification generated automaticaly|
|is_read|boolean|false|none|receiver read notification|
|statuses|[onboarding.Merchant.Notification.Statuses](#schemaonboarding.merchant.notification.statuses)|false|none|statuses "from -> to" for system notification. for not system notification this field will be equal NULL|
|created_at|integer|false|none|dete of create notification in unix timestamp format|
|updated_at|integer|false|none|dete of last update notification in unix timestamp format|

## onboarding.Merchant.Notifications

<a id="schemaonboarding.merchant.notifications"></a>

```json
{
  "count": 0,
  "items": {
    "id": "string",
    "title": "string",
    "message": "string",
    "merchant_id": "string",
    "user_id": "string",
    "is_system": true,
    "is_read": true,
    "statuses": {
      "from": 0,
      "to": 0
    },
    "created_at": 0,
    "updated_at": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|integer|false|none|total number of filtered notifications|
|items|[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|false|none|list of filtered notifications|

## onboarding.Merchant.Notification.CreateRequest

<a id="schemaonboarding.merchant.notification.createrequest"></a>

```json
{
  "title": "string",
  "message": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|title|string|true|none|notification title|
|message|string|true|none|notification message|

## order.Refund

<a id="schemaorder.refund"></a>

```json
{
  "id": "string",
  "order_id": "string",
  "external_id": "string",
  "amount": 0,
  "creator_id": "string",
  "reason": "string",
  "currency": "string",
  "status": 0,
  "created_at": 0,
  "updated_at": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|refund unique identifier|
|order_id|string|false|none|order unique identifier for which the refund was created|
|external_id|string|false|none|refund unique identifier on payment system side|
|amount|number|false|none|refund amount|
|creator_id|string|false|none|user identifier who created refund|
|reason|string|false|none|reason to refund|
|currency|string|false|none|refund currency|
|status|integer|false|none|refund status. available statuses: 0 - refund was created; 1 - refund rejected on payment system side; 2 - refund in processing on payment system side; 3 - refund successfully completed;|
|created_at|integer|false|none|dete of create notification in unix timestamp format|
|updated_at|integer|false|none|dete of last update notification in unix timestamp format|

## order.Refund.CreateRequest

<a id="schemaorder.refund.createrequest"></a>

```json
{
  "amount": 0,
  "reason": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|true|none|refund amount|
|reason|string|false|none|reason to refund|

## onboarding.Merchant.ChangeAgreementDataRequest

<a id="schemaonboarding.merchant.changeagreementdatarequest"></a>

```json
{
  "has_psp_signature": true,
  "has_merchant_signature": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|has_psp_signature|boolean|false|none|flag for set peysuper signature on the agreement|
|has_merchant_signature|boolean|false|none|flag for set merchant signature on the agreement|

## onboarding.Merchant.PrintableAgreementData.Metadata

<a id="schemaonboarding.merchant.printableagreementdata.metadata"></a>

```json
{
  "name": "string",
  "extension": "string",
  "content_type": "string",
  "size": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|agreement file name|
|extension|string|true|none|agreement file extension|
|content_type|string|true|none|agreement file content type|
|size|integer|true|none|agreement file size in Kb|

## onboarding.Merchant.PrintableAgreementData.Response

<a id="schemaonboarding.merchant.printableagreementdata.response"></a>

```json
{
  "url": "string",
  "metadata": {
    "name": "string",
    "extension": "string",
    "content_type": "string",
    "size": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|url|string|false|none|link to download printable agreement|
|metadata|[onboarding.Merchant.PrintableAgreementData.Metadata](#schemaonboarding.merchant.printableagreementdata.metadata)|false|none|agreement file metadata|

## onboarding.Merchant.ChangeAgreementType.Request

<a id="schemaonboarding.merchant.changeagreementtype.request"></a>

```json
{
  "agreement_type": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|agreement_type|integer|true|none|type of agreement which merchant selected. possible values: 1 - paper agreement; 2 - e-sign agreement;|

## projects.CreateRequest

<a id="schemaprojects.createrequest"></a>

```json
{
  "merchant_id": "string",
  "image": "string",
  "callback_currency": "string",
  "callback_protocol": "string",
  "create_invoice_allowed_urls": [
    "string"
  ],
  "allow_dynamic_notify_urls": true,
  "allow_dynamic_redirect_urls": true,
  "limits_currency": "string",
  "max_payment_amount": 0,
  "min_payment_amount": 0,
  "name": {},
  "notify_emails": [
    "string"
  ],
  "is_products_checkout": true,
  "secret_key": "string",
  "send_notify_email": true,
  "url_check_account": "string",
  "url_process_payment": "string",
  "url_redirect_fail": "string",
  "url_redirect_success": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|merchant_id|string|false|none|project merchant id|
|image|string|false|none|url to project logo|
|callback_currency|string|false|none|currency to send payment notification|
|callback_protocol|string|false|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls|[string]|false|none|list of urls rom which you can send a request to create an order|
|allow_dynamic_notify_urls|boolean|false|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls|boolean|false|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency|string|false|none|currency for amount's limit|
|max_payment_amount|number|false|none|maximal amount allowed for create order|
|min_payment_amount|number|false|none|minimal amount allowed for create order|
|name|object|false|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails|[string]|false|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout|boolean|false|none|is allow create order only with amounts from products list|
|secret_key|string|false|none|secret key for create check hash for request about order statuses changes|
|send_notify_email|boolean|false|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account|string|false|none|default url to send request for verification payment data to project|
|url_process_payment|string|false|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail|string|false|none|default url to redirect user after failed payment|
|url_redirect_success|string|false|none|default url to redirect user after successfully completed payment|

## order.BillingAddress

<a id="schemaorder.billingaddress"></a>

```json
{
  "country": "string",
  "city": "string",
  "postal_code": "string",
  "state": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|country|string|false|none|2 chars country code in upper registry by ISO 3166-1|
|city|string|false|none|city name|
|postal_code|string|false|none|zip code|
|state|string|false|none|state code by ISO 3166-2|

## token.TokenRequest.ValueVerified

<a id="schematoken.tokenrequest.valueverified"></a>

```json
{
  "value": "string",
  "verified": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|value|string|true|none|parameter value|
|verified|boolean|false|none|is parameter was verified in project side. for example: user verify email|

## token.TokenRequest.Value

<a id="schematoken.tokenrequest.value"></a>

```json
{
  "value": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|value|string|true|none|parameter value|

## token.TokenRequest.User

<a id="schematoken.tokenrequest.user"></a>

```json
{
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
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|true|none|user identifier in project|
|email|[token.TokenRequest.ValueVerified](#schematoken.tokenrequest.valueverified)|false|none|object which contain information about user email|
|phone|[token.TokenRequest.ValueVerified](#schematoken.tokenrequest.valueverified)|false|none|object which contain information about user phone|
|name|[token.TokenRequest.Value](#schematoken.tokenrequest.value)|false|none|object which contain information about user real name|
|ip|[token.TokenRequest.Value](#schematoken.tokenrequest.value)|false|none|object which contain information about user ip|
|locale|[token.TokenRequest.Value](#schematoken.tokenrequest.value)|false|none|object which contain information about user locale. value in this object must contain locale code by ISO 639|
|address|[order.BillingAddress](#schemaorder.billingaddress)|false|none|object which contain information about user address|
|metadata|object|false|none|object can contain any other information about user. object must contain only string values.|

## token.TokenRequest.Settings.ReturnUrl

<a id="schematoken.tokenrequest.settings.returnurl"></a>

```json
{
  "success": "string",
  "fail": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|success|string|false|none|url to redirect user after payment was successfully completed|
|fail|string|false|none|url to redirect user after payment failed|

## token.TokenRequest.Settings

<a id="schematoken.tokenrequest.settings"></a>

```json
{
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
  "type": "string",
  "metadata": {},
  "is_buy_for_virtual_currency": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|project_id|string|true|none|project identifier|
|return_url|[token.TokenRequest.Settings.ReturnUrl](#schematoken.tokenrequest.settings.returnurl)|false|none|object contain urls for redirect user after payment ended. can be set if project settings allow this.|
|currency|string|false|none|3 characters currency code in upper registry by ISO 4217. this field is required if payment type is simple. WARNING: this field is disallowed if creating payment token with types product or key|
|amount|number|false|none|payment amount. this field is required if payment type is simple. WARNING: this field is disallowed if creating payment token with types product or key|
|products_ids|[string]|false|none|array of products identifiers or key products identifiers. this field is required if payment types are product or key. WARNING: this field is disallowed if creating payment token with type simple|
|description|string|false|none|payment description|
|type|string|true|none|payment type. now available next values: simple, product, key|
|metadata|object|false|none|object can contain any other information about payment. object must contain only string values. this object will return in project notification about payment.|
|is_buy_for_virtual_currency|boolean|false|none|flag indicates that order should be processed using virtual currency|

## token.TokenRequest

<a id="schematoken.tokenrequest"></a>

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
    "type": "string",
    "metadata": {},
    "is_buy_for_virtual_currency": true
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|user|[token.TokenRequest.User](#schematoken.tokenrequest.user)|true|none|object which contain any information about payer|
|settings|[token.TokenRequest.Settings](#schematoken.tokenrequest.settings)|true|none|object which contain information to process payment|

## token.TokenResponse

<a id="schematoken.tokenresponse"></a>

```json
{
  "token": "string",
  "payment_form_url": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|token|string|true|none|payment token|
|payment_form_url|string|false|none|url to payment form|

## product.Price

<a id="schemaproduct.price"></a>

```json
{
  "amount": 0,
  "currency": "string",
  "region": "string",
  "is_virtual_currency": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|false|none|price|
|currency|string|false|none|currency|
|region|string|false|none|region|
|is_virtual_currency|boolean|false|none|virtual currency flag|

## product.PutPrice

<a id="schemaproduct.putprice"></a>

```json
{
  "id": "string",
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string",
      "is_virtual_currency": true
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|true|none|id of product|
|prices|[[product.Price](#schemaproduct.price)]|true|none|list of prices|

## userProfile.personal

<a id="schemauserprofile.personal"></a>

```json
{
  "first_name": "string",
  "last_name": "string",
  "position": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|first_name|string|false|none|user first name|
|last_name|string|false|none|user last name|
|position|string|false|none|user position in company|

## userProfile.help

<a id="schemauserprofile.help"></a>

```json
{
  "product_promotion_and_development": true,
  "released_game_promotion": true,
  "international_sales": true,
  "other": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|product_promotion_and_development|boolean|false|none|User need help with product promotion and development|
|released_game_promotion|boolean|false|none|User need help with games promotion that have already been released|
|international_sales|boolean|false|none|User need help with international sales|
|other|boolean|false|none|User need help with other problems|

## RangeInt

<a id="schemarangeint"></a>

```json
{
  "from": 0,
  "to": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|from|integer|false|none|range start value|
|to|integer|false|none|range end value|

## userProfile.company.monetization

<a id="schemauserprofile.company.monetization"></a>

```json
{
  "paid_subscription": true,
  "in_game_advertising": true,
  "in_game_purchases": true,
  "premium_access": true,
  "other": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|paid_subscription|boolean|false|none|company monetisation from buy paid subscription by company users|
|in_game_advertising|boolean|false|none|company monetisation from buy in game advertising|
|in_game_purchases|boolean|false|none|company monetisation from buy in game purchases by company users|
|premium_access|boolean|false|none|company monetisation from buy premium access by company users|
|other|boolean|false|none|company monetisation from other activities|

## userProfile.company.platforms

<a id="schemauserprofile.company.platforms"></a>

```json
{
  "pc_mac": true,
  "game_console": true,
  "mobile_device": true,
  "web_browser": true,
  "other": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|pc_mac|boolean|false|none|PC/MacOs|
|game_console|boolean|false|none|game console|
|mobile_device|boolean|false|none|mobile device|
|web_browser|boolean|false|none|web browsers|
|other|boolean|false|none|other platforms|

## userProfile.company

<a id="schemauserprofile.company"></a>

```json
{
  "company_name": "string",
  "website": "string",
  "annual_income": {
    "from": 0,
    "to": 0
  },
  "number_of_employees": {
    "from": 0,
    "to": 0
  },
  "kind_of_activity": "string",
  "monetization": {
    "paid_subscription": true,
    "in_game_advertising": true,
    "in_game_purchases": true,
    "premium_access": true,
    "other": true
  },
  "platforms": {
    "pc_mac": true,
    "game_console": true,
    "mobile_device": true,
    "web_browser": true,
    "other": true
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|company_name|string|false|none|company name|
|website|string|false|none|company website url|
|annual_income|[RangeInt](#schemarangeint)|false|none|company annual income|
|number_of_employees|[RangeInt](#schemarangeint)|false|none|company number of employees|
|kind_of_activity|string|false|none|company kind of activity. available values: develop_and_publish_your_games, publish_games_of_other_companies, publish_your_games_through_other_publishers, other|
|monetization|[userProfile.company.monetization](#schemauserprofile.company.monetization)|false|none|company monetization activities|
|platforms|[userProfile.company.platforms](#schemauserprofile.company.platforms)|false|none|platforms|

## ProtobufTimestamp

<a id="schemaprotobuftimestamp"></a>

```json
{
  "seconds": 0,
  "nanos": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|seconds|integer|false|none|time in unix timestamp|
|nanos|integer|false|none|time nano seconds|

## userProfile.request

<a id="schemauserprofile.request"></a>

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|personal|[userProfile.personal](#schemauserprofile.personal)|false|none|object contain personal information about user|
|help|[userProfile.help](#schemauserprofile.help)|false|none|object contain information about user problem which need help|
|company|[userProfile.company](#schemauserprofile.company)|false|none|object contain information about user company|
|last_step|string|false|none|identifier of wizard last step which user ended|

## userProfile.response

<a id="schemauserprofile.response"></a>

```json
{
  "personal": {
    "first_name": "string",
    "last_name": "string",
    "position": "string"
  },
  "help": {
    "product_promotion_and_development": true,
    "released_game_promotion": true,
    "international_sales": true,
    "other": true
  },
  "company": {
    "company_name": "string",
    "website": "string",
    "annual_income": {
      "from": 0,
      "to": 0
    },
    "number_of_employees": {
      "from": 0,
      "to": 0
    },
    "kind_of_activity": "string",
    "monetization": {
      "paid_subscription": true,
      "in_game_advertising": true,
      "in_game_purchases": true,
      "premium_access": true,
      "other": true
    },
    "platforms": {
      "pc_mac": true,
      "game_console": true,
      "mobile_device": true,
      "web_browser": true,
      "other": true
    }
  },
  "last_step": "string",
  "centrifugo_token": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|personal|[userProfile.personal](#schemauserprofile.personal)|false|none|object contain personal information about user|
|help|[userProfile.help](#schemauserprofile.help)|false|none|object contain information about user problem which need help|
|company|[userProfile.company](#schemauserprofile.company)|false|none|object contain information about user company|
|last_step|string|false|none|identifier of wizard last step which user ended|
|centrifugo_token|string|false|none|user authorisation token to connect to centrifigo channel|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time of create user profile|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time of last update user profile|

## pageReview.request

<a id="schemapagereview.request"></a>

```json
{
  "review": "string",
  "url": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|review|string|true|none|user review about page|
|url|string|true|none|URL address of page|

## user.confirmEmail.request

<a id="schemauser.confirmemail.request"></a>

```json
{
  "token": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|token|string|true|none|email confirmation token|

## onboarding.merchant.fillStatus.Steps

<a id="schemaonboarding.merchant.fillstatus.steps"></a>

```json
{
  "company": true,
  "contacts": true,
  "banking": true,
  "tariff": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|company|boolean|false|none|step company basic info complete|
|contacts|boolean|false|none|step company contacts complete|
|banking|boolean|false|none|step company banking complete|
|tariff|boolean|false|none|step tariff complete|

## onboarding.merchant.fillStatus

<a id="schemaonboarding.merchant.fillstatus"></a>

```json
{
  "status": "string",
  "steps": {
    "company": true,
    "contacts": true,
    "banking": true,
    "tariff": true
  },
  "complete_steps_count": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|string|false|none|fill status. possible values: draft, life|
|steps|[onboarding.merchant.fillStatus.Steps](#schemaonboarding.merchant.fillstatus.steps)|false|none|object contain information about fill status different steps|
|complete_steps_count|integer|false|none|count of complete steps|

## onboarding.merchant.signatureRequest

<a id="schemaonboarding.merchant.signaturerequest"></a>

```json
{
  "signer_type": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|signer_type|integer|true|none|type of signer which request a signing license agreement. possible values: 0 - merchant owner; 1 - paysuper admin|

## onboarding.merchant.signatureResponse

<a id="schemaonboarding.merchant.signatureresponse"></a>

```json
{
  "sign_url": "string",
  "expires_at": {
    "seconds": 0,
    "nanos": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|sign_url|string|false|none|URL of the signature page to display in the embedded iFrame|
|expires_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time of create user profile|

## onboarding.cost.payment.system

<a id="schemaonboarding.cost.payment.system"></a>

```json
{
  "id": "string",
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|unique identifier|
|name|string|false|none|payment method name|
|region|string|false|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|percent|number|false|none|percent fee|
|fix_amount|number|false|none|fixed fee in particular currency|
|fix_amount_currency|string|false|none|currency of fixed fee.  letters code by ISO 4217|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|date of create cost record|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|date of create cost record|
|is_active|boolean|false|none|true is cost record is active|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|
|operating_company_id|string|false|none|id of operation company for which this cost is applicable|

## onboarding.cost.payment.system.create

<a id="schemaonboarding.cost.payment.system.create"></a>

```json
{
  "name": "string",
  "region": "string",
  "country": "string",
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "mcc_code": "string",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|payment method name|
|region|string|true|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|percent|number|true|none|percent fee|
|fix_amount|number|false|none|fixed fee in particular currency|
|fix_amount_currency|string|true|none|currency of fixed fee.  letters code by ISO 4217|
|mcc_code|string|true|none|mcc code value, for which this cost is applicable|
|operating_company_id|string|true|none|id of operation company for which this cost is applicable|

## onboarding.cost.payment.system.all

<a id="schemaonboarding.cost.payment.system.all"></a>

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "region": "string",
      "country": "string",
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string",
      "operating_company_id": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)]|false|none|array of system payment costs|

## onboarding.cost.money_back.system.all

<a id="schemaonboarding.cost.money_back.system.all"></a>

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "payout_currency": "string",
      "undo_reason": "string",
      "region": "string",
      "country": "string",
      "days_from": 0,
      "payment_stage": 0,
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string",
      "operating_company_id": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)]|false|none|array of system money back costs|

## onboarding.cost.payment.merchant

<a id="schemaonboarding.cost.payment.merchant"></a>

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|unique identifier|
|merchant_id|string|false|none|merchant identifier|
|name|string|false|none|payment method name|
|payout_currency|string|false|none|payout currency. 3 lettre code by ISO 4217|
|min_amount|number|false|none|payment min amount in payout currency|
|region|string|false|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|method_percent|number|false|none|payment method fee in percents|
|method_fix_amount|number|false|none|payment method fixed fee in particular currency|
|method_fix_amount_currency|string|false|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent|number|false|none|paysuper fixed fee in particular currency|
|ps_fixed_fee|number|false|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency|string|false|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was created for merchant|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was updated at last time for merchant|
|is_active|boolean|false|none|true is rates record active for merchant|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|

## onboarding.cost.payment.merchant.create

<a id="schemaonboarding.cost.payment.merchant.create"></a>

```json
{
  "name": "string",
  "payout_currency": "string",
  "min_amount": 0,
  "region": "string",
  "country": "string",
  "method_percent": 0,
  "method_fix_amount": 0,
  "method_fix_amount_currency": "string",
  "ps_percent": 0,
  "ps_fixed_fee": 0,
  "ps_fixed_fee_currency": "string",
  "mcc_code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|payment method name|
|payout_currency|string|true|none|payout currency. 3 lettre code by ISO 4217|
|min_amount|number|true|none|payment min amount in payout currency|
|region|string|true|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|method_percent|number|true|none|payment method fee in percents|
|method_fix_amount|number|false|none|payment method fixed fee in particular currency|
|method_fix_amount_currency|string|true|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent|number|true|none|paysuper fixed fee in particular currency|
|ps_fixed_fee|number|false|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency|string|true|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|
|mcc_code|string|true|none|mcc code value, for which this cost is applicable|

## onboarding.cost.money_back.system

<a id="schemaonboarding.cost.money_back.system"></a>

```json
{
  "id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|unique identifier|
|name|string|false|none|payment method name|
|payout_currency|string|false|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason|string|false|none|money back type. available values: refund, reversal, chargeback|
|region|string|false|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|days_from|number|false|none|number of days after payment operation|
|payment_stage|number|false|none|payment stage|
|percent|number|false|none|payment method fee in percents|
|fix_amount|number|false|none|payment method fixed fee|
|fix_amount_currency|string|false|none|payment method fixed fee currency|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was updated at last time|
|is_active|boolean|false|none|true is rates record is active|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|
|operating_company_id|string|false|none|id of operation company for which this cost is applicable|

## onboarding.cost.money_back.system.create

<a id="schemaonboarding.cost.money_back.system.create"></a>

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "mcc_code": "string",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|payment method name|
|payout_currency|string|true|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason|string|true|none|money back type. available values: refund, reversal, chargeback|
|region|string|true|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|days_from|number|false|none|number of days after payment operation|
|payment_stage|number|false|none|payment stage|
|percent|number|false|none|payment method fee in percents|
|fix_amount|number|false|none|payment method fixed fee|
|mcc_code|string|true|none|mcc code value, for which this cost is applicable|
|operating_company_id|string|true|none|id of operation company for which this cost is applicable|

## onboarding.cost.money_back.merchant

<a id="schemaonboarding.cost.money_back.merchant"></a>

```json
{
  "id": "string",
  "merchant_id": "string",
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "is_active": true,
  "mcc_code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|unique identifier|
|merchant_id|string|false|none|merchant identifier|
|name|string|false|none|payment method name|
|payout_currency|string|false|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason|string|false|none|money back type. available values: refund, reversal, chargeback|
|region|string|false|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|days_from|number|false|none|number of days after payment operation|
|payment_stage|number|false|none|payment stage|
|percent|number|false|none|payment method fee in percents|
|fix_amount|number|false|none|payment method fixed fee in particular currency|
|fix_amount_currency|string|false|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant|boolean|false|none|if true than commission will to take from merchant when money back operation will be processing|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was updated at last time|
|is_active|boolean|false|none|true is rates record is active|
|mcc_code|string|false|none|mcc code value, for which this cost is applicable|

## onboarding.cost.money_back.merchant.create

<a id="schemaonboarding.cost.money_back.merchant.create"></a>

```json
{
  "name": "string",
  "payout_currency": "string",
  "undo_reason": "string",
  "region": "string",
  "country": "string",
  "days_from": 0,
  "payment_stage": 0,
  "percent": 0,
  "fix_amount": 0,
  "fix_amount_currency": "string",
  "is_paid_by_merchant": true,
  "mcc_code": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|true|none|payment method name|
|payout_currency|string|true|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason|string|true|none|money back type. available values: refund, reversal, chargeback|
|region|string|true|none|region name|
|country|string|false|none|two-letter country code by ISO 3166-1|
|days_from|number|false|none|number of days after payment operation|
|payment_stage|number|false|none|payment stage|
|percent|number|true|none|payment method fee in percents|
|fix_amount|number|false|none|payment method fixed fee in particular currency|
|fix_amount_currency|string|true|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant|boolean|false|none|if true than commission will to take from merchant when money back operation will be processing|
|mcc_code|string|true|none|mcc code value, for which this cost is applicable|

## onboarding.cost.payment.merchant.all

<a id="schemaonboarding.cost.payment.merchant.all"></a>

```json
{
  "items": [
    {
      "id": "string",
      "merchant_id": "string",
      "name": "string",
      "payout_currency": "string",
      "min_amount": 0,
      "region": "string",
      "country": "string",
      "method_percent": 0,
      "method_fix_amount": 0,
      "method_fix_amount_currency": "string",
      "ps_percent": 0,
      "ps_fixed_fee": 0,
      "ps_fixed_fee_currency": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)]|false|none|array of merchant payment costs|

## onboarding.cost.money_back.merchant.all

<a id="schemaonboarding.cost.money_back.merchant.all"></a>

```json
{
  "items": [
    {
      "id": "string",
      "merchant_id": "string",
      "name": "string",
      "payout_currency": "string",
      "undo_reason": "string",
      "region": "string",
      "country": "string",
      "days_from": 0,
      "payment_stage": 0,
      "percent": 0,
      "fix_amount": 0,
      "fix_amount_currency": "string",
      "is_paid_by_merchant": true,
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      },
      "is_active": true,
      "mcc_code": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)]|false|none|array of merchant payment costs|

## dashboard.main_reports.chart.float

<a id="schemadashboard.main_reports.chart.float"></a>

```json
{
  "label": "string",
  "value": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|label|string|false|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value|number|false|none|point value|

## dashboard.main_reports.chart.integer

<a id="schemadashboard.main_reports.chart.integer"></a>

```json
{
  "label": "string",
  "value": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|label|string|false|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value|integer|false|none|point value|

## dashboard.main_reports.amount_with_chart

<a id="schemadashboard.main_reports.amount_with_chart"></a>

```json
{
  "amount_current": 0,
  "amount_previous": 0,
  "currency": "string",
  "chart": [
    {
      "label": "string",
      "value": 0
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount_current|number|false|none|total amount calculated for current report|
|amount_previous|number|false|none|total amount calculated for previous report|
|currency|string|false|none|report amount currency.  three-letter ISO 4217 currency code, in uppercase.|
|chart|[[dashboard.main_reports.chart.float](#schemadashboard.main_reports.chart.float)]|false|none|array contain objects for chart drawing|

## dashboard.main_reports.total_transactions

<a id="schemadashboard.main_reports.total_transactions"></a>

```json
{
  "count_current": 0,
  "count_previous": 0,
  "chart": [
    {
      "label": "string",
      "value": 0
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count_current|integer|false|none|total count of transactions by current period|
|count_previous|integer|false|none|total count of transactions by previous period|
|chart|[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|false|none|array contain objects for chart drawing|

## dashboard.main_reports

<a id="schemadashboard.main_reports"></a>

```json
{
  "gross_revenue": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "vat": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "total_transactions": {
    "count_current": 0,
    "count_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "arpu": {
    "amount_current": 0,
    "amount_previous": 0,
    "currency": "string",
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|gross_revenue|[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|false|none|object contain information for block gross revenue|
|vat|[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|false|none|object contain information for block VAT|
|total_transactions|[dashboard.main_reports.total_transactions](#schemadashboard.main_reports.total_transactions)|false|none|object contain information for block total transactions|
|arpu|[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|false|none|object contain information for block ARPU|

## dashboard.revenue_dynamics.item

<a id="schemadashboard.revenue_dynamics.item"></a>

```json
{
  "label": "string",
  "amount": 0,
  "count": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|label|string|false|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount|number|false|none|revenue amount for label|
|count|integer|false|none|transactions count for label|

## dashboard.revenue_dynamics

<a id="schemadashboard.revenue_dynamics"></a>

```json
{
  "currency": "string",
  "items": [
    {
      "label": "string",
      "amount": 0,
      "count": 0
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|currency|string|false|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|items|[[dashboard.revenue_dynamics.item](#schemadashboard.revenue_dynamics.item)]|false|none|array of points|

## dashboard.base.revenue_by_country.top

<a id="schemadashboard.base.revenue_by_country.top"></a>

```json
{
  "country": "string",
  "amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|country|string|false|none|country, two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|amount|number|false|none|amount by country|

## dashboard.base.chart

<a id="schemadashboard.base.chart"></a>

```json
{
  "label": "string",
  "amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|label|string|false|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount|number|false|none|amount for label|

## dashboard.base.revenue_by_country

<a id="schemadashboard.base.revenue_by_country"></a>

```json
{
  "top": [
    {
      "country": "string",
      "amount": 0
    }
  ],
  "total_current": 0,
  "total_previous": 0,
  "currency": "string",
  "chart": {
    "label": "string",
    "amount": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|top|[[dashboard.base.revenue_by_country.top](#schemadashboard.base.revenue_by_country.top)]|false|none|array of objects with information about top 5 countries by revenue by period|
|total_current|number|false|none|total revenue amount by current period|
|total_previous|number|false|none|total revenue amount by previous period|
|currency|string|false|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|chart|[dashboard.base.chart](#schemadashboard.base.chart)|false|none|array contain objects for chart drawing|

## dashboard.base.sales_today.top.item

<a id="schemadashboard.base.sales_today.top.item"></a>

```json
{
  "name": "string",
  "count": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|false|none|sold item name|
|count|integer|false|none|item total count which were sold in period|

## dashboard.base.sales_today

<a id="schemadashboard.base.sales_today"></a>

```json
{
  "top": [
    {
      "name": "string",
      "count": 0
    }
  ],
  "total_current": 0,
  "total_previous": 0,
  "chart": [
    {
      "label": "string",
      "value": 0
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|top|[[dashboard.base.sales_today.top.item](#schemadashboard.base.sales_today.top.item)]|false|none|array of objects with information about top 5 merchant products (projects) which were sold in period|
|total_current|integer|false|none|items total count which were sold by chosen period|
|total_previous|integer|false|none|items total count which were sold by previous period to chosen period|
|chart|[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|false|none|array contain objects for chart drawing|

## dashboard.base.sources.top.item

<a id="schemadashboard.base.sources.top.item"></a>

```json
{
  "name": "string",
  "count": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|name|string|false|none|url of issuer|
|count|integer|false|none|total count|

## dashboard.base.sources

<a id="schemadashboard.base.sources"></a>

```json
{
  "top": [
    {
      "name": "string",
      "count": 0
    }
  ],
  "total_current": 0,
  "total_previous": 0,
  "chart": [
    {
      "label": "string",
      "value": 0
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|top|[[dashboard.base.sources.top.item](#schemadashboard.base.sources.top.item)]|false|none|array of objects with information about top 5 issuers url|
|total_current|integer|false|none|transactions total count by chosen period|
|total_previous|integer|false|none|transactions total count by previous period to chosen period|
|chart|[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|false|none|array contain objects for chart drawing|

## dashboard.base

<a id="schemadashboard.base"></a>

```json
{
  "revenue_by_country": {
    "top": [
      {
        "country": "string",
        "amount": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "currency": "string",
    "chart": {
      "label": "string",
      "amount": 0
    }
  },
  "sales_today": {
    "top": [
      {
        "name": "string",
        "count": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  },
  "sources": {
    "top": [
      {
        "name": "string",
        "count": 0
      }
    ],
    "total_current": 0,
    "total_previous": 0,
    "chart": [
      {
        "label": "string",
        "value": 0
      }
    ]
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|revenue_by_country|[dashboard.base.revenue_by_country](#schemadashboard.base.revenue_by_country)|false|none|object contain information for block revenue by country|
|sales_today|[dashboard.base.sales_today](#schemadashboard.base.sales_today)|false|none|object contain information for block sales today|
|sources|[dashboard.base.sources](#schemadashboard.base.sources)|false|none|object contain information for block sources|

## merchant_balance

<a id="schemamerchant_balance"></a>

```json
{
  "merchant_id": "string",
  "currency": "string",
  "debit": 0,
  "credit": "string",
  "rolling_reserve": 0,
  "total": 0,
  "created_at": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|merchant_id|string|false|none|merchant identificator|
|currency|string|false|none|currency|
|debit|number|false|none|balance debit|
|credit|string|false|none|balance credit|
|rolling_reserve|number|false|none|current rooling reserve balance|
|total|number|false|none|total amount|
|created_at|string|false|none|last update date|

## billingPayoutDocument

<a id="schemabillingpayoutdocument"></a>

```json
{
  "id": "string",
  "source_id": [
    "string"
  ],
  "transaction": "string",
  "total_fees": 0,
  "balance": 0,
  "currency": "string",
  "status": "string",
  "description": "string",
  "destination": {
    "name": "string",
    "address": "string",
    "account_number": "string",
    "swift": "string",
    "details": "string",
    "correspondent_account": "string"
  },
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "arrival_date": "2019-11-18T09:55:34Z",
  "failure_code": "string",
  "failure_message": "string",
  "failure_transaction": "string",
  "merchant_id": "string",
  "period_from": "2019-11-18T09:55:34Z",
  "period_to": "2019-11-18T09:55:34Z",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|document id|
|source_id|[string]|false|none|royalty reports id|
|transaction|string|false|none|transaction id|
|total_fees|number(double)|false|none|total_fees|
|balance|number(double)|false|none|amount|
|currency|string|false|none|currency|
|status|string|false|none|status, one of skip pending in_progress paid canceled failed|
|description|string|false|none|description|
|destination|[onboarding.Banking](#schemaonboarding.banking)|false|none|merchant banking details|
|created_at|string(date-time)|false|none|creation date|
|updated_at|string(date-time)|false|none|update date|
|arrival_date|string(date-time)|false|none|arrival date|
|failure_code|string|false|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message|string|false|none|failure message|
|failure_transaction|string|false|none|failure transaction|
|merchant_id|string|false|none|merchant identificator|
|period_from|string(date-time)|false|none|payout period start|
|period_to|string(date-time)|false|none|payout period end|
|operating_company_id|string|false|none|operating company id|

## payout_documents_list

<a id="schemapayout_documents_list"></a>

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "source_id": [
        "string"
      ],
      "transaction": "string",
      "total_fees": 0,
      "balance": 0,
      "currency": "string",
      "status": "string",
      "description": "string",
      "destination": {
        "name": "string",
        "address": "string",
        "account_number": "string",
        "swift": "string",
        "details": "string",
        "correspondent_account": "string"
      },
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "arrival_date": "2019-11-18T09:55:34Z",
      "failure_code": "string",
      "failure_message": "string",
      "failure_transaction": "string",
      "merchant_id": "string",
      "period_from": "2019-11-18T09:55:34Z",
      "period_to": "2019-11-18T09:55:34Z",
      "operating_company_id": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|number|false|none|number of found documents|
|items|[[billingPayoutDocument](#schemabillingpayoutdocument)]|false|none|array with documents|

## payout_documents_create

<a id="schemapayout_documents_create"></a>

```json
{
  "merchant_id": "string",
  "description": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|merchant_id|string|false|none|merchant identificator to create payout document for|
|description|string|false|none|document description|

## payout_documents_update

<a id="schemapayout_documents_update"></a>

```json
{
  "transaction": "string",
  "status": "string",
  "failure_code": "string",
  "failure_message": "string",
  "failure_transaction": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|transaction|string|false|none|transaction id|
|status|string|false|none|status, one of skip pending in_progress paid canceled failed|
|failure_code|string|false|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message|string|false|none|failure message|
|failure_transaction|string|false|none|failure transaction|

## price

<a id="schemaprice"></a>

```json
{
  "amount": 0,
  "currency": "string",
  "region": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number|false|none|price amount|
|currency|string|false|none|price currency. three-letter ISO 4217 currency code, in uppercase.|
|region|string|false|none|region name for this price. available regions: oceania, eu, cis, north_europe, north_africa, polynesia, north_america, central_africa, south_europe, antarctica, south_america, south_asia, caribbean, west_asia, central_america, west_africa, southern_africa, southeast_asia, east_africa, east_asia, micronesia, west_europe, latin_america, melanesia, russia, sub_saharan_africa, south_africa|

## product

<a id="schemaproduct"></a>

```json
{
  "id": "string",
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {},
  "billing_type": "real"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|product identifier|
|project_id|string|false|none|project identifier for which created product|
|object|string|false|none|system constant conteined returning object type. for product object always must be - product|
|type|string|false|none|product type|
|sku|string|false|none|product sku (simple slug name)|
|name|object|false|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency|string|false|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled|boolean|false|none|true is product is enabled|
|prices|[[price](#schemaprice)]|false|none|array of available prices for product|
|description|object|false|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description|object|false|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was updated at last time|
|images|[string]|false|none|array of product images. if images not set then field can be null|
|url|string|false|none|url to product on project side|
|metadata|object|false|none|object can contain any other information about product. object must contain only string values|
|billing_type|string|false|none|Type of billing|

#### Enumerated Values

|Property|Value|
|---|---|
|billing_type|real|
|billing_type|virtual|

## product.create_or_update

<a id="schemaproduct.create_or_update"></a>

```json
{
  "project_id": "string",
  "object": "string",
  "type": "string",
  "sku": "string",
  "name": {},
  "default_currency": "string",
  "enabled": true,
  "prices": [
    {
      "amount": 0,
      "currency": "string",
      "region": "string"
    }
  ],
  "description": {},
  "long_description": {},
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  },
  "images": [
    "string"
  ],
  "url": "string",
  "metadata": {}
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|project_id|string|false|none|project identifier for which created product|
|object|string|false|none|system constant conteined returning object type. for product object always must be - product|
|type|string|false|none|product type|
|sku|string|false|none|product sku (simple slug name)|
|name|object|false|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency|string|false|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled|boolean|false|none|true is product is enabled|
|prices|[[price](#schemaprice)]|false|none|array of available prices for product|
|description|object|false|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description|object|false|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|time when retes record was updated at last time|
|images|[string]|false|none|array of product images. if images not set then field can be null|
|url|string|false|none|url to product on project side|
|metadata|object|false|none|object can contain any other information about product. object must contain only string values|

## billingRoyaltyReport

<a id="schemabillingroyaltyreport"></a>

```json
{
  "id": "string",
  "merchant_id": "string",
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "payout_date": "2019-11-18T09:55:34Z",
  "status": "string",
  "period_from": "2019-11-18T09:55:34Z",
  "period_to": "2019-11-18T09:55:34Z",
  "accept_expire_at": "2019-11-18T09:55:34Z",
  "accepted_at": "2019-11-18T09:55:34Z",
  "totals": {
    "transactions_count": 0,
    "fee_amount": 0,
    "vat_amount": 0,
    "payout_amount": 0,
    "rolling_reserve_amount": 0,
    "correction_amount": 0
  },
  "currency": "string",
  "summary": {
    "products_items": [
      {
        "product": "string",
        "region": "string",
        "total_transactions": 0,
        "sales_count": 0,
        "gross_sales_amount": 0,
        "returns_count": 0,
        "gross_returns_amount": 0,
        "gross_total_amount": 0,
        "total_fees": 0,
        "total_vat": 0,
        "payout_amount": 0
      }
    ],
    "products_total": {
      "product": "string",
      "region": "string",
      "total_transactions": 0,
      "sales_count": 0,
      "gross_sales_amount": 0,
      "returns_count": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "total_fees": 0,
      "total_vat": 0,
      "payout_amount": 0
    },
    "corrections": [
      {
        "accounting_entry_id": "string",
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "entry_date": "2019-11-18T09:55:34Z"
      }
    ],
    "rolling_reserves": [
      {
        "accounting_entry_id": "string",
        "amount": 0,
        "currency": "string",
        "reason": "string",
        "entry_date": "2019-11-18T09:55:34Z"
      }
    ]
  },
  "dispute_reason": "string",
  "dispute_started_at": "2019-11-18T09:55:34Z",
  "dispute_closed_at": "2019-11-18T09:55:34Z",
  "is_auto_accepted": true,
  "payout_document_id": "string",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|report id|
|merchant_id|string|false|none|merchant id|
|created_at|string(date-time)|false|none|date of report creation|
|updated_at|string(date-time)|false|none|date of report last update|
|payout_date|string(date-time)|false|none|date when report was paid|
|status|string|false|none|status of report|
|period_from|string(date-time)|false|none|start of report time period|
|period_to|string(date-time)|false|none|end of report time period|
|accept_expire_at|string(date-time)|false|none|date when report will be auto-accepted, if merchant didn't accept or start a dispute yet|
|accepted_at|string(date-time)|false|none|date when report was accepted|
|totals|[billingRoyaltyReportTotals](#schemabillingroyaltyreporttotals)|false|none|totals section of report|
|currency|string|false|none|currency of report|
|summary|[billingRoyaltyReportSummary](#schemabillingroyaltyreportsummary)|false|none|summary section|
|dispute_reason|string|false|none|reason of dispute (if it was started)|
|dispute_started_at|string(date-time)|false|none|date of dispute beginning (if it was started)|
|dispute_closed_at|string(date-time)|false|none|date of dispute resolve (if it was started)|
|is_auto_accepted|boolean(boolean)|false|none|flag of auto-acceptance|
|payout_document_id|string|false|none|cross-link to payout invoice, that includes this royalty report|
|operating_company_id|string|false|none|operating company id|

## billingRoyaltyReportCorrectionItem

<a id="schemabillingroyaltyreportcorrectionitem"></a>

```json
{
  "accounting_entry_id": "string",
  "amount": 0,
  "currency": "string",
  "reason": "string",
  "entry_date": "2019-11-18T09:55:34Z"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|accounting_entry_id|string|false|none|linked accounting entry id|
|amount|number(double)|false|none|amount of correction|
|currency|string|false|none|currency|
|reason|string|false|none|reason if correction|
|entry_date|string(date-time)|false|none|date of correction|

## billingRoyaltyReportProductSummaryItem

<a id="schemabillingroyaltyreportproductsummaryitem"></a>

```json
{
  "product": "string",
  "region": "string",
  "total_transactions": 0,
  "sales_count": 0,
  "gross_sales_amount": 0,
  "returns_count": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "total_fees": 0,
  "total_vat": 0,
  "payout_amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|product|string|false|none|product or project name|
|region|string|false|none|country ISO Alpha2 code|
|total_transactions|integer(int32)|false|none|total number of transactions for current product/project in current country (including sales and returns)|
|sales_count|integer(int32)|false|none|number of sales for current product/project in current country|
|gross_sales_amount|number(double)|false|none|gross amount of sales for current product/project in current country|
|returns_count|integer(int32)|false|none|number of returns for current product/project in current country|
|gross_returns_amount|number(double)|false|none|gross amount of returns for current product/project in current country|
|gross_total_amount|number(double)|false|none|resulting gross amount for current product/project in current country (sales minus returns)|
|total_fees|number(double)|false|none|fees amount for current product/project in current country|
|total_vat|number(double)|false|none|vat amount for current product/project in current country|
|payout_amount|number(double)|false|none|payout amount for current product/project in current country|

## billingRoyaltyReportSummary

<a id="schemabillingroyaltyreportsummary"></a>

```json
{
  "products_items": [
    {
      "product": "string",
      "region": "string",
      "total_transactions": 0,
      "sales_count": 0,
      "gross_sales_amount": 0,
      "returns_count": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "total_fees": 0,
      "total_vat": 0,
      "payout_amount": 0
    }
  ],
  "products_total": {
    "product": "string",
    "region": "string",
    "total_transactions": 0,
    "sales_count": 0,
    "gross_sales_amount": 0,
    "returns_count": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "total_fees": 0,
    "total_vat": 0,
    "payout_amount": 0
  },
  "corrections": [
    {
      "accounting_entry_id": "string",
      "amount": 0,
      "currency": "string",
      "reason": "string",
      "entry_date": "2019-11-18T09:55:34Z"
    }
  ],
  "rolling_reserves": [
    {
      "accounting_entry_id": "string",
      "amount": 0,
      "currency": "string",
      "reason": "string",
      "entry_date": "2019-11-18T09:55:34Z"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|products_items|[[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)]|false|none|summary details for each product/project and country|
|products_total|[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)|false|none|summary totals for all product/project and country|
|corrections|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of corrections applied (if any)|
|rolling_reserves|[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|false|none|list of rolling reserves applied (if any)|

## billingRoyaltyReportTotals

<a id="schemabillingroyaltyreporttotals"></a>

```json
{
  "transactions_count": 0,
  "fee_amount": 0,
  "vat_amount": 0,
  "payout_amount": 0,
  "rolling_reserve_amount": 0,
  "correction_amount": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|transactions_count|integer(int32)|false|none|total transactions count (including sales and returns)|
|fee_amount|number(double)|false|none|fees amount|
|vat_amount|number(double)|false|none|vat amount|
|payout_amount|number(double)|false|none|payput amount|
|rolling_reserve_amount|number(double)|false|none|applied rolling reserve total amount|
|correction_amount|number(double)|false|none|applied corrections total amount|

## grpcChangeRoyaltyReport

<a id="schemagrpcchangeroyaltyreport"></a>

```json
{
  "status": "string",
  "reason": "string",
  "correction": {
    "amount": 0,
    "reason": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|status|string|false|none|new report status|
|reason|string|true|none|correction reason|
|correction|[grpcChangeRoyaltyReportCorrection](#schemagrpcchangeroyaltyreportcorrection)|false|none|none|

## grpcChangeRoyaltyReportCorrection

<a id="schemagrpcchangeroyaltyreportcorrection"></a>

```json
{
  "amount": 0,
  "reason": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|amount|number(double)|true|none|correction amount (in report's currency)|
|reason|string|true|none|correction reason|

## grpcRoyaltyReportsPaginate

<a id="schemagrpcroyaltyreportspaginate"></a>

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "merchant_id": "string",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "payout_date": "2019-11-18T09:55:34Z",
      "status": "string",
      "period_from": "2019-11-18T09:55:34Z",
      "period_to": "2019-11-18T09:55:34Z",
      "accept_expire_at": "2019-11-18T09:55:34Z",
      "accepted_at": "2019-11-18T09:55:34Z",
      "totals": {
        "transactions_count": 0,
        "fee_amount": 0,
        "vat_amount": 0,
        "payout_amount": 0,
        "rolling_reserve_amount": 0,
        "correction_amount": 0
      },
      "currency": "string",
      "summary": {
        "products_items": [
          {
            "product": "string",
            "region": "string",
            "total_transactions": 0,
            "sales_count": 0,
            "gross_sales_amount": 0,
            "returns_count": 0,
            "gross_returns_amount": 0,
            "gross_total_amount": 0,
            "total_fees": 0,
            "total_vat": 0,
            "payout_amount": 0
          }
        ],
        "products_total": {
          "product": "string",
          "region": "string",
          "total_transactions": 0,
          "sales_count": 0,
          "gross_sales_amount": 0,
          "returns_count": 0,
          "gross_returns_amount": 0,
          "gross_total_amount": 0,
          "total_fees": 0,
          "total_vat": 0,
          "payout_amount": 0
        },
        "corrections": [
          {
            "accounting_entry_id": "string",
            "amount": 0,
            "currency": "string",
            "reason": "string",
            "entry_date": "2019-11-18T09:55:34Z"
          }
        ],
        "rolling_reserves": [
          {
            "accounting_entry_id": "string",
            "amount": 0,
            "currency": "string",
            "reason": "string",
            "entry_date": "2019-11-18T09:55:34Z"
          }
        ]
      },
      "dispute_reason": "string",
      "dispute_started_at": "2019-11-18T09:55:34Z",
      "dispute_closed_at": "2019-11-18T09:55:34Z",
      "is_auto_accepted": true,
      "payout_document_id": "string",
      "operating_company_id": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|integer(int32)|false|none|total items count|
|items|[[billingRoyaltyReport](#schemabillingroyaltyreport)]|false|none|royalty reports|

## grpcPaylinksPaginate

<a id="schemagrpcpaylinkspaginate"></a>

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "object": "string",
      "products": [
        "string"
      ],
      "expires_at": "2019-11-18T09:55:34Z",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "merchant_id": "string",
      "project_id": "string",
      "name": "string",
      "is_expired": true,
      "visits": 0,
      "no_expiry_date": true,
      "products_type": "string",
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "conversion": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|integer(int32)|false|none|none|
|items|[[paylinkPaylink](#schemapaylinkpaylink)]|false|none|none|

## paylinkGroupStatCommon

<a id="schemapaylinkgroupstatcommon"></a>

```json
{
  "top": [
    {
      "paylink_id": "string",
      "visits": 0,
      "total_transactions": 0,
      "sales_count": 0,
      "returns_count": 0,
      "gross_sales_amount": 0,
      "gross_returns_amount": 0,
      "gross_total_amount": 0,
      "transactions_currency": "string",
      "conversion": 0,
      "country_code": "string",
      "date": "string",
      "referrer_host": "string",
      "utm": {
        "utm_source": "string",
        "utm_medium": "string",
        "utm_campaign": "string"
      }
    }
  ],
  "total": {
    "paylink_id": "string",
    "visits": 0,
    "total_transactions": 0,
    "sales_count": 0,
    "returns_count": 0,
    "gross_sales_amount": 0,
    "gross_returns_amount": 0,
    "gross_total_amount": 0,
    "transactions_currency": "string",
    "conversion": 0,
    "country_code": "string",
    "date": "string",
    "referrer_host": "string",
    "utm": {
      "utm_source": "string",
      "utm_medium": "string",
      "utm_campaign": "string"
    }
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|top|[[paylinkStatCommon](#schemapaylinkstatcommon)]|false|none|top items of grouping stat data|
|total|[paylinkStatCommon](#schemapaylinkstatcommon)|false|none|overall results of grouping stat data|

## paylinkPaylink

<a id="schemapaylinkpaylink"></a>

```json
{
  "id": "string",
  "object": "string",
  "products": [
    "string"
  ],
  "expires_at": "2019-11-18T09:55:34Z",
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "merchant_id": "string",
  "project_id": "string",
  "name": "string",
  "is_expired": true,
  "visits": 0,
  "no_expiry_date": true,
  "products_type": "string",
  "total_transactions": 0,
  "sales_count": 0,
  "returns_count": 0,
  "conversion": 0,
  "gross_sales_amount": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "transactions_currency": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|paylink id|
|object|string|false|none|object type|
|products|[string]|false|none|list of products included to paylink|
|expires_at|string(date-time)|false|none|expiration date|
|created_at|string(date-time)|false|none|creation date|
|updated_at|string(date-time)|false|none|last updation date|
|merchant_id|string|false|none|paylink merchant id"|
|project_id|string|false|none|paylink project id"|
|name|string|false|none|paylink name|
|is_expired|boolean(boolean)|false|none|is expired flag|
|visits|integer(int32)|false|none|total visits count|
|no_expiry_date|boolean(boolean)|false|none|no expiry date flag|
|products_type|string|false|none|products type|
|total_transactions|integer(int32)|false|none|total transactions count|
|sales_count|integer(int32)|false|none|sales count|
|returns_count|integer(int32)|false|none|returns count|
|conversion|number(double)|false|none|conversion (sales per visits relation)|
|gross_sales_amount|number(double)|false|none|gross sales amount|
|gross_returns_amount|number(double)|false|none|gross returns amount|
|gross_total_amount|number(double)|false|none|gross total amount|
|transactions_currency|string|false|none|transactions currency ISO code|

## paylinkStatCommon

<a id="schemapaylinkstatcommon"></a>

```json
{
  "paylink_id": "string",
  "visits": 0,
  "total_transactions": 0,
  "sales_count": 0,
  "returns_count": 0,
  "gross_sales_amount": 0,
  "gross_returns_amount": 0,
  "gross_total_amount": 0,
  "transactions_currency": "string",
  "conversion": 0,
  "country_code": "string",
  "date": "string",
  "referrer_host": "string",
  "utm": {
    "utm_source": "string",
    "utm_medium": "string",
    "utm_campaign": "string"
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|paylink_id|string|false|none|paylink id|
|visits|integer(int32)|false|none|total visits count|
|total_transactions|integer(int32)|false|none|total transactions count|
|sales_count|integer(int32)|false|none|sales count|
|returns_count|integer(int32)|false|none|returns count|
|gross_sales_amount|number(double)|false|none|gross sales amount|
|gross_returns_amount|number(double)|false|none|gross returns amount|
|gross_total_amount|number(double)|false|none|gross total amount|
|transactions_currency|string|false|none|transactions currency ISO code|
|conversion|number(double)|false|none|conversion, optional|
|country_code|string|false|none|country iso code A2, optional|
|date|string|false|none|date yyyy-mm-dd, optional|
|referrer_host|string|false|none|referrer host value, optional|
|utm|[paylinkUtm](#schemapaylinkutm)|false|none|utm stat values, optional|

## paylinkUtm

<a id="schemapaylinkutm"></a>

```json
{
  "utm_source": "string",
  "utm_medium": "string",
  "utm_campaign": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|utm_source|string|false|none|utm_source value|
|utm_medium|string|false|none|utm_medium value|
|utm_campaign|string|false|none|utm_campaign value|

## createPaylinkRequest

<a id="schemacreatepaylinkrequest"></a>

```json
{
  "id": "string",
  "products": [
    "string"
  ],
  "expires_at": 0,
  "project_id": "string",
  "name": "string",
  "no_expiry_date": true,
  "products_type": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|paylink id, optional, used only for edit existing paylink|
|products|[string]|false|none|list of products included to paylink|
|expires_at|number|false|none|expiration date as unix timestamp|
|project_id|string|false|none|paylink project id"|
|name|string|false|none|paylink name|
|no_expiry_date|boolean(boolean)|false|none|no expiry date flag|
|products_type|string|false|none|products type|

## billingVatReport

<a id="schemabillingvatreport"></a>

```json
{
  "id": "string",
  "country": "string",
  "vat_rate": 0,
  "currency": "string",
  "transactions_count": 0,
  "gross_revenue": 0,
  "vat_amount": 0,
  "fees_amount": 0,
  "deduction_amount": 0,
  "correction_amount": 0,
  "status": "string",
  "country_annual_turnover": 0,
  "world_annual_turnover": 0,
  "amounts_approximate": true,
  "date_from": "2019-11-18T09:55:34Z",
  "date_to": "2019-11-18T09:55:34Z",
  "pay_until_date": "2019-11-18T09:55:34Z",
  "created_at": "2019-11-18T09:55:34Z",
  "updated_at": "2019-11-18T09:55:34Z",
  "paid_at": "2019-11-18T09:55:34Z",
  "operating_company_id": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|vat report id|
|country|string|false|none|country ISO A2 code|
|vat_rate|number(double)|false|none|rate value of VAT|
|currency|string|false|none|vat currency ISO code|
|transactions_count|integer(int32)|false|none|total transactions count in period|
|gross_revenue|number(double)|false|none|gross revenue amount in period|
|vat_amount|number(double)|false|none|vat amount in period|
|fees_amount|number(double)|false|none|fees amount in period|
|deduction_amount|number(double)|false|none|deduction amount in period|
|correction_amount|number(double)|false|none|manual correction amount in period|
|status|string|false|none|status|
|country_annual_turnover|number(double)|false|none|annual turnover for country|
|world_annual_turnover|number(double)|false|none|world annual turnover|
|amounts_approximate|boolean(boolean)|false|none|flag of non-final amounts due to currency exchange rates delay|
|date_from|string(date-time)|false|none|period start date|
|date_to|string(date-time)|false|none|period end date|
|pay_until_date|string(date-time)|false|none|VAT payment deadline date|
|created_at|string(date-time)|false|none|report creation date|
|updated_at|string(date-time)|false|none|report last update date|
|paid_at|string(date-time)|false|none|date of payment|
|operating_company_id|string|false|none|operating company id|

## grpcVatReportsPaginate

<a id="schemagrpcvatreportspaginate"></a>

```json
{
  "count": 0,
  "items": [
    {
      "id": "string",
      "country": "string",
      "vat_rate": 0,
      "currency": "string",
      "transactions_count": 0,
      "gross_revenue": 0,
      "vat_amount": 0,
      "fees_amount": 0,
      "deduction_amount": 0,
      "correction_amount": 0,
      "status": "string",
      "country_annual_turnover": 0,
      "world_annual_turnover": 0,
      "amounts_approximate": true,
      "date_from": "2019-11-18T09:55:34Z",
      "date_to": "2019-11-18T09:55:34Z",
      "pay_until_date": "2019-11-18T09:55:34Z",
      "created_at": "2019-11-18T09:55:34Z",
      "updated_at": "2019-11-18T09:55:34Z",
      "paid_at": "2019-11-18T09:55:34Z",
      "operating_company_id": "string"
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|count|integer(int32)|false|none|total reports count|
|items|[[billingVatReport](#schemabillingvatreport)]|false|none|reports|

## saved_card.remove.request

<a id="schemasaved_card.remove.request"></a>

```json
{
  "id": "string",
  "cookie": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|true|none|saved card identifier|
|cookie|string|true|none|customer cookie value got on payment form data|

## operating_company

<a id="schemaoperating_company"></a>

```json
{
  "id": "string",
  "name": "string",
  "country": "string",
  "registration_number": "string",
  "registration_date": "string",
  "vat_number": "string",
  "address": "string",
  "vat_address": "string",
  "signatory_name": "string",
  "signatory_position": "string",
  "banking_details": "string",
  "payment_countries": [
    "string"
  ],
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|string|false|none|operating company id|
|name|string|false|none|operating company name|
|country|string|false|none|country|
|registration_number|string|false|none|registration_number|
|registration_date|string|false|none|registration date|
|vat_number|string|false|none|vat_number|
|address|string|false|none|address|
|vat_address|string|false|none|address for VAT purposes|
|signatory_name|string|false|none|signatory_name|
|signatory_position|string|false|none|signatory_position|
|banking_details|string|false|none|banking_details|
|payment_countries|[string]|false|none|banking_details|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when operating company created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when operating company updated at last time|

## operating_company_list

<a id="schemaoperating_company_list"></a>

```json
{
  "items": [
    {
      "id": "string",
      "name": "string",
      "country": "string",
      "registration_number": "string",
      "registration_date": "string",
      "vat_number": "string",
      "address": "string",
      "vat_address": "string",
      "signatory_name": "string",
      "signatory_position": "string",
      "banking_details": "string",
      "payment_countries": [
        "string"
      ],
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      }
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[operating_company](#schemaoperating_company)]|false|none|list of operating companies|

## payment_min_limit_system

<a id="schemapayment_min_limit_system"></a>

```json
{
  "currency": "string",
  "amount": "string",
  "created_at": {
    "seconds": 0,
    "nanos": 0
  },
  "updated_at": {
    "seconds": 0,
    "nanos": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|currency|string|false|none|limit currency|
|amount|string|false|none|limit value|
|created_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when operating company created|
|updated_at|[ProtobufTimestamp](#schemaprotobuftimestamp)|false|none|object contain information about time when operating company updated at last time|

## payment_min_limit_system_list

<a id="schemapayment_min_limit_system_list"></a>

```json
{
  "items": [
    {
      "currency": "string",
      "amount": "string",
      "created_at": {
        "seconds": 0,
        "nanos": 0
      },
      "updated_at": {
        "seconds": 0,
        "nanos": 0
      }
    }
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|items|[[payment_min_limit_system](#schemapayment_min_limit_system)]|false|none|list of payment minimum limits system|

