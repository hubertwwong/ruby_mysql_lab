# Ruby Mysql lab

Some test code that i'm working on. Mostly just for practice.
Code is broken up into a few directories.


#### basic
A basic test to get things started.



#### school
Practice creating a database and some data for a school.
Using just the MYSQL2 gem and bare sql queries for some practice.



#### space_ship
Insert performance test. Baiscally figured out that Sequel is really show
for insert performances. Adding transactions to the Sequel insert doubles
performance. Using the pure Mysql2 gem doubles the naive Sequel
implementation. Adding transaction to the naive implementation 3x performance.
The MYSQL load data command seems the way to go. its 10x faster than the
transaction data. Decided to build it out.

Sequel seems to have some command for insert build but my hunch is that it
won't beat the LOAD DATA performance.



#### util
building out a some simple classes to help with some generate the MySQL
strings.


