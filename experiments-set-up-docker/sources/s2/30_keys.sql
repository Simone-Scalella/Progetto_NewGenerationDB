alter table review add constraint fk_review_person foreign key(person) references person(nr);
