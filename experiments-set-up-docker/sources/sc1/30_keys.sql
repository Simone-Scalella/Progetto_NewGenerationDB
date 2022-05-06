
alter table productfeatureproduct add constraint fk_productfeatureproduct_product foreign key(product) references product(nr);

alter table productfeatureproduct add constraint fk_productfeatureproduct_productfeature foreign key(productfeature) references productfeature(nr);

alter table producttypeproduct add constraint fk_producttypeproduct_product foreign key(product) references product(nr);

alter table producttypeproduct add constraint fk_producttypeproduct_producttype foreign key(producttype) references producttype(nr);

alter table product add constraint fk_product_producer foreign key(producer) references producer(nr);

alter table offer add constraint fk_offer_product foreign key(product) references product(nr);

alter table review add constraint fk_review_product foreign key(product) references product(nr);

alter table offer add constraint fk_offer_vendor foreign key(vendor) references vendor(nr);

alter table review add constraint fk_review_person foreign key(person) references person(nr);