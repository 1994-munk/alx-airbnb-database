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
