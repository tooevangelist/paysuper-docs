---
title: Analytics Integration
bookToc: true
---

# Analytics Integration
***

It's assumed that you have already integrated [PaySuper Checkout via SDK](/docs/payments/sdk-integration) and set up your Google Analytics account.

## Integrate

{{< hint warning >}}
We've set up a Google Analytics data collection in a test mode inside PaySuper. After the Beta testing, we'll release the analytics integration to use with a customer's tracking ID.
{{< /hint >}}

## Google Analytics

You can track the following events:

Category|Action|Description
---|---|---
userAction|clickCloseCross|Closing the form by click on the cross (for a modal window mode).
general|formClosed|The Checkout Form is closed (for a modal window mode).
general|hasSavedBankCards|The Checkout Form contains user's saved cards on starting.
general|noSavedBankCards|The Checkout Form does not contain user's saved cards on starting.
userAction|clickSaveUserCountry|Clicking the **Save** button when select a country on the screen of a manual selection of posibble countries for a payment.
userAction|clickCloseButton|Clicking the **Close** button at the bottom of the Checkout Form.
userAction|clickOkButton|Clicking the **OK** button at the bottom of the Checkout Form.
userAction|clickPayButton|Clicking the **Pay** button at the bottom of the Checkout Form.
general|submitPaymentForm|Starting a payment proccessing after a successful card validation.
userAction|setUserCountry|The selected country has been changed (in any way).
userAction|clickRememberCard|Clicking the checkbox **Remember**.
userAction|selectSavedCard|A user has selected a saved card.
userAction|removeSavedCard|A user has started deleting a saved card.
userAction|cancelRemovingSavedCard|A user has cancelled deleting a saved card.
general|submitSavedCardRemove|A request to delete a saved card has been sent (the last 5 seconds before a deletion were passed).
userAction|clickSupportLink|Clicking the **Support** link.
userAction|clickUserAgreementLink|Clicking the **User Agreement** link.
userAction|clickToggleCart|Clicking the **Collapse/Expand a cart** toggle (mobile view).
userAction|clickProjectLink|Clicking the **Project** link.
userAction|clickTermsOfUseLink|Clicking the **Terms of use** link.
userAction|clickPaySuperLink|Clicking the **PasySuper** link.
userAction|clickIconSupportLink|Clicking the **Support** icon on the top of the Checkout Form next to the Languages select.
userAction|clickOpenReceiptButton|Clicking the **Open the receipt page** button.
userAction|selectPlatform|A user has selected the game platform.
userAction|useSavedBankCards|A user has switched to the saved cards.
userAction|useManualBankCardsInput|A user has switched on the manual input of a bank card data.
general|showActionProcessing|A screen with a downloading action process has been shown.
general|showActionResult|A screen with a successful or failed result has been shown.
general|orderPrimaryInitError|An error has happen on an initialisation of the Checkout Form (a failure of an order creation).
general|orderAlreadyProcessed|Starting a Checkout Form has been failed because of an order had been purchased yet.
userAction|setPaymentMethod|A payment method has been selected (for instance a bank card, QIWI etc.).
general|purchaseFailed|A payment processing has been failed.
general|checkPaymentAccount|Checking a bank card number has been started.
general|customLocale|The Checkout Form has been started with a selected locale (a token encrypted string has been used).
userAction|setLocale|A user has changed a locale.
ecommerce|begin_checkout|Sending a special e-commerce data after starting the Checkout Form.
ecommerce|purchase|Sending a special e-commerce data after a successul purchase.

***

## Next steps

{{< hint info >}}
[**After the payment**](/docs/payments/fulfillment/)

After a successful payment, you have to fulfil the customer’s purchase. You can use [webhooks](/docs/payments/fulfillment/#fulfilling-purchases-with-webhooks) or the [Transactions](/docs/payments/fulfillment/#fulfilling-purchases-with-the-dashboard) to accomplish the purchase.
{{< /hint >}}

{{< hint info >}}
[**Testing the Checkout**](/docs/payments/testing/)

Verify that your integration with PaySuper Checkout works correctly. Our offered test cards can be used to create payments that produce defined responses for you to test your integration code.
{{< /hint >}}

{{< hint info >}}
[**Going live checklist**](/docs/payments/live/)

You can inspect this checklist before going live to ensure you've implemented all the significant setup steps.
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}