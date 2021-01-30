CREATE DATABASE BackEndTask;
USE BackEndTask;

CREATE TABLE Size (
    SIZEID INT UNSIGNED  NOT NULL,
    VehicleSize varchar(255)  NOT NULL,
    PRIMARY KEY(SIZEID));
CREATE TABLE Vehicle (
    ID INT UNSIGNED  NOT NULL,
    Size  INT UNSIGNED,
    Model varchar(255)  NOT NULL,
    PRIMARY KEY(ID),
    foreign key(Size) references Size(SIZEID));

CREATE TABLE Customer (
    CID INT UNSIGNED  NOT NULL,
    Name varchar(255)  NOT NULL,
    PRIMARY KEY(CID));

CREATE TABLE Booking (
    BookingID int UNSIGNED NOT NULL,
    CustomerID int UNSIGNED ,
    VehicleID int UNSIGNED ,
    Datebooked DATE NOT NULL,
    DateReturned DATE NOT NULL,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(ID)
);



Show tables;