# E_MINC Jupyter Notebook - Phyton Script
Purpose: It is important to accurately determine iso-pressure levels because they affect the volume fractions, transmissibilities between nested blocks, and the overall performance of the E-MINC model. The K-Means clustering algorithm is utilized to optimize iso-pressure contour level determination so that pressure distribution within each nested block is as uniform as possible. This is necessary for the MINC model because transfer flows between nested volumes are calculated based on average pressure differences.

This jupyter notebook - phyton script uses kmeans algorithm to determine the pressure contours so that pressure distribution within each nested block should be as homogeneous as possible.

1) The Equi-dimensional discrete fracture model reference pressure levels are given as an input in csv file format "_equidim_dfn_pressure_v2_2.csv" file.
2) Within the script number of blocks is defined depending how many blocks you want to have, e.g. n_blocks=11.
3) Script is run to get pressure levels "levels array" of each contours level so that pressure distribution within each nested block should be as homogeneous as possible. 
