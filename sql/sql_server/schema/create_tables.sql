-- HOTEL table
CREATE TABLE Hotel (
    hotelId INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100)
);

-- ROOM table
CREATE TABLE Room (
    roomId INT IDENTITY(1,1) PRIMARY KEY,
    hotelId INT NOT NULL,
    roomNumber VARCHAR(20),
    roomType VARCHAR(50),
    capacity INT CHECK (capacity > 0),
    pricePerNight DECIMAL(10, 2) CHECK (pricePerNight >= 0),
    FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId)
);

-- BOOKING table
CREATE TABLE Booking (
    bookingId INT IDENTITY(1,1) PRIMARY KEY,
    roomId INT NOT NULL,
    checkingInDate DATE,
    checkingOutDate DATE,
    bookingDate DATE DEFAULT GETDATE(),
    status VARCHAR(50),
    FOREIGN KEY (roomId) REFERENCES Room(roomId)
);

-- GUEST table
CREATE TABLE Guest (
    guestId INT IDENTITY(1,1) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100),
    address VARCHAR(255)
);

-- BOOKINGGUEST (Join Table)
CREATE TABLE BookingGuest (
    bookingGuestId INT IDENTITY(1,1) PRIMARY KEY,
    bookingId INT NOT NULL,
    guestId INT NOT NULL,
    isPrimary BIT,
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    FOREIGN KEY (guestId) REFERENCES Guest(guestId)
);

-- PAYMENT table
CREATE TABLE Payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    bookingId INT NOT NULL,
    paymentDate DATE DEFAULT GETDATE(),
    amount DECIMAL(10, 2) CHECK (amount >= 0),
    paymentMethod VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
