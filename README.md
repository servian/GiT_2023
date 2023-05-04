%md

### Hola! Welcome to today's workshop. Please find the below instructions for the workshop.

## INSTRUCTIONS
### Agenda of the Workshop:

A quick demo to capture the user messages on real time basis using POSTMAN and running a ML model for sentiment analysis over the collected data using Databricks. 
Note: Azure Cloud Services had been used for the demo.

### Resources:
To run the shared notebooks , the user must have the mentioned resources set up . 
* A Cloud Account with Active Subscription ( AWS, GCP, Azure, for the workshop we are running the demo on Azure Cloud).
* Any api platform ( POSTMAN is being used for demo)
* Cloud messaging Services ( We are using the Azure Bus Service for the demo)
* Cloud Storage account to store the data.
* A databricks workspace.
* Key vault

### Using POSTMAN:

 * The users are required to open a **[POSTMAN free account](www.postman.com)**.
 * Create a new collection, change the operation to POST and Save it.
 * Once they created the account , they need to open a new page or tab clicking on the '+' sign.
 * On the new tab , select the option as "POST" if not selected, and insert the URL "https://databricksstreaming.servicebus.windows.net/topic1/messages"
 * The Header portion will contain the below options along with the additional options present:
      * ['Key': Authorizaion, 'Value': Temporary Token will be shared]
      * ['Key': Content-Type, 'Value': application/atom+xml;type=entry;charset=utf-8]
      * ['Key': x-ms-retrypolicy , 'Value': NoRetry]
 * The user need to send an answer in the Body section and type in the answer for the question as "How is your day going?"
 * Click the Send button.
 * The messages will be sent to the Service Bus.

### Signing up for Databricks account:

 * Click the **[Try Databricks](https://www.databricks.com/try-databricks?_gl=1*304qnf*_ga*MzYxMjY1Nzk3LjE2ODI0ODIwNDI.*_ga_PQSEQ3RZQC*MTY4MjY0MjAxOS44LjEuMTY4MjY0MjA1Mi4yNy4wLjA.&_ga=2.130158927.1351879435.1682482042-361265797.1682482042#account)**
 * The user will be directed towards the account page of Databricks.
 * Create an community edition account by giving user's details and choosing the link below to proceed with community edition for any free trial of databricks.
 * Proceed to Azure databricks account.
 * Once in the databricks account , select the Data Engineering and Science space and create a folder as "GiT2023", we can proceed with creating or importing the shared notebooks in the same folder.
 * We also need to create the clusters to run the notebooks, load the respective libraries into the cluster to run the notebook.
 * List of libraries to be loaded as PyPI packages:
     * flax
     * transformers
     * tensorflow
     * emoji
     * azure-servicebus

### Notebooks:
The following mentioned notebooks contains the code snippet for the below actions.
#### Notebook: message_processing
  * Calling the Azure Bus Service to get the messages. (an Azure Service Bus under the same create a topic and subscription to capture the data). 
  * Please note that The Azure Bus Service is created earlier to the workshop and with all set up done, a temporary access token will be shared with user , to send the message to the Azure Bus Service.
  * There are various methods to connect with the Azure Bus Service using various languages, Please refer to the link **[Azure Bus Service messages](https://learn.microsoft.com/en-us/azure/service-bus-messaging/service-bus-python-how-to-use-topics-subscriptions?tabs=passwordless)**
  * The message is stored in the datalake.
  * Autoloader reading the messages and storing them into a table in delta lake and processing them.
#### Notebook: model_training
  * Reading the data from the delta lake.
  * Running a pre-trained transformer model for sentiment analysis. (Note:Pre-trained model are from hugging face which has been trained on previous data , more information can be obtained on the **[Huggingface Models list](https://huggingface.co/models)**)
  * Tagging the data with the orginal messages.
  * Visualizations in the dashboard will be demonstrated over the results of the model .
