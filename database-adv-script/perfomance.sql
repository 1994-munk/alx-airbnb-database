-- perfomance.sql
-- Task 4: Initial complex query + analysis + refactor (includes WHERE and AND)

----------------------------------------------------------------
-- PART A: INITIAL COMPLEX QUERY (BEFORE OPTIMIZATION)
----------------------------------------------------------------
-- This query retrieves bookings + user + property + payment details,
-- filtered to a realistic subset so it contains WHERE ... AND as required.
EXPLAIN ANALYZE
SELECT
    b.id           AS booking_id,
    b.start_date,
    b.end_date,
    u.id           AS user_id,
    u.name         AS user_name,
    u.email        AS user_email,
    p.id           AS property_id,
    p.name         AS property_name,
    pay.id         AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u      ON b.user_id     = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id          = pay.booking_id
WHERE b.start_date >= '2025-01-01'  -- filter by date
  AND pay.status = 'completed';     -- filter by payment status

----------------------------------------------------------------
-- PART B: REFACTOR / OPTIMIZED VERSION
----------------------------------------------------------------
-- Strategy:
-- 1) Push filters into CTEs to reduce rows early (less work for joins).
-- 2) Ensure joins remain on indexed FK/PK columns.
-- 3) Run EXPLAIN ANALYZE again to compare plans/timings.

EXPLAIN ANALYZE
WITH
  filtered_bookings AS (
    SELECT id, user_id, property_id, start_date, end_date
    FROM bookings
    WHERE start_date >= '2025-01-01'         -- early filter reduces scanned rows
  ),
  completed_payments AS (
    SELECT booking_id, id AS payment_id, amount
    FROM payments
    WHERE status = 'completed'               -- early filter reduces scanned rows
  )
SELECT
    fb.id           AS booking_id,
    fb.start_date,
    fb.end_date,
    u.id            AS user_id,
    u.name          AS user_name,
    u.email         AS user_email,
    p.id            AS property_id,
    p.name          AS property_name,
    cp.payment_id   AS payment_id,
    cp.amount
FROM filtered_bookings fb
JOIN users u       ON fb.user_id     = u.id          -- index: users.id / bookings.user_id
JOIN properties p  ON fb.property_id = p.id          -- index: properties.id / bookings.property_id
JOIN completed_payments cp ON fb.id  = cp.booking_id -- index: payments.booking_id
ORDER BY fb.start_date DESC;
