USE Labs;
-- 1. Which are the different genres?
SELECT DISTINCT prime_genre
FROM applestore2;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, rating_count_tot,COUNT(*) AS total_genre_rated
FROM applestore2
WHERE rating_count_tot>0
GROUP BY prime_genre,rating_count_tot
ORDER BY total_genre_rated DESC
LIMIT 1;

/* Games are the genre with the most rated apps, with a total of 71 apps rated.*/

-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(*) AS total_genre
FROM applestore2
GROUP BY prime_genre
ORDER BY total_genre DESC;
-- Games is the genre with more apps


-- 4. Which is the one with less?
SELECT prime_genre, COUNT(*) AS total_genre
FROM applestore2
GROUP BY prime_genre
ORDER BY total_genre ASC;
-- Catalogs is the genre with less apps

--  5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;


-- 6. Take the 10 apps best rated by users.

SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

SELECT *
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/*
All the apps are free;
There are multiple versions of each app;
Most of them are highly popular;
All of these apps are designed for use by kids, with a minimum age requirement of 12 years old for downloading.
*/


-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

SELECT *
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

/* 
All the apps are free;
Most of them have a very low number of ratings.
The apps are in very primitive versions due to the low number of updates.
All of these apps are designed for use by kids, with a minimum age requirement of 9 years old for downloading 
*/


-- 9. Now compare the data from questions 5 and 6. What do you see?
/* 
The data from Q6 shows significant differences compared to Q5. 
In Q6, the apps are highly popular, with a substantial number of ratings and multiple versions. 
On the contrary, the Q5 data indicates a low number of ratings, and the apps are less developed, as evidenced by the limited number of versions. 
The common factor between them is that they are both free.
*/


-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, rating_count_tot, price
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 20;
/* In a top 20 list of apps with hight number of votes, only 3 apps are paid.
*/

SELECT track_name, user_rating, rating_count_tot, price
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 20;
/* In a top 20 list of apps with both high user ratings and a significant number of votes, only 5 apps are paid.
*/

SELECT track_name, user_rating, price
FROM applestore2
ORDER BY user_rating DESC
LIMIT 20;

SELECT AVG(user_rating)
FROM applestore2;
/* Find a mean of user rating*/

SELECT AVG(rating_count_tot)
FROM applestore2;
/* Find a mean of total user rating*/

SELECT track_name, user_rating, rating_count_tot, ver, cont_rating,MAX(price) AS max_price
FROM applestore2
GROUP BY track_name, user_rating, rating_count_tot, ver, cont_rating
ORDER BY max_price DESC;
/* I made this query to understand if the higher price of apps would influence user ratings, considering that users, when paying for apps, expect higher quality.
However, what I found was that more expensive apps have a user rating above the average value; nevertheless, they also present a total rating value below the average value by users.
*/

/* In conclusion, in my opinion and after analyzing the data, people do indeed care about the price, as evidenced by the fact that apps with the highest number of rating votes are free apps.
With this, I conclude that free apps are more appealing to people who seek to rate them as a way of giving back for the work developed.*/