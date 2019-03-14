# Users

User represents one single customer in PaySuper system. We will generate unique identity for each customer and update
user profile with any information we got from each payment. User profile also used as part of fraud protection in 
PaySuper.

## The User object
> Example object

```json
{
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
  "metadata": {}
}
```

### Attributes
 
|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|object|object| The object representing user in PaySuper system. Objects of the same type share the same value.|
|name|string| The name of user.|
|email|string| The email of user.|
|email_verified| boolean| True is user confirm they email.|
|phone|string| String representing the user`s phone.|
|phone_verified| boolean| True is user confirm they phone.|
|ip|string|String representing the user`s last used ip.|
|locale|string|Preferred locale for the payment page in [ISO 639-1](https://en.wikipedia.org/wiki/ISO_639-1) language code format. 
|address.country|string| String representing the  user`s country by given IP. Two-letter uppercase country code in [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) format.|
|address.city|string| String representing the  user`s city by given IP.|
|address.postal_code|string| String representing the user`s postal code by given IP.|
|address.state|string| String representing the user`s State/County/Province/Region. by given IP.|
|metadata|object| Set of key-value pairs that attached to an object on create order state.|
