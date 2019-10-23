---
title: Simple Checkout
bookToc: true
---

# Simple Checkout
***

* [Client integration with JS SDK](#client-integration)
* [Server integration with PaySuper API](#server-integration)

## Client integration

You can create an instance of a PaySuper Form on your website using this sample code.

> Use your IDs for the Project and Products found in your merchant account in the PaySuper Admin. To get the Project and Product IDs click on the Product from the Products list page and copy the ID from an opened page URL.

### Sample code of the Payment form with Token

{{< highlight html >}}
<script>
function buyItems() {
    // Create an instance of the Payment Form with required order parameters
    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185'
    });
    
    // Display a modal window with the Payment Form
    paySuper.renderModal();

    paySuper.on('paymentCompleted', function() {
        // You can show a completed payment message
    });
}
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

### Sample code of the Payment form with order parameters

{{< highlight html >}}
<script>
    function buyItems() {
        // Create an instance of the Payment Form with required order parameters
        const paySuper = new PaySuper({
            project: '5cd5624a06ae110001509186',
            amount: 50,
            currency: 'USD'
        });
        
        // Display a modal window with the Payment Form
        paySuper.renderModal();

        paySuper.on('paymentCompleted', function() {
            // You can show a completed payment message
        });
    }
</script>

<button onclick="buyItems()">BUY</button>
{{< /highlight >}}

## Server integration

ПРИМЕР КОДА HTTP запроса с параметрами для simple checkout