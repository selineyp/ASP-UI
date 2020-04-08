# SMTI Solver

This software provides a user interface for solving Stable Marriage Problem(SMP) instances.
Users may select .txt input files by clicking the File tab and/or edit them in text area.

## Input format
First line is reserved for number of men, second line for number of women. Starting from the 3^rd line, men's preferences are specified one by one.
After men's preferences, women's preferences should be specified.

## Rank/Preference

If preferences of individuals are provided as an ordering of the goal set, in the single line reserved to this individual, his/her ordering is given.

ex: 1 2 3

These two lines represent the following information: The corresponding individual prefers 1'st woman(resp. man) to 2^nd and prefers 2^nd woman(resp. man) to 3^rd.

Preferences of individuals can also be specified with ranks. Length of such ranking list is written at first line reserved to this individual.
Starting from the 2^nd line, ranks given to individuals of the goal set is specified. In such lines, first number represents the index of the individual who is being given a rank, second number is the rank. Higher ranks represent stronger preference.

 ex: 2
     1 3
     2 1

Corresponding individual ranks 1^st man(resp. woman) as 3, 2^nd man(resp. woman) as 1.

Ties are represented in ordering lists as followed:
  ex: '2 {1,3}' - curly braces represent ties

2^nd man(resp. woman) is preferred over 1 and 3. There is no strict preference between 1 and 3.

If sticky stability is preferred, each individual's stickiness degree should be specified with respect to their indices.
Men's stickiness degrees are specified first.


## Prerequisites

ant should be installed.
See: https://ant.apache.org/manual/install.html

* Can be tested by running 'ant -v'.

clingo should be installed in command line.
See: https://potassco.org/clingo/

* Can be tested by running 'clingo'.

## How to run

In main directory (where build.xml is) run 'ant compile jar run' for displaying and interacting with the user interface.
Project can also be built and run with parameters, in this case user interface will not be displayed.
Parameters:

Specifying the file name is required. ex: -Dfile = "filename.txt"

Specifying the optimization variant is optional. Default is no optimization. ex: -Dopt = 0

Optimization variants are given in the following list:
0 : No optimization
1 : Sex Equal
2 : Min Regret
3 : Egalitarian
4 : Max Cardinality

Specifying if sticky stability should be used, is optional. Default is weak stability. ex: -Ds = 0

ex: 'ant jar compile run -Dfile="sample_input_rank.txt" -Dopt=1'
This command will solve SMP instance given in the file with sex equal optimization.
