-- Drop existing table if needed (for demo purposes)
-- DROP TABLE IF EXISTS bookings;

-- 1. Create a partitioned bookings table based on start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions (example: by year)
CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Example query to test performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-03-01' AND '2025-03-31';
