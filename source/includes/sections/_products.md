# Products

Store representations of digital products you sell in PaySuper.

## The Product object
> Example object

```json
{
  "id": "prod_EgX1BRd6k9cbxc",
  "type": "product",
  "sku": "sku1234568",
  "name": "The Game",
  "default_currency": "usd",
  "enabled": true,
  "prices": [   
    {
      "amount": 1.0,
      "currency": "usd"
    }
  ],  
  "description": "game key",
  "long_description": "Super game steam keys",
  "created_at": "2018-07-10T14:27:54.691Z",
  "updated_at": "2018-07-17T14:28:32.484Z",
  "images": [],
  "url": null,
  "metadata": {}
}
``` 

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the object.|
|object|string| String representing the object’s type. Objects of the same type share the same value.|
|sku|string|String representing the stock keeping unit.|
|name|string|An arbitrary string attached to the object. Often useful for displaying to users.|
|default_currency|string|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.|
|enabled|boolean| True is product available for purchase.| 
|prices|array|The list of prices for all available regional prices for product.|
|description|string|An arbitrary string attached to the object. Often useful for displaying to users.|
|long_description|string|An arbitrary string attached to the object. Often useful for displaying to users.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been created.|
|updated_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product order has been updated.|
|images|string[]|The array if URL to product images.|
|url|string|An arbitrary URL to product web page.|
|metadata|object| Set of key-value pairs that attached to an object on creating product.|
