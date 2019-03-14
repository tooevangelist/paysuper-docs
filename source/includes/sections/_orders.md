# Orders 
Order objects are created to handle end customers' purchases of previously defined products. You can create, retrieve,
and pay individual orders, as well as list all orders. Orders are identified by a unique, random ID.

## The Order object
> Example object


```json
{
  "id": "22d6d597-000f-5000-9000-145f6df21d6f",
  "transaction": "22d6d597-000f-5000-9000-145f6df21d6f",
  "object": "order",
  "description": "Order No. 72",
  "created_at": "2018-07-10T14:27:54.691Z",
  "canceled_at": null,
  "canceled": false,
  "cancellation_reason": null,
  "refunded": false,
  "refunded_at": null,
  "receipt_email": "jenny@example.com",
  "receipt_phone": "",
  "receipt_number": "id-string",
  "receipt_url": "https://pay.super.com/receipts/long-id-string-for-receipt",
  "agreement_version": "1.0",
  "agreement_accepted": true,
  "notify_sale": false,
  "notify_sale_email": null,
  "issuer": {
    "url": "https://buy.example.com",
    "embedded": true
  },
  "amount": "2.00",
  "currency": "USD",
  "user": {
    "id": "1234567890",
    "object": "user",
    "name": "unknown",
    "email": "test@example.com",
    "email_verified": false,
    "phone": "12345",
    "phone_verified": false,
    "ip": "127.0.0.1",
    "locale": "en",
    "address": {
      "country": "US",
      "city": "New York",
      "postal_code": "123456",
      "state": "NY"
    },
    "metadata": {
      "externalId": "some id"
    }
  },
  "payout": {
    "amount": "2.00",
    "currency": "USD",
    "effective_rate": "0.05"
  },
  "platform_fee": {
    "amount": "2.00",
    "currency": "USD",
    "effective_rate": "0.05"
  },
  "billing_address": {
    "country": "US",
    "city": "New York",
    "postal_code": "123456",
    "state": "NY"
  },
  "tax": {
    "type": "vat|sales_tax|НДС",
    "rate": 0.10,
    "amount": "2.00",
    "currency": "USD"
  },
  "method": {
    "type": "bank_card",
    "title": "Bank card *4444",
    "saved": false,
    "card": {
      "first6": "555544",
      "last4": "4444",
      "masked": "5555 44** **** 4444",
      "expiry_month": "07",
      "expiry_year": "2021",
      "brand": "MasterCard",
      "fingerprint": "hash",
      "3ds": false
    },
    "crypto_currency": {
      "brand": "bincoin",
      "address": "EgX1BRd6k9cbxcEgX1BRd6k9cbxcEgX1BRd6k9cbxc"      
    }, 
    "wallet": {
      "brand": "Yandex Money",
      "account": "410200391399912"
    },
    "fee": {
      "value": "2.00",
      "currency": "USD",
      "effective_rate": "0.1"
    }
  },
  "items": [
    {
      "id": "prod_EgX1BRd6k9cbxc",
      "object": "product",
      "sku": "sku1234568",
      "name": "The Game",
      "description": "Super game steam keys",
      "created_at": "2018-07-10T14:27:54.691Z",
      "updated_at": "2018-07-17T14:28:32.484Z",
      "images": [],
      "url": null,
      "metadata": {}
    }
  ],
  "refund": {
    "amount": 100,
    "currency": "USD",
    "reason": "fraud",
    "code": "ID_FRAUD",
    "receipt_number": "",
    "receipt_url": "https://pay.super.com/receipts/long-id-string-for-receipt"
  },
  "metadata": {
    "some_data_from_create_payment": "any data"
  }
}
```

### Attributes
|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|transaction|string|Unique identifier for the transaction in payment system.|
|object|string| String representing the object’s type. Objects of the same type share the same value.|
|description|string|An arbitrary string attached to the object. Often useful for displaying to users.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when an order has been created.|
|canceled_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when an order has been canceled.|
|canceled|boolean|True if current order object was canceled.|
|cancellation_reason|string|String representing the cancellation reasons.|
|refunded|boolean|True if current order object was refunded.|
|refunded_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when an order has been refunded.|
|receipt_email|string|String representing the customer email for receipt information. Could be different with user email.|
|receipt_phone|string|String representing the customer phone for receipt information. Could be different with user phone. |
|receipt_number|string|String representing the unique id for receipt.|
|receipt_url|string|String representing the URL in PaySuper service for online access to given receipt.|
|agreement_version|string|String representing the EULA agreement accepted by payment.|
|agreement_accepted|boolean|True if agreement was accepted.|
|notify_sale|boolean|True if user confirm to be informed about feature sales or discounts.|
|notify_sale_email|string|String representing the customer email for sales.Could be different with user email.|
|issuer.url|string|String representing the store reference URL.|
|issuer.embedded|boolean|True if PaySuper embedded form was used to collect payment.|
|amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing how much to charge.| 
|currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.| 
|user|object|Object representing User for current Order.|
|payout.amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing the possible payout.|
|payout.currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.|
|payout.effective_rate|float|A positive float with two decimal points representing the actual rate of payout for the payment.|
|platform_fee.amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing the PaySuper fee.|
|platform_fee.currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.|
|platform_fee.effective_rate|float|A positive float with two decimal points representing the actual rate of the PaySuper fee for the payment.|
|billing_address.country|string| String representing the the user`s country by payment form. Two-letter uppercase country code in [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) format.|
|billing_address.city|string| String representing the  user`s city by payment form .|
|billing_address.postal_code|string| String representing the user`s postal code by payment form .|
|billing_address.state|string| String representing the user`s State/County/Province/Region. by payment form .|
|tax.type|string|String representing the tax type (sales tax for USA, vat for EU, НДС for Russia).| 
|tax.rate|float|A positive float with two decimal points representing current user location taxes.|
|tax.amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing the tax amount.|
|tax.currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.|
|method.type|string|String representing the payment method type. Some of method object fields available to specific type.|
|method.title|string|String representing the human readable method name.|
|method.saved|boolean|True is payment method was saved by user for future usage.| 
|method.card.first6|string|String representing the first 6 digits of the card. Available only for a card method.|
|method.card.last4|string|String representing the last 4 digits of the card. Available only for a card method.|
|method.card.expiry_month|string|String representing the validity month of the card. Available only for a card method.|
|method.card.expiry_year|string|String representing the validity year of the card. Available only for a card method.|
|method.card.brand|string|String representing the brand of the card issuer. Available only for a card method.|
|method.card.fingerprint|string|String representing the internal fingerprint for given card. Available only for a card method.| 
|method.card.3ds|boolean|True is 3DS secure was used during payment. Available only for a card method.|
|method.crypto_currency.brand|string|String representing the name of the crypto currency. Available only for a crypto currency.|
|method.crypto_currency.address|string|String representing the customer address in the crypto currency. Available only for a crypto currency.|
|method.wallet.brand|string|String representing the name of the wallet. Available only for an integrated wallet payment systems.|
|method.wallet.account|string|String representing the customer identity in the wallet. Available only for an integrated wallet payment systems.|
|method.fee.amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing the payment method fee.|
|method.fee.currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.|
|method.fee.effective_rate|float|A positive float with two decimal points representing the actual rate of the payment method fee for the payment.|
|items|object[]|Array of Product objects associated with current Order.|
|refund.amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing the refund amount.|
|refund.currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.|
|refund.reason|string|String representing the refund reasons.|
|refund.code|string|String representing the PaySuper internal identity for refund reasons.|
|refund.receipt_number|string|String representing the unique id for refund receipt.|
|refund.receipt_url|string|String representing the URL in PaySuper service for online access to given refund receipt.|
|metadata|object| Set of key-value pairs that attached to an object on create order state.|
        

