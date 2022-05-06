alter table productfeatureproduct2 add constraint fk_productfeatureproduct2_product foreign key(product) references product2(nr);

alter table producttypeproduct2 add constraint fk_producttypeproduct2_product foreign key(product) references product2(nr);
