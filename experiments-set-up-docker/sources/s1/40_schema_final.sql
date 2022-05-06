
alter table review rename to reviewc;

--insert into product1 select * from product where nr < ((select max(nr) from product) / 2 + 1);
--insert into productfeatureproduct1 select * from productfeatureproduct where product < ((select max(nr) from product) / 2 + 1);
--insert into producttypeproduct1 select * from producttypeproduct where product < ((select max(nr) from product) / 2 + 1);
--insert into reviewc select * from review;

--COPY (SELECT * from product where nr > (select max(nr) from product) / 2) TO '/data/s5p/product2.csv' (format csv, delimiter ',', header);
--COPY (SELECT * from productfeature where nr > (select max(product) from productfeatureproduct) / 2) TO '/data/s5p/productfeatureproduct2.csv' (format csv, delimiter ',', header);
--COPY (SELECT * from producttypeproduct where nr > (select max(product) from producttypeproduct) / 2) TO '/Users/s5p/producttypeproduct2.csv' (format csv, delimiter ',', header);


--drop table product;
--drop table productfeatureproduct;
--drop table producttypeproduct;
--drop table review;
