# Database Seeding - AirBnB Clone

This directory contains SQL scripts to insert sample data into the database.

## Files
- `seed.sql` → Inserts sample data for all entities (Users, Properties, Bookings, Payments, Reviews, Messages).

## Instructions
1. Ensure you have already created the database schema by running the `schema.sql` file.
2. Run the following command in your SQL environment:
   ```bash
   mysql -u your_user -p airbnb_database < seed.sql
