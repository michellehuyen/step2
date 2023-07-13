CREATE OR REPLACE TABLE Books (
    BookID int NOT NULL AUTO_INCREMENT,
    Title varchar(50),
    Author varchar(50),
    Genre varchar(50),
    Price decime(19,2),
    Status varchar(50),
    PRIMARY KEY (BookID)
);

INSERT INTO Books (
    Title,
    Author,
    Genre,
    Price,
    Status
)
VALUES
(
    "The Handmaid's Tale",
    "Margaret Atwood",
    "Science fiction",
    "17.49"
);

CREATE OR REPLACE TABLE Users (
    UserID int not NULL AUTO_INCREMENT,
    Name varchar(50),
    Email varchar(50),
    PRIMARY KEY (UserID)
);

INSERT INTO Users (
    Name,
    Email
)
VALUES
(
    "John Doe",
    "johndoe@gmail.com"
);

CREATE OR REPLACE TABLE Orders (
    OrderID int not NULL AUTO_INCREMENT,
    UserID int,
    BookID int,
    CustomerName varchar(50),
    AddressLine1 varchar(50),
    AddressLine2 varchar(50),
    City varchar(50),
    State varchar(50),
    PostalCode varchar(50),
    OrderDate datetime,
    OrderStatus varchar(50),
    Quantity int,
    TotalDue decimal(19,2),
    PaymentMethod varchar(50),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Orders (
    CustomerName,
    AddressLine1,
    City,
    State,
    PostalCode,
    OrderDate,
    OrderStatus,
    Quantity,
    TotalDue
)
VALUES
(
    "John Doe",
    "60025 Bollinger Canyon Road",
    "San Ramon",
    "California",
    "94583",
    "20230713",
    "Pending",
    "2",
    "32.94"
);

CREATE OR REPLACE TABLE Reviews (
    ReviewID int not NULL AUTO_INCREMENT,
    UserID int,
    BookID int,
    ReviewName varchar(50),
    Rating int,
    Description text,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Reviews (
    ReviewName,
    Rating,
    Description
)
VALUES
(
    "XYZ123"
    "5",
    "Great book!"
);