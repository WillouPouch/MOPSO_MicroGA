# MOPSO_MicroGA
Authors : Esmé James & Wilfried Pouchous

## Description

Two multi-objective genetic algorithm containing user inputs for:
* Genetic Algorithm parameters (Population size, Archive size, crossover and mutation probabilities, Max number of generations, Population memory size, number of iterations until nominal convergence, ...)
* A choice between 6 test functions (FON, POL, KUR, ZDT1, ZDT2, ZDT3)

The pareto front is plotted on a graph at each iteration, and the number of members in the front is printed.

Results are discussed in the report.

## File organisation

The two algorithms are contained in separate folders, each containing the steps of the algorithm (initialisation, evaluation, selection, ...).

The program is launched by executing the main.m file.

A folder called "Problemes" contains the functions to test the algorithm.
