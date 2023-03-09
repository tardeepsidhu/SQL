#Sales from an online furniture store (Data from Khan Academy)
#Collected by: https://www.khanacademy.org/profile/charlesb2000/


CREATE TABLE sales(
  ID INTEGER  NOT NULL PRIMARY KEY
, transaction_date TEXT
, product TEXT
, price INTEGER
, payment_type TEXT
, name TEXT
, city TEXT
, state TEXT
, country TEXT
, account_created TEXT
, last_login TEXT
, latitude REAL
, longitude REAL
);
