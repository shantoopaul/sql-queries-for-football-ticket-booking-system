# Football Ticket Booking System

A PostgreSQL database project that simulates a simple football ticket booking platform. The project demonstrates database design principles, data integrity through constraints, sample data seeding, and SQL querying techniques used to retrieve and analyze booking information.

## Project Overview

This project implements a relational database for managing football ticket bookings. It consists of three interconnected tables:

- **Users** – Stores information about customers (Football Fan) and administrative staff (Ticket Manager).
- **Matches** – Stores football match details and ticket information.
- **Bookings** – Stores ticket purchase transactions made by users.

The SQL script creates the database schema, applies constraints to maintain data integrity, inserts sample records, and provides example queries for common reporting scenarios.

---

## Features

- Relational database design using PostgreSQL
- Primary key and foreign key relationships
- Data validation using `CHECK` constraints
- Unique email enforcement
- Sample data insertion for testing
- SQL queries demonstrating filtering, joins, subqueries, null handling, and pagination

---

## Database Schema

### Users Table

Stores information about registered users of the system.

| Column         | Data Type    | Description          |
| -------------- | ------------ | -------------------- |
| `user_id`      | SERIAL       | Primary key          |
| `full_name`    | VARCHAR(100) | User's full name     |
| `email`        | VARCHAR(254) | Unique email address |
| `role`         | VARCHAR(14)  | User role            |
| `phone_number` | VARCHAR(15)  | Contact number       |

#### Constraints

- Primary Key: `user_id`
- Unique Constraint: `email`
- Allowed roles:
  - `Ticket Manager`
  - `Football Fan`

---

### Matches Table

Stores information about football matches.

| Column                | Data Type     | Description                 |
| --------------------- | ------------- | --------------------------- |
| `match_id`            | SERIAL        | Primary key                 |
| `fixture`             | VARCHAR(100)  | Competing teams             |
| `tournament_category` | VARCHAR(20)   | Tournament name             |
| `base_ticket_price`   | NUMERIC(10,2) | Ticket price                |
| `match_status`        | VARCHAR(12)   | Current availability status |

#### Constraints

- Primary Key: `match_id`
- Ticket price cannot be negative.
- Allowed match statuses:
  - `Available`
  - `Selling Fast`
  - `Sold Out`
  - `Postponed`

---

### Bookings Table

Stores ticket booking transactions.

| Column           | Data Type     | Description        |
| ---------------- | ------------- | ------------------ |
| `booking_id`     | SERIAL        | Primary key        |
| `user_id`        | INT           | References Users   |
| `match_id`       | INT           | References Matches |
| `seat_number`    | VARCHAR(10)   | Allocated seat     |
| `payment_status` | VARCHAR(10)   | Payment state      |
| `total_cost`     | NUMERIC(10,2) | Final booking cost |

#### Constraints

- Primary Key: `booking_id`
- Foreign Key: `user_id → Users(user_id)`
- Foreign Key: `match_id → Matches(match_id)`
- Total cost cannot be negative.
- Allowed payment statuses:
  - `Pending`
  - `Confirmed`
  - `Cancelled`
  - `Refunded`

---

## Relationships

The database establishes the following relationships:

### Users → Bookings

One user can have multiple bookings.

```
Users (1) ───────< Bookings (Many)
```

### Matches → Bookings

One match can have multiple bookings.

```
Matches (1) ───────< Bookings (Many)
```

---

## Sample Data

The SQL script includes sample records for:

- 4 users
- 5 football matches
- 5 booking transactions

These records allow all queries to be executed immediately after setup.

---

## Implemented SQL Queries

### Query 1

Retrieve all available Champions League matches.

#### Concepts Used

- `WHERE`

---

### Query 2

Search users whose names:

- Start with `"Tanvir"`
- Contain `"Haque"` (case-insensitive)

#### Concepts Used

- `ILIKE`

---

### Query 3

Find bookings with missing payment status and replace null values with a readable message.

#### Concepts Used

- `IS NULL`
- `COALESCE`

---

### Query 4

Retrieve booking details together with user names and match fixtures.

#### Concepts Used

- `INNER JOIN`

---

### Query 5

Display all users and their booking IDs, including users who have never booked tickets.

#### Concepts Used

- `LEFT JOIN`

---

### Query 6

Find bookings whose total cost exceeds the average booking cost.

#### Concepts Used

- Subqueries
- Aggregate functions
- `AVG`

---

### Query 7

Retrieve the next two most expensive matches while skipping the highest-priced match.

#### Concepts Used

- `ORDER BY`
- `OFFSET`
- `LIMIT`

---

## Getting Started

### Prerequisites

- PostgreSQL installed on your system
- A PostgreSQL client such as:
  - pgAdmin
  - psql
  - BeeKeeper Studio

---

### Running the Project

1. Clone the repository.

```bash
git clone https://github.com/shantoopaul/sql-queries-for-football-ticket-booking-system.git
```

2. Open PostgreSQL.

3. Execute the SQL script:

```sql
QUERY.sql
```

4. The script will:

- Create the database tables
- Apply constraints
- Insert sample data
- Execute all example queries

---

## Learning Outcomes

Through this project, the following SQL concepts were practiced:

- Database schema design
- Primary and foreign keys
- Referential integrity
- Constraints and validation
- Data seeding
- Filtering records
- Case-insensitive searching
- Null handling
- Table joins
- Subqueries
- Aggregate functions
- Pagination techniques
