create table Airport (
    AirportIATA varchar(4) not null,
    AirportName varchar(255) not null,
    AirportLocation varchar(60) not null,
    primary key (AirportIATA)
);

create table Airline (
    AirlineIATA varchar(4) not null,
    AirlineName varchar(255) not null,
    primary key (AirlineIATA)
);

create table AirRoutes (
    FromIATA varchar(4) not null,
    ToIATA varchar(4) not null,
    RouteID int identity(1, 1) unique,
    primary key (RouteID, FromIATA, ToIATA),
    foreign key (FromIATA) references Airport(AirportIATA),
    foreign key (ToIATA) references Airport(AirportIATA),
);

create table Owns (
    RouteID int not null,
    AirlineIATA varchar(4) not null,
    primary key (RouteID, AirlineIATA),
    foreign key (RouteID) references AirRoutes(RouteID),
    foreign key (AirlineIATA) references Airline(AirlineIATA)
);

create table Operates (
    RouteID int not null,	
    AirlineIATA varchar(4) not null,
    primary key (RouteID, AirlineIATA),
    foreign key (RouteID) references AirRoutes(RouteID),
    foreign key (AirlineIATA) references Airline(AirlineIATA)
);