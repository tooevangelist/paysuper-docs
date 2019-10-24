---
title: Quick start
bookToc: true
---

# Payments Flow
***

## User Flow

{{< figure src="/images/user-flow.png">}}

## Integration Flow

{{< figure src="/images/integration-flow.png">}}

# Quick start
***

## **Step 1** Register a PaySuper Company account

{{< expand "Registration and onboarding" " " >}}

1. [Sign up](https://paysupermgmt.tst.protocol.one).
2. Verify your email address from a delivered confirmation email.
3. Follow several steps of a brief [Welcome Onboarding](https://paysupermgmt.tst.protocol.one/profile).
4. It's required to fill in the Banking info in the [Company Onboarding](https://paysupermgmt.tst.protocol.one/company) to enable creating a project.

{{< hint info >}}
When you are ready to start selling you will need to fill in all your company details in the [Company Onboarding](https://paysupermgmt.tst.protocol.one/company) and the signed documents in the License Agreement.

Before sign the documents we manually check each new account to ensure that our platform is attended only by companies who are related to the gaming industry, this allows us to provide maximum features and stability to all our users.
{{< /hint >}}

{{< /expand >}}

## **Step 2** Set up a Project

Having a single project is enough to start selling. 

{{< expand "Create a project" " " >}}

**To create a project:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Click the **Create Project** button.
3. Enter a **Project Name**. 
4. Click **Create** to redirect to the Project Settings page.
5. Fill the required information in an appropriate localization:

    * **Full description**
    * **Short description**
    * **Secret key**: Generate a secret key to set up correct integration with PaySuper platform.
    * **Currency**: by default is equal to **USD**.
6. Optional information:

    * **Localization**: you can choose the complete set of supported languages for the project and products descriptions
    * **Logotype**

7. Click **Save**.

{{< /expand >}}

If you want to sell products (as Game keys, Virtual items, Virtual currency) then easily add the necessary sales information about your products to the project.

{{< expand "Add a Game key to the project" " " >}}

**To add a Game key:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

{{< expand "Add a Virtual item to the project" " " >}}

**To add a Virtual item:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

{{< expand "Add a Virtual currency to the project" " " >}}

**To add a Virtual currency:**

1. Open [**the Projects List page**](https://paysupermgmt.tst.protocol.one/projects/)
2. Open the Project settings page.
3. 

{{< /expand >}}

## **Step 3** Set up a Checkout Form

Use Checkout to collect [one-time payments](/docs/payments/#simple-checkout) or to sell [products defined in the Project](/docs/payments/#typed-checkout).

### [Integration on client-side](/docs/payments/sdk-integration/)

The client-only integration lets you accept online payments using only frontend code PaySuper JS SDK. The Checkout Form can be embedded as an [iframe](ССЫЛКА на метод renderPage) or [modal window](ССЫЛКА на метод renderModal).

### [Integration on client and server-side](/docs/payments/integration/)

You can also integrate on a server-side without PaySuper SJ SDK for other reasons. Checkout Form can be embedded as an [iframe](ССЫЛКА) or [new window](ССЫЛКА).

## **Step 4** After the payment

Once payment is successful, you should fulfill the customer’s purchase. You can use [webhooks](ССЫЛКА) to fulfill the purchase. For more details about handling purchase fulfillment with Checkout, see [After the payment](/docs/payments/fulfillment/).

## Next steps

{{< hint info >}}
[**Testig the Checkout**](/docs/payments/testing/)
{{< /hint >}}

{{< hint info >}}
[**After the payment**](/docs/payments/live/)
{{< /hint >}}

{{< hint info >}}
[**Customizing Checkout**](/docs/payments/customization/)
{{< /hint >}}

***

{{< questions >}}{{< questions-text >}}{{< /questions-text >}}{{< /questions >}}