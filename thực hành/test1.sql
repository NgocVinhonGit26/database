use sangthu5;

create table Supplier(
	sid char(4) NOT NULL,
    sname varchar(30) NOT NULL,
    constraint KhoachinhP primary key(sid)
);
create table Product(
	pid char(4) NOT NULL,
    pname varchar(30) NOT NULL,
    colour char(8),
    weight int,
    city varchar(20),
    constraint KhoachinhP primary key(pid)
);
create table supplyproduct(
sid char(4) NOT NULL,
pid char(4) NOT NULL,
quantity smallint,
primary key(sid,pid),
foreign key(sid) references Supplier(sid),
foreign key(pid) references Product(pid),
check(quantity<0)
);

alter table supplyproduct
	add price real NOT NULL;

alter table supplyproduct
	drop column price;
-- alter table Supplier
-- 	alter column sname varchar(20);

 drop table supplyproduct;
alter table Product
	drop primary key;
    


