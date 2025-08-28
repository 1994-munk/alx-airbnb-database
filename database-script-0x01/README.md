# Airbnb Clone Database Schema

This directory contains the SQL schema for the Airbnb clone project.

## Files
- **schema.sql**: Defines the database schema using `CREATE TABLE` statements, constraints, and indexes.

## Schema Overview
- **Users**: Stores user details (guest, host, admin).
- **Properties**: Listings created by hosts.
- **Bookings**: Reservations made by users for properties.
- **Payments**: Payment information linked to bookings.
- **Reviews**: Feedback and ratings from users about properties.
- **Messages**: Private messages exchanged between users.

## Constraints and Indexes
- Primary keys are UUIDs (generated automatically).
- Foreign key constraints enforce relationships between tables.
- Unique constraint on `users.email`.
- Check constraints for valid ENUM-like fields (role, status, payment_method, rating).
- Indexes added for email, foreign keys (property_id, booking_id, user_id) for performance optimization.
