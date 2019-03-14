# Payouts

A Payout object represents the request to receive funds from PaySuper, or request status when you initiate a payout to
either a bank account.

## The Payout object
> Example object

```json
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
```

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|object|string|String representing the object’s type. Objects of the same type share the same value.|
|type|string|String representing the destination type - bank account or card.|
|status|string|String representing the current payout status.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been created.|
|arrival_date|string|A forecast date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when the payment should reach your Bank account.|
|amount|float|A positive float with two decimal points(e.g., 1.00 to charge $1.00) representing how much to payout.| 
|currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.| 
|payout_url|string|String representing the URL in PaySuper for details if given payout.| 
|automatic|boolean|True is payout was initiated by PaySuper system.|
|description|string|An arbitrary string attached to the object.|
|destination|string|ID of the bank account the payout was sent to.|
|failure_balance_transaction|string|If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.|
|failure_code|string|Error code explaining reason for payout failure if available.|
|failure_message|Message to user further explaining reason for payout failure if available.|
|live|boolean| True is payout request originated from the live environment.|
|metadata|object| Set of key-value pairs that attached to an object on payout request.|

### Failure codes 

Payouts can fail for a variety of reasons. The reason a given payout failed is available in a Payout object's failure_code 
attribute. 

|Value|Description|
|---|---|
|account_closed|The bank account has been closed.|
|account_frozen|The bank account has been frozen.|
|could_not_process|The bank could not process this payout.|
|declined|The bank has declined this transfer. Please contact the bank before retrying.|
|invalid_account_number|The account number is invalid.|
|incorrect_account_holder_name|Your bank notified us that the bank account holder name on file is incorrect.|
|invalid_currency|The bank was unable to process this payout because of its currency. This is probably because the bank account cannot accept payments in that currency.|
|no_account|The bank account details on file are probably incorrect. No bank account could be located with those details.|
