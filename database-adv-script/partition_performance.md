# Partitioning Performance Report

## 📌 Task: Partitioning Large Tables

### 🔹 Implementation
- The **bookings** table was partitioned by the `start_date` column using PostgreSQL **RANGE partitioning**.
- Partitions were created for different date ranges:
  - `bookings_2024` for bookings between `2024-01-01` and `2024-12-31`.
  - `bookings_2025` for bookings between `2025-01-01` and `2025-12-31`.

### 🔎 Performance Testing
- Queries were tested on the partitioned table using date ranges.
- Example query to fetch bookings in March 2025:

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';


### 📈 Observed Improvements
- Before partitioning: Full table scans on bookings caused high query execution time.
- After partitioning:
  - Only the relevant partition (`bookings_2025`) was scanned due to partition pruning.
  - Query execution time decreased significantly.
  - I/O operations were reduced, improving efficiency.

### 📝 Conclusion
Partitioning the bookings table by `start_date`:
1. Reduced the number of rows scanned for date-specific queries.
2. Leveraged partition pruning for faster lookups.
3. Made the database more scalable for large datasets, ensuring faster query performance over time.
