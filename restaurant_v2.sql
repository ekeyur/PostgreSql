create table restaurant (
	id serial primary key,
	name varchar,
	address varchar,
	category varchar
);

create table reviewer (
	id serial primary key,
	name varchar,
	email varchar,
	karma integer check (karma between 0 and 7)
);

create table review (
	id serial primary key,
	reviewer_id integer references reviewer (id),
	stars real check (stars between 1 and 5),
	title varchar,
	review varchar,
	restaurant_id integer references restaurant (id)
);

--------------------

1.
SELECT review,restaurant.name FROM review INNER JOIN restaurant on restaurant_id = restaurant.id order by restaurant_id;

2.
SELECT review,reviewer.name FROM review INNER JOIN reviewer on reviewer_id = reviewer.id order by reviewer.id;

3.
SELECT restaurant.name, review FROM review LEFT OUTER JOIN restaurant on restaurant_id = restaurant.id order by restaurant_id;

4.
SELECT restaurant.name, avg(stars) FROM review LEFT OUTER JOIN restaurant on restaurant_id = restaurant.id group by restaurant.name;

5.
SELECT restaurant.name, count(review) FROM review RIGHT OUTER JOIN restaurant on restaurant_id = restaurant.id group by restaurant.name;

6.
SELECT restaurant.name, review, reviewer.name FROM review INNER JOIN restaurant on restaurant_id = restaurant.id INNER JOIN reviewer ON review.reviewer_id = reviewer.id;

7.
SELECT reviewer.name, avg(stars) from review inner join reviewer on reviewer_id = reviewer.id GROUP BY reviewer.name;

8.
SELECT reviewer.name, min(stars) from review inner join reviewer on reviewer_id = reviewer.id GROUP BY reviewer.name;

9.
SELECT category,count(name) FROM restaurant GROUP BY category;

10.
SELECT restaurant.name, count(review.stars) from restaurant inner join review on restaurant.id = restaurant_id where review.stars = 5 GROUP BY restaurant.name;

11.
SELECT restaurant.category, avg(review.stars) from restaurant inner join review on restaurant.id = restaurant_id GROUP BY restaurant.category
