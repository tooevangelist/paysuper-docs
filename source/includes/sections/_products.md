# Products

Store representations of digital products you sell in PaySuper.

## The Product object
> Example object

```json
{
    "id": "5ca5124868add448289e432e",
    "object": "product",
    "type": "simple_product",
    "project_id": "5be2e16701d96d00012d26c3",
    "sku": "ru_0_gta_31",
    "name": {
        "en": "GTA 3"
    },
    "default_currency": "USD",
    "enabled": true,
    "prices": [
        {
            "amount": 101,
            "currency": "USD"
        }
    ],
    "description": {
        "en": "GTA 3 description"
    },
    "long_description": {
        "en": "GTA 3 long description"
    },
    "created_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "updated_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "images": ["http://some.host.ru/images/img1.jpg", "http://some.host.ru/images/img2.jpg"],
    "url": "http://mylanding.ru/games/gta3",
    "metadata": {
        "some_key": "some_data"
    },
    "pricing": "currency"
}
``` 

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|object|string|String representing the object’s type. Objects of the same type share the same value.|
|type|string|String representing the destination type - type of product.|
|project_id|string| Identifier of project, with which the product is associated.|
|sku|string|String representing the stock keeping unit.|
|name|map[string]string|An map object, where keys are locales, and values is product name in key's locale.|
|default_currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|enabled|boolean| True is product available for purchase.| 
|prices|array|The list of prices for all available regional prices for product.|
|description|map[string]string|An map object, where keys are locales, and values is product description in key's locale.|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been created.|
|updated_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been updated.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
|pricing|string|Pricing mode (currency manual steam default).|

## Create a Product

```
# Definition
POST /admin/api/v1/products
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products
   -X POST -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
         "object": "product",
         "type": "simple_product",
         "sku": "ru_0_gta_31",
         "name": {
           "en": "GTA 3"
         },
         "default_currency": "USD",
         "enabled": true,
         "prices": [
           {
             "amount": 101,
             "currency": "USD"
           }
         ],
         "description": {
           "en": "GTA 3 description"
         },
         "long_description": {},
         "project_id": "5be2e16701d96d00012d26c3",
         "pricing": "currency"
       }'

# Example response
{
    "id": "5ca5124868add448289e432e",
    "project_id": "5be2e16701d96d00012d26c3",
    "object": "product",
    "type": "simple_product",
    "sku": "ru_0_gta_31",
    "name": {
        "en": "GTA 3"
    },
    "default_currency": "USD",
    "enabled": true,
    "prices": [
        {
            "amount": 101,
            "currency": "USD"
        }
    ],
    "description": {
        "en": "GTA 3 description"
    },
    "long_description": null,
    "created_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "updated_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "images": null,
    "url": "",
    "metadata": null,
    "pricing": "currency"
}
```
### Arguments

|Name|Type|Description|
|---|---|---|
|project_id|string|**REQUIRED** Identifier of project, with which the product is associated.|
|object|string|**REQUIRED** String representing the object’s type. Objects of the same type share the same value.|
|type|string|**REQUIRED** String representing the destination type - type of product.|
|sku|string|**REQUIRED** String representing the stock keeping unit.|
|name|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product name in key's locale. Must have, at least, value in default system locale|
|default_currency|string|**REQUIRED**Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|enabled|boolean|**REQUIRED** True is product available for purchase.| 
|prices|array|**REQUIRED** The list of prices for all available regional prices for product. Must have at least price in default_currency|
|description|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product description in key's locale. Must have, at least, value in default system locale|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
|pricing|string|Pricing mode (currency manual steam default).|


## Update a Product

```
# Definition
PUT /admin/api/v1/products/:product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products/5ca5124868add448289e432e
   -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
         "object": "product",
         "type": "simple_product",
         "sku": "ru_0_gta_31",
         "name": {
           "en": "GTA 3"
         },
         "default_currency": "USD",
         "enabled": true,
         "prices": [
           {
             "amount": 101,
             "currency": "USD"
           }
         ],
         "description": {
           "en": "GTA 3 description"
         },
         "long_description": {},
         "project_id": "5be2e16701d96d00012d26c3",
         "pricing": "currency"
       }'

# Example response
{
    "id": "5ca5124868add448289e432e",
    "project_id": "5be2e16701d96d00012d26c3",
    "object": "product",
    "type": "simple_product",
    "sku": "ru_0_gta_31",
    "name": {
        "en": "GTA 3"
    },
    "default_currency": "USD",
    "enabled": true,
    "prices": [
        {
            "amount": 101,
            "currency": "USD"
        }
    ],
    "description": {
        "en": "GTA 3 description"
    },
    "long_description": null,
    "created_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "updated_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "images": null,
    "url": "",
    "metadata": null,
    "pricing": "currency"
}
```
### Arguments

|Name|Type|Description|
|---|---|---|
|project_id|string|**REQUIRED** Identifier of project, with which the product is associated.|
|object|string|**REQUIRED** String representing the object’s type. Objects of the same type share the same value.|
|type|string|**REQUIRED** String representing the destination type - type of product.|
|sku|string|**REQUIRED** String representing the stock keeping unit.|
|name|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product name in key's locale. Must have, at least, value in default system locale|
|default_currency|string|**REQUIRED**Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|enabled|boolean|**REQUIRED** True is product available for purchase.| 
|prices|array|**REQUIRED** The list of prices for all available regional prices for product. Must have at least price in default_currency|
|description|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product description in key's locale. Must have, at least, value in default system locale|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
|pricing|string|Pricing mode (currency manual steam default).|

## Get a Product

```
# Definition
GET /admin/api/v1/products/:product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products/5ca5124868add448289e432e \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "id": "5ca5124868add448289e432e",
    "project_id": "5be2e16701d96d00012d26c3",
    "object": "product",
    "type": "simple_product",
    "sku": "ru_0_gta_31",
    "name": {
        "en": "GTA 3"
    },
    "default_currency": "USD",
    "enabled": true,
    "prices": [
        {
            "amount": 101,
            "currency": "USD"
        }
    ],
    "description": {
        "en": "GTA 3 description"
    },
    "long_description": null,
    "created_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "updated_at": {
        "seconds": 1554321992,
        "nanos": 11905100
    },
    "images": null,
    "url": "",
    "metadata": null,
    "pricing": "currency"
}
``` 

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of product|

## Delete product
```
# Definition
DELETE /admin/api/v1/products/:product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products/5ca5124868add448289e432e \
      -X DELETE -H "Authorization: Bearer %access_token_here%"

# Example response
No content in response
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of product|


## List of products

By default, returns full list of all Merchant's products. Some filters may be applied.

```
# Definition
GET /admin/api/v1/products?name=car&sku=ru_0&project_id=5bdc39a95d1e1100019fb7df&offset=0&limit=10
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products?name=car&sku=ru_0&project_id=5bdc39a95d1e1100019fb7df&offset=0&limit=10 \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response

{
    "limit": 1,
    "offset": 0,
    "total": 1,
    "products": [
        {
            "id": "5c9e152e9fb5a85298c090fd",
            "object": "product",
            "type": "simple_product",
            "sku": "ru_0_doom_2",
            "name": {
                "en": "Doom II"
            },
            "default_currency": "USD",
            "enabled": true,
            "prices": [
                {
                    "amount": 12.93,
                    "currency": "USD"
                }
            ],
            "description": {
                "en": "Doom II description"
            },
            "long_description": null,
            "created_at": {
                "seconds": 1553863982,
                "nanos": 132000000
            },
            "updated_at": {
                "seconds": 1553863982,
                "nanos": 132000000
            },
            "images": null,
            "url": "",
            "metadata": null,
            "project_id": "5bdc39a95d1e1100019fb7df"
        }
    ]
}
```
### Arguments

|Name|Type|Description|
|---|---|---|
|name|string|Part of product's name to filter by name (substring match)|
|sku|string|Part of product's name to filter by sku (substring match)|
|project_id|string|Project Id, to filter by|
|offset|number|offset from first item position|
|limit|number|maximum items per page|
