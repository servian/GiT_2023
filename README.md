
# GiT 2023

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
* A databricks workspace.
* Key vault

### Using POSTMAN:

 * The users are required to open a **[POSTMAN free account](www.postman.com)**.
 * Create a workspace or can use if there is an external workspace.
 * Create a new collection.
 * Once they created the account , they need to open a new page or tab clicking on the '+' sign.
 * On the new tab , select the option as "POST"
 * Copy the below curl code and paste in the space against the post 
 
 
 
 *curl --location 'https://databricksstreaming.servicebus.windows.net/topic1/messages' 
--header 'Authorization: SharedAccessSignature sr=https%3A%2F%2Fdatabricksstreaming.servicebus.windows.net%2Ftopic1&sig=dCiyGYjowPsQBlw537yHzAzazWK/IGnWOIl2Xj2GGRM%3D&se=101682055697&skn=RootManageSharedAccessKey' 
--header 'Content-Type: application/atom+xml;type=entry;charset=utf-8'
--header 'x-ms-retrypolicy: NoRetry' 


 * The Header portion will show three additional key as Authorization, Content-Type and x-ms-retrypolicy
 * Please note the Authorization Key Value to set up Postman API is a temporary token and will be invalid after the session.
 
 
 * The user need to send an answer in the Body section and type in the answer for the question as "How is your day going?"
 * Click the Send button.
 * The messages will be sent to the Service Bus.

### Signing up for Databricks account:

 * Click the **[Try Databricks](https://www.databricks.com/try-databricks?_gl=1*304qnf*_ga*MzYxMjY1Nzk3LjE2ODI0ODIwNDI.*_ga_PQSEQ3RZQC*MTY4MjY0MjAxOS44LjEuMTY4MjY0MjA1Mi4yNy4wLjA.&_ga=2.130158927.1351879435.1682482042-361265797.1682482042#account)**
 * The user will be directed towards the account page of Databricks.
 * Create an community edition account by giving user's details and choosing the link below to proceed with community edition for any free trial of databricks.
 * Proceed to Azure databricks account.
 * We also need to create the clusters to run the notebooks, load the respective libraries into the cluster to run the notebook.
 * List of libraries to be loaded as PyPI packages:
     * flax
     * transformers
     * tensorflow
     * emoji
     * azure-servicebus


### Creating a notebook in Databricks :
 While in an active Databricks workspace , 
  * Navigate to Data Science and Engineering space.
  * Click on New button.



  [![New Button](/images/Notebook.png)]
  
  
  
  
  
  * Navigate to the options and select Notebook from the dropdown  
  * A blank notebook will come up.

### Creating a cluster in  Databricks:
  * In the main page of the Databricks Account.
  * Navigate to Compute option.
  
  
  
  ![Notebook](/images/NewButton.png)
  
  
  
  
  * Click on the create cluster on the right side of the screen.


  
  ![Notebook](/images/createcompute.png)
  
  
  
  * Fill in the option for a compute , for the below databricks solution the standard cluster properties will be enough.
  
  
  
  
  
  ![Cluster Defination](/images/clustervalues.png)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   For the demo purpose we have chosen,
   
   1. Databricks Runtime: 11.3 LTS (includes Apache Spark 3.3.0, Scala 2.12)
   2. Worker Type : Standard_DS3_V2
   3. Drive  Type : Standard_DS3_V2
   4. Terminate after 10 minutes (until its required for a job, as it will incurr cost)
   5. Access Mode : Single User
   
  * This fetches less cost.

### Installing libraries in Cluster

  * Open the Compute Tab as earlier.
  * Open the cluster created by clicking on it.
  * You will find "Libraries" option in the header , Select the "Libearies" Tab.
  * Click on Install Libraries option.
  * Select the PyPI option 
  * Insert the name of above libraries (one at a time) in the Package test box.
  * Click the  Install 



  ![Library](/images/library.png)
  
  
  
  
  
  
  
  
  
  
  
  
  
  ![Library Installation](/images/libraryinstall.png)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
 


### Notebooks:
The following notebook message_processing.py contains the code snippet for the below actions.

#### Notebook: message_processing
  * Calling the Azure Bus Service to get the messages. (an Azure Service Bus under the same create a topic and subscription to capture the data). 
  * Please note that The Azure Bus Service is created earlier to the workshop and a temporary access token will be shared with user , to send the message to the Azure Bus Service.
  * Running a pre-trained transformer model for sentiment analysis. (Note:Pre-trained model are from hugging face which has been trained on previous data , more information can be obtained on the **[Huggingface Models list](https://huggingface.co/models)**)
  * Tagging the data with the orginal messages.
  * Storing the predicted results in the delta lake
  * Visualizations in the dashboard will be demonstrated over the results of the model .
