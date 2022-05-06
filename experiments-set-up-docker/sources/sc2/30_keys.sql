alter table product1 add constraint fk_product1_producer foreign key(producer) references producer(nr);

alter table product2 add constraint fk_product2_producer foreign key(producer) references producer(nr);

-- alter table offer add constraint fk_offer_product foreign key(product) references product(nr);

-- alter table review add constraint fk_review_product foreign key(product) references product(nr);

-- alter table reviewc add constraint fk_reviewc_product foreign key(product) references product(nr);

alter table offer add constraint fk_offer_vendor foreign key(vendor) references vendor(nr);

alter table review add constraint fk_review_person foreign key(person) references person(nr);

alter table reviewc add constraint fk_reviewc_person foreign key(person) references person(nr);

alter table productfeatureproduct1 add constraint fk_productfeatureproduct1_product foreign key(product) references product1(nr);

alter table productfeatureproduct1 add constraint fk_productfeatureproduct1_productfeature foreign key(productfeature) references productfeature(nr);

alter table producttypeproduct1 add constraint fk_producttypeproduct1_product foreign key(product) references product1(nr);

alter table producttypeproduct1 add constraint fk_producttypeproduct1_producttype foreign key(producttype) references producttype(nr);

alter table productfeatureproduct2 add constraint fk_productfeatureproduct2_product foreign key(product) references product2(nr);

alter table productfeatureproduct2 add constraint fk_productfeatureproduct2_productfeature foreign key(productfeature) references productfeature(nr);

alter table producttypeproduct2 add constraint fk_producttypeproduct2_product foreign key(product) references product2(nr);

alter table producttypeproduct2 add constraint fk_producttypeproduct2_producttype foreign key(producttype) references producttype(nr);
