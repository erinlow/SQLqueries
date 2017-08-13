--
-- Table structure for table `author`
--
CREATE TABLE author (
  author_id SMALLINT UNSIGNED NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  PRIMARY KEY  (author_id)
);


--
-- Table structure for table `publisher`
--
CREATE TABLE publisher (
  publisher_id SMALLINT UNSIGNED NOT NULL,
  company_name VARCHAR(45) NOT NULL,
  address TEXT NOT NULL,
  phone VARCHAR(25) NOT NULL,
  PRIMARY KEY  (publisher_id)
);


--
-- Table structure for table `series`
--
CREATE TABLE series (
  series_id SMALLINT UNSIGNED NOT NULL,
  series_title VARCHAR(45) NOT NULL,
  PRIMARY KEY  (series_id)
);


--
-- Table structure for table `books`
--
CREATE TABLE books (
  isbn VARCHAR(15) NOT NULL,
  title VARCHAR(150) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  category VARCHAR(45) NOT NULL,
  year CHAR(4) NOT NULL,
  rating DECIMAL(2,1),
  inventory INT NOT NULL,
  pub_id SMALLINT UNSIGNED NOT NULL,
  seriesid SMALLINT UNSIGNED,
  PRIMARY KEY  (isbn),
  FOREIGN KEY (pub_id) REFERENCES publisher (publisher_id),
  FOREIGN KEY (seriesid) REFERENCES series (series_id)
);


--
-- Table structure for table `cutomer_order`
--
CREATE TABLE customer_order (
  order_id SMALLINT UNSIGNED NOT NULL,
  order_status VARCHAR(45) NOT NULL,
  PRIMARY KEY  (order_id)
);




--
-- Table structure for table `customer`
--
CREATE TABLE customer (
  customer_id SMALLINT UNSIGNED NOT NULL,
  c_last_name VARCHAR(25) NOT NULL,
  c_first_name VARCHAR(25) NOT NULL,
  quantity_purchased INT NOT NULL,
  money_spent DECIMAL(6,2) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY  (customer_id)
);


--
-- Table structure for table `writes`
--
CREATE TABLE writes (
  auth_id SMALLINT UNSIGNED NOT NULL,
  book_id VARCHAR(15) NOT NULL,
  FOREIGN KEY (auth_id) REFERENCES author (author_id),
  FOREIGN KEY (book_id) REFERENCES books (isbn)
);


--
-- Table structure for table `promotion` 
--
CREATE TABLE promotion (
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  percent_off INT NOT NULL,
  promo_isbn VARCHAR(15) NOT NULL,
  FOREIGN KEY (promo_isbn) REFERENCES books (isbn)
);


--
-- Table structure for table `purchase`
--
CREATE TABLE purchase (
  purchase_id SMALLINT UNSIGNED NOT NULL,
  cost DECIMAL(6,2) NOT NULL,
  quantity INT NOT NULL,
  purchase_date DATE NOT NULL,
  cust_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (purchase_id),
  FOREIGN KEY (cust_id) REFERENCES customer (customer_id)
);


--
-- Table structure for table `is_ordered` 
--
CREATE TABLE is_ordered (
	bookid VARCHAR(15) NOT NULL,
	orderid SMALLINT UNSIGNED NOT NULL,
	purchaseid SMALLINT UNSIGNED NOT NULL,
	FOREIGN KEY (bookid) REFERENCES books (isbn),
	FOREIGN KEY (orderid) REFERENCES customer_order (order_id),
	FOREIGN KEY (purchaseid) REFERENCES purchase (purchase_id)
);







