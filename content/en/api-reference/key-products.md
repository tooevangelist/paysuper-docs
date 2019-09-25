---
title: Key Products
linktitle: Key Products
description: Store representations of product with keys you sell in PaySuper.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
layout: single
menu:
  docs:
    parent: "api-reference"
    weight: 15
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

## The Key Product object

Attribute|Type|Description|
---|---|---
**id**|**string**| Unique identifier for the object.
**object**|**string**|String representing the object’s type. Objects of the same type share the same value.
**project_id**|**string**| Identifier of project, with which the product is associated.
**sku**|**string**|String representing the stock keeping unit.
**name**|**map[string]string**|An map object, where keys are locales, and values is product name in key's locale.
**default_currency**|**string**|Three-letter [ISO 4217 currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase, representing the product default currency.
**enabled**|**boolean**| True is product available for purchase.
**platforms**|**array**|The list of platforms for all available with prices
**platforms.id**|**string**|Identifier for platform (steam, gog, xbox, etc.)
**platforms.name**|**string**|Name for platform (Steam, GOG, Xbox Store, etc.)
**platforms.prices**|**array**|The list of prices for specified platform for all available regional prices for key product.
**description**|**map[string]string**|An map object, where keys are locales, and values is product description in key's locale.
**long_description**|**map[string]string**|An map object, where keys are locales, and values is product long description in key's locale.
**created_at**|**string**|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been created.
**updated_at**|**string**|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been updated.
**published_at**|**string**|The date and time in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) when a product has been published.
**images**|**string[]**|The array if URL to product images.
**url**|**string**|An arbitrary URL to product web page.
**metadata**|**object**| Set of key-value pairs that attached to an object on creating product.

## Example object

{{< highlight json >}}
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
  "published_at": "2019-08-13T08:23:25Z"
}
{{< /highlight >}}

## Endpoints

{{< oai-spec url="/api/v1/key-products-swagger.yaml" >}}