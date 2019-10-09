---
title: PaySuper API
linktitle: PaySuper API
description: All API requests must be made over **HTTPS**. Calls made over plain HTTP will fail.
date: 2016-02-01
publishdate: 2016-02-01
lastmod: 2016-03-02
layout: single
menu:
  docs:
    parent: "api-reference"
    weight: 10
categories: []
keywords: []
aliases: []
draft: false
toc: true
---

##  API Endpoint

**`https://api.paysuper.io`**

## Authentication

Authentication to the API occurs via HTTP Basic Auth. Provide your API secret key as the basic auth username. You do not need to provide a password.

{{% warning %}}
Credentials can be found on your PaySuper project dashboard, in the "API Keys" section.
{{% /warning %}}

You must authenticate for all requests. You can manage your API keys from your account. Your API keys carry many privileges, so be sure to keep them secret!

**Example request:**

{{< highlight shell >}}
$ curl https://api.paysuper.io/orders -u tkHCYYOUVrYyY5rBFZxNzgtt:
{{< /highlight >}}

{{% warning %}}
curl uses the **-u** flag to pass basic auth credentials (adding a colon after your secret API key will prevent it from asking you for a password).
{{% /warning %}}

## Errors

PaySuper uses conventional HTTP response codes to indicate success or failure of an API request. 

In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from the provided information (e.g. a required parameter was missing, a charge failed, etc.), and codes in the 5xx range indicate an error with PaySupers's servers.

#### HTTP status codes summary

Code and status|Description
---|---
**200 OK**|Everything worked as expected.
**201 Created**|Resource has been successfully created
**202 Accepted**|Request has been accepted, but requires asynchronous work to be fully performed
**400 Bad Request**|Request failed due to a combination of errors
**401 Unauthorized**|No valid API credentials provided.
**402 Payment Required**|Your request was in livemode while your account is not activated for live requests yet.
**403 Forbidden**|You are not authorized to access the requested item.
**404 Not Found**|The requested item doesn't exist.
**406 Unacceptable**|Your request format was not supported. Use JSON.
**409 Conflict**|The data you submitted is in conflict with existing data.
**422 Unprocessable Entity**|Often missing a required parameter.
**429 Too Many Requests**|You sent us too many API requests in a row. Please retry later.
**500, 502, 503, 504 Server errors**|Something went wrong on PaySupers's end.

## Versioning

PaySuper is developed incrementally. We use semantic versioning and approach to release new versions of the specification.

The content of each release is the result of the work of the project team located on github. All changes and additions to each version of this specification are publicly discussed by the PaySuper working group.

While making requests in PaySuper using HTTPS, the version is passed as a special HTTP header, which makes it easier to choose the correct implementation of objects on the receiving and transmitting side. The version passed is specified as major and minor of the version using semantic versioning.

For the transmission version must use the header **`x-paysuper-api-version: 1.0`**.

## Compression

The amount of data transferred with notifications can be huge, and endpoints are required to support data compression to reduce the amount and speed of data transfer over the network.

Endpoints that send HTTP 1.1 messages are required to send gzip-compressed data by specifying the appropriate value in the HTTP [Accept-Encoding header](https://tools.ietf.org/html/rfc7231#section-5.3.4).

Receiving hosts are required to support gzip and respond to requests by passing an HTTP [Content-Encoding header](https://tools.ietf.org/html/rfc7231#section-3.1.2.2).

## Endpoints

{{< oai-spec url="/api/v1/api.yaml" >}}