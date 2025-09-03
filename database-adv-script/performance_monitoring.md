# Partitioning Performance Report

## 📌 Task: Partitioning Large Tables

### 🔹 Implementation
- Partitioned the **bookings** table by `start_date` using PostgreSQL **RANGE partitioning**.
- Created yearly partitions:
  - `bookings_2024` for all 2024 bookings.
  - `bookings_2025` for all 2025 bookings.

### 🔎 Performance Testing
Ran a query to fetch bookings in March 2025:

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';

📈 Observed Improvements

Before partitioning: Full table scan over the entire bookings dataset.

After partitioning: Partition pruning kicked in → only bookings_2025 was scanned.

Result: Faster query execution, lower cost, and less I/O

📝 Conclusion

Partitioning improved performance for date-range queries on large datasets by:

Restricting scans to relevant partitions.

Reducing query execution time significantly.

Making the database more scalable as data volume grows.
