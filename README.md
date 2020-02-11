# ASP-UI

This software provides a user interface for solving Stable Marriage Problem with SAT solver clingo.
Users may select .txt input files by File tab and/or edit them in text area.

## Input format
First line is reserved for number of men, second line for number of women.
Starting with 3rd line, preference list of each men should be specified.
ex: i^th man's preference list should be on (i+2)^th line.
Similarly, women's preference lists should follow men's.

## Rank/Preference

If preference lists are provided as a ranking of individuals, indices should be separated by single space.
 ex: '1 2 3'

If preference lists are provided as a comparison of individuals, indices should be separated by one the following operators:
 ' < , > , = '

Operators should be surrounded by single space.
 ex:'1 < 2 < 3'

## How to run
clingo 5.2.2 must be installed in command line.
See: https://potassco.org/clingo/

* Can be tested by running 'clingo'.

In main directory run 'ant compile jar run'.
