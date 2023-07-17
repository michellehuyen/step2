-- Michelle Nguyen & Prestion Sellers
-- Team 10

-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- Create Books table
CREATE OR REPLACE TABLE Books (
    BookID int NOT NULL AUTO_INCREMENT,
    Title varchar(50),
    Author varchar(50),
    Genre varchar(50),
    Price decime(19,2),
    Status varchar(50),
    PRIMARY KEY (BookID)
);

-- Insert values into the Books table
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

-- Create Users table
CREATE OR REPLACE TABLE Users (
    UserID int not NULL AUTO_INCREMENT,
    Name varchar(50) not NULL,
    Email varchar(50) not NULL,
    PRIMARY KEY (UserID)
);

-- Insert values into the Users table
INSERT INTO Users (
    Name,
    Email
)
VALUES
(
    "John Doe",
    "johndoe@gmail.com"
);

-- Create Orders table
CREATE OR REPLACE TABLE Orders (
    OrderID int not NULL AUTO_INCREMENT,
    UserID int not NULL,
    BookID int not NULL,
    CustomerName varchar(50) not NULL,
    AddressLine1 varchar(50) not NULL,
    AddressLine2 varchar(50),
    City varchar(50) not NULL,
    State varchar(50) not NULL,
    PostalCode varchar(50) not NULL,
    OrderDate datetime not NULL,
    OrderStatus varchar(50) not NULL,
    Quantity int not NULL,
    TotalDue decimal(19,2) not NULL,
    PaymentMethod varchar(50) not NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert values into the Orders table
INSERT INTO Orders (
    UserID,
    BookID,
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
    1,
    1,
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

-- Create Reviews table
CREATE OR REPLACE TABLE Reviews (
    ReviewID int not NULL AUTO_INCREMENT,
    UserID int not NULL,
    BookID int not NULL,
    ReviewName varchar(50) not NULL,
    Rating int not NULL,
    Description text not NULL,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert values into the Reviews table
INSERT INTO Reviews (
    UserID,
    BookID,
    ReviewName,
    Rating,
    Description
)
VALUES
(
    1,
    1,
    "XYZ123",
    "5",
    "Great book!"
);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;