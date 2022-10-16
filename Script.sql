-- #1 - 2
select last_name
from actor 
where last_name like 'Wahlberg'

-- #2 - 3273
select count(amount) 
from payment
where amount >= 3.99 and amount <= 5.99

-- #3 - film_id - 200, count - 9
select film_id, count(film_id)
from inventory
group by film_id
having count(film_id) = (select max(a) from (select film_id, count(film_id) as a from inventory group by film_id) as b)

-- #4 - 0
select count(last_name)
from customer 
where last_name = 'William'

-- #5 staff_id - 1 count - 8040
select staff_id, count(rental_id)
from rental 
group by staff_id
having count(rental_id) = (select max(a) from (select staff_id, count(rental_id) as a from rental group by staff_id) as b)

-- #6 total districts - 378
select count(distinct district)
from address

-- #7 film_id - 508, actor count - 16
select film_id, count(actor_id)
from film_actor 
group by film_id 
having count(actor_id) = (select max(a) from (select film_id, count(actor_id) as a from film_actor group by film_id) as b)

-- #8 - 13
select count(*)
from customer
where last_name like '%es' and store_id = 1

-- #9 - 3
select sum(r)
from (select amount, count(distinct amount) as r from payment where customer_id between 380 and 430 group by amount having count(amount) > 250) as a

-- #10 5, PG-13
select count(distinct rating)
from film

select rating
from film 
group by rating 
order by count(rating) desc limit 1
