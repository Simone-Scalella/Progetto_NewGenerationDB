insert into op1 (o_nr, o_price, o_vendor, o_validto, o_deliverydays, o_offerwebpages, p_nr, p_label, p_propertynum1, p_propertynum2)
select o.nr, o.price, o.vendor, o.validto, o.deliverydays, o.offerwebpage, pro.nr, pro.label, pro.propertynum1, pro.propertynum2
from offer o, product1 pro
where o.product=pro.nr;

insert into op2 (o_nr, o_price, o_vendor, o_validto, o_deliverydays, o_offerwebpages, p_nr, p_label, p_propertynum1, p_propertynum2)
select o.nr, o.price, o.vendor, o.validto, o.deliverydays, o.offerwebpage, pro.nr, pro.label, pro.propertynum1, pro.propertynum2
from offer o, product2 pro
where o.product=pro.nr;

insert into pfpf1 (product, productfeature, f_label, f_publisher, f_publishdate)
select pfp.product, pfp.productfeature, pf.label, pf.publisher, pf.publishdate
from productfeatureproduct1 pfp, productfeature pf
where pfp.productfeature=pf.nr;

insert into pfpf2 (product, productfeature, f_label, f_publisher, f_publishdate)
select pfp.product, pfp.productfeature, pf.label, pf.publisher, pf.publishdate
from productfeatureproduct2 pfp, productfeature pf
where pfp.productfeature=pf.nr;

insert into ppd1 (p_nr, p_label, p_comment, p_propertytex1, p_propertytex2, p_propertytex3, p_propertytex4, p_propertytex5, p_propertynum1, p_propertynum2, p_propertynum4, pd_producer, pd_label, pd_country)
select pro.nr, pro.label, pro.comment, pro.propertytex1, pro.propertytex2, pro.propertytex3, pro.propertytex4, pro.propertytex5, pro.propertynum1, pro.propertynum2, pro.propertynum4, pd.nr, pd.label, pd.country
from product1 pro, producer pd
where pro.producer=pd.nr;

insert into ppd2 (p_nr, p_label, p_comment, p_propertytex1, p_propertytex2, p_propertytex3, p_propertytex4, p_propertytex5, p_propertynum1, p_propertynum2, p_propertynum4, pd_producer, pd_label, pd_country)
select pro.nr, pro.label, pro.comment, pro.propertytex1, pro.propertytex2, pro.propertytex3, pro.propertytex4, pro.propertytex5, pro.propertynum1, pro.propertynum2, pro.propertynum4, pd.nr, pd.label, pd.country
from product2 pro, producer pd
where pro.producer=pd.nr;

drop table product1;
drop table productfeatureproduct1;
drop table product2;
drop table productfeatureproduct2;
drop table offer;
drop table producer;
drop table productfeature;
