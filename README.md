### COVID-19 Vaccine Research

Our Project is about trying to predict if a person taking a COVID vaccine is going to have a serious adverse reaction or not given features such as existing allergies, current medication, age and gender. To help solve this question, we will put our data set through a process of cleaning and normalizing and first run the data through an unsupervised machine learning model to determine whether there are any patterns or clusters in the data.  The clustered data will be summarized and visualized with the hope of finding trends that we can then inform our supervised machine learning model, a logistic regression to answer the question.

A high level view of the project flow and progression is as follows:
![Project_Flow](Resources/Project_Flow.png)

NOTE:  This same map is provided at the bottom of the ReadMe to provide file names that should be present in the Main branch for each step in the associated project flow diagram.

Please visit our [Google Slide Presentation](https://docs.google.com/presentation/d/1jvdRTj7KpEPRe3xggcCQyRMWejOfemQR9ayRXhyVhGs/edit?usp=sharing) for more details. 

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
![ERD](Resources/vaers_raw_erd.png)

## Data Cleaning

### Cleaning for VAERS_Symptoms_Raw
VAERS Symptoms was fairly well organized as structured data with essentially 5 useful columns of symptom data. Each column row is a single value. However, there are many duplicate VAERS IDs. The highest frequency of documented symptoms for a single patient is 120 symptoms.  That's 24 rows of symptom data for that 1 patient.

To prepare for machine learning, we believed the data needed to be a single value per column, but all duplicate rows needed to be removed. It seems that the original data collection solution only allowed for 5 symptoms per patient.  So, if there were more than 5 symptoms reported, the same vaers_id would be duplicated on the next line.  So, one patient had 24 successive lines of symptom data.  The goal was accomplished by merging the five columns into a single column with a list of five values. Next, a lambda function that leverages the join method to find all duplicate rows and merge their 5 symptoms into the first occurrence of the duplicated VAERS ID. 

Now the symptoms data had been transformed to a dataframe with unique VAERS_IDs and each row with a single list of symptoms, with as many as 120 values in the list. Next, the values in the lists were split into individual columns. This would allow these text columns to be encoded during the machine learning process.  This was done by creating an iterration to iterate through the dataframe and on each row, loop through the symptoms in the symptom list and create a columen, SYMPTOM1, SYMPTOM2, and so on all the way to SYMPTOM 120.  Of course, after column SYMPTOM5, the remaining columns contained mostly null values.
Please see “symptoms_cleaning.ipynb” to review related python code.

### Cleaning for VAERS_Data_Raw
VAERS_Data_Raw has many data elements of interest including basic demographics for each patient and other useful information such as medical history, allergies and other medications. Aside from utilizing the demographic information, allergies and other medication information are part of the needed data set to support our machine learning models. Both allergies data and other medications data were also documented in a single column with multiple entries per row. This data also had to be split and placed in columns in a 1:1 ratio between column and allergy or medication values.

To prepare for our machine learning model, we had to create an allergy table and scrub out all the bad data. We started with a merged file of VAERS_Data_Raw and VAERS_Vax_Raw called vaerscombined_2 so as to eliminate rows that were non COVID-19 related. We then dropped the non essential columns and were left with vaers_id and Allergy.

We then used a lambda function to split the allergy column using a delimeter and after scrubbing down all non-essential values we created our Allergy table and saved it to our database. Please see “Clean_Split_Allergy_Table.ipynb” to review related python code.

<!-- [Vitaly to reference python file for medications cleaning] -->

### Cleaning for VAERS_Vax_Raw
This data set listed the VAERS_ID and vaccine information such as the vaccine manufacturer, dose lot and dose series. These features too were believed to be relevant to our planned models. Cleaning this table however was relatively easy as it was already setup with no duplicate VAERS_ID values. A subset of this data is all that was needed as it included many other vaccines besides COVID-19. Our study is relevant to only COVID-19 and this is the subset of vaccine information that we gathered.

Please see vax_cleaning.ipynb in the main branch for coding details.

These tables were saved in the database as clean_vaers_vax, clean_vaers_data and clean_vaers_symptom. In the database, they were joined with left outer joins to VAERS_VAX. Please see “create_uml_table.sql’ in the main branch to review the database joins in preparation for unsupervised machine learning activities.

## Machine Learning

The planned method for analyzing the VAERS data through machine learning is a two-step process:

### Step 1: Unsupervised Learning
The goal of unsupervised learning is to determine whether there are any patterns or clusters with the data from which insights about the data can be gained. Many data analysts will leverage machine learning to gain insights and from those insights create a supervised learning model where predictive value can be achieved. From this, we hope to answer questions such as, “is there possibly a link to death, hospitalization or life-threatening circumstances that arise because a patient has a particular allergy or is on a particular medication?”. 

#### Description of Data PreProcessing
Initial data cleaning and processing mentioned above was mostly to combine data bring it as much as possible into a structured state from its original unstructured state.  While symptoms data was cleaned in the symptoms_cleaning.ipynb and for the most part made ready for machine learning, the allergy and medication data was a long way from being ready for machine learning.

The allergy and medication data had to be processed further to normalize it.  First, data had to be converted to all upper case since there was variation in the data by case.  For example, "Penicillan" appeared as PENICILLIN and as Penicillin.  Second, There were occurrences of spaces in the data that were creating variation.  String functions like str.upper and str.rtrim were leveraged to tackle these variations.  Additonally, the same answer could appear in many forms, spellings or additional anecdotal information.  Penicillin was listed in the data as: [penacillin, pnc, penicilin, penicillin - rash, severe allergy to penicillin, penicillian, allergic to penicillin, and so on...]  To fix this, these variations were cataloged and put in a list and a dataframe replace function was leveraged to replace all variations with a single form of PENICILLIN.

This same situation occurred with the medications and the same actions were taken.  However, in addition, we believed that medications an individual might be linked to adverse reactions, so instead of just leaving the normalized medications in a long vertical column, we believed it would be more appropriate to organize the medications as a boolean value in an individual medication column.  To do this, we used Numpy where() function to examine whether a sub-string was contained in the Med-1 column or row and then used to replace all values with a "Y" or "N".  This again was done by iterating through a lengthy list of specific medications (reflecting the majority of all named medications) that we wanted to examine closely and applying the where() function on while the specific drug had the focus in the iterration.  By selecting a specific list of medications and determining if they were present in the Med_1 column as a substring, we were able to remove a lot of noise and varied data in the medications feature.


#### Description of Feature Engineering, Selection and Decision-Making Process
Feature engineering is touched on lightly in the above paragraph as the data preprocessing is examined.  Generally, although categorical data of a boolean format is harder to visualize, we believe that our symptoms, medication and allergy data at some point should all be converted to a wide format.  Although this is done with get_dummies(), having a specific list of values to get wide on limits the noise of non-normalized data.  

If time permits, we will take this approach and further refine our symptoms and allergies data and lastly, we may spend some more time expanding the list of medications to the complete universe of specific medications.

#### Description of How Data Split into Testing vs Training
Testing vs Training is a supervised machine learning task and is unnecessary for unsupervised models.

#### Explanation of Model Choice (Limitations and Benefits)
Unsupervised learning was selected because there is no known correlation between demographics, medications, allergies or symptoms that occur with an adverse reaction.  There is no known correlation between vaccine manufacturers either.  A K-Means approach lets the machine learning algorithm find patterns or clusters.

#### Explanation of Changes in Model Choice (if changes occurred between Seg 2 and Seg 3)
There were no changes in model choice from previous work segments.

#### Description of How the Model Has Been Trained So Far and Additional Training To Come
This is not applicable to Unsupervised Machine Learning.

#### Description of Current Accuracy Score
Following is a 3 dimensional representation of the clusters found by our model:
![3D_Clusters](Resources/3d_clusters.png)

#### How the Model Addresses the Question or Problem Being Solved
The K-Means Model addresses the problem by providing insight into groups that have higer adverse reactions than others.  Following is a summary of most frequenly occuring metrics for the four clusters that K-Means provided:
![UML_Results](Resources/UML_results_summary.png)



### Step 2: Supervised Machine Learning


 - We chose to use a logistic regression model because we are trying to predict a binary outcome using a fairly limited amount of inputs. If this were a larger dataset with more features, a deep learning model may have been more applicable. As more data is processed and we add more features, we may transition to a deep learning model to accomodate these changes.  
 - We chose to split the data into 70% training data and 30% testing data. Changing these proportions had a negligible effect on our models performance, but we will continue to test and monitor these values as our model changes and adds more features.  

After analyzing our clusters to see if there are any links that can be correlated to outcomes, we will put the supervised machine learning models to work and see if we can predict an event outcome based on certain features. Although we have saved to the main branch our current supervised learning models, we expect to develop this effort for the next project segment submission.


## Visualization & Story Board
Our overall story and study of our analysis will let the user interact with the aggregated results and filter on topics that matter most to them. Our interactive dashboard will be hosted on Tableau Public and a user will be able to click through a data point to see the relevant data feeding into the analysis. 

## The Summary
COVID-19 vaccines help our bodies develop immunity to the virus that causes COVID-19 without us having to get the illness. Getting vaccinated is one of many steps you can take to protect yourself and others from COVID-19.  Protection from COVID-19 is critically important because for some people, COVID-19 can cause severe illness or death as seen by the data we are analyzing. 

### File Map
![File_Map](Resources/file_map.png)