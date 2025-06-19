-- -----------------------------------------------------
-- Table Creation (DDL)
-- -----------------------------------------------------

CREATE TABLE customer (
    c_name VARCHAR(20),
    start_date DATE,
    return_date DATE,
    travellers INT,
    sourcee VARCHAR(20),
    destination VARCHAR(20),
    phone_no DECIMAL(10),
    card_no DECIMAL(20),
    trip_expenses INT DEFAULT 0,
    PRIMARY KEY(phone_no)
);

CREATE TABLE travel_website (
    booking_id INT,
    costt INT,
    start_mode VARCHAR(20),
    return_mode VARCHAR(20),
    phone_no DECIMAL(10),
    FOREIGN KEY (phone_no) REFERENCES customer(phone_no),
    PRIMARY KEY (booking_id)
);

CREATE TABLE cab_services (
    capacityy INT,
    phone_no DECIMAL(10),
    cab_no INT,
    FOREIGN KEY(phone_no) REFERENCES customer(phone_no),
    PRIMARY KEY (phone_no, cab_no)
);

CREATE TABLE tourist_places (
    spot_name NVARCHAR(100),
    spot_address NVARCHAR(100),
    specialty NVARCHAR(100),
    destination NVARCHAR(20),
    restaurent_name NVARCHAR(30),
    rating FLOAT,
    PRIMARY KEY (spot_name, spot_address)
);

CREATE TABLE travel_agency (
    start_vno INT,
    return_vno INT,
    start_sno INT,
    return_sno INT,
    travelling_charges INT,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES travel_website(booking_id),
    PRIMARY KEY (booking_id)
);

CREATE TABLE hotel_site (
    stay_place VARCHAR(20),
    no_of_travellers NUMBER,
    accomodation_charges NUMBER,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES travel_website(booking_id),
    PRIMARY KEY (booking_id, stay_place)
);

CREATE TABLE hotel1 (
    no_of_rooms NUMBER,
    stay_place VARCHAR(20),
    booking_id INT,
    FOREIGN KEY (stay_place, booking_id) REFERENCES hotel_site(stay_place, booking_id),
    PRIMARY KEY (booking_id)
);

CREATE TABLE hotel2 (
    namee VARCHAR(50),
    address VARCHAR(100),
    rating NUMBER,
    roomrent NUMBER,
    booking_id INT,
    FOREIGN KEY (booking_id) REFERENCES hotel1(booking_id),
    PRIMARY KEY(booking_id)
);

-- -----------------------------------------------------
-- Data Insertion (DML)
-- -----------------------------------------------------

INSERT INTO customer VALUES ('mahesh babu', '18-apr-21', '27-apr-21', 3, 'HYDERABAD', 'MANALI', 9883746478, 8473781277445463, 0);
INSERT INTO customer VALUES ('vijay', '28-apr-21', '12-may-21', 4, 'CHENNAI', 'OOTY', 9886834478, 6376474746467383, 0);
INSERT INTO customer VALUES ('rajinikanth', '8-apr-21', '17-apr-21', 5, 'CHENNAI', 'SHIMLA', 9799765431, 7865435678965432, 0);
INSERT INTO customer VALUES ('balayya', '11-apr-21', '01-may-21', 6, 'HYDERABAD', 'KASHMIR', 9765437546, 8736456251890123, 0);
INSERT INTO customer VALUES ('pawan kalyan', '18-AUG-21', '27-AUG-21', 4, 'BENGALURU', 'DELHI', 9345984592, 4448174040235238, 0);
INSERT INTO customer VALUES ('ntr', '15-DEC-21', '26-DEC-21', 5, 'DELHI', 'GOA', 9847298479, 7438274287482734, 0);
INSERT INTO customer VALUES ('ram charan', '20-OCT-21', '15-NOV-21', 9, 'DELHI', 'MANALI', 9842897324, 8744832347922832, 0);
INSERT INTO customer VALUES ('samantha', '12-jun-08', '21-jun-08', 5, 'HYDERABAD', 'VIZAG', 8688102828, 123456789121213, 0);
INSERT INTO customer VALUES ('kajal', '21-jan-10', '29-jan-10', 5, 'MUMBAI', 'BENGALURU', 9878102826, 784556789121214, 0);
INSERT INTO customer VALUES ('tamanna', '10-dec-21', '19-dec-21', 5, 'MUMBAI', 'CHENNAI', 6878202827, 891556789121345, 0);

INSERT INTO travel_website VALUES(65574567, 0, 'FLIGHT', 'TRAIN', 9883746478);
INSERT INTO travel_website VALUES(87654356, 0, 'FLIGHT', 'BUS', 9886834478);
INSERT INTO travel_website VALUES(87655677, 0, 'FLIGHT', 'TRAIN', 9799765431);
INSERT INTO travel_website VALUES(76876577, 0, 'FLIGHT', 'FLIGHT', 9765437546);
INSERT INTO travel_website VALUES(73278361, 0, 'BUS', 'TRAIN', 9345984592);
INSERT INTO travel_website VALUES(74326486, 0, 'FLIGHT', 'TRAIN', 9847298479);
INSERT INTO travel_website VALUES(37612898, 0, 'TRAIN', 'FLIGHT', 9842897324);
INSERT INTO travel_website VALUES(22331456, 0, 'train', 'bus', 9878102826);
INSERT INTO travel_website VALUES(97331452, 0, 'flight', 'train', 8688102828);
INSERT INTO travel_website VALUES(32331457, 0, 'train', 'flight', 6878202827);

INSERT INTO cab_services VALUES (0, 9883746478, 1480);
INSERT INTO cab_services VALUES (0, 9886834478, 6130);
INSERT INTO cab_services VALUES (0, 9799765431, 6260);
INSERT INTO cab_services VALUES (0, 9765437546, 7889);
INSERT INTO cab_services VALUES (0, 9345984592, 2537);
INSERT INTO cab_services VALUES (0, 9847298479, 7464);
INSERT INTO cab_services VALUES (0, 9842897324, 3432);
INSERT INTO cab_services VALUES (0, 8688102828, 1265);
INSERT INTO cab_services VALUES (0, 9878102826, 7462);
INSERT INTO cab_services VALUES (0, 6878202827, 5637);

INSERT INTO tourist_places VALUES('Hawa Ghar', 'Ridge, Shimla', 'Elevated pavilion offering vistas', 'SHIMLA', 'apple', 3);
INSERT INTO tourist_places VALUES('Chadwick Falls', 'Shimla, Himachal Pradhesh', 'waterfall in a dense forest', 'SHIMLA', 'blue mango', 4);
INSERT INTO tourist_places VALUES('Scandal Point', 'Mall Rd, Shimla', 'Great views of the Himalayas', 'SHIMLA', 'green hard', 4.2);
INSERT INTO tourist_places VALUES ('Khilanmarg', 'Gulmarg, Jammu and Kashmir', 'carpeted with flowers', 'KASHMIR', 'whale', 3.8);
INSERT INTO tourist_places VALUES('Thaj glacier', 'Forest Block, Jammu', 'scenic golf course', 'KASHMIR', 'andi', 3.4);
INSERT INTO tourist_places VALUES ('Shiv Khori', 'near hayat, Jammu', 'Miracle of God', 'KASHMIR', 'boleraj', 4.1);
INSERT INTO tourist_places VALUES ('Dolhins nose', 'Cannoor, Ooty', 'Catherine Waterfalls', 'OOTY', 'udipi', 4.2);
INSERT INTO tourist_places VALUES('Ooty Boat House', 'North Lake Road, ooty', 'boating', 'OOTY', 'thard', 4.5);
INSERT INTO tourist_places VALUES('Tiger Hill', 'Ooty, Tamil Nadu', 'panoramic view of Mount Everest', 'OOTY', 'nanged', 4.1);
INSERT INTO tourist_places VALUES('Humayan tomb', 'Mathura road, New Delhi', 'tomb of famous Mughal Emperor', 'DELHI', 'khauj', 4);
INSERT INTO tourist_places VALUES('Bahai Temple', 'Bahapur, Kalkaji', 'Famous for architecture', 'DELHI', 'Barbeque', 4.6);
INSERT INTO tourist_places VALUES('Gardenofsenses', 'South of Saket, New Delhi', 'Famous for Nature Beauty', 'DELHI', 'Mandi', 4.8);
INSERT INTO tourist_places VALUES('Baga Beach', 'Saunto, Goa', 'famous for parasailing', 'GOA', 'Udipi restaurant', 3.5);
INSERT INTO tourist_places VALUES ('Calangu Beach', 'North Goa', 'Coastal road with dining, lodging', 'GOA', 'Feliz', 3.5);
INSERT INTO tourist_places VALUES ('Dudhsagar Falls', 'Sonalium, Goa', 'famoous for adventrous trek', 'GOA', 'Rio Salao', 3.5);
INSERT INTO tourist_places VALUES('Solang Valley', 'Burwa, Manali', 'snow-capped mountains', 'MANALI', 'Renaissance', 3.5);
INSERT INTO tourist_places VALUES('Jogini Waterfalls', 'Vashist Village, Manali', 'Shakti peeth', 'MANALI', 'John Cafe', 3.5);
INSERT INTO tourist_places VALUES('Manali Gompa', 'Old Manali Road', 'roof built in pagoda style', 'MANALI', 'Drift Inn', 3.5);
INSERT INTO tourist_places VALUES('Aruku valley', 'aruku, Vizag', 'hill station', 'VIZAG', 'vashistha', 3.9);
INSERT INTO tourist_places VALUES ('Rishikonda beach', 'Bheemili road, Vizag', 'beach with golden and black sand', 'VIZAG', 'Bake hotel', 4.3);
INSERT INTO tourist_places VALUES('Tenneti Park', 'Beach Road, Vizag', 'childrens park', 'VIZAG', 'Treebo Trend', 4.6);
INSERT INTO tourist_places VALUES('Nandi hills', 'Chikkaballapur, Banglore', 'ancient hill fortification', 'BENGALURU', 'Leela palace', 4.1);
INSERT INTO tourist_places VALUES ('Banglore palace', 'Vasanth Nagar, Banglore', 'stylish archutecture towers', 'BENGALURU', 'haveli', 4.4);
INSERT INTO tourist_places VALUES('Thottikallu Falls', 'Kanakapura Rd, Banglore', 'golden faced water falls', 'BENGALURU', 'Rasisson', 4.7);
INSERT INTO tourist_places VALUES('Chennai Lighthouse', 'Marina beach road, Myykapore', 'facing bay of bengal on east coast', 'CHENNAI', 'cafe hotel', 4.5);
INSERT INTO tourist_places VALUES ('Semmozhi Poonga', 'Cathedra Rd, Teynampet', 'botanical garden', 'CHENNAI', 'Grand Chola', 4.0);
INSERT INTO tourist_places VALUES('Anna Nagar', 'Anna Nagar, Chennai', 'first and only township in chennai', 'CHENNAI', 'Hilton chennai', 4.2);

INSERT INTO travel_agency VALUES (1737, 3636, 727, 636, 25000, 65574567);
INSERT INTO travel_agency VALUES (7272, 6262, 535, 626, 24250, 87654356);
INSERT INTO travel_agency VALUES (9020, 9276, 244, 398, 20000, 87655677);
INSERT INTO travel_agency VALUES (7265, 5252, 189, 298, 50000, 76876577);
INSERT INTO travel_agency VALUES (2376, 2839, 234, 578, 30000, 73278361);
INSERT INTO travel_agency VALUES (1238, 2489, 452, 700, 45000, 74326486);
INSERT INTO travel_agency VALUES (3864, 3498, 387, 498, 50000, 37612898);
INSERT INTO travel_agency VALUES (8765, 2345, 451, 278, 30000, 22331456);
INSERT INTO travel_agency VALUES (6417, 4358, 257, 753, 48000, 97331452);
INSERT INTO travel_agency VALUES (2561, 3475, 761, 247, 45000, 32331457);

INSERT INTO hotel_site VALUES('NULL', 0, 0, 65574567);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 87654356);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 87655677);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 76876577);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 73278361);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 74326486);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 37612898);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 22331456);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 97331452);
INSERT INTO hotel_site VALUES('NULL', 0, 0, 32331457);

INSERT INTO hotel1 VALUES (NULL, NULL, 65574567);
INSERT INTO hotel1 VALUES (NULL, NULL, 87654356);
INSERT INTO hotel1 VALUES (NULL, NULL, 87655677);
INSERT INTO hotel1 VALUES (NULL, NULL, 76876577);
INSERT INTO hotel1 VALUES (NULL, NULL, 73278361);
INSERT INTO hotel1 VALUES (NULL, NULL, 74326486);
INSERT INTO hotel1 VALUES (NULL, NULL, 37612898);
INSERT INTO hotel1 VALUES (NULL, NULL, 22331456);
INSERT INTO hotel1 VALUES (NULL, NULL, 97331452);
INSERT INTO hotel1 VALUES (NULL, NULL, 32331457);

INSERT INTO hotel2 VALUES ('rayal villas', 'Manali, Himachal Pradesh', 3.5, 6000, 65574567);
INSERT INTO hotel2 VALUES ('taj banjara', 'Ooty, Tamil Nadu', 3.8, 9000, 87654356);
INSERT INTO hotel2 VALUES ('snow valley', 'Shimla, Himachal Pradesh', 4, 10000, 87655677);
INSERT INTO hotel2 VALUES ('samson', 'Patnitop Jammu and Kashmir', 5, 40000, 76876577);
INSERT INTO hotel2 VALUES ('Radisson Plaza', 'Mahipalpur', 4.9, 5000, 73278361);
INSERT INTO hotel2 VALUES ('ITC Goa', 'Utorda', 5, 8000, 74326486);
INSERT INTO hotel2 VALUES ('IPC Manali', 'Old Manali', 4.9, 10000, 37612898);
INSERT INTO hotel2 VALUES ('VIVANTA', 'RESIDENCY ROAD, BANGLORE', 4.5, 7000, 22331456);
INSERT INTO hotel2 VALUES ('NOVOTEL', 'VARUN BEACH, VISHAKAPATNAM', 3.9, 4500, 97331452);
INSERT INTO hotel2 VALUES ('HILTON', 'RESIDANCY ROAD, KOTTAM, CHENNAI', 4.7, 9000, 32331457);

-- -----------------------------------------------------
-- Updates and View Creation
-- -----------------------------------------------------

UPDATE cab_services
SET capacityy=(SELECT travellers FROM customer WHERE customer.phone_no=cab_services.phone_no);

UPDATE hotel_site
SET stay_place=(SELECT destination FROM customer NATURAL JOIN travel_website WHERE travel_website.booking_id=hotel_site.booking_id);

UPDATE hotel_site
SET no_of_travellers=(SELECT travellers FROM customer NATURAL JOIN travel_website where hotel_site.booking_id=travel_website.booking_id);

UPDATE hotel1
SET no_of_rooms=(SELECT CEIL(no_of_travellers/2) FROM hotel_site where hotel_site.booking_id=hotel1.booking_id),
stay_place=(SELECT stay_place FROM hotel_site WHERE hotel_site.booking_id=hotel1.booking_id);

CREATE VIEW XYZ AS SELECT no_of_rooms*roomrent AS ROOMRENT, booking_id FROM (SELECT * FROM hotel1 NATURAL JOIN hotel2);

UPDATE hotel_site
SET accomodation_charges=(SELECT ROOMRENT FROM XYZ WHERE hotel_site.booking_id=XYZ.booking_id);

UPDATE travel_website
SET costt=(SELECT hotel_site.accomodation_charges FROM hotel_site WHERE hotel_site.booking_id=travel_website.booking_id) + (SELECT travel_agency.travelling_charges FROM travel_agency WHERE travel_agency.booking_id=travel_website.booking_id);

UPDATE customer
SET trip_expenses=(SELECT costt FROM travel_website WHERE travel_website.phone_no=customer.phone_no);
