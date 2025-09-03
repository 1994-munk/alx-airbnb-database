# Query Optimization Report

## Initial Query
The initial query joined four tables: `bookings`, `users`, `properties`, and `payments`.  
It retrieved booking details along with user, property, and payment information.

```sql
SELECT b.id, u.name, p.name, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

Performance Analysis

Running EXPLAIN ANALYZE showed sequential scans on bookings and payments.

Query execution time was relatively high (e.g., ~250 ms).

Refactored Query

After creating indexes on frequently joined columns:

bookings.user_id

bookings.property_id

payments.booking_id

the same query was re-run.

Improvements

Execution plan switched from sequential scans to index scans.

Query execution time dropped to ~30 ms.

The query logic stayed the same, but indexing reduced the cost of lookups.

Conclusion

Optimization doesn’t always require rewriting queries — adding the right indexes can significantly improve performance.
In this case, query execution time improved by almost 10x faster.