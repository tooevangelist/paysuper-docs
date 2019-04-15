# Paylinks

Payment links is a some url shortcuts, to make order with predefined products set.

Each paylink may contain from 1 to 6 products, and have some expire time (1, 7 or 30 days by default)

Paylinks are linked to merchant and project, and all products in paylink are also must be associated with the same project

## The Paylink object
> Example object

```json
{
    "id": "6d3d86a9664b4aa5b4e6df53b3c47d46",
    "object": "paylink",
    "products": [
        "5ca50e3868add4353c4815d2", "5ca5124868add448289e432e"
    ],
    "expires_at": {
        "seconds": 1554925829,
        "nanos": 652479500
    },
    "created_at": {
        "seconds": 1554321029,
        "nanos": 652479500
    },
    "updated_at": {
        "seconds": 1554321029,
        "nanos": 652479500
    },
    "merchant_id": "5ca50d4a68add46220e4a6e9",
    "project_id": "5be2e16701d96d00012d26c3"
}
``` 

### Attributes

|Name|Type|Description|
|---|---|---|
|id|string| Unique identifier for the paylink object.|
|object|string|String representing the object’s type. Objects of the same type share the same value.|
|products|string[]| Array of products identifiers|
|project_id|string| Identifier of project, with which the paylink and all included products are associated.|
|merchant_id|string| Identifier of merchant, with which the paylink and all included products are associated.|
|created_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a paylink has been created.|
|updated_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a paylink has been updated last time.|
|expires_at|string|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a paylink will be expired.|

## Create a Paylink

```
# Definition
POST /admin/api/v1/paylinks
```
```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks
   -X POST -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
       	"life_days": 7,
       	"products": ["5ca50e3868add4353c4815d2", "5ca5124868add448289e432e"],
       	"project_id": "5be2e16701d96d00012d26c3"
       }'

# Example response
{
    "id": "ef2c6b84a7d54881a73450e115841c4b",
    "products": [
        "5ca50e3868add4353c4815d2",
        "5ca5124868add448289e432e"
    ],
    "expires_at": {
        "seconds": 1554926803,
        "nanos": 616476900
    },
    "created_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "updated_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "merchant_id": "5ca50d4a68add46220e4a6e9",
    "project_id": "5be2e16701d96d00012d26c3"
}
```
### Attributes

|Name|Type|Description|
|---|---|---|
|products|string[]|**REQUIRED** Array of products identifiers|
|project_id|string|**REQUIRED** Identifier of project, with which the paylink and all included products are associated.|
|life_days|number|**REQUIRED**Number of days, after then paylink will be automatically expired |

## Update a Paylink

```
# Definition
PUT /admin/api/v1/paylinks/:paylink_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/ef2c6b84a7d54881a73450e115841c4b
   -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer %access_token_here%" \
   -d '{
       	"life_days": 7,
       	"products": ["5ca50e3868add4353c4815d2", "5ca5124868add448289e432e"],
       	"project_id": "5be2e16701d96d00012d26c3"
       }'

# Example response
{
    "id": "ef2c6b84a7d54881a73450e115841c4b",
    "products": [
        "5ca50e3868add4353c4815d2",
        "5ca5124868add448289e432e"
    ],
    "expires_at": {
        "seconds": 1554926803,
        "nanos": 616476900
    },
    "created_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "updated_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "merchant_id": "5ca50d4a68add46220e4a6e9",
    "project_id": "5be2e16701d96d00012d26c3"
}
```
### Attributes

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of paylink|
|products|string[]|**REQUIRED** Array of products identifiers|
|project_id|string|**REQUIRED** Identifier of project, with which the paylink and all included products are associated.|
|life_days|number|**REQUIRED**Number of days, after then paylink will be automatically expired |

## Get a Paylink

```
# Definition
GET /admin/api/v1/paylinks/:paylink_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/ef2c6b84a7d54881a73450e115841c4b \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "id": "ef2c6b84a7d54881a73450e115841c4b",
    "products": [
        "5ca50e3868add4353c4815d2",
        "5ca5124868add448289e432e"
    ],
    "expires_at": {
        "seconds": 1554926803,
        "nanos": 616476900
    },
    "created_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "updated_at": {
        "seconds": 1554322003,
        "nanos": 616476900
    },
    "merchant_id": "5ca50d4a68add46220e4a6e9",
    "project_id": "5be2e16701d96d00012d26c3"
}
``` 

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of paylink|

## Delete product
```
# Definition
DELETE /admin/api/v1/paylinks/:paylink_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/ef2c6b84a7d54881a73450e115841c4b \
      -X DELETE -H "Authorization: Bearer %access_token_here%"

# Example response
No content in response
```

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of paylink|

## Get a Paylink Stat

```
# Definition
GET /admin/api/v1/paylinks/:paylink_id/stat
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/ef2c6b84a7d54881a73450e115841c4b/stat \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "visits": 100500,
}
``` 

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of paylink|

## Get a Paylink Url

```
# Definition
GET /admin/api/v1/paylinks/:paylink_id/url?utm_source=3wefwe&utm_medium=njytrn&utm_campaign=bdfbh5
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/ef2c6b84a7d54881a73450e115841c4b/url?utm_source=3wefwe&utm_medium=njytrn&utm_campaign=bdfbh5 \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "url": "https://api.paysuper.online/paylink/6d3d86a9664b4aa5b4e6df53b3c47d46?utm_campagin=bdfbh5&utm_medium=njytrn&utm_source=3wefwe"
}
``` 

### Arguments

|Name|Type|Description|
|---|---|---|
|:product_id|string|**REQUIRED** Identifier of paylink|
|utm_source|string|utm_source value|
|utm_medium|string|utm_medium value|
|utm_campagin|string|utm_campagin value|

## Get a Paylinks list

```
# Definition
GET /admin/api/v1/paylinks/project/:project_id?offset=0&limit=10
```

```shell
# Example Request
$ curl https://api.paysuper.online/admin/api/v1/paylinks/project/5be2e16701d96d00012d26c3?offset=0&limit=10 \
      -G -H "Authorization: Bearer %access_token_here%"

# Example response
{
    "merchant_id": "5ca50d4a68add46220e4a6e9",
    "project_id": "5be2e16701d96d00012d26c3",
    "limit": 10,
    "offset": 0,
    "total": 1,
    "paylinks": [
      {
          "id": "ef2c6b84a7d54881a73450e115841c4b",
          "products": [
              "5ca50e3868add4353c4815d2",
              "5ca5124868add448289e432e"
          ],
          "expires_at": {
              "seconds": 1554926803,
              "nanos": 616476900
          },
          "created_at": {
              "seconds": 1554322003,
              "nanos": 616476900
          },
          "updated_at": {
              "seconds": 1554322003,
              "nanos": 616476900
          },
          "merchant_id": "5ca50d4a68add46220e4a6e9",
          "project_id": "5be2e16701d96d00012d26c3"
      }
    ]
}
``` 

### Arguments

|Name|Type|Description|
|---|---|---|
|:project_id|string|**REQUIRED** Identifier of project|
|offset|number|offset from first item position|
|limit|number|maximum items per page|


## Get a Paylink order page

```
# Definition
GET /paylink/:paylink_id
```

```shell
# Example Request
$ curl https://api.paysuper.online/paylink/6d3d86a9664b4aa5b4e6df53b3c47d46?utm_campagin=bdfbh5&utm_medium=njytrn&utm_source=3wefwe

# Example response
Redirect to order payment page if sccess, or html page with error information
```
