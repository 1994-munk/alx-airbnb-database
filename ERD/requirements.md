```mermaid
erDiagram
    USER {
        UUID user_id PK
        VARCHAR first_name
    }
    PROPERTY {
        UUID property_id PK
    }
    USER ||--o{ PROPERTY : "owns"
