drop table Hours;
drop table Sales;
drop table Employees;
drop table Locations;
drop table Ratings;
drop table FoodTrucks;
drop table Consumers;
drop table Owners;

create table Owners (
	ID serial primary key,
	Owner_id varchar(10) not null,
	Password varchar(10) not null,
	Name varchar(128) not null
);

create table Consumers (
	ID serial primary key,
	Consumer_id varchar(10) not null,
	Password varchar(10) not null,
	Name varchar(128) not null
);

create table FoodTrucks (
	ID serial primary key,
	Name varchar(128) not null,
	Type varchar(128),
	Owner integer,
	foreign key (Owner) references Owners (ID)
);

create table Ratings (
	Rating_id serial primary key,
	Date date not null,
	Stars varchar(1) not null,
	Comments text,
	Consumer integer not null,
	Food_truck integer not null,
	foreign key (Consumer) references Consumers (ID),
	foreign key (Food_truck) references FoodTrucks (ID)
);

create table Employees (
	ID serial primary key,
	Name varchar(128) not null,
	DOB date,
	Food_truck integer not null,
	foreign key (Food_truck) references FoodTrucks (ID)
);

create table Locations (
	Location_id serial primary key,
	Address text not null,
	Start_date date not null,
	End_date date,
	Food_truck integer not null,
	foreign key (Food_truck) references FoodTrucks (ID)
);

create table Sales (
	Sales_id serial,
	Date date not null,
	Amount decimal not null,
	Location integer not null,
	foreign key (Location) references Locations (Location_id),
	primary key (Sales_id, Location)
);

create table Hours (
	Hour_id serial primary key,
	Day varchar(10),
	Start_time time not null,
	End_time time not null,
	Location integer not null,
	foreign key (Location) references Locations (Location_id)
);

insert into Owners (Owner_id, Password, Name) values ('abc123', '123456', 'Joe Smith');
insert into Owners (Owner_id, Password, Name) values ('aa12', 'aa12', 'Joe Wallace');
insert into Owners (Owner_id, Password, Name) values ('bb34', 'bb34', 'Michael Miller');
insert into Owners (Owner_id, Password, Name) values ('cc56', 'cc56', 'Melissa Miller');
insert into Owners (Owner_id, Password, Name) values ('dd78', 'dd78', 'Katherine OBrien');
insert into Owners (Owner_id, Password, Name) values ('ee90', 'ee90', 'Manny Lopez');
insert into Owners (Owner_id, Password, Name) values ('ff12', 'ff12', 'Juan Hernandez');
insert into Owners (Owner_id, Password, Name) values ('gg34', 'gg34', 'Margeret Jones');
insert into Owners (Owner_id, Password, Name) values ('hh56', 'hh56', 'Joe Jones');
insert into Owners (Owner_id, Password, Name) values ('ii78', 'ii78', 'Jerry Ron');

insert into Consumers (Consumer_id, Password, Name) values ('abc456', '123456', 'Mike Smith');
insert into Consumers (Consumer_id, Password, Name) values ('oa123', '123456', 'Omar Ali');
insert into Consumers (Consumer_id, Password, Name) values ('mw88', '88', 'Mike Wallace');
insert into Consumers (Consumer_id, Password, Name) values ('jw789', '123789', 'Joe Williams');
insert into Consumers (Consumer_id, Password, Name) values ('tyh15', 'colts15', 'Ty Hilton');
insert into Consumers (Consumer_id, Password, Name) values ('ajd1891', 'school', 'AJ Drexel');
insert into Consumers (Consumer_id, Password, Name) values ('bt456', '456123', 'Billy Temple');
insert into Consumers (Consumer_id, Password, Name) values ('wp1682', 'pa', 'William Penn');
insert into Consumers (Consumer_id, Password, Name) values ('mb7885', 'bloomwall', 'Mike Bloomsburg');
insert into Consumers (Consumer_id, Password, Name) values ('c137', 'best', 'Rick Sanchez');


insert into FoodTrucks (Name, Type, Owner) values ('Rick''s Cafe', 'Chinese', 1);
insert into FoodTrucks (Name, Type, Owner) values ('Halal Cart', 'Halal', 1);
insert into FoodTrucks (Name, Type, Owner) values ('A&M Halal Food Trucks', 'Halal', 1);
insert into FoodTrucks (Name, Type, Owner) values ('Oriental Food Truck', 'Chinese', 2);
insert into FoodTrucks (Name, Type, Owner) values ('Miller''s Truck', 'American Casual', 3);
insert into FoodTrucks (Name, Type, Owner) values ('Miller''s Truck II', 'American Casual', 4);
insert into FoodTrucks (Name, Type, Owner) values ('The Irish Luck', 'Irish', 5);
insert into FoodTrucks (Name, Type, Owner) values ('Big Burrito', 'Spanish', 6);
insert into FoodTrucks (Name, Type, Owner) values ('Amigos', 'Spanish', 7);
insert into FoodTrucks (Name, Type, Owner) values ('Jones''s Truck', 'American Casual', 8);
insert into FoodTrucks (Name, Type, Owner) values ('Jones''s Truck II', 'American Casual', 9);
insert into FoodTrucks (Name, Type, Owner) values ('Jerry''s Kitchen', 'Special Menu', 10);

insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-12', '5', 'Good food', 1, 1);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-12', '5', 'Best one in town', 2, 2);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-13', '4', 'Not as good as the Halal Cart', 2, 3);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-14', '5', 'Best chinese!', 3, 4);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-22', '4', 'Great Hoagies', 4, 5);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-22', '5', 'Cheap and tasty', 4, 5);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-23', '5', 'The Burritos are awesome and authentic', 10, 8);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-05', '4', 'Mac and Cheese was fresh', 8, 10);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-12', '5', 'Great Burgers!', 8, 12);
insert into Ratings (Date, Stars, Comments, Consumer, Food_truck) values ('2017-05-11', '5', 'Corned Beef and Cabbage!', 9, 7);

insert into Locations (Address, Start_date, End_date, Food_truck) values ('34th Market', '2017-05-12', '2017-06-12', 1);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('34th Market', '2017-05-01', '2018-05-01', 2);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('36th Market', '2017-05-15', '2019-06-15', 3);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('33th Market', '2017-05-02', '2020-05-02', 4);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('42th Market', '2017-05-05', '2017-05-25', 5);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('Arch & 33rd', '2017-05-08', '2019-05-11', 6);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('30th Market', '2017-05-16', '2017-12-11', 7);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('34th Market', '2017-05-18', '2025-01-01', 8);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('36th Market', '2017-05-01', '2017-11-11', 9);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('33th Market', '2017-05-19', '2018-01-01', 10);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('30th Street Station', '2017-05-11', '2017-05-28', 11);
insert into Locations (Address, Start_date, End_date, Food_truck) values ('34th Walnut', '2017-05-10', '2019-02-02', 12);


insert into Employees (Name, DOB, Food_truck) values ('John Smith', '1994-08-04', 1);
insert into Employees (Name, DOB, Food_truck) values ('Josh Jackson', '1993-01-01', 2);
insert into Employees (Name, DOB, Food_truck) values ('Ella Miller', '1994-05-21', 3);
insert into Employees (Name, DOB, Food_truck) values ('Emma Podolski', '2000-08-04', 4);
insert into Employees (Name, DOB, Food_truck) values ('Bill Burr', '1991-01-04', 5);
insert into Employees (Name, DOB, Food_truck) values ('Andy Sampler', '1998-08-20', 6);
insert into Employees (Name, DOB, Food_truck) values ('John Xu', '1993-10-10', 7);
insert into Employees (Name, DOB, Food_truck) values ('Greg Popvich', '1956-07-07', 8);
insert into Employees (Name, DOB, Food_truck) values ('Dilbert Ferguson', '1960-08-04', 9);
insert into Employees (Name, DOB, Food_truck) values ('Andrew Oblak', '1992-12-25', 10);
insert into Employees (Name, DOB, Food_truck) values ('Fatima Furkan', '1988-09-18', 11);
insert into Employees (Name, DOB, Food_truck) values ('Ryan Ryans', '1994-05-23', 12);

insert into Sales (Date, Amount, Location) values ('2017-05-11', '123.5', 1);
insert into Sales (Date, Amount, Location) values ('2017-05-12', '150', 4);
insert into Sales (Date, Amount, Location) values ('2017-05-13', '223.5', 5);
insert into Sales (Date, Amount, Location) values ('2017-05-14', '300', 6);
insert into Sales (Date, Amount, Location) values ('2017-05-15', '255', 7);
insert into Sales (Date, Amount, Location) values ('2017-05-16', '101', 8);
insert into Sales (Date, Amount, Location) values ('2017-05-17', '333', 9);
insert into Sales (Date, Amount, Location) values ('2017-05-17', '229', 10);
insert into Sales (Date, Amount, Location) values ('2017-05-18', '218', 11);
insert into Sales (Date, Amount, Location) values ('2017-05-19', '199', 12);

insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '11:00', '09:00', 1);
<<<<<<< HEAD
insert into Hours (Day, Start_time, End_time, Location) values ('Monday', '09:00', '09:00', 2);
insert into Hours (Day, Start_time, End_time, Location) values ('Tuesday', '11:00', '09:00', 3);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '09:00', '09:00', 4);
insert into Hours (Day, Start_time, End_time, Location) values ('Friday', '08:00', '04:00', 5);
insert into Hours (Day, Start_time, End_time, Location) values ('Monday', '08:00', '04:00', 6);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '09:00', '08:00', 7);
insert into Hours (Day, Start_time, End_time, Location) values ('Wednesday', '10:00', '09:00', 8);
insert into Hours (Day, Start_time, End_time, Location) values ('Wednesday', '11:00', '09:00', 9);
insert into Hours (Day, Start_time, End_time, Location) values ('Monday', '06:00', '04:00', 10);
insert into Hours (Day, Start_time, End_time, Location) values ('Tuesday', '11:00', '09:00', 11);
=======
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '09:00', '09:00', 4);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '08:00', '04:00', 5);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '08:00', '04:00', 6);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '09:00', '08:00', 7);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '10:00', '09:00', 8);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '11:00', '09:00', 9);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '06:00', '04:00', 10);
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '11:00', '09:00', 11);
>>>>>>> origin/master
insert into Hours (Day, Start_time, End_time, Location) values ('Thursday', '10:30', '07:30', 12);
