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

`POST /api/v1/order`

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

### Parameters

|Parameter|Type|Description|
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

> Example responses

> 200 Response

```json
{
  "id": "string",
  "payment_form_url": "string"
}
```

### Responses

|Status|Description|Schema|
|---|---|---|
|200|Object which contain data to render payment form|[CreateOrderResponse](#schemacreateorderresponse)|
|400|Object with error message|[ErrorMessage](#schemaerrormessage)|
|500|Object with error message|[ErrorMessage](#schemaerrormessage)|

### Schemas

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|code_a2 |string|none|2 chars ISO 3166-1 country code|
|code_a3 |string|none|3 chars ISO 3166-1 country code|
|code_int |integer|none|numeric ISO 3166-1 country code|
|created_at |string|none|date of create country in system|
|is_active |boolean|none|is country active|
|name |[model.Name](#schemamodel.name)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|message |string|none|A description of the error.|
|code |string|none|A status code of the error.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city |string|none|user's city|
|zip |string|none|postal code|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|item identifier|
|object |string|none|item type|
|sku |string|none|item sku identifier|
|name |string|none|item name|
|description |string|none|item description|
|amount |number|none|item price|
|currency |string|none|item price currency. three-letter ISO 4217 currency code, in uppercase.|
|images |[string]|none|list of urls to item images|
|url |object|none|url to item on project site|
|metadata |object|none|object contain item metadata|
|code |string|none|item code|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|platform_id |string|none|item platform identifier|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|The unique identifier for the order.|
|payment_form_url |string|none|The PaySuper-hosted URL of payment form.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account |string|none|user account, may be null|
|has_vat |boolean|none|flag to show VAT commission amount in payment form|
|vat |number|none|VAT amount|
|amount |number|none|order amount without VAT|
|total_amount |number|none|total order amount with VAT|
|currency |string|none|order currency|
|user_address_data_required |boolean|none|flag to get information about user real geo position|
|id |string|none|order unique identifier|
|payment_methods |[[model.PaymentMethodJsonOrderResponse](#schemamodel.paymentmethodjsonorderresponse)]|none|contain data about payment methods|
|project |[model.ProjectJsonOrderResponse](#schemamodel.projectjsonorderresponse)|none|none|
|token |string|none|access token to websocket private chanel|
|user_ip_data |[CreateOrderResponse.user.address](#schemacreateorderresponse.user.address)|none|none|
|items |[[CreateOrderResponse.item](#schemacreateorderresponse.item)]|none|list of buyed items in order|
|cookie |string|none|value to set to cookie for user identification. if user was identified by other data than value can be empty.|
|email |string|none|user email|
|description |string|none|order description|
|country_payments_allowed |boolean|none|true is payments from user country is allowed|
|country_change_allowed |boolean|none|true if user can change self country if payments from his country disallow|
|platforms |[string]|none|list of supported platforms if this payment with type key (for other types this field can be empty)|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|en |string|none|english name|
|ru |string|none|russian name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|address |string|none|user wallet address in crypto payment system. required only for crypto payment|
|card_holder |string|none|bank card card holder name. required only for bank card payment|
|cvv |integer|none|bank card cvv code. required only for bank card payment|
|ewallet |string|none|user account in ewallet payment system. required only for ewallet payment|
|month |integer|none|month of expire date of user bank card. required only for bank card payment|
|order_id |string|none|unique identifier of order on PSP (P1) side|
|pan |string|none|user bank card number. required only for bank card payment|
|payment_method_id |string|none|unique identifier of payment method by PSP (P1) classifier|
|year |integer|none|year of expire date of user bank card. required only for bank card payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|project unique identifier|
|merchant_id |string|none|project merchant unique identifier|
|url_success |string|none|url for redirect user after successfully completed payment|
|url_fail |string|none|url for redirect user after failed payment|
|send_notify_email |boolean|none|flag to send notification emails by "notify_emails" list after successfully completed payment|
|notify_emails |[string]|none|emails list to send notification email after successfully completed payment|
|secret_key |string|none|project secret key|
|url_check_account |string|none|callback url to check payment requisites|
|url_process_payment |string|none|callback url to send payment complete request|
|callback_protocol |string|none|type of callback notification protocol. now available next values: empty - notification request not send, order just mark as successfully complete; default - notification request send by PaySuper notification protocol;|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|first6 |string|none|string representing the first 6 digits of the card. Available only for a card method|
|last4 |string|none|string representing the last 4 digits of the card. Available only for a card method|
|masked |string|none|masked pan of bank card|
|expiry_month |string|none|month of expiration bank card|
|expiry_year |string|none|year of expiration bank card|
|brand |string|none|bank card brand|
|fingerprint |string|none|string representing the internal fingerprint for given card|
|secure3d |boolean|none|true is 3DS secure was used during payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|brand |string|none|name of payment system|
|account |string|none|payer wallet number in payment system|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|brand |string|none|name of crypto currency system|
|address |string|none|payer address in crypto cyrrency system|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|title |string|none|payment method name|
|external_id |string|none|payment method identifier in payment system|
|payment_system_id |string|none|payment system identifier|
|saved |boolean|none|true is payment method was saved by user for future usage|
|card |[order.payment_method.card](#schemaorder.payment_method.card)|none|none|
|wallet |[order.payment_method.wallet](#schemaorder.payment_method.wallet)|none|none|
|crypto_currency |[order.payment_method.crypto_currency](#schemaorder.payment_method.crypto_currency)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city |string|none|user's city|
|postal_code |string|none|postal code|
|state |string|none|state name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|customer identity identifier|
|object |string|none|constant with object name|
|external_id |string|none|user identifier in project|
|name |string|none|user name|
|email |string|none|user email|
|email_verified |boolean|none|true is email was verified|
|phone |string|none|user phone|
|phone_verified |boolean|none|true is phone was verified|
|ip |string|none|user ip address|
|locale |string|none|user's locale. two-letter code in lowercase|
|address |[order.user.address](#schemaorder.user.address)|none|none|
|metadata |object|none|set of key-value pairs that attached to an object on create order state|
|notify_new_region |boolean|none|true is user wanting to receiving notification when paysuper will work in user's region|
|notify_new_region_email |string|none|user's email to send notification email when paysuper starting work in user's region|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|entry amount|
|currency |string|none|entry currency. three-letter ISO 4217 currency code, in uppercase.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|uuid |string|none|order unique identifier|
|total_payment_amount |number|none|payment amount|
|currency |string|none|payment currency. three-letter ISO 4217 currency code, in uppercase.|
|project |[order.project](#schemaorder.project)|none|none|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|transaction |string|none|unique identifier for the transaction in payment system|
|transaction_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|payment_method |[order.payment_method](#schemaorder.payment_method)|none|none|
|country_code |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|merchant_id |string|none|project merchant unique identifier|
|locale |string|none|user's locale. two-letter code in lowercase|
|status |string|none|string representing the order current status. possible statuses: created - the order created but not processed yet; canceled - the order was canceled and money refunded to user; rejected - the order was rejected by payment system with any reasons; processed - the order was processed in payment system;|
|user |[order.user](#schemaorder.user)|none|none|
|billing_address |[order.user.address](#schemaorder.user.address)|none|none|
|type |string|none|constant with object type|
|is_vat_deduction |boolean|none|true is vat deduction|
|gross_revenue |[order.money](#schemaorder.money)|none|none|
|tax_fee |[order.money](#schemaorder.money)|none|none|
|tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|tax_fee_total |[order.money](#schemaorder.money)|none|none|
|method_fee_total |[order.money](#schemaorder.money)|none|none|
|method_fee_tariff |[order.money](#schemaorder.money)|none|none|
|method_fixed_fee_tariff |[order.money](#schemaorder.money)|none|none|
|paysuper_fixed_fee |[order.money](#schemaorder.money)|none|none|
|fees_total |[order.money](#schemaorder.money)|none|none|
|fees_total_local |[order.money](#schemaorder.money)|none|none|
|net_revenue |[order.money](#schemaorder.money)|none|none|
|refund_gross_revenue |[order.money](#schemaorder.money)|none|none|
|method_refund_fee_tariff |[order.money](#schemaorder.money)|none|none|
|merchant_refund_fixed_fee_tariff |[order.money](#schemaorder.money)|none|none|
|refund_tax_fee |[order.money](#schemaorder.money)|none|none|
|refund_tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|paysuper_refund_tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|refund_reverse_revenue |[order.money](#schemaorder.money)|none|none|
|refund_fees_total |[order.money](#schemaorder.money)|none|none|
|refund_fees_total_local |[order.money](#schemaorder.money)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer|none|total count of selected orders|
|items |[[order.public](#schemaorder.public)]|none|array of selected orders|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|external_id |string|none|The user unique identifier on the merchant side.|
|name |string|none|The user's name.|
|email |string|none|The user's email address.|
|email_verified |boolean|none|Whether the user's email address has been verified on the merchant side.|
|phone |string|none|The user's phone number.|
|phone_verified |boolean|none|Whether the user’s phone number has been verified on the merchant side.|
|ip |string|none|The user's IP address.|
|locale |string|none|The user's locale name. Two-letter language code by ISO 639-1, in lowercase.|
|address |[Order.BillingAddress](#schemaorder.billingaddress)|none|none|
|metadata |object|none|A string-value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account |string|none|The user unique account in the Project.|
|amount |number|none|The order amount as a positive number. It is required for a simple checkout payment.|
|currency |string|none|The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.|
|description |string|none|The arbitrary order description.|
|order_id |string|none|The unique order identifier on the merchant side. This field is not required, but we recommend sending this field always.|
|project  <br><p style="color: red;">required</p> |string|none|The ID of the Project found in your merchant account in the PaySuper Dashboard.|
|url_fail |string|none|The redirect URL for the failed payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.|
|url_success |string|none|The redirect URL for the successful payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.|
|type  <br><p style="color: red;">required</p> |string|none|The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type.|
|products |[string]|none|The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.|
|platform_id |string|none|The default platform identifier for which customer buys the in-game key. This field used only for a payment type 'key'.|
|token |string|none|An encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.  The token encrypted parameters override the corresponding parameters in an order object even the required parameters.|
|user |[Order.User](#schemaorder.user)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account_regexp |string|none|regexp mask for check main requisite of payment method|
|group_alias |string|none|payment method group alias|
|icon |string|none|url to payment method icon|
|id |string|none|payment method unique identifier|
|name |string|none|payment method name|
|type |string|none|payment method type. allowed: bank_card, ewallet, crypto|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique project identifier|
|merchant_id |string|none|project merchant id|
|image |string|none|url to project logo|
|callback_currency |string|none|currency to send payment notification|
|callback_protocol |string|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls |[string]|none|list of urls rom which you can send a request to create an order|
|status |integer|none|project status. now available: 0 - new project; 1 - project successfully complete integration tests; 2 - project fail one or more integration test; 3 - project in production; 4 - project deleted|
|allow_dynamic_notify_urls |boolean|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls |boolean|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency |string|none|currency for amount's limit|
|max_payment_amount |number|none|maximal amount allowed for create order|
|min_payment_amount |number|none|minimal amount allowed for create order|
|name |object|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails |[string]|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout |boolean|none|is allow create order only with amounts from products list|
|secret_key |string|none|secret key for create check hash for request about order statuses changes|
|send_notify_email |boolean|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account |string|none|default url to send request for verification payment data to project|
|url_process_payment |string|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail |string|none|default url to redirect user after failed payment|
|url_redirect_success |string|none|default url to redirect user after successfully completed payment|
|products_count |integer|none|count of project's products|
|created_at |object|none|date of create merchant in system in unix timestamp|
|updated_at |object|none|date of update merchant in system in unix timestamp|
|localizations |[string]|none|languages for product to localize|
|full_description |object|none|localized full description for product|
|- **additionalProperties** |string|none|none|
|short_description |object|none|localized short description for product|
|- **additionalProperties** |string|none|none|
|cover |object|none|none|
|- images |object|none|none|
|-- **additionalProperties** |string|none|none|
|- use_one_for_all |boolean|none|none|
|virtual_currency |[model.VirtualCurrency](#schemamodel.virtualcurrency)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|logo |string|none|none|
|name |string|none|none|
|SuccessMessage |string|none|none|
|MinPurchaseValue |number(double)|none|none|
|MaxPurchaseValue |number(double)|none|none|
|SellCountType |string|none|none|
|Prices |[[product.Price](#schemaproduct.price)]|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|project name|
|url_fail |string|none|url to redirect user after failed payment. may be NULL if not set in project settings|
|url_success |string|none|url to redirect user after successfully completed payment. may be NULL if not set in project settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|error |string|none|none|
|redirect_url |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|none|
|country  <br><p style="color: red;">required</p> |string|none|none|
|city |string|none|none|
|state |string|none|none|
|zip |string|none|none|
|rate  <br><p style="color: red;">required</p> |number|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|none|
|file_type  <br><p style="color: red;">required</p> |string|none|none|
|report_type  <br><p style="color: red;">required</p> |string|none|none|
|template |string|none|none|
|params  <br><p style="color: red;">required</p> |object|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |number|none|none|
|message |string|none|none|
|file_id |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency  <br><p style="color: red;">required</p> |string|none|none|
|terminal_id |string|none|none|
|secret |string|none|none|
|secret_callback |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|Name of method|
|group_alias |string|none|Name of group for currency type|
|external_id  <br><p style="color: red;">required</p> |string|none|External id|
|currencies |[integer]|none|List of currency int codes|
|min_payment_amount |integer|none|Minimal payment amount|
|max_payment_amount |integer|none|Maximum payment amount|
|type |string|none|Type of payment method|
|account_regexp |string|none|Regular expression for validation|
|is_active |boolean|none|Active or not|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|test_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of test settings|
|production_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of production settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|Payment method identifier|
|name  <br><p style="color: red;">required</p> |string|none|Name of method|
|group_alias |string|none|Name of group for currency type|
|external_id  <br><p style="color: red;">required</p> |string|none|External id|
|currencies |[integer]|none|List of currency int codes|
|min_payment_amount |integer|none|Minimal payment amount|
|max_payment_amount |integer|none|Maximum payment amount|
|type |string|none|Type of payment method|
|account_regexp |string|none|Regular expression for validation|
|is_active |boolean|none|Active or not|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|test_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of test settings|
|production_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of production settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|Payment method identifier|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|params  <br><p style="color: red;">required</p> |[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|person full name|
|email  <br><p style="color: red;">required</p> |string|none|person email|
|phone  <br><p style="color: red;">required</p> |string|none|person contact phone|
|position  <br><p style="color: red;">required</p> |string|none|person position in company|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|person full name|
|email  <br><p style="color: red;">required</p> |string|none|person email|
|phone  <br><p style="color: red;">required</p> |string|none|person contact phone|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|name|
|alternative_name  <br><p style="color: red;">required</p> |string|none|brand|
|website  <br><p style="color: red;">required</p> |string|none|website url|
|country  <br><p style="color: red;">required</p> |string|none|destination country 2 letter code by ISO 3166-1|
|state  <br><p style="color: red;">required</p> |string|none|destination state or region|
|zip  <br><p style="color: red;">required</p> |string|none|destination zip code|
|city  <br><p style="color: red;">required</p> |string|none|destination city|
|address  <br><p style="color: red;">required</p> |string|none|destination address|
|address_additional |string|none|additional company address|
|registration_number |string|none|company registration number|
|tax_id |string|none|company tax identifier|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|authorized  <br><p style="color: red;">required</p> |[onboarding.Contacts.Authorized](#schemaonboarding.contacts.authorized)|none|none|
|technical  <br><p style="color: red;">required</p> |[onboarding.Contacts.Technical](#schemaonboarding.contacts.technical)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|bank name|
|address  <br><p style="color: red;">required</p> |string|none|bank address|
|account_number  <br><p style="color: red;">required</p> |string|none|merchant accounting number in bank|
|swift  <br><p style="color: red;">required</p> |string|none|bank SWIFT code|
|details |string|none|any details abount merchant accounting bank|
|correspondent_account |string|none|bank correspondent account|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|date |integer|none|date in unix timestamp when was last payout to merchant|
|amount |number|none|last payout amount to merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|method_percent_fee |number|none|payment method fee in percents|
|method_fixed_fee |number|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|min_amount |number|none|min payment amount|
|max_amount |number|none|max payment amount|
|method_name |string|none|payment method name|
|method_percent_fee |number|none|payment method fee in percents|
|method_fixed_fee |number|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|ps_percent_fee |number|none|paysuper fee in percents|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency |string|none|currency of paysuper fixed fee.  letters code by ISO 4217|
|merchant_home_region |string|none|merchant region name|
|payer_regions |string|none|payer region name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|payment |[onboarding.Tariff.Payment](#schemaonboarding.tariff.payment)|none|none|
|chargeback |[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|none|none|
|payout |[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|home_region |string|none|merchant home region name. possible values: asia, europe, latin_america, russia_and_cis, worldwide|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|user identifier|
|email |string|none|user email|
|first_name |string|none|user first name|
|last_name |string|none|user last name|
|profile_id |string|none|user primary onboarding profile identifier|
|registration_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|merchant unique identifier in system|
|company |[onboarding.Company](#schemaonboarding.company)|none|none|
|contacts |[onboarding.Contacts](#schemaonboarding.contacts)|none|none|
|banking |[onboarding.Banking](#schemaonboarding.banking)|none|none|
|status |integer|none|merchant status in system|
|created_at |integer|none|date of create merchant in system in unix timestamp|
|updated_at |integer|none|date of update merchant in system in unix timestamp|
|first_payment_at |integer|none|date when was first payment by some merchant project in system in unix timestamp|
|last_payout |[onboarding.Merchant.LastPayout](#schemaonboarding.merchant.lastpayout)|none|none|
|is_signed |boolean|none|agreement between merchant and system fully signed|
|payment_methods |object|none|list of payment methods activated to merchant|
|agreement_type |integer|none|type of agreement which merchant selected. possible values: 0 - type not select; 1 - paper agreement; 2 - e-sign agreement;|
|agreement_sent_via_mail |boolean|none|mark agreement as sent via post|
|mail_tracking_link |string|none|link to tracking package with agreement in post|
|signature_request |[onboarding.merchant.signatureRequest](#schemaonboarding.merchant.signaturerequest)|none|none|
|tariff |string|none|tariff identifier|
|agreement_template |string|none|license agreement template identifier in hellosign|
|received_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|status_last_updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|has_projects |boolean|none|true is merchant has created projects|
|user |[onboarding.Merchant.user](#schemaonboarding.merchant.user)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|new status identifier of merchant. possible statuses: 5 - deleted, 6 - rejected|
|message |string|none|string description to new status|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|status as result of operation|
|message |string|none|string description for error message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|status as result of operation|
|message |string|none|string description for error message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|price group identifier|
|region |string|none|name of region|
|currency |string|none|code of currency|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|regions |[price_group.Regions](#schemaprice_group.regions)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency |string|none|name of currency|
|region |[price_group.Region](#schemaprice_group.region)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|region |string|none|name of region|
|country |[string]|none|list of countries|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|recommended_price |[price_group.RecommendedPrice](#schemaprice_group.recommendedprice)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|region |string|none|name of region|
|currency |string|none|name of currency|
|amount |number|none|recommended amount|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|ranges |[[price_group.RecommendedPriceTableItem](#schemaprice_group.recommendedpricetableitem)]|none|list of price|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|start point of range|
|to |integer|none|end point of range|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|status before changes|
|to |integer|none|status after changes|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|notification unique identifier in system|
|title |string|none|notification title|
|message |string|none|notification message|
|merchant_id |string|none|merchant identifier who must recieve notification|
|user_id |string|none|user identifier who send notification|
|is_system |boolean|none|notification generated automaticaly|
|is_read |boolean|none|receiver read notification|
|statuses |[onboarding.Merchant.Notification.Statuses](#schemaonboarding.merchant.notification.statuses)|none|none|
|created_at |integer|none|dete of create notification in unix timestamp format|
|updated_at |integer|none|dete of last update notification in unix timestamp format|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer|none|total number of filtered notifications|
|items |[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|title  <br><p style="color: red;">required</p> |string|none|notification title|
|message  <br><p style="color: red;">required</p> |string|none|notification message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|refund unique identifier|
|order_id |string|none|order unique identifier for which the refund was created|
|external_id |string|none|refund unique identifier on payment system side|
|amount |number|none|refund amount|
|creator_id |string|none|user identifier who created refund|
|reason |string|none|reason to refund|
|currency |string|none|refund currency|
|status |integer|none|refund status. available statuses: 0 - refund was created; 1 - refund rejected on payment system side; 2 - refund in processing on payment system side; 3 - refund successfully completed;|
|created_at |integer|none|dete of create notification in unix timestamp format|
|updated_at |integer|none|dete of last update notification in unix timestamp format|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount  <br><p style="color: red;">required</p> |number|none|refund amount|
|reason |string|none|reason to refund|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|has_psp_signature |boolean|none|flag for set peysuper signature on the agreement|
|has_merchant_signature |boolean|none|flag for set merchant signature on the agreement|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|agreement file name|
|extension  <br><p style="color: red;">required</p> |string|none|agreement file extension|
|content_type  <br><p style="color: red;">required</p> |string|none|agreement file content type|
|size  <br><p style="color: red;">required</p> |integer|none|agreement file size in Kb|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|url |string|none|link to download printable agreement|
|metadata |[onboarding.Merchant.PrintableAgreementData.Metadata](#schemaonboarding.merchant.printableagreementdata.metadata)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|agreement_type  <br><p style="color: red;">required</p> |integer|none|type of agreement which merchant selected. possible values: 1 - paper agreement; 2 - e-sign agreement;|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|project merchant id|
|image |string|none|url to project logo|
|callback_currency |string|none|currency to send payment notification|
|callback_protocol |string|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls |[string]|none|list of urls rom which you can send a request to create an order|
|allow_dynamic_notify_urls |boolean|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls |boolean|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency |string|none|currency for amount's limit|
|max_payment_amount |number|none|maximal amount allowed for create order|
|min_payment_amount |number|none|minimal amount allowed for create order|
|name |object|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails |[string]|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout |boolean|none|is allow create order only with amounts from products list|
|secret_key |string|none|secret key for create check hash for request about order statuses changes|
|send_notify_email |boolean|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account |string|none|default url to send request for verification payment data to project|
|url_process_payment |string|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail |string|none|default url to redirect user after failed payment|
|url_redirect_success |string|none|default url to redirect user after successfully completed payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|The user's country. Two-letter language code by ISO 3166-1, in lowercase.|
|city |string|none|The user's city.|
|postal_code |string|none|The user's postal code.|
|state |string|none|The user's state code by ISO 3166-2.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|value  <br><p style="color: red;">required</p> |string|none|The parameter value.|
|verified |boolean|none|Whether the value has been verified on the merchant side.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|value  <br><p style="color: red;">required</p> |string|none|The parameter value.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|The user unique identifier on the merchant side.|
|email |[Token.ValueVerified](#schematoken.valueverified)|none|none|
|phone |[Token.ValueVerified](#schematoken.valueverified)|none|none|
|name |[Token.Value](#schematoken.value)|none|none|
|ip |[Token.Value](#schematoken.value)|none|none|
|locale |[Token.Value](#schematoken.value)|none|none|
|address |[Order.BillingAddress](#schemaorder.billingaddress)|none|none|
|metadata |object|none|A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|success |string|none|The redirect URL for the successful payment.|
|fail |string|none|The redirect URL for the failed payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|project_id  <br><p style="color: red;">required</p> |string|none|The ID of the Project found in your merchant account in the PaySuper Dashboard.|
|return_url |[Token.Settings.ReturnUrl](#schematoken.settings.returnurl)|none|none|
|currency |string|none|The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.|
|amount |number|none|The order amount as a positive number. It is required for a simple checkout payment.|
|products_ids |[string]|none|The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.|
|description |string|none|The arbitrary order description.|
|type  <br><p style="color: red;">required</p> |string|none|The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type.|
|metadata |object|none|A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|user  <br><p style="color: red;">required</p> |[Token.User](#schematoken.user)|none|none|
|settings  <br><p style="color: red;">required</p> |[Token.Settings](#schematoken.settings)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|token  <br><p style="color: red;">required</p> |string|none|A secure string which contains encrypted information about your customer and sales option data.|
|payment_form_url |string|none|The PaySuper-hosted URL of payment form.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|price|
|currency |string|none|currency|
|region |string|none|region|
|is_virtual_currency |boolean|none|virtual currency flag|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|id of product|
|prices  <br><p style="color: red;">required</p> |[[product.Price](#schemaproduct.price)]|none|list of prices|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|first_name |string|none|user first name|
|last_name |string|none|user last name|
|position |string|none|user position in company|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|product_promotion_and_development |boolean|none|User need help with product promotion and development|
|released_game_promotion |boolean|none|User need help with games promotion that have already been released|
|international_sales |boolean|none|User need help with international sales|
|other |boolean|none|User need help with other problems|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|range start value|
|to |integer|none|range end value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|paid_subscription |boolean|none|company monetisation from buy paid subscription by company users|
|in_game_advertising |boolean|none|company monetisation from buy in game advertising|
|in_game_purchases |boolean|none|company monetisation from buy in game purchases by company users|
|premium_access |boolean|none|company monetisation from buy premium access by company users|
|other |boolean|none|company monetisation from other activities|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|pc_mac |boolean|none|PC/MacOs|
|game_console |boolean|none|game console|
|mobile_device |boolean|none|mobile device|
|web_browser |boolean|none|web browsers|
|other |boolean|none|other platforms|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|company_name |string|none|company name|
|website |string|none|company website url|
|annual_income |[RangeInt](#schemarangeint)|none|none|
|number_of_employees |[RangeInt](#schemarangeint)|none|none|
|kind_of_activity |string|none|company kind of activity. available values: develop_and_publish_your_games, publish_games_of_other_companies, publish_your_games_through_other_publishers, other|
|monetization |[userProfile.company.monetization](#schemauserprofile.company.monetization)|none|none|
|platforms |[userProfile.company.platforms](#schemauserprofile.company.platforms)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|seconds |integer|none|time in unix timestamp|
|nanos |integer|none|time nano seconds|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|personal |[userProfile.personal](#schemauserprofile.personal)|none|none|
|help |[userProfile.help](#schemauserprofile.help)|none|none|
|company |[userProfile.company](#schemauserprofile.company)|none|none|
|last_step |string|none|identifier of wizard last step which user ended|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|personal |[userProfile.personal](#schemauserprofile.personal)|none|none|
|help |[userProfile.help](#schemauserprofile.help)|none|none|
|company |[userProfile.company](#schemauserprofile.company)|none|none|
|last_step |string|none|identifier of wizard last step which user ended|
|centrifugo_token |string|none|user authorisation token to connect to centrifigo channel|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|review  <br><p style="color: red;">required</p> |string|none|user review about page|
|page_id  <br><p style="color: red;">required</p> |string|none|page identifier. now allowed values: primary_onboarding, merchant_onboarding|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|token  <br><p style="color: red;">required</p> |string|none|email confirmation token|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|company |boolean|none|step company basic info complete|
|contacts |boolean|none|step company contacts complete|
|banking |boolean|none|step company banking complete|
|tariff |boolean|none|step tariff complete|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |string|none|fill status. possible values: draft, life|
|steps |[onboarding.merchant.fillStatus.Steps](#schemaonboarding.merchant.fillstatus.steps)|none|none|
|complete_steps_count |integer|none|count of complete steps|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|signer_type  <br><p style="color: red;">required</p> |integer|none|type of signer which request a signing license agreement. possible values: 0 - merchant owner; 1 - paysuper admin|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|sign_url |string|none|URL of the signature page to display in the embedded iFrame|
|expires_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|name |string|none|payment method name|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|percent |number|none|percent fee|
|fix_amount |number|none|fixed fee in particular currency|
|fix_amount_currency |string|none|currency of fixed fee.  letters code by ISO 4217|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is cost record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|percent  <br><p style="color: red;">required</p> |number|none|percent fee|
|fix_amount |number|none|fixed fee in particular currency|
|fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of fixed fee.  letters code by ISO 4217|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)]|none|array of system payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)]|none|array of system money back costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|merchant_id |string|none|merchant identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|min_amount |number|none|payment min amount in payout currency|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|method_percent |number|none|payment method fee in percents|
|method_fix_amount |number|none|payment method fixed fee in particular currency|
|method_fix_amount_currency |string|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency |string|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record active for merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|min_amount  <br><p style="color: red;">required</p> |number|none|payment min amount in payout currency|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|method_percent  <br><p style="color: red;">required</p> |number|none|payment method fee in percents|
|method_fix_amount |number|none|payment method fixed fee in particular currency|
|method_fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent  <br><p style="color: red;">required</p> |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency  <br><p style="color: red;">required</p> |string|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason |string|none|money back type. available values: refund, reversal, chargeback|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason  <br><p style="color: red;">required</p> |string|none|money back type. available values: refund, reversal, chargeback|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|merchant_id |string|none|merchant identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason |string|none|money back type. available values: refund, reversal, chargeback|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee in particular currency|
|fix_amount_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant when money back operation will be processing|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason  <br><p style="color: red;">required</p> |string|none|money back type. available values: refund, reversal, chargeback|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent  <br><p style="color: red;">required</p> |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee in particular currency|
|fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant when money back operation will be processing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)]|none|array of merchant payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)]|none|array of merchant payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value |number|none|point value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value |integer|none|point value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount_current |number|none|total amount calculated for current report|
|amount_previous |number|none|total amount calculated for previous report|
|currency |string|none|report amount currency.  three-letter ISO 4217 currency code, in uppercase.|
|chart |[[dashboard.main_reports.chart.float](#schemadashboard.main_reports.chart.float)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count_current |integer|none|total count of transactions by current period|
|count_previous |integer|none|total count of transactions by previous period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|gross_revenue |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|
|vat |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|
|total_transactions |[dashboard.main_reports.total_transactions](#schemadashboard.main_reports.total_transactions)|none|none|
|arpu |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount |number|none|revenue amount for label|
|count |integer|none|transactions count for label|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency |string|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|items |[[dashboard.revenue_dynamics.item](#schemadashboard.revenue_dynamics.item)]|none|array of points|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|country, two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|amount |number|none|amount by country|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount |number|none|amount for label|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.revenue_by_country.top](#schemadashboard.base.revenue_by_country.top)]|none|array of objects with information about top 5 countries by revenue by period|
|total_current |number|none|total revenue amount by current period|
|total_previous |number|none|total revenue amount by previous period|
|currency |string|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|chart |[dashboard.base.chart](#schemadashboard.base.chart)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|sold item name|
|count |integer|none|item total count which were sold in period|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.sales_today.top.item](#schemadashboard.base.sales_today.top.item)]|none|array of objects with information about top 5 merchant products (projects) which were sold in period|
|total_current |integer|none|items total count which were sold by chosen period|
|total_previous |integer|none|items total count which were sold by previous period to chosen period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|url of issuer|
|count |integer|none|total count|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.sources.top.item](#schemadashboard.base.sources.top.item)]|none|array of objects with information about top 5 issuers url|
|total_current |integer|none|transactions total count by chosen period|
|total_previous |integer|none|transactions total count by previous period to chosen period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|revenue_by_country |[dashboard.base.revenue_by_country](#schemadashboard.base.revenue_by_country)|none|none|
|sales_today |[dashboard.base.sales_today](#schemadashboard.base.sales_today)|none|none|
|sources |[dashboard.base.sources](#schemadashboard.base.sources)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|merchant identificator|
|currency |string|none|currency|
|debit |number|none|balance debit|
|credit |string|none|balance credit|
|rolling_reserve |number|none|current rooling reserve balance|
|total |number|none|total amount|
|created_at |string|none|last update date|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|document id|
|source_id |[string]|none|royalty reports id|
|transaction |string|none|transaction id|
|total_fees |number(double)|none|total_fees|
|balance |number(double)|none|amount|
|currency |string|none|currency|
|status |string|none|status, one of skip pending in_progress paid canceled failed|
|description |string|none|description|
|destination |[onboarding.Banking](#schemaonboarding.banking)|none|none|
|created_at |string(date-time)|none|creation date|
|updated_at |string(date-time)|none|update date|
|arrival_date |string(date-time)|none|arrival date|
|failure_code |string|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message |string|none|failure message|
|failure_transaction |string|none|failure transaction|
|merchant_id |string|none|merchant identificator|
|signature_data |[billingPayoutDocumentSignatureData](#schemabillingpayoutdocumentsignaturedata)|none|none|
|has_merchant_signature |boolean(boolean)|none|is document signed by merchant|
|has_psp_signature |boolean(boolean)|none|is document signed by paysuper|
|signed_document_file_url |string|none|url to signed file|
|period_from |string(date-time)|none|payout period start|
|period_to |string(date-time)|none|payout period end|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|details_url |string|none|none|
|files_url |string|none|none|
|signature_request_id |string|none|none|
|merchant_signature_id |string|none|none|
|ps_signature_id |string|none|none|
|merchant_sign_url |[billingPayoutDocumentSignatureDataSignUrl](#schemabillingpayoutdocumentsignaturedatasignurl)|none|none|
|ps_sign_url |[billingPayoutDocumentSignatureDataSignUrl](#schemabillingpayoutdocumentsignaturedatasignurl)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|sign_url |string|none|none|
|expires_at |string(date-time)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |number|none|number of found documents|
|items |[[billingPayoutDocument](#schemabillingpayoutdocument)]|none|array with documents|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|merchant identificator to create payout document for|
|description |string|none|document description|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|transaction |string|none|transaction id|
|status |string|none|status, one of skip pending in_progress paid canceled failed|
|failure_code |string|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message |string|none|failure message|
|failure_transaction |string|none|failure transaction|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|price amount|
|currency |string|none|price currency. three-letter ISO 4217 currency code, in uppercase.|
|region |string|none|region name for this price. available regions: oceania, eu, cis, north_europe, north_africa, polynesia, north_america, central_africa, south_europe, antarctica, south_america, south_asia, caribbean, west_asia, central_america, west_africa, southern_africa, southeast_asia, east_africa, east_asia, micronesia, west_europe, latin_america, melanesia, russia, sub_saharan_africa, south_africa|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|product identifier|
|project_id |string|none|project identifier for which created product|
|object |string|none|system constant conteined returning object type. for product object always must be - product|
|type |string|none|product type|
|sku |string|none|product sku (simple slug name)|
|name |object|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency |string|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled |boolean|none|true is product is enabled|
|prices |[[price](#schemaprice)]|none|array of available prices for product|
|description |object|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description |object|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|images |[string]|none|array of product images. if images not set then field can be null|
|url |string|none|url to product on project side|
|metadata |object|none|object can contain any other information about product. object must contain only string values|
|billing_type |string|none|Type of billing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|project_id |string|none|project identifier for which created product|
|object |string|none|system constant conteined returning object type. for product object always must be - product|
|type |string|none|product type|
|sku |string|none|product sku (simple slug name)|
|name |object|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency |string|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled |boolean|none|true is product is enabled|
|prices |[[price](#schemaprice)]|none|array of available prices for product|
|description |object|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description |object|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|images |[string]|none|array of product images. if images not set then field can be null|
|url |string|none|url to product on project side|
|metadata |object|none|object can contain any other information about product. object must contain only string values|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|report id|
|merchant_id |string|none|merchant id|
|created_at |string(date-time)|none|date of report creation|
|updated_at |string(date-time)|none|date of report last update|
|payout_date |string(date-time)|none|date when report was paid|
|status |string|none|status of report|
|period_from |string(date-time)|none|start of report time period|
|period_to |string(date-time)|none|end of report time period|
|accept_expire_at |string(date-time)|none|date when report will be auto-accepted, if merchant didn't accept or start a dispute yet|
|accepted_at |string(date-time)|none|date when report was accepted|
|totals |[billingRoyaltyReportTotals](#schemabillingroyaltyreporttotals)|none|none|
|currency |string|none|currency of report|
|summary |[billingRoyaltyReportSummary](#schemabillingroyaltyreportsummary)|none|none|
|dispute_reason |string|none|reason of dispute (if it was started)|
|dispute_started_at |string(date-time)|none|date of dispute beginning (if it was started)|
|dispute_closed_at |string(date-time)|none|date of dispute resolve (if it was started)|
|is_auto_accepted |boolean(boolean)|none|flag of auto-acceptance|
|payout_document_id |string|none|cross-link to payout invoice, that includes this royalty report|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|accounting_entry_id |string|none|linked accounting entry id|
|amount |number(double)|none|amount of correction|
|currency |string|none|currency|
|reason |string|none|reason if correction|
|entry_date |string(date-time)|none|date of correction|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|product |string|none|product or project name|
|region |string|none|country ISO Alpha2 code|
|total_transactions |integer(int32)|none|total number of transactions for current product/project in current country (including sales and returns)|
|sales_count |integer(int32)|none|number of sales for current product/project in current country|
|gross_sales_amount |number(double)|none|gross amount of sales for current product/project in current country|
|returns_count |integer(int32)|none|number of returns for current product/project in current country|
|gross_returns_amount |number(double)|none|gross amount of returns for current product/project in current country|
|gross_total_amount |number(double)|none|resulting gross amount for current product/project in current country (sales minus returns)|
|total_fees |number(double)|none|fees amount for current product/project in current country|
|total_vat |number(double)|none|vat amount for current product/project in current country|
|payout_amount |number(double)|none|payout amount for current product/project in current country|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|products_items |[[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)]|none|summary details for each product/project and country|
|products_total |[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)|none|none|
|corrections |[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|none|list of corrections applied (if any)|
|rolling_reserves |[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|none|list of rolling reserves applied (if any)|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|transactions_count |integer(int32)|none|total transactions count (including sales and returns)|
|fee_amount |number(double)|none|fees amount|
|vat_amount |number(double)|none|vat amount|
|payout_amount |number(double)|none|payput amount|
|rolling_reserve_amount |number(double)|none|applied rolling reserve total amount|
|correction_amount |number(double)|none|applied corrections total amount|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |string|none|new report status|
|reason  <br><p style="color: red;">required</p> |string|none|correction reason|
|correction |[grpcChangeRoyaltyReportCorrection](#schemagrpcchangeroyaltyreportcorrection)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount  <br><p style="color: red;">required</p> |number(double)|none|correction amount (in report's currency)|
|reason  <br><p style="color: red;">required</p> |string|none|correction reason|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|total items count|
|items |[[billingRoyaltyReport](#schemabillingroyaltyreport)]|none|royalty reports|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|none|
|items |[[paylinkPaylink](#schemapaylinkpaylink)]|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[paylinkStatCommon](#schemapaylinkstatcommon)]|none|top items of grouping stat data|
|total |[paylinkStatCommon](#schemapaylinkstatcommon)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|paylink id|
|object |string|none|object type|
|products |[string]|none|list of products included to paylink|
|expires_at |string(date-time)|none|expiration date|
|created_at |string(date-time)|none|creation date|
|updated_at |string(date-time)|none|last updation date|
|merchant_id |string|none|paylink merchant id"|
|project_id |string|none|paylink project id"|
|name |string|none|paylink name|
|is_expired |boolean(boolean)|none|is expired flag|
|visits |integer(int32)|none|total visits count|
|no_expiry_date |boolean(boolean)|none|no expiry date flag|
|products_type |string|none|products type|
|total_transactions |integer(int32)|none|total transactions count|
|sales_count |integer(int32)|none|sales count|
|returns_count |integer(int32)|none|returns count|
|conversion |number(double)|none|conversion (sales per visits relation)|
|gross_sales_amount |number(double)|none|gross sales amount|
|gross_returns_amount |number(double)|none|gross returns amount|
|gross_total_amount |number(double)|none|gross total amount|
|transactions_currency |string|none|transactions currency ISO code|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|paylink_id |string|none|paylink id|
|visits |integer(int32)|none|total visits count|
|total_transactions |integer(int32)|none|total transactions count|
|sales_count |integer(int32)|none|sales count|
|returns_count |integer(int32)|none|returns count|
|gross_sales_amount |number(double)|none|gross sales amount|
|gross_returns_amount |number(double)|none|gross returns amount|
|gross_total_amount |number(double)|none|gross total amount|
|transactions_currency |string|none|transactions currency ISO code|
|conversion |number(double)|none|conversion, optional|
|country_code |string|none|country iso code A2, optional|
|date |string|none|date yyyy-mm-dd, optional|
|referrer_host |string|none|referrer host value, optional|
|utm |[paylinkUtm](#schemapaylinkutm)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|utm_source |string|none|utm_source value|
|utm_medium |string|none|utm_medium value|
|utm_campaign |string|none|utm_campaign value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|paylink id, optional, used only for edit existing paylink|
|products |[string]|none|list of products included to paylink|
|expires_at |number|none|expiration date as unix timestamp|
|project_id |string|none|paylink project id"|
|name |string|none|paylink name|
|no_expiry_date |boolean(boolean)|none|no expiry date flag|
|products_type |string|none|products type|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|vat report id|
|country |string|none|country ISO A2 code|
|vat_rate |number(double)|none|rate value of VAT|
|currency |string|none|vat currency ISO code|
|transactions_count |integer(int32)|none|total transactions count in period|
|gross_revenue |number(double)|none|gross revenue amount in period|
|vat_amount |number(double)|none|vat amount in period|
|fees_amount |number(double)|none|fees amount in period|
|deduction_amount |number(double)|none|deduction amount in period|
|correction_amount |number(double)|none|manual correction amount in period|
|status |string|none|status|
|country_annual_turnover |number(double)|none|annual turnover for country|
|world_annual_turnover |number(double)|none|world annual turnover|
|amounts_approximate |boolean(boolean)|none|flag of non-final amounts due to currency exchange rates delay|
|date_from |string(date-time)|none|period start date|
|date_to |string(date-time)|none|period end date|
|pay_until_date |string(date-time)|none|VAT payment deadline date|
|created_at |string(date-time)|none|report creation date|
|updated_at |string(date-time)|none|report last update date|
|paid_at |string(date-time)|none|date of payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|total reports count|
|items |[[billingVatReport](#schemabillingvatreport)]|none|reports|

# Token

A token is an encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.

## Create a token

> Code samples

```shell
curl -X POST /api/v1/tokens \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json'

```

`POST /api/v1/tokens`

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

### Parameters

|Parameter|Type|Description|
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

> Example responses

> 200 Response

```json
{
  "token": "string",
  "payment_form_url": "string"
}
```

### Responses

|Status|Description|Schema|
|---|---|---|
|200|OK|[Token.TokenResponse](#schematoken.tokenresponse)|
|400|Invalid request data|[ErrorMessage](#schemaerrormessage)|
|404|Object not found|[ErrorMessage](#schemaerrormessage)|
|500|Some unknown error on server side|[ErrorMessage](#schemaerrormessage)|

### Schemas

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|code_a2 |string|none|2 chars ISO 3166-1 country code|
|code_a3 |string|none|3 chars ISO 3166-1 country code|
|code_int |integer|none|numeric ISO 3166-1 country code|
|created_at |string|none|date of create country in system|
|is_active |boolean|none|is country active|
|name |[model.Name](#schemamodel.name)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|message |string|none|A description of the error.|
|code |string|none|A status code of the error.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city |string|none|user's city|
|zip |string|none|postal code|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|item identifier|
|object |string|none|item type|
|sku |string|none|item sku identifier|
|name |string|none|item name|
|description |string|none|item description|
|amount |number|none|item price|
|currency |string|none|item price currency. three-letter ISO 4217 currency code, in uppercase.|
|images |[string]|none|list of urls to item images|
|url |object|none|url to item on project site|
|metadata |object|none|object contain item metadata|
|code |string|none|item code|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|platform_id |string|none|item platform identifier|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|The unique identifier for the order.|
|payment_form_url |string|none|The PaySuper-hosted URL of payment form.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account |string|none|user account, may be null|
|has_vat |boolean|none|flag to show VAT commission amount in payment form|
|vat |number|none|VAT amount|
|amount |number|none|order amount without VAT|
|total_amount |number|none|total order amount with VAT|
|currency |string|none|order currency|
|user_address_data_required |boolean|none|flag to get information about user real geo position|
|id |string|none|order unique identifier|
|payment_methods |[[model.PaymentMethodJsonOrderResponse](#schemamodel.paymentmethodjsonorderresponse)]|none|contain data about payment methods|
|project |[model.ProjectJsonOrderResponse](#schemamodel.projectjsonorderresponse)|none|none|
|token |string|none|access token to websocket private chanel|
|user_ip_data |[CreateOrderResponse.user.address](#schemacreateorderresponse.user.address)|none|none|
|items |[[CreateOrderResponse.item](#schemacreateorderresponse.item)]|none|list of buyed items in order|
|cookie |string|none|value to set to cookie for user identification. if user was identified by other data than value can be empty.|
|email |string|none|user email|
|description |string|none|order description|
|country_payments_allowed |boolean|none|true is payments from user country is allowed|
|country_change_allowed |boolean|none|true if user can change self country if payments from his country disallow|
|platforms |[string]|none|list of supported platforms if this payment with type key (for other types this field can be empty)|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|en |string|none|english name|
|ru |string|none|russian name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|address |string|none|user wallet address in crypto payment system. required only for crypto payment|
|card_holder |string|none|bank card card holder name. required only for bank card payment|
|cvv |integer|none|bank card cvv code. required only for bank card payment|
|ewallet |string|none|user account in ewallet payment system. required only for ewallet payment|
|month |integer|none|month of expire date of user bank card. required only for bank card payment|
|order_id |string|none|unique identifier of order on PSP (P1) side|
|pan |string|none|user bank card number. required only for bank card payment|
|payment_method_id |string|none|unique identifier of payment method by PSP (P1) classifier|
|year |integer|none|year of expire date of user bank card. required only for bank card payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|project unique identifier|
|merchant_id |string|none|project merchant unique identifier|
|url_success |string|none|url for redirect user after successfully completed payment|
|url_fail |string|none|url for redirect user after failed payment|
|send_notify_email |boolean|none|flag to send notification emails by "notify_emails" list after successfully completed payment|
|notify_emails |[string]|none|emails list to send notification email after successfully completed payment|
|secret_key |string|none|project secret key|
|url_check_account |string|none|callback url to check payment requisites|
|url_process_payment |string|none|callback url to send payment complete request|
|callback_protocol |string|none|type of callback notification protocol. now available next values: empty - notification request not send, order just mark as successfully complete; default - notification request send by PaySuper notification protocol;|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|first6 |string|none|string representing the first 6 digits of the card. Available only for a card method|
|last4 |string|none|string representing the last 4 digits of the card. Available only for a card method|
|masked |string|none|masked pan of bank card|
|expiry_month |string|none|month of expiration bank card|
|expiry_year |string|none|year of expiration bank card|
|brand |string|none|bank card brand|
|fingerprint |string|none|string representing the internal fingerprint for given card|
|secure3d |boolean|none|true is 3DS secure was used during payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|brand |string|none|name of payment system|
|account |string|none|payer wallet number in payment system|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|brand |string|none|name of crypto currency system|
|address |string|none|payer address in crypto cyrrency system|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|title |string|none|payment method name|
|external_id |string|none|payment method identifier in payment system|
|payment_system_id |string|none|payment system identifier|
|saved |boolean|none|true is payment method was saved by user for future usage|
|card |[order.payment_method.card](#schemaorder.payment_method.card)|none|none|
|wallet |[order.payment_method.wallet](#schemaorder.payment_method.wallet)|none|none|
|crypto_currency |[order.payment_method.crypto_currency](#schemaorder.payment_method.crypto_currency)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|city |string|none|user's city|
|postal_code |string|none|postal code|
|state |string|none|state name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|customer identity identifier|
|object |string|none|constant with object name|
|external_id |string|none|user identifier in project|
|name |string|none|user name|
|email |string|none|user email|
|email_verified |boolean|none|true is email was verified|
|phone |string|none|user phone|
|phone_verified |boolean|none|true is phone was verified|
|ip |string|none|user ip address|
|locale |string|none|user's locale. two-letter code in lowercase|
|address |[order.user.address](#schemaorder.user.address)|none|none|
|metadata |object|none|set of key-value pairs that attached to an object on create order state|
|notify_new_region |boolean|none|true is user wanting to receiving notification when paysuper will work in user's region|
|notify_new_region_email |string|none|user's email to send notification email when paysuper starting work in user's region|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|entry amount|
|currency |string|none|entry currency. three-letter ISO 4217 currency code, in uppercase.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|uuid |string|none|order unique identifier|
|total_payment_amount |number|none|payment amount|
|currency |string|none|payment currency. three-letter ISO 4217 currency code, in uppercase.|
|project |[order.project](#schemaorder.project)|none|none|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|transaction |string|none|unique identifier for the transaction in payment system|
|transaction_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|payment_method |[order.payment_method](#schemaorder.payment_method)|none|none|
|country_code |string|none|string representing the the user's country. two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|merchant_id |string|none|project merchant unique identifier|
|locale |string|none|user's locale. two-letter code in lowercase|
|status |string|none|string representing the order current status. possible statuses: created - the order created but not processed yet; canceled - the order was canceled and money refunded to user; rejected - the order was rejected by payment system with any reasons; processed - the order was processed in payment system;|
|user |[order.user](#schemaorder.user)|none|none|
|billing_address |[order.user.address](#schemaorder.user.address)|none|none|
|type |string|none|constant with object type|
|is_vat_deduction |boolean|none|true is vat deduction|
|gross_revenue |[order.money](#schemaorder.money)|none|none|
|tax_fee |[order.money](#schemaorder.money)|none|none|
|tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|tax_fee_total |[order.money](#schemaorder.money)|none|none|
|method_fee_total |[order.money](#schemaorder.money)|none|none|
|method_fee_tariff |[order.money](#schemaorder.money)|none|none|
|method_fixed_fee_tariff |[order.money](#schemaorder.money)|none|none|
|paysuper_fixed_fee |[order.money](#schemaorder.money)|none|none|
|fees_total |[order.money](#schemaorder.money)|none|none|
|fees_total_local |[order.money](#schemaorder.money)|none|none|
|net_revenue |[order.money](#schemaorder.money)|none|none|
|refund_gross_revenue |[order.money](#schemaorder.money)|none|none|
|method_refund_fee_tariff |[order.money](#schemaorder.money)|none|none|
|merchant_refund_fixed_fee_tariff |[order.money](#schemaorder.money)|none|none|
|refund_tax_fee |[order.money](#schemaorder.money)|none|none|
|refund_tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|paysuper_refund_tax_fee_currency_exchange_fee |[order.money](#schemaorder.money)|none|none|
|refund_reverse_revenue |[order.money](#schemaorder.money)|none|none|
|refund_fees_total |[order.money](#schemaorder.money)|none|none|
|refund_fees_total_local |[order.money](#schemaorder.money)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer|none|total count of selected orders|
|items |[[order.public](#schemaorder.public)]|none|array of selected orders|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|external_id |string|none|The user unique identifier on the merchant side.|
|name |string|none|The user's name.|
|email |string|none|The user's email address.|
|email_verified |boolean|none|Whether the user's email address has been verified on the merchant side.|
|phone |string|none|The user's phone number.|
|phone_verified |boolean|none|Whether the user’s phone number has been verified on the merchant side.|
|ip |string|none|The user's IP address.|
|locale |string|none|The user's locale name. Two-letter language code by ISO 639-1, in lowercase.|
|address |[Order.BillingAddress](#schemaorder.billingaddress)|none|none|
|metadata |object|none|A string-value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account |string|none|The user unique account in the Project.|
|amount |number|none|The order amount as a positive number. It is required for a simple checkout payment.|
|currency |string|none|The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.|
|description |string|none|The arbitrary order description.|
|order_id |string|none|The unique order identifier on the merchant side. This field is not required, but we recommend sending this field always.|
|project  <br><p style="color: red;">required</p> |string|none|The ID of the Project found in your merchant account in the PaySuper Dashboard.|
|url_fail |string|none|The redirect URL for the failed payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.|
|url_success |string|none|The redirect URL for the successful payment.  Enable the dynamic notify URLs option in the Project Settings to use this field.|
|type  <br><p style="color: red;">required</p> |string|none|The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type.|
|products |[string]|none|The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.|
|platform_id |string|none|The default platform identifier for which customer buys the in-game key. This field used only for a payment type 'key'.|
|token |string|none|An encrypted string that represents certain details of your customer (such as the user ID, email and others), a game and purchase parameters.  The token encrypted parameters override the corresponding parameters in an order object even the required parameters.|
|user |[Order.User](#schemaorder.user)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|account_regexp |string|none|regexp mask for check main requisite of payment method|
|group_alias |string|none|payment method group alias|
|icon |string|none|url to payment method icon|
|id |string|none|payment method unique identifier|
|name |string|none|payment method name|
|type |string|none|payment method type. allowed: bank_card, ewallet, crypto|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique project identifier|
|merchant_id |string|none|project merchant id|
|image |string|none|url to project logo|
|callback_currency |string|none|currency to send payment notification|
|callback_protocol |string|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls |[string]|none|list of urls rom which you can send a request to create an order|
|status |integer|none|project status. now available: 0 - new project; 1 - project successfully complete integration tests; 2 - project fail one or more integration test; 3 - project in production; 4 - project deleted|
|allow_dynamic_notify_urls |boolean|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls |boolean|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency |string|none|currency for amount's limit|
|max_payment_amount |number|none|maximal amount allowed for create order|
|min_payment_amount |number|none|minimal amount allowed for create order|
|name |object|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails |[string]|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout |boolean|none|is allow create order only with amounts from products list|
|secret_key |string|none|secret key for create check hash for request about order statuses changes|
|send_notify_email |boolean|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account |string|none|default url to send request for verification payment data to project|
|url_process_payment |string|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail |string|none|default url to redirect user after failed payment|
|url_redirect_success |string|none|default url to redirect user after successfully completed payment|
|products_count |integer|none|count of project's products|
|created_at |object|none|date of create merchant in system in unix timestamp|
|updated_at |object|none|date of update merchant in system in unix timestamp|
|localizations |[string]|none|languages for product to localize|
|full_description |object|none|localized full description for product|
|- **additionalProperties** |string|none|none|
|short_description |object|none|localized short description for product|
|- **additionalProperties** |string|none|none|
|cover |object|none|none|
|- images |object|none|none|
|-- **additionalProperties** |string|none|none|
|- use_one_for_all |boolean|none|none|
|virtual_currency |[model.VirtualCurrency](#schemamodel.virtualcurrency)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|logo |string|none|none|
|name |string|none|none|
|SuccessMessage |string|none|none|
|MinPurchaseValue |number(double)|none|none|
|MaxPurchaseValue |number(double)|none|none|
|SellCountType |string|none|none|
|Prices |[[product.Price](#schemaproduct.price)]|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|project name|
|url_fail |string|none|url to redirect user after failed payment. may be NULL if not set in project settings|
|url_success |string|none|url to redirect user after successfully completed payment. may be NULL if not set in project settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|error |string|none|none|
|redirect_url |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|none|
|country  <br><p style="color: red;">required</p> |string|none|none|
|city |string|none|none|
|state |string|none|none|
|zip |string|none|none|
|rate  <br><p style="color: red;">required</p> |number|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|none|
|file_type  <br><p style="color: red;">required</p> |string|none|none|
|report_type  <br><p style="color: red;">required</p> |string|none|none|
|template |string|none|none|
|params  <br><p style="color: red;">required</p> |object|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |number|none|none|
|message |string|none|none|
|file_id |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency  <br><p style="color: red;">required</p> |string|none|none|
|terminal_id |string|none|none|
|secret |string|none|none|
|secret_callback |string|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|Name of method|
|group_alias |string|none|Name of group for currency type|
|external_id  <br><p style="color: red;">required</p> |string|none|External id|
|currencies |[integer]|none|List of currency int codes|
|min_payment_amount |integer|none|Minimal payment amount|
|max_payment_amount |integer|none|Maximum payment amount|
|type |string|none|Type of payment method|
|account_regexp |string|none|Regular expression for validation|
|is_active |boolean|none|Active or not|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|test_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of test settings|
|production_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of production settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|Payment method identifier|
|name  <br><p style="color: red;">required</p> |string|none|Name of method|
|group_alias |string|none|Name of group for currency type|
|external_id  <br><p style="color: red;">required</p> |string|none|External id|
|currencies |[integer]|none|List of currency int codes|
|min_payment_amount |integer|none|Minimal payment amount|
|max_payment_amount |integer|none|Maximum payment amount|
|type |string|none|Type of payment method|
|account_regexp |string|none|Regular expression for validation|
|is_active |boolean|none|Active or not|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|test_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of test settings|
|production_settings |[[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)]|none|List of production settings|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|Payment method identifier|
|payment_system_id  <br><p style="color: red;">required</p> |string|none|Payment system identifier|
|params  <br><p style="color: red;">required</p> |[payment_method.PaymentMethodParams](#schemapayment_method.paymentmethodparams)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|person full name|
|email  <br><p style="color: red;">required</p> |string|none|person email|
|phone  <br><p style="color: red;">required</p> |string|none|person contact phone|
|position  <br><p style="color: red;">required</p> |string|none|person position in company|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|person full name|
|email  <br><p style="color: red;">required</p> |string|none|person email|
|phone  <br><p style="color: red;">required</p> |string|none|person contact phone|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|name|
|alternative_name  <br><p style="color: red;">required</p> |string|none|brand|
|website  <br><p style="color: red;">required</p> |string|none|website url|
|country  <br><p style="color: red;">required</p> |string|none|destination country 2 letter code by ISO 3166-1|
|state  <br><p style="color: red;">required</p> |string|none|destination state or region|
|zip  <br><p style="color: red;">required</p> |string|none|destination zip code|
|city  <br><p style="color: red;">required</p> |string|none|destination city|
|address  <br><p style="color: red;">required</p> |string|none|destination address|
|address_additional |string|none|additional company address|
|registration_number |string|none|company registration number|
|tax_id |string|none|company tax identifier|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|authorized  <br><p style="color: red;">required</p> |[onboarding.Contacts.Authorized](#schemaonboarding.contacts.authorized)|none|none|
|technical  <br><p style="color: red;">required</p> |[onboarding.Contacts.Technical](#schemaonboarding.contacts.technical)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|bank name|
|address  <br><p style="color: red;">required</p> |string|none|bank address|
|account_number  <br><p style="color: red;">required</p> |string|none|merchant accounting number in bank|
|swift  <br><p style="color: red;">required</p> |string|none|bank SWIFT code|
|details |string|none|any details abount merchant accounting bank|
|correspondent_account |string|none|bank correspondent account|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|date |integer|none|date in unix timestamp when was last payout to merchant|
|amount |number|none|last payout amount to merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|method_percent_fee |number|none|payment method fee in percents|
|method_fixed_fee |number|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|min_amount |number|none|min payment amount|
|max_amount |number|none|max payment amount|
|method_name |string|none|payment method name|
|method_percent_fee |number|none|payment method fee in percents|
|method_fixed_fee |number|none|payment method fixed fee in particular currency|
|method_fixed_fee_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|ps_percent_fee |number|none|paysuper fee in percents|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency |string|none|currency of paysuper fixed fee.  letters code by ISO 4217|
|merchant_home_region |string|none|merchant region name|
|payer_regions |string|none|payer region name|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|payment |[onboarding.Tariff.Payment](#schemaonboarding.tariff.payment)|none|none|
|chargeback |[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|none|none|
|payout |[onboarding.Tariff.Item](#schemaonboarding.tariff.item)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|home_region |string|none|merchant home region name. possible values: asia, europe, latin_america, russia_and_cis, worldwide|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|user identifier|
|email |string|none|user email|
|first_name |string|none|user first name|
|last_name |string|none|user last name|
|profile_id |string|none|user primary onboarding profile identifier|
|registration_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|merchant unique identifier in system|
|company |[onboarding.Company](#schemaonboarding.company)|none|none|
|contacts |[onboarding.Contacts](#schemaonboarding.contacts)|none|none|
|banking |[onboarding.Banking](#schemaonboarding.banking)|none|none|
|status |integer|none|merchant status in system|
|created_at |integer|none|date of create merchant in system in unix timestamp|
|updated_at |integer|none|date of update merchant in system in unix timestamp|
|first_payment_at |integer|none|date when was first payment by some merchant project in system in unix timestamp|
|last_payout |[onboarding.Merchant.LastPayout](#schemaonboarding.merchant.lastpayout)|none|none|
|is_signed |boolean|none|agreement between merchant and system fully signed|
|payment_methods |object|none|list of payment methods activated to merchant|
|agreement_type |integer|none|type of agreement which merchant selected. possible values: 0 - type not select; 1 - paper agreement; 2 - e-sign agreement;|
|agreement_sent_via_mail |boolean|none|mark agreement as sent via post|
|mail_tracking_link |string|none|link to tracking package with agreement in post|
|signature_request |[onboarding.merchant.signatureRequest](#schemaonboarding.merchant.signaturerequest)|none|none|
|tariff |string|none|tariff identifier|
|agreement_template |string|none|license agreement template identifier in hellosign|
|received_date |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|status_last_updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|has_projects |boolean|none|true is merchant has created projects|
|user |[onboarding.Merchant.user](#schemaonboarding.merchant.user)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|new status identifier of merchant. possible statuses: 5 - deleted, 6 - rejected|
|message |string|none|string description to new status|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|status as result of operation|
|message |string|none|string description for error message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status  <br><p style="color: red;">required</p> |integer|none|status as result of operation|
|message |string|none|string description for error message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|price group identifier|
|region |string|none|name of region|
|currency |string|none|code of currency|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|regions |[price_group.Regions](#schemaprice_group.regions)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency |string|none|name of currency|
|region |[price_group.Region](#schemaprice_group.region)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|region |string|none|name of region|
|country |[string]|none|list of countries|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|recommended_price |[price_group.RecommendedPrice](#schemaprice_group.recommendedprice)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|region |string|none|name of region|
|currency |string|none|name of currency|
|amount |number|none|recommended amount|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|ranges |[[price_group.RecommendedPriceTableItem](#schemaprice_group.recommendedpricetableitem)]|none|list of price|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|start point of range|
|to |integer|none|end point of range|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|status before changes|
|to |integer|none|status after changes|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|notification unique identifier in system|
|title |string|none|notification title|
|message |string|none|notification message|
|merchant_id |string|none|merchant identifier who must recieve notification|
|user_id |string|none|user identifier who send notification|
|is_system |boolean|none|notification generated automaticaly|
|is_read |boolean|none|receiver read notification|
|statuses |[onboarding.Merchant.Notification.Statuses](#schemaonboarding.merchant.notification.statuses)|none|none|
|created_at |integer|none|dete of create notification in unix timestamp format|
|updated_at |integer|none|dete of last update notification in unix timestamp format|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer|none|total number of filtered notifications|
|items |[onboarding.Merchant.Notification](#schemaonboarding.merchant.notification)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|title  <br><p style="color: red;">required</p> |string|none|notification title|
|message  <br><p style="color: red;">required</p> |string|none|notification message|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|refund unique identifier|
|order_id |string|none|order unique identifier for which the refund was created|
|external_id |string|none|refund unique identifier on payment system side|
|amount |number|none|refund amount|
|creator_id |string|none|user identifier who created refund|
|reason |string|none|reason to refund|
|currency |string|none|refund currency|
|status |integer|none|refund status. available statuses: 0 - refund was created; 1 - refund rejected on payment system side; 2 - refund in processing on payment system side; 3 - refund successfully completed;|
|created_at |integer|none|dete of create notification in unix timestamp format|
|updated_at |integer|none|dete of last update notification in unix timestamp format|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount  <br><p style="color: red;">required</p> |number|none|refund amount|
|reason |string|none|reason to refund|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|has_psp_signature |boolean|none|flag for set peysuper signature on the agreement|
|has_merchant_signature |boolean|none|flag for set merchant signature on the agreement|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|agreement file name|
|extension  <br><p style="color: red;">required</p> |string|none|agreement file extension|
|content_type  <br><p style="color: red;">required</p> |string|none|agreement file content type|
|size  <br><p style="color: red;">required</p> |integer|none|agreement file size in Kb|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|url |string|none|link to download printable agreement|
|metadata |[onboarding.Merchant.PrintableAgreementData.Metadata](#schemaonboarding.merchant.printableagreementdata.metadata)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|agreement_type  <br><p style="color: red;">required</p> |integer|none|type of agreement which merchant selected. possible values: 1 - paper agreement; 2 - e-sign agreement;|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|project merchant id|
|image |string|none|url to project logo|
|callback_currency |string|none|currency to send payment notification|
|callback_protocol |string|none|protocol identifier to send payment notification. Now available: default, empty|
|create_invoice_allowed_urls |[string]|none|list of urls rom which you can send a request to create an order|
|allow_dynamic_notify_urls |boolean|none|is allow send dynamic notification urls in request to create an order|
|allow_dynamic_redirect_urls |boolean|none|is allow send dynamic user's redirect urls in request to create an order|
|limits_currency |string|none|currency for amount's limit|
|max_payment_amount |number|none|maximal amount allowed for create order|
|min_payment_amount |number|none|minimal amount allowed for create order|
|name |object|none|project names map in other language: {"en": "project name", "ru": "имя проекта"}|
|notify_emails |[string]|none|list of emails to send notifications about successfully completed payment operations|
|is_products_checkout |boolean|none|is allow create order only with amounts from products list|
|secret_key |string|none|secret key for create check hash for request about order statuses changes|
|send_notify_email |boolean|none|is allow send notifications about successfully completed payment operations to user's emails|
|url_check_account |string|none|default url to send request for verification payment data to project|
|url_process_payment |string|none|default url to send request for notification about successfully completed payment to project|
|url_redirect_fail |string|none|default url to redirect user after failed payment|
|url_redirect_success |string|none|default url to redirect user after successfully completed payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|The user's country. Two-letter language code by ISO 3166-1, in lowercase.|
|city |string|none|The user's city.|
|postal_code |string|none|The user's postal code.|
|state |string|none|The user's state code by ISO 3166-2.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|value  <br><p style="color: red;">required</p> |string|none|The parameter value.|
|verified |boolean|none|Whether the value has been verified on the merchant side.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|value  <br><p style="color: red;">required</p> |string|none|The parameter value.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|The user unique identifier on the merchant side.|
|email |[Token.ValueVerified](#schematoken.valueverified)|none|none|
|phone |[Token.ValueVerified](#schematoken.valueverified)|none|none|
|name |[Token.Value](#schematoken.value)|none|none|
|ip |[Token.Value](#schematoken.value)|none|none|
|locale |[Token.Value](#schematoken.value)|none|none|
|address |[Order.BillingAddress](#schemaorder.billingaddress)|none|none|
|metadata |object|none|A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|success |string|none|The redirect URL for the successful payment.|
|fail |string|none|The redirect URL for the failed payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|project_id  <br><p style="color: red;">required</p> |string|none|The ID of the Project found in your merchant account in the PaySuper Dashboard.|
|return_url |[Token.Settings.ReturnUrl](#schematoken.settings.returnurl)|none|none|
|currency |string|none|The currency of the order. Three-letter Currency Code ISO 4217, in uppercase.  If provided, the amount will be processed in this currency.  It is required for a simple checkout payment.|
|amount |number|none|The order amount as a positive number. It is required for a simple checkout payment.|
|products_ids |[string]|none|The list of unique identifiers of Products being in the Project. It is required if a payment type is equal to 'product' or 'key'.|
|description |string|none|The arbitrary order description.|
|type  <br><p style="color: red;">required</p> |string|none|The order type. It depends on your sales option (Game Keys, Virtual Items, the simple checkout). For products created as Game Keys use the 'key' type,  as Virtual Items - the 'product' type, for a simple checkout - the 'simple' type.|
|metadata |object|none|A string value description that you can attach to the user object.  It can be useful for storing additional information about your customer payment.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|user  <br><p style="color: red;">required</p> |[Token.User](#schematoken.user)|none|none|
|settings  <br><p style="color: red;">required</p> |[Token.Settings](#schematoken.settings)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|token  <br><p style="color: red;">required</p> |string|none|A secure string which contains encrypted information about your customer and sales option data.|
|payment_form_url |string|none|The PaySuper-hosted URL of payment form.|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|price|
|currency |string|none|currency|
|region |string|none|region|
|is_virtual_currency |boolean|none|virtual currency flag|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id  <br><p style="color: red;">required</p> |string|none|id of product|
|prices  <br><p style="color: red;">required</p> |[[product.Price](#schemaproduct.price)]|none|list of prices|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|first_name |string|none|user first name|
|last_name |string|none|user last name|
|position |string|none|user position in company|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|product_promotion_and_development |boolean|none|User need help with product promotion and development|
|released_game_promotion |boolean|none|User need help with games promotion that have already been released|
|international_sales |boolean|none|User need help with international sales|
|other |boolean|none|User need help with other problems|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|from |integer|none|range start value|
|to |integer|none|range end value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|paid_subscription |boolean|none|company monetisation from buy paid subscription by company users|
|in_game_advertising |boolean|none|company monetisation from buy in game advertising|
|in_game_purchases |boolean|none|company monetisation from buy in game purchases by company users|
|premium_access |boolean|none|company monetisation from buy premium access by company users|
|other |boolean|none|company monetisation from other activities|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|pc_mac |boolean|none|PC/MacOs|
|game_console |boolean|none|game console|
|mobile_device |boolean|none|mobile device|
|web_browser |boolean|none|web browsers|
|other |boolean|none|other platforms|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|company_name |string|none|company name|
|website |string|none|company website url|
|annual_income |[RangeInt](#schemarangeint)|none|none|
|number_of_employees |[RangeInt](#schemarangeint)|none|none|
|kind_of_activity |string|none|company kind of activity. available values: develop_and_publish_your_games, publish_games_of_other_companies, publish_your_games_through_other_publishers, other|
|monetization |[userProfile.company.monetization](#schemauserprofile.company.monetization)|none|none|
|platforms |[userProfile.company.platforms](#schemauserprofile.company.platforms)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|seconds |integer|none|time in unix timestamp|
|nanos |integer|none|time nano seconds|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|personal |[userProfile.personal](#schemauserprofile.personal)|none|none|
|help |[userProfile.help](#schemauserprofile.help)|none|none|
|company |[userProfile.company](#schemauserprofile.company)|none|none|
|last_step |string|none|identifier of wizard last step which user ended|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|personal |[userProfile.personal](#schemauserprofile.personal)|none|none|
|help |[userProfile.help](#schemauserprofile.help)|none|none|
|company |[userProfile.company](#schemauserprofile.company)|none|none|
|last_step |string|none|identifier of wizard last step which user ended|
|centrifugo_token |string|none|user authorisation token to connect to centrifigo channel|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|review  <br><p style="color: red;">required</p> |string|none|user review about page|
|page_id  <br><p style="color: red;">required</p> |string|none|page identifier. now allowed values: primary_onboarding, merchant_onboarding|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|token  <br><p style="color: red;">required</p> |string|none|email confirmation token|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|company |boolean|none|step company basic info complete|
|contacts |boolean|none|step company contacts complete|
|banking |boolean|none|step company banking complete|
|tariff |boolean|none|step tariff complete|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |string|none|fill status. possible values: draft, life|
|steps |[onboarding.merchant.fillStatus.Steps](#schemaonboarding.merchant.fillstatus.steps)|none|none|
|complete_steps_count |integer|none|count of complete steps|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|signer_type  <br><p style="color: red;">required</p> |integer|none|type of signer which request a signing license agreement. possible values: 0 - merchant owner; 1 - paysuper admin|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|sign_url |string|none|URL of the signature page to display in the embedded iFrame|
|expires_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|name |string|none|payment method name|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|percent |number|none|percent fee|
|fix_amount |number|none|fixed fee in particular currency|
|fix_amount_currency |string|none|currency of fixed fee.  letters code by ISO 4217|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is cost record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|percent  <br><p style="color: red;">required</p> |number|none|percent fee|
|fix_amount |number|none|fixed fee in particular currency|
|fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of fixed fee.  letters code by ISO 4217|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.payment.system](#schemaonboarding.cost.payment.system)]|none|array of system payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.money_back.system](#schemaonboarding.cost.money_back.system)]|none|array of system money back costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|merchant_id |string|none|merchant identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|min_amount |number|none|payment min amount in payout currency|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|method_percent |number|none|payment method fee in percents|
|method_fix_amount |number|none|payment method fixed fee in particular currency|
|method_fix_amount_currency |string|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency |string|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record active for merchant|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|min_amount  <br><p style="color: red;">required</p> |number|none|payment min amount in payout currency|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|method_percent  <br><p style="color: red;">required</p> |number|none|payment method fee in percents|
|method_fix_amount |number|none|payment method fixed fee in particular currency|
|method_fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of payment method fixed fee. 3-letters code by ISO 4217|
|ps_percent  <br><p style="color: red;">required</p> |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee |number|none|paysuper fixed fee in particular currency|
|ps_fixed_fee_currency  <br><p style="color: red;">required</p> |string|none|currency of paysuper fixed fee. 3-letters code by ISO 4217|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason |string|none|money back type. available values: refund, reversal, chargeback|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason  <br><p style="color: red;">required</p> |string|none|money back type. available values: refund, reversal, chargeback|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|unique identifier|
|merchant_id |string|none|merchant identifier|
|name |string|none|payment method name|
|payout_currency |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason |string|none|money back type. available values: refund, reversal, chargeback|
|region |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee in particular currency|
|fix_amount_currency |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant when money back operation will be processing|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|is_active |boolean|none|true is rates record is active|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name  <br><p style="color: red;">required</p> |string|none|payment method name|
|payout_currency  <br><p style="color: red;">required</p> |string|none|payout currency. 3 lettre code by ISO 4217|
|undo_reason  <br><p style="color: red;">required</p> |string|none|money back type. available values: refund, reversal, chargeback|
|region  <br><p style="color: red;">required</p> |string|none|region name|
|country |string|none|two-letter country code by ISO 3166-1|
|days_from |number|none|number of days after payment operation|
|payment_stage |number|none|payment stage|
|percent  <br><p style="color: red;">required</p> |number|none|payment method fee in percents|
|fix_amount |number|none|payment method fixed fee in particular currency|
|fix_amount_currency  <br><p style="color: red;">required</p> |string|none|currency of payment method fixed fee.  letters code by ISO 4217|
|is_paid_by_merchant |boolean|none|if true than commission will to take from merchant when money back operation will be processing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.payment.merchant](#schemaonboarding.cost.payment.merchant)]|none|array of merchant payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|items |[[onboarding.cost.money_back.merchant](#schemaonboarding.cost.money_back.merchant)]|none|array of merchant payment costs|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value |number|none|point value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|value |integer|none|point value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount_current |number|none|total amount calculated for current report|
|amount_previous |number|none|total amount calculated for previous report|
|currency |string|none|report amount currency.  three-letter ISO 4217 currency code, in uppercase.|
|chart |[[dashboard.main_reports.chart.float](#schemadashboard.main_reports.chart.float)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count_current |integer|none|total count of transactions by current period|
|count_previous |integer|none|total count of transactions by previous period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|gross_revenue |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|
|vat |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|
|total_transactions |[dashboard.main_reports.total_transactions](#schemadashboard.main_reports.total_transactions)|none|none|
|arpu |[dashboard.main_reports.amount_with_chart](#schemadashboard.main_reports.amount_with_chart)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount |number|none|revenue amount for label|
|count |integer|none|transactions count for label|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|currency |string|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|items |[[dashboard.revenue_dynamics.item](#schemadashboard.revenue_dynamics.item)]|none|array of points|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|country |string|none|country, two-letter uppercase country code in ISO 3166-1 alpha-2 format|
|amount |number|none|amount by country|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|label |string|none|point label. for example: if period to get report equal month then point label will be equal one day|
|amount |number|none|amount for label|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.revenue_by_country.top](#schemadashboard.base.revenue_by_country.top)]|none|array of objects with information about top 5 countries by revenue by period|
|total_current |number|none|total revenue amount by current period|
|total_previous |number|none|total revenue amount by previous period|
|currency |string|none|amount currency. three-letter ISO 4217 currency code, in uppercase.|
|chart |[dashboard.base.chart](#schemadashboard.base.chart)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|sold item name|
|count |integer|none|item total count which were sold in period|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.sales_today.top.item](#schemadashboard.base.sales_today.top.item)]|none|array of objects with information about top 5 merchant products (projects) which were sold in period|
|total_current |integer|none|items total count which were sold by chosen period|
|total_previous |integer|none|items total count which were sold by previous period to chosen period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|name |string|none|url of issuer|
|count |integer|none|total count|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[dashboard.base.sources.top.item](#schemadashboard.base.sources.top.item)]|none|array of objects with information about top 5 issuers url|
|total_current |integer|none|transactions total count by chosen period|
|total_previous |integer|none|transactions total count by previous period to chosen period|
|chart |[[dashboard.main_reports.chart.integer](#schemadashboard.main_reports.chart.integer)]|none|array contain objects for chart drawing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|revenue_by_country |[dashboard.base.revenue_by_country](#schemadashboard.base.revenue_by_country)|none|none|
|sales_today |[dashboard.base.sales_today](#schemadashboard.base.sales_today)|none|none|
|sources |[dashboard.base.sources](#schemadashboard.base.sources)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|merchant identificator|
|currency |string|none|currency|
|debit |number|none|balance debit|
|credit |string|none|balance credit|
|rolling_reserve |number|none|current rooling reserve balance|
|total |number|none|total amount|
|created_at |string|none|last update date|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|document id|
|source_id |[string]|none|royalty reports id|
|transaction |string|none|transaction id|
|total_fees |number(double)|none|total_fees|
|balance |number(double)|none|amount|
|currency |string|none|currency|
|status |string|none|status, one of skip pending in_progress paid canceled failed|
|description |string|none|description|
|destination |[onboarding.Banking](#schemaonboarding.banking)|none|none|
|created_at |string(date-time)|none|creation date|
|updated_at |string(date-time)|none|update date|
|arrival_date |string(date-time)|none|arrival date|
|failure_code |string|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message |string|none|failure message|
|failure_transaction |string|none|failure transaction|
|merchant_id |string|none|merchant identificator|
|signature_data |[billingPayoutDocumentSignatureData](#schemabillingpayoutdocumentsignaturedata)|none|none|
|has_merchant_signature |boolean(boolean)|none|is document signed by merchant|
|has_psp_signature |boolean(boolean)|none|is document signed by paysuper|
|signed_document_file_url |string|none|url to signed file|
|period_from |string(date-time)|none|payout period start|
|period_to |string(date-time)|none|payout period end|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|details_url |string|none|none|
|files_url |string|none|none|
|signature_request_id |string|none|none|
|merchant_signature_id |string|none|none|
|ps_signature_id |string|none|none|
|merchant_sign_url |[billingPayoutDocumentSignatureDataSignUrl](#schemabillingpayoutdocumentsignaturedatasignurl)|none|none|
|ps_sign_url |[billingPayoutDocumentSignatureDataSignUrl](#schemabillingpayoutdocumentsignaturedatasignurl)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|sign_url |string|none|none|
|expires_at |string(date-time)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |number|none|number of found documents|
|items |[[billingPayoutDocument](#schemabillingpayoutdocument)]|none|array with documents|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|merchant_id |string|none|merchant identificator to create payout document for|
|description |string|none|document description|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|transaction |string|none|transaction id|
|status |string|none|status, one of skip pending in_progress paid canceled failed|
|failure_code |string|none|failure code, one of account_closed account_frozen account_restricted destination_bank_invalid could_not_process declined insufficient_funds invalid_account_number incorrect_account_holder_name invalid_currency|
|failure_message |string|none|failure message|
|failure_transaction |string|none|failure transaction|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount |number|none|price amount|
|currency |string|none|price currency. three-letter ISO 4217 currency code, in uppercase.|
|region |string|none|region name for this price. available regions: oceania, eu, cis, north_europe, north_africa, polynesia, north_america, central_africa, south_europe, antarctica, south_america, south_asia, caribbean, west_asia, central_america, west_africa, southern_africa, southeast_asia, east_africa, east_asia, micronesia, west_europe, latin_america, melanesia, russia, sub_saharan_africa, south_africa|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|product identifier|
|project_id |string|none|project identifier for which created product|
|object |string|none|system constant conteined returning object type. for product object always must be - product|
|type |string|none|product type|
|sku |string|none|product sku (simple slug name)|
|name |object|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency |string|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled |boolean|none|true is product is enabled|
|prices |[[price](#schemaprice)]|none|array of available prices for product|
|description |object|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description |object|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|images |[string]|none|array of product images. if images not set then field can be null|
|url |string|none|url to product on project side|
|metadata |object|none|object can contain any other information about product. object must contain only string values|
|billing_type |string|none|Type of billing|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|project_id |string|none|project identifier for which created product|
|object |string|none|system constant conteined returning object type. for product object always must be - product|
|type |string|none|product type|
|sku |string|none|product sku (simple slug name)|
|name |object|none|product names map in other language: {"en": "project name", "ru": "имя проекта"}|
|default_currency |string|none|default currency for selling product. three-letter ISO 4217 currency code, in uppercase.|
|enabled |boolean|none|true is product is enabled|
|prices |[[price](#schemaprice)]|none|array of available prices for product|
|description |object|none|product short descriptions map in other language: {"en": "project short description", "ru": "короткое описание проекта"}|
|long_description |object|none|product long descriptions map in other language: {"en": "project long description", "ru": "длинное описание проекта"}|
|created_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|updated_at |[ProtobufTimestamp](#schemaprotobuftimestamp)|none|none|
|images |[string]|none|array of product images. if images not set then field can be null|
|url |string|none|url to product on project side|
|metadata |object|none|object can contain any other information about product. object must contain only string values|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|report id|
|merchant_id |string|none|merchant id|
|created_at |string(date-time)|none|date of report creation|
|updated_at |string(date-time)|none|date of report last update|
|payout_date |string(date-time)|none|date when report was paid|
|status |string|none|status of report|
|period_from |string(date-time)|none|start of report time period|
|period_to |string(date-time)|none|end of report time period|
|accept_expire_at |string(date-time)|none|date when report will be auto-accepted, if merchant didn't accept or start a dispute yet|
|accepted_at |string(date-time)|none|date when report was accepted|
|totals |[billingRoyaltyReportTotals](#schemabillingroyaltyreporttotals)|none|none|
|currency |string|none|currency of report|
|summary |[billingRoyaltyReportSummary](#schemabillingroyaltyreportsummary)|none|none|
|dispute_reason |string|none|reason of dispute (if it was started)|
|dispute_started_at |string(date-time)|none|date of dispute beginning (if it was started)|
|dispute_closed_at |string(date-time)|none|date of dispute resolve (if it was started)|
|is_auto_accepted |boolean(boolean)|none|flag of auto-acceptance|
|payout_document_id |string|none|cross-link to payout invoice, that includes this royalty report|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|accounting_entry_id |string|none|linked accounting entry id|
|amount |number(double)|none|amount of correction|
|currency |string|none|currency|
|reason |string|none|reason if correction|
|entry_date |string(date-time)|none|date of correction|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|product |string|none|product or project name|
|region |string|none|country ISO Alpha2 code|
|total_transactions |integer(int32)|none|total number of transactions for current product/project in current country (including sales and returns)|
|sales_count |integer(int32)|none|number of sales for current product/project in current country|
|gross_sales_amount |number(double)|none|gross amount of sales for current product/project in current country|
|returns_count |integer(int32)|none|number of returns for current product/project in current country|
|gross_returns_amount |number(double)|none|gross amount of returns for current product/project in current country|
|gross_total_amount |number(double)|none|resulting gross amount for current product/project in current country (sales minus returns)|
|total_fees |number(double)|none|fees amount for current product/project in current country|
|total_vat |number(double)|none|vat amount for current product/project in current country|
|payout_amount |number(double)|none|payout amount for current product/project in current country|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|products_items |[[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)]|none|summary details for each product/project and country|
|products_total |[billingRoyaltyReportProductSummaryItem](#schemabillingroyaltyreportproductsummaryitem)|none|none|
|corrections |[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|none|list of corrections applied (if any)|
|rolling_reserves |[[billingRoyaltyReportCorrectionItem](#schemabillingroyaltyreportcorrectionitem)]|none|list of rolling reserves applied (if any)|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|transactions_count |integer(int32)|none|total transactions count (including sales and returns)|
|fee_amount |number(double)|none|fees amount|
|vat_amount |number(double)|none|vat amount|
|payout_amount |number(double)|none|payput amount|
|rolling_reserve_amount |number(double)|none|applied rolling reserve total amount|
|correction_amount |number(double)|none|applied corrections total amount|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|status |string|none|new report status|
|reason  <br><p style="color: red;">required</p> |string|none|correction reason|
|correction |[grpcChangeRoyaltyReportCorrection](#schemagrpcchangeroyaltyreportcorrection)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|amount  <br><p style="color: red;">required</p> |number(double)|none|correction amount (in report's currency)|
|reason  <br><p style="color: red;">required</p> |string|none|correction reason|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|total items count|
|items |[[billingRoyaltyReport](#schemabillingroyaltyreport)]|none|royalty reports|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|none|
|items |[[paylinkPaylink](#schemapaylinkpaylink)]|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|top |[[paylinkStatCommon](#schemapaylinkstatcommon)]|none|top items of grouping stat data|
|total |[paylinkStatCommon](#schemapaylinkstatcommon)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|paylink id|
|object |string|none|object type|
|products |[string]|none|list of products included to paylink|
|expires_at |string(date-time)|none|expiration date|
|created_at |string(date-time)|none|creation date|
|updated_at |string(date-time)|none|last updation date|
|merchant_id |string|none|paylink merchant id"|
|project_id |string|none|paylink project id"|
|name |string|none|paylink name|
|is_expired |boolean(boolean)|none|is expired flag|
|visits |integer(int32)|none|total visits count|
|no_expiry_date |boolean(boolean)|none|no expiry date flag|
|products_type |string|none|products type|
|total_transactions |integer(int32)|none|total transactions count|
|sales_count |integer(int32)|none|sales count|
|returns_count |integer(int32)|none|returns count|
|conversion |number(double)|none|conversion (sales per visits relation)|
|gross_sales_amount |number(double)|none|gross sales amount|
|gross_returns_amount |number(double)|none|gross returns amount|
|gross_total_amount |number(double)|none|gross total amount|
|transactions_currency |string|none|transactions currency ISO code|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|paylink_id |string|none|paylink id|
|visits |integer(int32)|none|total visits count|
|total_transactions |integer(int32)|none|total transactions count|
|sales_count |integer(int32)|none|sales count|
|returns_count |integer(int32)|none|returns count|
|gross_sales_amount |number(double)|none|gross sales amount|
|gross_returns_amount |number(double)|none|gross returns amount|
|gross_total_amount |number(double)|none|gross total amount|
|transactions_currency |string|none|transactions currency ISO code|
|conversion |number(double)|none|conversion, optional|
|country_code |string|none|country iso code A2, optional|
|date |string|none|date yyyy-mm-dd, optional|
|referrer_host |string|none|referrer host value, optional|
|utm |[paylinkUtm](#schemapaylinkutm)|none|none|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|utm_source |string|none|utm_source value|
|utm_medium |string|none|utm_medium value|
|utm_campaign |string|none|utm_campaign value|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|paylink id, optional, used only for edit existing paylink|
|products |[string]|none|list of products included to paylink|
|expires_at |number|none|expiration date as unix timestamp|
|project_id |string|none|paylink project id"|
|name |string|none|paylink name|
|no_expiry_date |boolean(boolean)|none|no expiry date flag|
|products_type |string|none|products type|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|id |string|none|vat report id|
|country |string|none|country ISO A2 code|
|vat_rate |number(double)|none|rate value of VAT|
|currency |string|none|vat currency ISO code|
|transactions_count |integer(int32)|none|total transactions count in period|
|gross_revenue |number(double)|none|gross revenue amount in period|
|vat_amount |number(double)|none|vat amount in period|
|fees_amount |number(double)|none|fees amount in period|
|deduction_amount |number(double)|none|deduction amount in period|
|correction_amount |number(double)|none|manual correction amount in period|
|status |string|none|status|
|country_annual_turnover |number(double)|none|annual turnover for country|
|world_annual_turnover |number(double)|none|world annual turnover|
|amounts_approximate |boolean(boolean)|none|flag of non-final amounts due to currency exchange rates delay|
|date_from |string(date-time)|none|period start date|
|date_to |string(date-time)|none|period end date|
|pay_until_date |string(date-time)|none|VAT payment deadline date|
|created_at |string(date-time)|none|report creation date|
|updated_at |string(date-time)|none|report last update date|
|paid_at |string(date-time)|none|date of payment|

### Properties

|Name|Type|Restrictions|Description|
|---|---|---|---|
|count |integer(int32)|none|total reports count|
|items |[[billingVatReport](#schemabillingvatreport)]|none|reports|

