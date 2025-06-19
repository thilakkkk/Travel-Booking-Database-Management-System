# 🧳 Travel Booking Database Management System

## 📖 Description

This project provides a complete **database backend** for a travel booking website. It is designed to manage customer data, trip details, hotel and cab bookings, and information about tourist destinations.

The system automates **cost calculations** by integrating various travel services into a cohesive, normalized relational database. All relations are normalized to **Boyce-Codd Normal Form (BCNF)** to reduce redundancy and ensure data integrity.

---

## ✨ Features

- **Customer & Booking Management**  
  Manages customer information and their travel bookings.

- **Service Integration**  
  Handles data for travel agencies, hotels, and cab services.

- **Dynamic Cost Calculation**  
  Automatically calculates and updates trip expenses based on accommodation and travel charges.

- **Tourist Information**  
  Stores details about tourist spots at various destinations.

- **Normalized Schema**  
  Utilizes a BCNF schema to ensure data integrity and minimize redundancy.

- **SQL-Based**  
  Implemented using standard SQL and compatible across various relational database systems (RDBMS).

---

## 🧩 ER Diagram Description

The database design consists of the following **entities** and **relationships**:

- **Customer**  
  A central entity storing user details. A customer can have multiple bookings.

- **Travel_Website**  
  Represents a booking made by a customer.

- **Cab_Services**  
  Linked to a customer, representing cab bookings for trips.

- **Travel_Agency**  
  Manages transportation details (e.g., flights, trains) for each booking.

- **Hotel_Site**  
  Represents the hotel stay information associated with each booking.

- **Hotel1 & Hotel2**  
  Decomposed from a single Hotel entity to achieve BCNF. These store hotel details like name, address, rating, room count, and pricing.

- **Tourist_Places**  
  Stores information about various tourist attractions.

---

## 🗃️ Database Schema

The database consists of the following **8 tables**:

1. `customer`  
2. `travel_website`  
3. `cab_services`  
4. `tourist_places`  
5. `travel_agency`  
6. `hotel_site`  
7. `hotel1`  
8. `hotel2`

The SQL `CREATE TABLE` statements, `INSERT` statements, and `UPDATE` logic are located in the [`database_setup.sql`](./database_setup.sql) file.

---

## 🔄 Normalization (BCNF)

The schema is fully normalized to **Boyce-Codd Normal Form (BCNF)**.

During the design process:
- Initial tables were evaluated for functional dependencies.
- The original `Hotel` table had transitive dependencies (1NF).
- It was **decomposed** into `hotel1` and `hotel2` to satisfy BCNF.

This decomposition is **lossless**, ensuring that for every non-trivial functional dependency `X → Y`, `X` is a superkey — fulfilling BCNF conditions.

---

## ⚙️ How to Use

### 📁 1. Save the Code
Save the SQL file as:  
`database_setup.sql`

### 🛠️ 2. Choose a SQL Client
Use any preferred database client:
- **Oracle SQL Developer**
- **MySQL Workbench**
- **DBeaver**
- **pgAdmin**
- Any other RDBMS-compatible SQL interface

### ▶️ 3. Execute the Script
Run the full SQL script:
- Creates all 8 tables
- Inserts initial sample data
- Performs `UPDATE` statements to calculate:
  - Trip expenses
  - Cab capacities
  - Accommodation charges

### ✅ 4. Verify Data
Use:
```sql
SELECT * FROM <table_name>;




