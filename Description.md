# Baseline correction using Non-Linear fitting of Bézier curves

In some analytical measurements, our signal is superimposed by a baseline signal not related to our measurand. In many cases, running a blank sample, i.e, a sample with the same matrix not containing your measured analyte, allows you to estimate your common baseline signal, which can be subtracted from your subsequent measurements.  In some cases, however, the approach described above is not possible, due to unavailability of blank samples or non reproducible baselines in between measurements/runs.

This script is an approach for baseline correction using non-linear fitting of Bézier Curves. It consists of fitting a curve (similar to drawing curves from vector drawing software) to a region of your signal (it is best if you can estimate a part of the signal without analyte response), which is subtracted from your measurement, and subsequent Gaussian peak fitting for estimation of concentration. 

This algorithm was used on my PhD Thesis ( https://doi.org/10.11606/T.46.2016.tde-07042016-090549 ) to correct baseline from voltammetric signals of acetone determination via imine reduction (highly affected by hydrogen reduction signal), with favourable results.

This version of the script was written in Octave 4.2, and the code here is presented as it is on the thesis (with few minor improvements in comments and formatting). Some standard parameters on the functions are chosen considering the aforementioned application (SWV acetone determination).

In case you have any interest on this project/approach, do not hesitate to contact me.
