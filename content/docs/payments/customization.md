---
title: Customizing Checkout
bookToc: true
---

# Customizing Checkout
***

Learn about the different ways you can customize your Checkout integration.

## Localization

PaySuper Checkout Form is localized for 2 languages with 10 more translations coming soon.

You can choose the complete set of supported languages for the project and products descriptions on the Project Settings page.

## Prefilling user data

Boost your paying conversion rate with pre-filled payment form with user's name and email. Generate a Token to encrypt all required information about the user intent to pay.

## Saving payment methods for future

Store in PaySuper a user's billing address and a payment method data to prefill once the Checkout Form opened.

## Customizing theme

    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185',
        viewScheme: 'light'
    });

Available options: **`dark`** (default), **`light`**.

## Customizing the colors

    const paySuper = new PaySuper({
        token: '5cd5620f06ae110001509185',
        viewSchemeConfig: { 
            <!-- headerTextColor overrides the default value of the viewSchemeConfig object -->
            headerTextColor: '#333333'
        }
    });

[Available parameters of **`viewSchemeConfig`**](https://github.com/paysuper/paysuper-js-sdk/blob/192153-quickstart/docs/CUSTOMIZATION.md#available-parameters-of-viewschemeconfig)

***

## Next steps

{{< hint info >}}
[**Testig the Checkout in the Sandbox**](/docs/payments/sandbox/).
{{< /hint >}}

{{< hint info >}}
[**Going live checklist**](/docs/payments/live/).
{{< /hint >}}

***

## Questions?

{{< columns >}}

#### [Sales](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform)

Our salespeople are pleasant and friendly. Leave your contact details, and we'll be back to you in no time. 

<--->

#### [Support](https://docs.google.com/forms/d/e/1FAIpQLScQPU83wKPkJeui_WvxGDoXWLDL4vyD8GsWNqf9-ccwDg3dEw/viewform)

We are always happy to help with a code, improve a guide or consider a feature.

<--->

#### [GitHub](https://github.com/paysuper)

The PaySuper Checkout Form, the JS SDK and even the server are available as a source code on our GitHub. You're welcome to explore the code and help us make PaySuper even better.

{{< /columns >}}