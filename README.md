# GiT_2023

###Hola! Welcome to today's workshop. Please find the below instructions for the workshop.

## INSTRUCTIONS
### Agenda of the Workshop:

A quick demo to capture the user messages on real time basis using POSTMAN and running a ML model for sentiment analysis over the collected data using databricks. 
Note : Azure Cloud Services had been used for the demo.

### Using POSTMAN:

 * The users are required to open an POSTMAN free account.
 * Once they created the account , they need to open a new page or tab clicking on the '+' sign.
 * On the new tab , select the option as "POST", and insert the URL "https://databricksstreaming.servicebus.windows.net/topic1/messages"
 * The user need to send an answer in the Body section and type in the answer for the question as "How is your day going?"
 * Click the Send button.
 * The messages will be sent to the Service Bus.

### Signing up for Databricks account:

 * Click the **[Try Databricks](https://www.databricks.com/try-databricks?_gl=1*304qnf*_ga*MzYxMjY1Nzk3LjE2ODI0ODIwNDI.*_ga_PQSEQ3RZQC*MTY4MjY0MjAxOS44LjEuMTY4MjY0MjA1Mi4yNy4wLjA.&_ga=2.130158927.1351879435.1682482042-361265797.1682482042#account)**
 * The user will be directed towards the account page of Databricks.
 * Create an community edition account by giving user's details.
 * Select the cloud vendor(**Azure for the Workshop**).
 * Proceed to Azure databricks account.

### Notebooks:
The following notebook "name" contains the code snippet for the below actions.
  1. Calling the Azure Bus Service to get the messages. ( Create an Azure Service Bus under the same create a topic and subscription to capture the data)
  2. Consolidating the messages in a table in delta lake and processing them.
  3. Running a pre-trained transformer model for sentiment analysis
  4. Visualizations are also included .
