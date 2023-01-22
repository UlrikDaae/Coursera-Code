/* Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below: */

SELECT 
	(*)
FROM 
	(table);

-- X is the name of the table.
	
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
	


-- 2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT
	COUNT(DISTINCT (primary/foreign key))

FROM
	(table);

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493 
vii. Photo = 10000
viii. Tip = 537 (user_id)
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

-- Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	

-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
Answer: No

-- SQL code used to arrive at answer:
SELECT 
    count(*)

FROM 
    user

WHERE 
	(collumn) IS NULL;

	
-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082
		
	
	ii. Table: Business, Column: Stars
	
		min:	1.0	max:	5.0	avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:	0	max:	2000	avg: 24.2995	

SELECT 
    MIN(collumn) AS min_(collumn),
    MAX(collumn) AS max_(collumn),
    AVG(collumn) AS mean_(collumn)

FROM 
    (table);

-- 5. List the cities with the most reviews in descending order:

-- SQL code used to arrive at answer:
	
SELECT 
    city,
    SUM(review_count) AS num_reviews

FROM 
    business
    
GROUP BY 
    city

ORDER BY 
    num_reviews DESC;
	
/* Copy and Paste the Result Below:
	
+-----------------+-------------+
| city            | num_reviews |
+-----------------+-------------+
| Las Vegas       |       82854 |
| Phoenix         |       34503 |
| Toronto         |       24113 |
| Scottsdale      |       20614 |
| Charlotte       |       12523 |
| Henderson       |       10871 |
| Tempe           |       10504 |
| Pittsburgh      |        9798 |
| Montréal        |        9448 |
| Chandler        |        8112 |
| Mesa            |        6875 |
| Gilbert         |        6380 |
| Cleveland       |        5593 |
| Madison         |        5265 |
| Glendale        |        4406 |
| Mississauga     |        3814 |
| Edinburgh       |        2792 |
| Peoria          |        2624 |
| North Las Vegas |        2438 |
| Markham         |        2352 |
| Champaign       |        2029 |
| Stuttgart       |        1849 |
| Surprise        |        1520 |
| Lakewood        |        1465 |
| Goodyear        |        1155 |
+-----------------+-------------+
(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer: */

SELECT 
    stars,
    SUM(review_count) AS num_reviews

FROM 
    business
    
WHERE city == 'Avon'

GROUP BY stars;


-- Copy and Paste the Resulting Table Below (2 columns – star rating and count):
/* 
+-------+-------------+
| stars | num_reviews |
+-------+-------------+
|   1.5 |          10 |
|   2.5 |           6 |
|   3.5 |          88 |
|   4.0 |          21 |
|   4.5 |          31 |
|   5.0 |           3 |
+-------+-------------+
ii. Beachwood

SQL code used to arrive at answer: */ 

SELECT 
    stars,
    SUM(review_count) AS num_reviews

FROM 
    business
    
WHERE city == 'Beachwood'

GROUP BY stars;

/* Copy and Paste the Resulting Table Below (2 columns – star rating and count):
		
+-------+-------------+
| stars | num_reviews |
+-------+-------------+
|   2.0 |           8 |
|   2.5 |           3 |
|   3.0 |          11 |
|   3.5 |           6 |
|   4.0 |          69 |
|   4.5 |          17 |
|   5.0 |          23 |
+-------+-------------+

7. Find the top 3 users based on their total number of reviews: */ 
		
-- SQL code used to arrive at answer:
	
SELECT 
    name,
    review_count

FROM 
    user

GROUP BY 
    name

ORDER BY 
    review_count DESC

LIMIT 
    3;
		
Copy and Paste the Result Below:
/* 		
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| .Hon   |         1246 |
| eric   |         1116 |
+--------+--------------+

8. Does posing more reviews correlate with more fans?

Please explain your findings and interpretation of the results: 
Yes somewhat. If you select review count and sort by ascending order you'll see that those with 0 or 1 reviews have 0 or 1 fans, and if you sort by descending order you'll see that those with higher review counts have more fans. However, there is large differences in those 25 with the highest number of reviews. In other words, more reviews means more fans, but it's not a linear correlation. 
*/ 

SELECT 
    name,
    review_count,
    fans

FROM 
    user

GROUP BY 
    name

ORDER BY 
    review_count DESC;

	
-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

-- Answer: Yes.


-- SQL code used to arrive at answer:
SELECT 
    COUNT(*)

FROM 
	review

WHERE 
	text LIKE "%love%";

SELECT 
	COUNT(*)

FROM 
	review

WHERE 
	text LIKE "%hate%";

	
/* Copy and Paste the Result Below:
+----------+
| COUNT(*) |
+----------+
|     1780 |
+----------+
+----------+
| COUNT(*) |
+----------+
|      232 |
+----------+
	
10. Find the top 10 users with the most fans:

SQL code used to arrive at answer: */ 

SELECT 
    name,
    fans
    
FROM 
    user

ORDER BY
    fans DESC

LIMIT 
    10;
/*
Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
The group of restaurants in Toronto (which is what I chose to analyze) with the lowest rating consistently open earlier than the ones with a higher rating. 


ii. Do the two groups you chose to analyze have a different number of reviews?
The two restaurants with the fewest stars have some of the lowest review counts as well. The ones with a better star rating seem to have more reviews. 
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
It's hard to infer anything from the postal codes, given that I don't know anything about how Toronto zip-codes work. That said, two of the restaurants with some of the worst ratings are in teh same neighborhood.


SQL code used for analysis: */ 
SELECT
    b.city,
    b.name,
    c.category,
    b.stars,
    h.hours,
    b.review_count,
    b.neighborhood,

FROM 
    business b

LEFT JOIN category c ON b.id = c.business_id
LEFT JOIN hours h on b.id = h. business_id

WHERE 
    b.city == 'Toronto' AND category == 'Restaurants'

ORDER BY 
    b.stars

LIMIT 25;
	
/* 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
	Restaurants open have on average 2.0 higher stars than those that are marked as closed. 
         

ii. Difference 2:
         Those that are open also has a much higher rate of reviews (37.0 vs 5.375).
         
SQL code used for analysis: */
SELECT
    b.city,
    b.name,
    c.category,
    b.stars,
    avg(b.review_count),
    b.is_open,
    r.funny,
    r.cool,
    r.useful

FROM 
    business b

LEFT JOIN category c ON b.id = c.business_id
LEFT JOIN hours h ON b.id = h. business_id
LEFT JOIN review r ON b.id = r.business_id

WHERE 
    b.city == 'Toronto' AND category == 'Restaurants'

GROUP BY
    is_open

ORDER BY 
    b.stars DESC
 
LIMIT 25;

/*	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:

	I have previously created a regression machine learning model in R for bankruptcies, and I wanted to do something simlar with this.


ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:

	To do this I need an independent variable, in our case going to be to predict whether a store goes bankrupt – i.e. "is_open". Secondly we need some other variables to test whether these might have an impact. In our case I want it to be the number of stars (b.stars), reviews (b.review_count) and then try to make separate models for categories and cities. That's the story of this data. 
                           
                  
iii. Output of your finished dataset:
         
+---------+------------------------+---------------------------------------------+------------------------+---------------+-------+--------------+
| is_open | id                     | name                                        |               category | city          | stars | review_count |
+---------+------------------------+---------------------------------------------+------------------------+---------------+-------+--------------+
|       1 | 38tScZkvRLoa5h-wNPyjkw | Scott Roofing Company                       |                   None | Phoenix       |   2.5 |           25 |
|       1 | 0JoJSub9w_KmONZrDzpFTg | Coach Chandler                              |            Accessories | Chandler      |   4.0 |            3 |
|       1 | 2vz3U82Sf8GgXppyjGSdbg | Oaks Golf Course                            |            Active Life | Cottage Grove |   4.5 |            5 |
|       1 | 1fQWV5PVyo6Gsu16KbotPQ | Toronto Acupuncture Studio                  |            Acupuncture | Toronto       |   4.5 |           16 |
|       0 | 2WfY9bow3Mv924gfDB8kqg | Restaurant Rosalie                          |         American (New) | Montréal      |   3.0 |           19 |
|       1 | 2skQeu3C36VCiB653MIfrw | Bootleggers Modern American Smokehouse      | American (Traditional) | Phoenix       |   4.0 |          431 |
|       1 | 32S_SP-ZaVmQucdEY5ynlQ | Bella Terra Condominiums At Paradise Valley |             Apartments | Scottsdale    |   2.0 |            4 |
|       1 | 16d3BlncEyCTzb0GxXrBXQ | Green Corner Restaurant                     |                Arabian | Mesa          |   5.0 |          267 |
|       1 | 0gWg-kqRLEQbhui8b_v2Xw | Hi Scores - Blue Diamond                    |                Arcades | Las Vegas     |   3.5 |          105 |
|       1 | -Ucy8i4uc_OzN8y5fkGVaQ | Taliesin West                               |             Architects | Scottsdale    |   4.5 |          223 |
|       1 | -Ucy8i4uc_OzN8y5fkGVaQ | Taliesin West                               |    Architectural Tours | Scottsdale    |   4.5 |          223 |
|       1 | 1UPbt3BRYU8FmvtEBTXJZQ | Dilworth Custom Framing                     |          Art Galleries | Charlotte     |   3.5 |            6 |
|       1 | 1UPbt3BRYU8FmvtEBTXJZQ | Dilworth Custom Framing                     |          Arts & Crafts | Charlotte     |   3.5 |            6 |
|       1 | 2yg6a9Ru6d1L33c_T53vkg | Cirque du Soleil - VOLTA                    |   Arts & Entertainment | Montréal      |   3.5 |           13 |
|       1 | 1ZnVfS-qP19upP_fwOhZsA | Big Wong Restaurant                         |           Asian Fusion | Las Vegas     |   4.0 |          768 |
|       1 | 2lUwUbSz5og2HyusNJ_UFQ | Xtreme Green Auto Detailing                 |         Auto Detailing | Charlotte     |   5.0 |           21 |
|       1 | 30bg35wKXbHvEwrkcxXSkw | Highland Auto Repair                        |            Auto Repair | Chandler      |   4.5 |           33 |
|       1 | 30bg35wKXbHvEwrkcxXSkw | Highland Auto Repair                        |             Automotive | Chandler      |   4.5 |           33 |
|       1 | -d9qyfNhLMQwVVg_raBKeg | What A Bagel                                |                 Bagels | York          |   3.0 |            8 |
|       1 | 2YmDZid3sYULrT60sRjuhA | Red Apron Bakeshop                          |               Bakeries | Chandler      |   5.0 |            5 |
|       1 | 2R0czAK1h2KuS-rINWiseg | Hsbc Bank Canada                            |  Banks & Credit Unions | Toronto       |   1.5 |            3 |
|       1 | 2skQeu3C36VCiB653MIfrw | Bootleggers Modern American Smokehouse      |               Barbeque | Phoenix       |   4.0 |          431 |
|       0 | 2WfY9bow3Mv924gfDB8kqg | Restaurant Rosalie                          |                   Bars | Montréal      |   3.0 |           19 |
|       1 | -Za5mjo-CYYUMsd1r8GC7Q | Ashbridges Bay Park                         |                Beaches | Toronto       |   3.5 |           29 |
|       1 | 2R_z-xwaSFjuRAEWKX0oDw | Gorgeous Glo                                |          Beauty & Spas | Charlotte     |   3.5 |           10 |
+---------+------------------------+---------------------------------------------+------------------------+---------------+-------+--------------+
(Output limit exceeded, 25 of 258 total rows shown)
         
iv. Provide the SQL code you used to create your final dataset: */

SELECT
    b.is_open,
    b.id,
    b.name,
    c.category,
    b.city,
    b.stars,
    b.review_count

FROM 
    business b

LEFT JOIN 
    category c ON b.id = c.business_id

GROUP BY 
    category
