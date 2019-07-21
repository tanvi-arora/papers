# papers
Collection of all papers

## Bank Account Customer Promotion : Classification Models 
![bank promo project](https://github.com/tanvi-arora/projects/tree/master/BankAcct_CustomerPromotion)

The data set selected is 'Bank Marketing', provided from the UCI Machine Learning Repository site.This data set follows a Portuguese telemarketing campaign to secure term deposits. As part of this project a deep exploratory analysis was performed to understand the features individually and their relationship with other features through multiple visualizations.
Feature Elimination was done using Lasso Logistic Regression. 
Additional ensemble of Feature Elimination was analyzed - LDA , Chi-sq test ,pearson correlation , logistic regression , random forest  , light GBM
**Model Evaluation criteria :**
1. The dataset is imbalanced with 89% non-subscribers and only 11% subscribers. In order to strike a balance between recall and precision values, F1 score metric is chosen as primary metric for evaluation of our models. 
2. Another primary metric is AUC scores in conjunction to ROC curve which basically provides accuracies at different threshold values
3. Recall will also be considered as another metric for evaluation , as per the business problem , increased false positive rate means that bank would make extra calls that would not yield positive results but since recall is high, model is less likely to miss people who actuallly want to subscribe. 

**Models :**
Stratified 10-fold and stratified 10-fold shuffle split used as cross validation techniques.
Grid search used for testing with hyper-parameters
1. SVM Model
2. Simple Random Forest 
3. XGBoost
4. Logistic Regression

**python libraries :** numpy, pandas, matplotlib , seaborn , sklearn , xgboost, scipy 

## HTRU2 ( High Time Resolution Universe Survey ) : Clustering Algorithms
![HTRU2](https://github.com/tanvi-arora/projects/tree/master/HTRU2_clusteringAnalysis)

The data set comes from pulsar candidates collected during the High Time Resolution Universe Survey (South) (HTRU2).There are about 2600 pulsars currently known and nearly all lie within our galaxy. There are two kinds of pulsars – normal pulsars (having pulse speed 0.3 – 3 seconds) and millisecond pulsars (MSP, having a pulse period between 1mSec – 10 mSec). The pulse period is very stable and predictable, but not constant. In order to detect pulsars, we look for the electromagnetic radiation that has cyclical pulses. The best analogy is that a pulsar is like a lighthouse – the light is emitted at regular intervals that can be measured from a distance. The HTRU2 study used radio telescopes to scan for wavelengths in that part of the electromagnetic spectrum to detect pulsars.

**Algorithms analyzed :**
1. K Means Algorithm
2. GMM Algorithm 
3. DBSCAN Algorithm
4. Hiearchical Clustering Algorithms ( Agglomerative clustering, ward , singlelink ,completelink , average linkages and BIRCH )
5. Spectral Clustering Algorithms ( RBF Kernel and Nearest Neighbour Graph Based )

**python libraries :** numpy, pandas,matplotlib, seaborn, itertools , tqdm,sklearn , mpl_toolkits.mplot3d


