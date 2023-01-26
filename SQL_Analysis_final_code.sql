-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select cf_id, backers_count from campaign
where outcome = 'live'
order by backers_count DESC


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select cf_id, Count(cf_id) from backers
group by cf_id
order by Count(cf_id) DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select 
	c.first_name, 
	c.last_name, 
	c.email,
	cam.goal - cam.pledged AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
From campaign as cam
Join contacts as c
ON c.contact_id=cam.contact_id
where cam.outcome = 'live'
order by "Remaining Goal Amount" DESC



-- Check the table
Select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
Select 
	b.email,
	b.first_name, 
	b.last_name, 
	b.cf_id,
	c.company_name,
	c.description,
	c.end_datedate AS "end_date",
	c.goal - c.pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
From campaign as c
Join backers as b
ON b.cf_id=c.cf_id
where c.outcome = 'live'
order by b.email 

--(to match the image in the  module instructions, we would order by last name, but the module instructions said
-- "that contains the email addresses of the backers in descending order, the first and the last name of each backer, the cf_id, the company name, the description, the end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal".")


-- Check the table
select * from email_backers_remaining_goal_amount

