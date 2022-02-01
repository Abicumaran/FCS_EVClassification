# FCS_EVClassification
Machine Learning Algorithms for Classifying Cancer Patients-derived EVs' FCS Power spectra

The Machine Learning codes for Cancer Patients-derived Extracellular Vesicles Classification by Fluorescence Correlation Spectroscopy (FCS).
The Google Colab Notebooks (.ipynb  files) of all hyperparameter tuned ML classifiers are provided. The Image Convolutional Neural Network cand ResNet Image classifier codes are provided with their sample datasets (power spectral images), organized into the folders as processed by the algorithms. The zipped folders “cancer” and “ResNet(Spectra)”, correspond to the power spectral images for the image CNN (Tensorflow) and ResNet CNN classifiers, respectively. All codes were executed on Google Colab.

The Jupyter Notebooks of the Nonlinear Feature Extraction algorithms are also provided.

The ImportFCS_code.R and a sample raw FCS counts spectrum (420_FCS_30s_001.fcs) is provided to run the code and obtain the FCS autcorrelation spectrum. The extracted power spectra are provided as csv files: Power2.csv (for the RF classifier) at their discussed selected frequencies. In diagnosis, 0 denotes healthy and 1 denotes cancer. The complete set of power spectra of all samples are provided as ‘PowerSpectra.csv’, with their respective patient sample IDs mentioned.

For the Quantum CNN, refer to the code provided in:
https://github.com/KinshukSengupta/qml-toolkit/blob/master/QNN_CT_COVID_dataset.ipynb 



