.mode csv
.import ./data/author.csv author
.import ./data/more_authors.csv author
.import ./data/book.csv books
.import ./data/more_books.csv books

-- sqlite3 command line shell fix for null values in the data:
update books set seriesid=null where seriesid=0;

.import ./data/customer.csv customer
.import ./data/customer_order.csv customer_order
.import ./data/is_ordered.csv is_ordered
.import ./data/promotion.csv promotion
.import ./data/publisher.csv publisher
.import ./data/more_publishers.csv publisher
.import ./data/purchase.csv purchase
.import ./data/writes.csv writes
.import ./data/more_writes.csv writes
.import ./data/series.csv series
