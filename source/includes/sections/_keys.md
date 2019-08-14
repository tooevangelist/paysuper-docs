# Keys

Store representations of digital key you sell in PaySuper.

## The Key object

> Example object

```json
{
  "id": "5ca5124868add448289e432e",
  "code": "XXXX-YYYY-ZZZZ-UUUU",
  "key_product_id": "5ca5124868add448289e432e",
  "platform_id": "steam",
  "order_id": "5ca5124868add448289e432e",
  "created_at": "2019-08-13T08:23:25Z",
  "reserved_to": "2019-08-13T08:23:25Z",
  "redeemed_at": "2019-08-13T08:23:25Z"
}
```

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string|Unique identifier for the object.|
|code|string|Code for activation game in specified platform.|
|key_product_id|string|Identifier of key product associated with.|
|platform_id|string|Identifier of platform (steam, gog, xbox, etc.)|
|order_id|string|Identifier of order.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a key has been uploaded.|
|reserved_to|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) a key has been reserved to.|
|redeemed_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a key has been redeemed.|

## Upload keys

User should upload file with keys for specified platform, where each line in file is key.


```shell
# Definition
GET /admin/api/v1/key-products/:key_product_id/platforms/:platform_id/file
```

```shell
# Example Request
$ curl -F 'file=@/steam/keys.txt' https://p1payapi.tst.protocol.one/admin/api/v1/key-products/5ca5124868add448289e432e/platforms/steam/file \
 -X POST -H "Authorization: Bearer %access_token_here%" \

# Example response
{
    "keys_processed": 1000,
    "total_count": 1963
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|key_product_id|string|**REQUIRED** Unique identifier for the key.|
|platform_id|string|**REQUIRED** Unique identifier for the key.|

### Attributes

|Name|Type|Description|
|---|---|---|
|keys_processed|int|Count of keys has been added. Duplicates are will not be added|
|total_count|int|Total count of keys for platform and key product in database.|

## Get key info

```shell
# Definition
GET /admin/api/v1/keys/:key_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/keys/5ca5124868add448289e432e \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
  "id": "5ca5124868add448289e432e",
  "code": "AAAA-BBBB-CCCC-XXXX",
  "key_product_id": "5ca5124868add448289e432e",
  "platform_id": "steam",
  "order_id": "5ca5124868add448289e432e",
  "created_at": "2019-08-14T12:50:49Z",
  "redeemed_at": "2019-08-14T12:50:49Z",
  "reserved_to": "2019-08-14T12:50:49Z"
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|key_product_id|string|**REQUIRED** Unique identifier for the key.|

## Count of keys for specified platform and product


```shell
# Definition
GET /admin/api/v1/key-products/:key_product_id/platforms/:platform_id/keys/count
```

```shell
# Example Request
$ curl https://p1payapi.tst.protocol.one/admin/api/v1/key-products/5ca5124868add448289e432e/platforms/steam/keys/count \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "count": 1463
}
```

### Arguments

|Name|Type|Description|
|---|---|---|
|key_product_id|string|**REQUIRED** Unique identifier for the key.|
|platform_id|string|**REQUIRED** Unique identifier for the key.|
