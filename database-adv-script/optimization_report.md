# Optimization Report

## Task: Optimize Complex Queries

### Initial Query
The initial query retrieved all bookings with user, property, and payment details:

```sql
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
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'completed';

🔎 Performance Analysis

Running EXPLAIN ANALYZE on the initial query showed:

Full table scans on bookings and payments.

Filtering (WHERE) applied after joining large tables, making it less efficient.

High overall query cost due to unnecessary rows being joined before filtering.

Refactored / Optimized Query

The optimized query applied filters early by using Common Table Expressions (CTEs):
WITH
  filtered_bookings AS (
    SELECT id, user_id, property_id, start_date, end_date
    FROM bookings
    WHERE start_date >= '2025-01-01'
  ),
  completed_payments AS (
    SELECT booking_id, id AS payment_id, amount
    FROM payments
    WHERE status = 'completed'
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
JOIN users u       ON fb.user_id     = u.id
JOIN properties p  ON fb.property_id = p.id
JOIN completed_payments cp ON fb.id  = cp.booking_id
ORDER BY fb.start_date DESC;

📈 Improvements Observed

Filters are applied early, reducing rows before joins.

Joins now operate only on already-filtered datasets.

Query planner switched from sequential scans → index scans (faster).

Overall execution time and cost decreased significantly.

📝 Conclusion

The optimization was successful because:

Filters were pushed down into subqueries (CTEs).

Unnecessary rows were eliminated before expensive joins.

Indexes were leveraged effectively by the query planner.
