# ASP-UI

This software provides a user interface for solving Stable Marriage Problem with SAT solver clingo.
Users may select .txt input files by clicking the File tab and/or edit them in text area.

## Input format
First line is reserved for number of men, second line for number of women.
Starting with 3rd line, preference list of each men should be specified.
ex: i^th man's preference list should be on (i+2)^th line.
Similarly, women's preference lists should follow men's.

## Rank/Preference

If preference lists are provided as a ranking of individuals, indices and ranks should be separated by single space.
Length of an individual's list should be written at the initial line.

 ex: '1'
     '1 3'
     
 ex: '2'
     '1 3'
     '2 1'
     
 If preference lists actually represent an ordering of individuals. After specifying the number of men and women, 
 men's preferences will occupy each line in the following format:
 
  ex: '2 3 {1,4}' - curly braces represent ties
  
 After men's preference lists, women's preferences should be specified.
     
 
 ## How to run
clingo 5.2.2 must be installed in command line.
See: https://potassco.org/clingo/

* Can be tested by running 'clingo'.

In main directory run 'ant compile jar run'.
