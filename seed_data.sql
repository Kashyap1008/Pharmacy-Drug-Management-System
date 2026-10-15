USE drugdatabase;

-- Clear any existing test data cleanly
DELETE FROM orders;
DELETE FROM inventory;
DELETE FROM product;
DELETE FROM customer;
DELETE FROM seller;

-- 1. Insert Sellers (Vendors)
INSERT INTO seller (sid, sname, pass, address, phno) VALUES
('medplus', 'MedPlus Pharma', 'seller123', 'Plot 42, Tech Park, Bangalore', 9876543210),
('apollo_rx', 'Apollo Pharmacy', 'seller123', '12 MG Road, Mumbai', 9812345678),
('caremed', 'CareMed Distributors', 'seller123', '78 Ring Road, Delhi', 9765432109);

-- 2. Insert Customers
INSERT INTO customer (uid, pass, fname, lname, email, address, phno) VALUES
('kashyap_user', 'user123', 'Kashyap', 'Patel', 'kashyap@example.com', 'Flat 402, Sunshine Heights, Ahmedabad', 9825012345),
('rahul_sharma', 'user123', 'Rahul', 'Sharma', 'rahul.s@example.com', 'A-15, Green Park, New Delhi', 9811122233),
('priya_verma', 'user123', 'Priya', 'Verma', 'priya.v@example.com', 'Block C, Indiranagar, Bengaluru', 9988776655);

-- 3. Insert Products
INSERT INTO product (pid, pname, manufacturer, mfg, exp, price) VALUES
('P101', 'Paracetamol 650mg', 'Cipla Ltd', '2026-01-15', '2028-01-15', 30),
('P102', 'Amoxicillin 500mg', 'Sun Pharma', '2026-02-10', '2027-08-10', 85),
('P103', 'Cetirizine 10mg', 'Dr Reddys', '2026-03-01', '2028-03-01', 40),
('P104', 'Azithromycin 500mg', 'Zydus Cadila', '2026-01-20', '2027-07-20', 120),
('P105', 'Omeprazole 20mg', 'Torrent Pharma', '2026-02-25', '2028-02-25', 65),
('P106', 'Ibuprofen 400mg', 'Abbott India', '2026-03-12', '2028-03-12', 50),
('P107', 'Metformin 500mg', 'USV Ltd', '2026-02-01', '2027-12-31', 45),
('P108', 'Vitamin C 500mg', 'GSK Health', '2026-04-05', '2028-04-05', 25);

-- 4. Insert Inventory for Sellers
INSERT INTO inventory (pid, pname, quantity, sid) VALUES
('P101', 'Paracetamol 650mg', 150, 'medplus'),
('P102', 'Amoxicillin 500mg', 90, 'apollo_rx'),
('P103', 'Cetirizine 10mg', 200, 'medplus'),
('P104', 'Azithromycin 500mg', 75, 'apollo_rx'),
('P105', 'Omeprazole 20mg', 120, 'caremed'),
('P106', 'Ibuprofen 400mg', 80, 'caremed'),
('P107', 'Metformin 500mg', 110, 'medplus'),
('P108', 'Vitamin C 500mg', 250, 'apollo_rx');

-- 5. Insert Sample Orders
INSERT INTO orders (pid, sid, uid, orderdatetime, quantity, price) VALUES
('P101', 'medplus', 'kashyap_user', '2026-10-14 10:30:00', 5, 150),
('P104', 'apollo_rx', 'kashyap_user', '2026-10-15 14:15:00', 2, 240),
('P103', 'medplus', 'rahul_sharma', '2026-10-15 16:45:00', 3, 120),
('P105', 'caremed', 'priya_verma', '2026-10-15 18:20:00', 4, 260),
('P108', 'apollo_rx', 'priya_verma', '2026-10-15 19:10:00', 10, 250);
