# Database Design & SQL Queries

A simple vehicle rental system database, built using PostgreSQL and Beekeeper Studio.

## Entity Relationship Diagram (ERD)

This section outlines the overall ERD of the relational tables in the system. The ERD shows relation between the following tables:

- Users
- Vehicles
- Bookings

The full public version of the ERD can be found [here](https://drawsql.app/teams/webdev-35/diagrams/vehicle-rental-system).

## SQL Queries

The vehicle rental system is setup using the following useful queries

- which can be reused to simulate the system and
- test out the queries in [queries.sql](queries.sql):

### Creating Database & Tables

```sql
create database vehiclerental;

create table users (
  user_id serial primary key,
  name varchar(150),
  email varchar(150) unique,
  password varchar(150),
  phone varchar(20),
  role varchar(50) check(role in ('Admin', 'Customer'))
);

create table vehicles (
  vehicle_id serial primary key,
  name varchar(150),
  type varchar(50) check(type in ('car', 'bike', 'truck')),
  model int,
  registration_number varchar(150) unique,
  rental_price int,
  status varchar(50) check(status in ('available', 'rented', 'maintenance'))
);

create table bookings (
  booking_id serial primary key,
  user_id int references users(user_id),
  vehicle_id int references vehicles(vehicle_id),
  start_date date,
  end_date date,
  status varchar(50) check(status in ('pending', 'confirmed', 'completed', 'cancelled')),
  total_cost int
);
```

### Inserting Data

```sql
insert into users (name, email, phone, role)
values
  ('Alice', 'alice@example.com', '1234567890', 'Customer'),
  ('Bob', 'bob@example.com', '0987654321', 'Admin'),
  ('Charlie', 'charlie@example.com', '1122334455', 'Customer');

insert into vehicles (name, type, model, registration_number, rental_price, status)
values
  ('Toyota Corolla', 'car', 2022, 'ABC-123', 50, 'available'),
  ('Honda Civic', 'car', 2021, 'DEF-456', 60, 'rented'),
  ('Yamaha R15', 'bike', 2023, 'GHI-789', 30, 'available'),
  ('Ford F-150', 'truck', 2020, 'JKL-012', 100, 'maintenance');

insert into bookings (user_id, vehicle_id, start_date, end_date, status, total_cost)
values
  (1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
  (1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
  (3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
  (1, 1, '2023-12-10', '2023-12-12', 'pending', 100);
```

## Theoretical Discussions

This section poses some theoretical questions regarding database design & SQL queries which will be discussed in video format.

#### Question 1

What is a foreign key and why is it important in relational databases?

#### Question 2

What is the difference between WHERE and HAVING clauses in SQL?

#### Question 3

What is a primary key and what are its characteristics?

#### Question 4

What is the difference between INNER JOIN and LEFT JOIN in SQL?
