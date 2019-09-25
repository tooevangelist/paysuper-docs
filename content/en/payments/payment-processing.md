---
title: Payment Processing
linktitle: Payment Processing
description: Payment can be processed according to the typical system scenarios listed below.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
layout: single
menu:
  docs:
    parent: "payments"
    weight: 40
categories: []
keywords: []
aliases: []
draft: false
toc: false
---

## Simple HTML Form

This method allows you to create an invoice by transferring a simple HTML form to the side of the payment system and is the easiest way to invoice the customer for payment. System requests for checking order data and notifications about successful payment of an order are received routinely in accordance with the system protocol.

**Basic algorithm of payment processing:**

1. The buyer initiates a transaction by pressing "Buy". 
2. The project collects all the necessary data from the user (in the simplest case, the project does not collect anything, but sends a pre-generated HTML form) about the buyer, generates an HTML payment form and sends the data to the system.
3. The system checks incoming data, and, if necessary, forms a server-to-server request for checking the order data on the side of the project (if specified in the technical settings of the project). 
4. If the order data is not enough to make a payment, the system prompts the user to enter all the missing data into the form. 
5. The system transfers the data to the payment system for payment processing. 
    
    a. The payment system prompts the user for confirmation of the charge-off. 
    
    b. The payment system notifies the system about the successful debiting of the payer. 
6. The system forms a request to the project about a successful payment against an invoice. 
7. The system redirects the payer to the project website page with information about the payment completion. 
  
    > If this option is not selected in the technical integration settings, then the user will be shown payment completion information on the system side.

![Payment HTML form](/images/html-form.png)

## Calling JSON API

This method allows you to accept a user payment, while minimizing the need to leave the project website. It also allows maximum control over all actions of the Project user, providing a full analysis of the project user actions. System requests for checking order data and notifications about successful payment of an order are received routinely in accordance with the system protocol.

**Basic algorithm of payment processing:**

1. The buyer initiates a transaction by pressing “Buy”.
2. The project processes the information received from the buyer in the previous steps and checks its completeness for invoicing according to the system protocol.

    a. If the information received from the buyer earlier is not enough to issue an invoice according to the system protocol, then the merchant requests additional information from the buyer.
3. The project sends a server to server request to the system in accordance with the API.
4. The system processes the request received from the project, and, if necessary, sends an invoice creation request to the payment system. The project receives information on the created invoice, which contains a link to the payment confirmation form for the buyer.
5. The project redirects the buyer to the received link.
    
    > In some cases, the indicated redirection can be carried out in the iframe on the side of the Project, which allows the user not to leave the project website. Details on payment systems that support this method of integration are available upon request.
    
    a. The payment system prompts the buyer for confirmation of the charge-off.
    
    b. The payment system notifies the system about the successful debiting of the
    payer.
6. The system forms a request to the project about a successful payment against an
invoice.
7. The system redirects the payer to the project website page with information about the payment completion. 
    
    > If this option is not selected in the technical integration settings, then the user will be shown payment completion information on the system side.

![Payment JSON API](/images/json-api.png)

## Payment Widget

This payment method allows you to process payments on the project website, when all the necessary payment interfaces are displayed in the payment widget. The user leaves the project website only to confirm the payment on the side of the payment system. That way, the visual presence of the system in the process is unnoticeable to the user. 

System requests for checking order data and notifications about successful payment of an order are received routinely in accordance with the system protocol.

**Basic algorithm of payment processing:**

1. The project enables the JavaScript code of the payment widget on its website.
2. The buyer initiates a transaction by pressing “Buy”.
3. The project checks the available payment information and, if necessary, records it in its accounting system.
4. The user is provided with a payment widget to fill in all the data required for making a payment. (The Payment widget can be opened both as a popup window and as an iframe on the project website. The type of opening is configured when the widget is initialized in step 1.) 
    a. When a payment widget is opened, the System receives a background request for billing and sending all the data that needs to be displayed in the payment widget. 
5. The payer fills in all the necessary information in the payment widget and presses the “Pay” button. 
    
    a. A system call for payment fixation is made in the background. 
    
    b. The system, in turn, sends the data to the payment system to create a payment transaction, and the payment system returns a link to the payment verification form. 
    
    c. The system returns the link to the payment verification form received in the previous step to the payment widget. 
    
    d. The payment widget redirects the payer to the payment verification form or displays this form within itself (depending on the technical capabilities of the payment system). 
6. The buyer verifies the payment. 
7. The payment system notifies the system about the successful debiting of the payer.
8. The system forms a request to the project about a successful payment against an invoice.
9. The system sends the payment success information to the payment widget for displaying to the payer.

![Payment Widget](/images/payment-widget.png)