create database cat;
use cat;
create table catBasic
	(
		catID int not null auto_increment,
		name varchar(20) default 'No name',
		age int default 0,
		primary key(catID)
	);
desc catBasic;
