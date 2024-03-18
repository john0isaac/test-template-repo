---
page_type: sample
languages:
- azdeveloper
- python
- terraform
- html
products:
- azure
- azure-app-service
- azure-monitor
urlFragment: simple-flask-app-terraform
name: Simple Flask (Python) Web App (Terraform) on Azure
description: A simple Python Flask website, made for demonstration purposes only, and deployed to Azure App service. Uses Azure Developer CLI (azd) to build, deploy, and monitor.
---
<!-- YAML front-matter schema: https://review.learn.microsoft.com/en-us/help/contribute/samples/process/onboarding?branch=main#supported-metadata-fields-for-readmemd -->

# Simple Flask (Python) Web App (Terraform) on Azure

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/john0isaac/simple-flask-app-terraform?devcontainer_path=.devcontainer/devcontainer.json)

This repository includes a simple Python Flask website, made for demonstration purposes only.
The project can be developed locally with Flask and can be deployed to Azure App Service using the infrastructure files in `infra`. See below for more details.

## Local development

This project has Dev Container support, so you can open it in GitHub Codespaces or local VS Code with the Dev Containers extension.

Steps for running the server: 

1. (Optional) If you're unable to open the devcontainer, [create a Python virtual environment](https://docs.python.org/3/tutorial/venv.html#creating-virtual-environments) and activate that.

2. Install the requirements:

```shell
python3 -m pip install -r requirements.txt
```

3. Run the local server: (or use VS Code "Run" button and select "Run server")

```shell
python3 -m flask --debug run --port 50505
```

3. Click 'http://127.0.0.1:50505' in the terminal, which should open the website in a new tab.

4. Try the index page, try '/hello?name=yourname', and try a non-existent path (to see 404 error).

### Prerequisites
> This template will create infrastructure and deploy code to Azure. If you don't have an Azure Subscription, you can sign up for a [free account here](https://azure.microsoft.com/free/). Make sure you have a contributor role to the Azure subscription.


The following prerequisites are required to use this application. Please ensure that you have them all installed locally.

- [Azure Developer CLI](https://aka.ms/azd-install)
- [Python (3.8+)](https://www.python.org/downloads/)
- [Terraform CLI](https://aka.ms/azure-dev/terraform-install)
    - Requires the [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)

## Deployment

This repo is set up for deployment on Azure App Service using the configuration files in the `infra` folder.

Steps for deployment:

1. Login to Azure Developer CLI:

    ```shell
    azd auth login
    ```

1. Login to Azure using Azure CLI:

    ```shell
    az login --use-device-code
    ```

1. Provision and deploy all the resources:

    ```shell
    azd up
    ```

    It will prompt you to provide an `azd` environment name (like "acaflaskapp"), select a subscription from your Azure account, and select a location (like "eastus"). Then it will provision the resources in your account and deploy the latest code. If you get an error with deployment, changing the location can help, as there may be availability constraints for some of the resources.

When `azd` has finished deploying, you'll see an endpoint URI in the command output. Visit that URI, and you should see the front page of the app! 🎉

> [!NOTE]
> When you've made any changes to the app code, you can just run:
>
>    ```shell
>    azd deploy
>    ```
