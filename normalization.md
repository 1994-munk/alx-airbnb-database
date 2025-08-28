# Database Normalization for Airbnb Clone

## 1. First Normal Form (1NF)
- All attributes are atomic and contain only indivisible values.
- There are no repeating groups or arrays.
- ✅ Our schema satisfies 1NF.

## 2. Second Normal Form (2NF)
- All non-key attributes depend on the whole primary key.
- Since all our tables use single-column primary keys (UUIDs), there are no partial dependencies.
- ✅ Our schema satisfies 2NF.

## 3. Third Normal Form (3NF)
- There are no transitive dependencies: non-key attributes do not depend on other non-key attributes.
- All attributes depend only on their respective primary keys.
- The only consideration is `total_price` in the Booking table, which could be derived. However, storing it avoids inconsistencies if property prices change later. This is a business decision and does not violate 3NF.
- ✅ Our schema satisfies 3NF.

## Conclusion
The database design for the Airbnb clone is in **Third Normal Form (3NF)**.
This ensures minimal redundancy and avoids update anomalies, while still supporting required business use cases.
