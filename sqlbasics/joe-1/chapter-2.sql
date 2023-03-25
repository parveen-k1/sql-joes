/************************************************************************/
/*
	Created - 03-23-2023
	@Author - Parveen Kumar
*/
/************************************************************************/
SELECT * FROM Employee WHERE FirstName = 'David'
/**
Note - 1
When we place excalmation before equals sign it means 'Not Equals'
In SQL Server previous versios - SQL 2008, '<>' was used as 'Not Equals'
*/
SELECT * FROM Employee WHERE FirstName != 'David'

SELECT * FROM Employee WHERE FirstName <> 'David'

/**
Note - 2
The risk in using '<>' operator is that it looks exactly like an HTML or XML tag.
When SQL Server needs to talk with other languages, it's better to use '!=' 
operator for 'Not Equals'
*/

SELECT * FROM Employee WHERE FirstName = 'Lisa' OR FirstName = 'David'

SELECT * FROM Employee WHERE FirstName IN ('Lisa', 'David')
/**
Note - 3
The multiple ORs for the same columns can be replaced with IN clause
*/

SELECT * FROM [Grant] WHERE Amount BETWEEN 25000 AND 42000
/**
Note - 4
Using a BETWEEN operator offers results that are inclusive of the numbers
in the predicate.
*/

/**
Note - 5
SQL Server Table can have maximum 1024 Columns
GO finishes the previous statement.
*/

SELECT * FROM Employee WHERE FirstName LIKE '%A'

/**
Note - 6
The % wildcard character represent any number of characters of any length.
'%A' will find all values ending with A

The '_' wildcard sign represent exactly one character
'_A%' will find all values where second letter is A.
*/
SELECT * FROM Employee WHERE FirstName LIKE '_A%'

/**
Note -7
To find all FirstName values begining with the letters 'A' or 'B' we can 
use two predicates in our WHERE clause, by separating them with the OR
statement. This works fine until we want larger range of letters as below
query.
*/
SELECT *
FROM Employee
WHERE FirstName Like 'A%'
OR FirstName Like 'B%'
OR FirstName Like 'C%'
OR FirstName Like 'D%'
OR FirstName Like 'E%'
OR FirstName Like 'F%'
OR FirstName Like 'G%'
OR FirstName Like 'H%'
OR FirstName Like 'I%'
OR FirstName Like 'J%'
OR FirstName Like 'K%'

/**
Note - 8
The above query finding all Firstnames begining with letters A through K
can be replaced with following
*/

SELECT * FROM Employee WHERE FirstName LIKE '[ABCDEFGHIJK]%'
/**
Note - 9
The above query can futher modified as following using '-' character
All this works with LIKE and not with '='
*/
SELECT * FROM Employee WHERE FirstName LIKE '[A-K]%'
/**
Note - 10
NO OUTPUT in following query
*/
SELECT * FROM Employee WHERE FirstName = '[A-K]%'


/**
Note - 11
Finding wild characters % and _ cannot be carried out by enclosing
these character in %%. eg SQL cannot find data having % with LIKE '%%%'
or data having _ with LIKE '%_%'

To find these special characters we need to enclose these in [] brackets
*/
SELECT * FROM [Grant] WHERE GrantName LIKE '%[%]%'
SELECT * FROM [Grant] WHERE GrantName LIKE '%[_]%'

/**
Note - 12
Following queries will not give correct results.
*/

SELECT * FROM [Grant] WHERE GrantName LIKE '%%%'
SELECT * FROM [Grant] WHERE GrantName LIKE '%_%'

/**
Note - 13
Find data having "'" in column values
This can be found using '%''%' signs
*/

SELECT * FROM [Grant] WHERE GrantName LIKE '%''%'

/**
following query will have error is execution 
SELECT * FROM [Grant] WHERE GrantName LIKE '%'%'
*/

/**
Note - 14
Finding all the names starting with the letter 'O' would use LIKE 'O%'
Finding all the names not starting with the letter 'O' would use NOT LIKE 'O%'

The new scenarios is to find Values those starts with 'O' and second letter is not 'S'
*/
SELECT * FROM Employee WHERE LastName LIKE 'O[^S]%'
/**
Note - 15
The carror sign '^' instructs SQL Server to ignore values that match this pattern.
We can use this feature with a range of values as well
*/

SELECT * FROM Employee WHERE LastName LIKE 'O[^A-Z]%'

/**
Note - 16
Here the filter of range is only on second letter of the value.
So, any names like O’Neil, O’Dowd, or O’Shannon are perfectly acceptable results 
in this query, as the second character is not a letter from ‘A’ thru ‘Z’.
*/
