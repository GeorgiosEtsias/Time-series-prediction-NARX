# Time series prediction using NARX 
The project uses a [nonlinear autoregressive exogenous (NARX)](https://en.wikipedia.org/wiki/Nonlinear_autoregressive_exogenous_model) model to make time-series prediction on data obtained from drive cycling testing on buses. In total 25 data-series, corresponding to three different [drive cycles](https://en.wikipedia.org/wiki/Driving_cycle) were obtained from the same bus. In each dataset four variables were experimentally quantified: engine torque, engine speed, air temperature intake, and exhaust fume temperature. Exhaust fume temperature served as the output variable, while the remaining 3 were the inputs of the NARX. 

![alt text](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/Photos/BusBelfast.jpg)

Five different MATLAB scripts were included in the repository:

# Code description 

**Data pre-processing**

Data pre-processing is conducted in [DataPreProcessingBus2.m](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/DataPreProcessingBus2.m). The data are modified in order to create a single training dataset, containing 22 of the 25 time series. Three datasets, one from each corresponding driving cycle, were not involved in training, instead they were used to evaluate NARX’s generalization ability. 

**Training**

Two different scripts for ANN training are included.  [TrainANN.m](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/TrainANN.m) trains a NARX with 10 hidden neurons and an input delay of 2. This network architecture was decided via trial and error. A typical divison of the training data sat in training (70%), validation (15%), and testing (%) subsets was used to prevent overfitting. [TrainANNsinLoop.m](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/TrainANNsinLoop.m) includes the same training procedure in a loop. A number of models are trained, their performance on the 3 testing datasets is quantified but only the ‘best’ model is saved. 

**Prediction**

Two variation of prediction scripts were included. The first one ([Prediction.m](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/Prediction.m))makes a strictly closed-loop prediction of the tree testing datasets, while [PredictionOpenClose.m](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/PredictionOpenClose.m) uses executes an open-loop prediction for the initial 1/3 of the test sets and a closed-loop prediction for the remaining data-points. 

# Results

The [optimally trained NARX](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/tree/master/OptimallyTrainedANNs) was able to successfully predict all 3 testing datasets, each one corresponding to a single driving cycle. For the first 1/3 of the prediction an opened loop NARX version was utilised, while for the remaining time series data points a closed-loop one was employed. 

![alt text](https://github.com/GeorgiosEtsias/Time-series-prediction-NARX/blob/master/Results/Results.png)

Figure 1: Real and predicted values of exhaust fume temperature for 3 distinct experimental drive cycles. 
