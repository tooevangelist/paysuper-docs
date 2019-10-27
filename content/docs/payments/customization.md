---
title: Customizing Checkout
bookToc: true
---

# Customizing Checkout
***

Learn about the different ways you can customize your Checkout.

## Localization

The Checkout Form is localized for 2 languages with 10 more translations coming soon.

You can choose the complete set of supported languages for the project and products descriptions on the Project Settings page.

## Prefilling user data

Boost your paying conversion rate with pre-filled payment form with user's name and email. Generate a Token to encrypt all required information about the user intent to pay.

## Saving payment methods for future

Store in PaySuper a user's billing address and a payment method data to prefill once the Checkout Form opened.

## Customizing theme

{{< highlight javascript >}}
const paySuper = new PaySuper({
    viewScheme: 'light'
});
{{< /highlight >}}

Available options: **`dark`** (default), **`light`**.

## Customizing the colors

{{< highlight javascript >}}
const paySuper = new PaySuper({
    viewSchemeConfig: { 
        // headerTextColor overrides the default value of the viewSchemeConfig object
        headerTextColor: '#333333'
    }
});
{{< /highlight >}}

[Available parameters of **`viewSchemeConfig`**](https://github.com/paysuper/paysuper-js-sdk/blob/192153-quickstart/docs/CUSTOMIZATION.md#available-parameters-of-viewschemeconfig)

***

## Next steps

{{< hint info >}}
[**After the payment**](/docs/payments/live/)

After a successful payment, you have to fulfil the customer’s purchase. You can use [webhooks](ССЫЛКА) or the [Transaction log](ССЫЛКА) to accomplish the purchase.
{{< /hint >}}

{{< hint info >}}
[**Testing the Checkout**](/docs/payments/testing/)

Check your integration with PaySuper Checkout works correctly. Test cards can be used to create payments that produce successful and particular responses.
{{< /hint >}}

{{< hint info >}}
[**Going live checklist**](/docs/payments/live/)

Before going live inspect this checklist to ensure you've implemented all the significant setup steps.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}