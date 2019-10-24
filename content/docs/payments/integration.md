---
title: Client-Server Integration
bookToc: true
---

# Client-Server Integration with PaySuper API
***

Client-side code

Server-side code

**Step 1.** Send a HTTP request to initiate a payment [POST /api/v1/order](ССЫЛКА НА API метод в redoc)

ДОБАВИТЬ RUNKIT

**Step 2.** Retrieve a response parameter **`payment_form_url`** - URL of PaySuper Checkout Form.

**Step 3.** Show the Checkout Form:

* Open the received URL in a browser as a **new window**

* Integrate the the Checkout Form as **iframe**:

{{< highlight html >}}
<iframe src="{payment_form_url}"></iframe>
{{< /highlight >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}