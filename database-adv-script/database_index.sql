-- Create index on users.id (used in JOINs)
CREATE INDEX idx_users_id ON users(id);

-- Create index on bookings.user_id (used in JOINs with users)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on properties.id (used in JOINs)
CREATE INDEX idx_properties_id ON properties(id);

-- Create index on bookings.property_id (used in JOINs with properties)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Optional: Create index on bookings.id if used in ORDER BY or frequent lookups
CREATE INDEX idx_bookings_id ON bookings(id);

-- Measure query performance before/after indexes
EXPLAIN ANALYZE
SELECT u.id, u.name, COUNT(b.id)
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

EXPLAIN ANALYZE
SELECT p.id, p.name, COUNT(b.id)
FROM properties p
JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;
