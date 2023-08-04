--insert into product1 select * from product where nr < ((select max(nr) from product) / 2 + 1);
--insert into productfeatureproduct1 select * from productfeatureproduct where product < ((select max(nr) from product) / 2 + 1);
--insert into producttypeproduct1 select * from producttypeproduct where product < ((select max(nr) from product) / 2 + 1);
--insert into product2 select * from product where nr >= ((select max(nr) from product) / 2 + 1);
--insert into productfeatureproduct2 select * from productfeatureproduct where product >= ((select max(nr) from product) / 2 + 1);
--insert into producttypeproduct2 select * from producttypeproduct where product >= ((select max(nr) from product) / 2 + 1);

insert into reviewc select * from review;

