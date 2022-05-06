alter table productfeatureproduct1 add constraint fk_productfeatureproduct1_product foreign key(product) references product1(nr);
alter table producttypeproduct1 add constraint fk_producttypeproduct1_product foreign key(product) references product1(nr);
