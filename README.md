This repository includes a simple Python Flask web site, made for demonstration purposes only.
The project can be developed locally with Flask and can be deployed to Azure App Service using the infrastructure files in `infra`. See below for more details.

### Local development

This project has Dev Container support, so you can open it in Github Codespaces or local VS Code with the Dev Containers extension.

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

### Deployment

This repo is set up for deployment on Azure App Service using the configuration files in the `infra` folder.

Steps for deployment:

1. Sign up for a [free Azure account](https://azure.microsoft.com/free/) and create an Azure Subscription.

1. Install the [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd). (If you open this repository in Codespaces or with the VS Code Dev Containers extension, that part will be done for you.)

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
