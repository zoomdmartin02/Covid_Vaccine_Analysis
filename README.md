### COVID-19 Vaccine Research

Our Project is about trying to predict if a person taking a COVID vaccine is going to have a serious adverse reaction or not given features such as existing allergies, 
current medication, age and gender. Please visit our [Google Slide Presentation](https://docs.google.com/presentation/d/1jvdRTj7KpEPRe3xggcCQyRMWejOfemQR9ayRXhyVhGs/edit?usp=sharing) for more details. 

## Data Source
 - Our data source is from HHS Vaers website - [Data Source](https://vaers.hhs.gov/data/datasets.html?)
 - We downloaded the latest available data for 2020 and 2021
 - To support the machine learning and visualization activities, the database will build off of the original three CSV files. Each of these  files were written to the database in their original form and named as follows:
  - VAERS_Data_Raw
  - VAERS_Symptom_Raw
  - VAERS_Vax_Raw
- These files were then pulled into python by various team members and cleaned in preparation for machine learning activities. 
- “vaers_raw_erd.png” in the main branch is the Entity Relationship Diagram that is the basis for all of our database joins 
 in any of the subsequent tables that are created.
- The three tables each have a VAERS_ID column and are joined with a 1-many relationship from VAERS_VAX_RAW to VAERS_DATA_RAW and a 1-many relationship from VAERS_VAX_RAW to VAERS_SYMPTOM_RAW as well.

## Data Cleaning

### Cleaning for VAERS_Symptoms_Raw
VAERS Symptoms data is essentially 5 columns of symptom data. Each column row is a single value. However, there are many duplicate VAERS IDs. The highest frequency of documented symptoms for a single patient is 120 symptoms.

To prepare for machine learning, the data had to be a single value per column, but all duplicate rows needed to be removed. The goal was accomplished by merging the five columns into a single column with a list of five values. Next, a lambda function that leverages the join method to find all duplicate rows and merge their 5 symptoms into the first occurrence of the duplicated VAERS ID.

Now the symptoms data was a dataframe with unique VAERS_IDs and each row with a single list of symptoms, with as many as 120 values in the list. Next, the values in the lists were split into individual columns. This would allow these text columns to be encoded during the machine learning process.
Please see “symptoms_cleaning.ipynb” to review related python code.

### Cleaning for VAERS_Data_Raw
VAERS_Data_Raw has many data elements of interest including basic demographics for each patient and other useful information such as medical history, allergies and other medications. Aside from utilizing the demographic information, allergies and other medication information was part of the needed data set to support our machine learning models. Both allergies data and other medications data were also documented in a single column with multiple entries per row. This data also had to be split and placed in columns in a 1:1 ration between column and allergy or medication values.

To prepare for our machine learning model, we had to create an allergy table and scrub out all the bad data. We started with a merged file of VAERS_Data_Raw and VAERS_Vax_Raw called vaerscombined_2 so as to eliminate rows that were non COVID-19 related. We then dropped the non essential columns and were left with vaers_id and Allergy.

We then used a lambda function to split the allergy column using a delimeter and after scrubbing down all non-essential values we created out Allergy table and saved it to our database. Please see “Clean_Split_Allergy_Table.ipynb” to review related python code.

<!-- [Vitaly to reference python file for medications cleaning] -->

### Cleaning for VAERS_Vax_Raw
This data set listed the VAERS_ID and vaccine information such as the vaccine manufacturer, dose lot and dose series. These features too were believed to be relevant to our planned models. Cleaning this table however was relatively easy as it was already setup with no duplicate VAERS_ID values. A subset of this data is all that was needed as it included many other vaccines besides COVID-19. Our study is relevant to only COVID-19 and this is the subset of vaccine information that we gathered.

Please see vax_cleaning.ipynb in the main branch for coding details.

These tables were saved in the database as clean_vaers_vax, clean_vaers_data and clean_vaers_symptom. In the database, they were joined with left outer joins to VAERS_VAX. Please see “create_ml_tables.sql’ in the main branch to review the database joins in preparation for unsupervised machine learning activities.

## Machine Learning

The planned method for analyzing the VAERS data through machine learning is a two-step process:

### Step 1: Unsupervised Learning

The goal of unsupervised learning is to determine whether there are any patterns or clusters with the data from which insights about the data can be gained. Many data analysts will leverage machine learning to gain insights and from those insights create a supervised learning model where predictive value can be achieved. From this, we hope to answer questions such as, “is there possibly a link to death, hospitalization or life-threatening circumstances that arise because a patient has a particular allergy or is on a particular medication?”. We also believe that the symptom data might reveal a pattern or cluster of symptoms by age group, vaccine taken or dose series of the vaccine and might also be influenced by allergies or medications. So, we hope to answer the question, “is there a link to symptoms presentation to any of the aforementioned features?”

Our unsupervised learning model will by the final presentation scrutinize 3 sets of data separately and merged together to evaluate for clusters. For Segment two, we are submitting the unsupervised machine learning model that evaluates demographic features, adverse outcomes (death, hospitalization or life-threatening circumstance), vaccine features and allergy data. This model resulted in finding 7 clusters of data that we will analyze further and plan our visualization around.

Our second unsupervised learning model evaluated features associated with demographics, adverse outcomes (death, hospitalization or life-threatening circumstance), vaccine features and symptom data. In this case, our model found 5 clusters of data that we will further analyze and visualize during our next segment.

Our last unsupervised machine learning model evaluates all of the data mentioned above: demographics, adverse outcomes (death, hospitalization or life-threatening circumstance), vaccine features, allergies and symptom data. Again, our model found 7 clusters.




### Step 2: Supervised Machine Learning


 - We chose to use a logistic regression model because we are trying to predict a binary outcome using a fairly limited amount of inputs. If this were a larger dataset with more features, a deep learning model may have been more applicable. As more data is processed and we add more features, we may transition to a deep learning model to accomodate these changes.  
 - We chose to split the data into 70% training data and 30% testing data. Changing these proportions had a negligible effect on our models performance, but we will continue to test and monitor these values as our model changes and adds more features.  

After analyzing our clusters to see if there are any links that can be correlated to outcomes, we will put the supervised machine learning models to work and see if we can predict an event outcome based on certain features. Although we have saved to the main branch our current supervised learning models, we expect to develop this effort for the next project segment submission.


## Visualization & Story Board
Our overall story and study of our analysis will let the user interact with the aggregated results and filter on topics that matter most to them. Our interactive dashboard will be hosted on Tableau Public and a user will be able to click through a data point to see the relevant data feeding into the analysis. 

## The Summary
COVID-19 vaccines help our bodies develop immunity to the virus that causes COVID-19 without us having to get the illness. Getting vaccinated is one of many steps you can take to protect yourself and others from COVID-19.  Protection from COVID-19 is critically important because for some people, COVID-19 can cause severe illness or death as seen by the data we are analyzing. 