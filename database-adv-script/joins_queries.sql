-- INNER JOIN: Get all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.user_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- LEFT JOIN: Get all properties and their reviews, including properties without reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- FULL OUTER JOIN: Get all users and all bookings, even if user has no booking or booking not linked to a user
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;
