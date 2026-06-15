SELECT
  match_id,
  fixture,
  ROUND(base_ticket_price) AS base_ticket_price
FROM Matches
WHERE tournament_category = 'Champions League' 
  AND match_status = 'Available';


SELECT
  user_id,
  full_name,
  email
FROM Users
WHERE full_name ILIKE 'Tanvir%'
  OR full_name ILIKE '%Haque%';


SELECT
  booking_id,
  user_id,
  match_id,
  COALESCE (payment_status,'Action Required') AS systematic_status
FROM Bookings
WHERE payment_status IS NULL;


SELECT
  b.booking_id,
  u.full_name,
  m.fixture,
  ROUND(b.total_cost) AS total_cost
FROM Bookings AS b
INNER JOIN Users AS u
  ON b.user_id = u.user_id
INNER JOIN Matches AS m
  ON b.match_id = m.match_id;


SELECT
  u.user_id,
  u.full_name,
  b.booking_id
FROM Users AS u
LEFT JOIN Bookings AS b
  ON u.user_id = b.user_id;


SELECT
  booking_id,
  match_id,
  ROUND(total_cost) AS total_cost
FROM Bookings
WHERE total_cost > (
    SELECT AVG(total_cost)
    FROM Bookings
);


SELECT
  match_id,
  fixture,
  ROUND(base_ticket_price) AS base_ticket_price
FROM Matches
ORDER BY base_ticket_price DESC
OFFSET 1
LIMIT 2;
