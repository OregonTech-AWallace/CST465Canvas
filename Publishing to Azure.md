# Setting up a Free Azure Student Account
Go to: https://azure.microsoft.com/en-us/free/students and select "Start Free".  It will ask you to create a basic profile and then should take you in to the Azure Portal

## Terminology
**Subscription** - An Azure subscription holds your Azure resources and determines billing boundaries and access management policies.

**Resource Group** - A resource group is a logical container within a subscription that groups related Azure resources together for easier management, monitoring, and cost tracking.

**App Service Plan** - An App Service Plan defines the compute resources (CPU, memory, storage) and pricing tier that will host your web applications, with multiple apps able to share the same plan.

**App Service** - An App Service is a platform-as-a-service (PaaS) offering that allows you to host web applications, REST APIs, and mobile backends without managing the underlying infrastructure.

## Steps

1. In the search bar, search for "App Services" and select the entry.
Click the "+Create" button and select "Web App"

1. In the Basics Tab, set the following fields:

    - **Subscription:** Access to Azure Active Directory(Converted to EA)

    - **Resource Group:** Click "Create New" and enter "RG-CST465-EastUS".  This name is arbitrary, more on resource groups later

    - **Name:** You may call this whatever you like.  The "Try a secure unique default hostname" box will automatically append some random characters to the end.  If you uncheck it, you can select any available subdomain of .azurewebsites.net

    - **Publish:** Code

    - **Runtime Stack:** .NET 10  (This should be backwards compatible if your app is compiled for 8/9)

    - **Operating System:** You can select either Linux or Windows. Linux will likely be more performant

    - **Region:**  This is the datacenter where your application will live.  I recommend picking a US region such as West US or East US.


    - **Linux/Windows Plan:** Click Create new and give it a name that will be meaningful to you.  I prefix with "plan-" to help make it easier to distinguish what it is in the list of resources.  After the first one is created, you can have multiple apps in the same plan

    - **Pricing plan:** Select Free F1

1. Select the Deployment tab
1. Change "Basic authentication" to "Enable"

    Feel free to browse through the other tabs. We will cover more of the "Deployment" tab options later, but they require using at least a "Basic B1" pricing plan which will start costing you some of your free credits.  Don't worry, we can convert this plan over later.

1. Click Review + create

1. Click Create


## Publishing your Web App with MSDeploy (Easiest Way)
1. In Visual Studio, you should now be able to right-click on your project and select "Publish..."
1. Click '+ New Profile'
1. Follow the wizard to access the web app you just created in Azure.  At the end of the steps, you should be able to start publishing your app directly to Azure.