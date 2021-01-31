CREATE DATABASE BackEndTask;
USE BackEndTask;

CREATE TABLE Size (
    SIZEID INT UNSIGNED  NOT NULL auto_increment,
    VehicleSize varchar(255)  NOT NULL,
    PRIMARY KEY(SIZEID));
CREATE TABLE Vehicle (
    ID INT UNSIGNED  NOT NULL auto_increment,
    Size  INT UNSIGNED,
    Model varchar(255)  NOT NULL,
    PRIMARY KEY(ID),
    foreign key(Size) references Size(SIZEID) ON delete restrict ON update cascade);

CREATE TABLE Customer (
    CID INT UNSIGNED  NOT NULL auto_increment,
    Name varchar(255)  NOT NULL,
    PRIMARY KEY(CID));

CREATE TABLE Booking (
    BookingID int UNSIGNED NOT NULL auto_increment,
    CustomerID int UNSIGNED ,
    VehicleID int UNSIGNED ,
    Datebooked DATE NOT NULL,
    DateReturned DATE NOT NULL,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CID) ON DELETE CASCADE ON update cascade,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(ID) ON DELETE CASCADE ON update cascade
);



Show tables;