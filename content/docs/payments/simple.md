---
title: Simple Checkout
bookToc: true
---

# Simple Checkout
***

## Integration with PaySuper JS SDK

You can create an instance of a PaySuper Form on your website using this sample code.

> Use your IDs for the Project and Products found in your merchant account in the PaySuper Admin. To get the Project and Product IDs click on the Product from the Products list page and copy the ID from an opened page URL.

### Sample code of the Payment form with Token

{{< highlight html >}}
<script>
function buyItems() {
    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185'
    });
    
    paySuper.renderModal();
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

### Sample code of the Payment form with order parameters

{{< highlight html >}}
<script>
    function buyItems() {
        const paySuper = new PaySuper({
            project: '5cd5624a06ae110001509186',
            amount: 50,
            currency: 'USD'
        });

        paySuper.renderModal();
    }
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

## Integration with PaySuper API

ПРИМЕР КОДА HTTP запроса с параметрами для simple checkout

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}