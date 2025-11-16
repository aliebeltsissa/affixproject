import numpy as np
import matplotlib.pyplot as plt
from dadapy import Data
from dadapy.plot import plot_SLAn, plot_MDS, plot_matrix, get_dendrogram, plot_DecGraph
import pandas as pd
import os
import seaborn

# data_path = 'C:/Users/annal/OneDrive/Documents/GitHub/affixproject'

# data_BLP_testing = pd.read_csv(f'{data_path}/BASL_exp2_BLP.csv')
# list(data_BLP_testing)
# #['sbj_ID', 'Age', 'Gender', 'RC1_L4', 'RC3_L3', 'RC2_use_L1vsL2', 
# # 'RC7_hist_L2', 'RC9_use_L4', 'var', 'ent', 'use_ent', 'multiexp', 
# # 'L1_L2_diff', 'cossim', 'use_cossim']

# #data_BLP_testing_vars = data_BLP_testing[["RC1_L4","RC3_L3","RC2_use_L1vsL2",
# #                                          "RC7_hist_L2","RC9_use_L4","ent",
# #                                          "use_ent","multiexp","L1_L2_diff",
# #                                          "cossim","use_cossim"]]
# data_BLP_testing_vars = data_BLP_testing[["multiexp","L1_L2_diff"]]

# vars = data_BLP_testing_vars.to_numpy()
# #print(True in np.isnan(vars))
# #print(True in np.isinf(vars))
# #res = data_BLP_testing['cossim'].tolist()

# #seaborn.displot(res)
# #plt.show()

# f, ax = plt.subplots(1, 1, figsize=(7, 7), gridspec_kw={"hspace": 0.05, "wspace": 0})
# ax.yaxis.set_major_locator(plt.NullLocator())
# ax.xaxis.set_major_locator(plt.NullLocator())
# ax.set_title("2D scatter of the data")
# ax.scatter(vars[:, 0], vars[:, 1], s=15.0, alpha=1.0, c="black", linewidths=0.0)
# plt.show()

# # initialize the "Data" class with the set of coordinates
# data = Data(vars,verbose=True)

# # compute distances up to the 100th nearest neighbor
# data.compute_distances(maxk=100)

# # estimation of intrinsic dimension
# data.compute_id_2NN()

# # estimate the density
# data.compute_density_kstarNN()





from sklearn.datasets import make_swiss_roll

n_samples = 5000
X, _ = make_swiss_roll(n_samples, noise=0.0)
ie = Data(coordinates=X)
ie.compute_distances(maxk=100)
ie.compute_id_2NN()
ie.compute_density_kstarNN()