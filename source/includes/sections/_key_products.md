# Key Products

Store representations of product with keys you sell in PaySuper.

## The Key Product object
> Example object

```json
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": {
    "en": "GTA 3"
  },
  "description": {
    "en": "GTA 3 description"
  },
  "long_description": {
    "en": "GTA 3 long description"
  },
  "created_at": "2019-08-13T08:23:25Z",
  "updated_at": "2019-08-13T08:23:25Z",
  "sku": "gta_3_common",
  "images": ["http://some.host.ru/images/img1.jpg", "http://some.host.ru/images/img2.jpg"],
  "url": "http://mylanding.ru/games/gta3",
  "metadata": {
    "some_key": "some_data"
  },
  "enabled": true,
  "default_currency": "USD",
  "platforms": [
    {
      "id": "gog",
      "name": "Good old games.com",
      "prices": [
        {
          "region": "string",
          "amount": 29.99,
          "currency": "EUR"
        }
      ]
    }
  ],
  "published_at": "2019-08-13T08:23:25Z",
  "pricing": "steam"
}
```

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|object|string|String representing the object’s type. Objects of the same type share the same value.|
|project_id|string| Identifier of project, with which the product is associated.|
|sku|string|String representing the stock keeping unit.|
|name|map[string]string|An map object, where keys are locales, and values is product name in key's locale.|
|default_currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|enabled|boolean| True is product available for purchase.| 
|platforms|array|The list of platforms for all available with prices|
|platforms.id|string|Identifier for platform (steam, gog, xbox, etc.)|
|platforms.name|string|Name for platform (Steam, GOG, Xbox Store, etc.)|
|platforms.prices|array|The list of prices for specified platform for all available regional prices for key product.|
|description|map[string]string|An map object, where keys are locales, and values is product description in key's locale.|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been created.|
|updated_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been updated.|
|published_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been published.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
|pricing|string|Pricing mode (currency manual steam default).|

## List of products

By default, returns full list of all Merchant's products. Some filters may be applied.

```shell
# Definition
GET /admin/api/v1/products?name=car&sku=ru_0&project_id=5bdc39a95d1e1100019fb7df&offset=0&limit=10
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/products?name=car&sku=ru_0&project_id=5bdc39a95d1e1100019fb7df&offset=0&limit=10 \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response

{
    "total_count": 1,
    "items": [
        {
            "id": "5ca5124868add448289e432e",
            "project_id": "5be2e16701d96d00012d26c3",
            "name": {
                "en": "The Awesome Game",
            },
            "description": {
                "en": "The Awesome Game Description",
            },
            "created_at": "2019-08-13T08:23:25Z",
            "updated_at": "2019-08-13T08:23:25Z",
            "sku": "en_awesome_game",
            "images": [],
            "enabled": true,
            "default_currency": "USD",
            "pricing": "currency",
            "platforms": [
                {
                    "id": "steam",
                    "name": "Steam",
                    "prices": [
                        {
                            "region": "EUR",
                            "amount": 29.99,
                            "currency": "EUR"
                        }
                    ]
                }
            ]
        }
    ]
}
```
### Arguments

|Name|Type|Description|
|---|---|---|
|name|string|Part of key product's name to filter by name (substring match)|
|sku|string|Part of key product's name to filter by sku (substring match)|
|project_id|string|Project Id, to filter by|
|offset|number|offset from first item position|
|limit|number|maximum items per page|
|pricing|string|Pricing mode (currency manual steam default).|

## Create a Key Product

```shell
# Definition
POST /admin/api/v1/key-products
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products
   -X POST -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
        "name": {
            "en": "The Awesome Game",
        },
        "project_id": "5be2e16701d96d00012d26c3",
        "description": {
            "en": "The Awesome Game Description",
        },
        "sku": "en_awesome_game",
        "default_currency": "USD",
        "pricing": "currency",
        }'

# Example response
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": {
    "en": "The Awesome Game",
  },
  "description": {
    "en": "The Awesome Game Description",
  },
  "created_at": "2019-08-13T08:23:25Z",
  "updated_at": "2019-08-13T08:23:25Z",
  "sku": "en_awesome_game",
  "images": [],
  "enabled": false,
  "default_currency": "USD",
  "platforms": [],
  "pricing": "currency",
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|project_id|string|**REQUIRED** Identifier of project, with which the product is associated.|
|object|string|**REQUIRED** String representing the object’s type. Objects of the same type share the same value.|
|sku|string|**REQUIRED** String representing the stock keeping unit.|
|name|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product name in key's locale. Must have, at least, value in default system locale|
|default_currency|string|**REQUIRED** Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), representing the product default currency.|
|description|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product description in key's locale. Must have, at least, value in default system locale|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|

## Update a Key Product

```shell
# Definition
PUT /admin/api/v1/key-products/:key_product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e
   -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
            "project_id": "5be2e16701d96d00012d26c3",
            "name": {
                "en": "The Awesome Game",
            },
            "description": {
                "en": "The Awesome Game Description",
            },
            "default_currency": "USD"
            "pricing": "currency",
        }'

# Example response
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": {
    "en": "The Awesome Game",
  },
  "description": {
    "en": "The Awesome Game Description",
  },
  "created_at": "2019-08-13T08:23:25Z",
  "updated_at": "2019-08-13T08:23:25Z",
  "sku": "en_awesome_game",
  "images": [],
  "enabled": false,
  "default_currency": "USD",
  "platforms": [],
  "pricing": "currency",
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|project_id|string|**REQUIRED** Identifier of project, with which the product is associated.|
|object|string|**REQUIRED** String representing the object’s type. Objects of the same type share the same value.|
|name|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product name in key's locale. Must have, at least, value in default system locale|
|default_currency|string|**REQUIRED**Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|description|map[string]string|**REQUIRED** An map object, where keys are locales, and values is product description in key's locale. Must have, at least, value in default system locale|
|long_description|map[string]string|An map object, where keys are locales, and values is product long description in key's locale.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
|pricing|string|Pricing mode (currency manual steam default).|

## Get a Key Product

```shell
# Definition
GET /admin/api/v1/key-products/:key_product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e 
-G -H "Authorization: Bearer %access_token_here%"

# Example response
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": {
    "en": "The Awesome Game",
  },
  "description": {
    "en": "The Awesome Game Description",
  },
  "created_at": "2019-08-13T08:23:25Z",
  "updated_at": "2019-08-13T08:23:25Z",
  "sku": "en_awesome_game",
  "images": [],
  "enabled": true,
  "default_currency": "USD",
  "pricing": "currency",
  "platforms": [
      {
          "id": "steam",
          "name": "Steam",
          "prices": [
              {
                  "region": "EUR",
                  "amount": 29.99,
                  "currency": "EUR"
              }
          ]
      }
  ]
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:key_product_id|string|**REQUIRED** Identifier of key product|

## Publish a Key Product

```shell
# Definition
POST /admin/api/v1/key-products/:key_product_id/publish
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e \
      -X DELETE -H "Authorization: Bearer %access_token_here%"

# Example response
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": {
    "en": "The Awesome Game",
  },
  "description": {
    "en": "The Awesome Game Description",
  },
  "created_at": "2019-08-13T08:23:25Z",
  "updated_at": "2019-08-13T08:23:25Z",
  "sku": "en_awesome_game",
  "images": [],
  "enabled": true,
  "default_currency": "USD",
  "pricing": "currency",
  "platforms": [
      {
          "id": "steam",
          "name": "Steam",
          "prices": [
              {
                  "region": "EUR",
                  "amount": 29.99,
                  "currency": "EUR"
              }
          ]
      }
  ],
  "published_at": "2019-08-13T08:23:25Z"
}
```

## Delete a Key Product

```shell
# Definition
DELETE /admin/api/v1/key-products/:key_product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e \
      -X DELETE -H "Authorization: Bearer %access_token_here%"

# Example response
No content in response
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:key_product_id|string|**REQUIRED** Identifier of key product|

## Get a Key Product public info
```shell
# Definition
GET /api/v1/key-products/:key_product_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/api/v1/key-products/5ca5124868add448289e432e?currency=EUR \
      -X GET

# Example response
{
  "id": "5ca5124868add448289e432e",
  "project_id": "5be2e16701d96d00012d26c3",
  "name": "The Awesome Game",
  "description": "The Awesome Game description",
  "long_description": "The Awesome Game long description",
  "images": [
    "http://example.com/image.jpeg"
  ],
  "platforms": [
    {
      "id": "steam",
      "name": "Steam",
      "price": {
        "amount": 29.99,
        "currency": "EUR",
        "region": "EUR",
        "is_fallback": false
      }
    },
    {
      "id": "gog",
      "name": "GOG.com",
      "price": {
        "amount": 29.99,
        "currency": "USD",
        "region": "USD",
        "is_fallback": true
      }
    }
  ]
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:key_product_id|string|**REQUIRED** Identifier of key product|
|country|string|ISO code of country for that price shoul be calculated|
|currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html)|


# Platforms

## List available platforms

```shell
# Definition
GET /admin/api/v1/platforms
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/platforms
-H "Authorization: Bearer %access_token_here%"

# Example response
{
  "total_count": 2,
  "items": [
    {
      "id": "steam",
      "name": "Steam"
    },
    {
      "id": "gog",
      "name": "GOG.com"
    }
  ]
}
```

### Arguments
No arguments

## Add/Change platform price for key product

```shell
# Definition
POST /admin/api/v1/key-products/:key_product_id/platforms
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e/platforms \
      -X POST -H "Authorization: Bearer %access_token_here%" \
      -d '{
            "platform": {
              "id": "gog",
              "name": "Good old games.com",
              "prices": [
                  {
                  "region": "EUR",
                  "amount": 29.99,
                  "currency": "EUR"
                  }
              ]
            }
          }'

# Example response
No content in response
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:key_product_id|string|**REQUIRED** Identifier of key product|

## Remove platform price for key product

```shell
# Definition
DELET /admin/api/v1/key-products/:key_product_id/platforms/:platform_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/key-products/5ca5124868add448289e432e/steam \
      -X DELETE -H "Authorization: Bearer %access_token_here%" \
      
# Example response
No content in response
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:key_product_id|string|**REQUIRED** Identifier of key product|
|:platform_id|string|**REQUIRED** Identifier of platform to remove for key product|