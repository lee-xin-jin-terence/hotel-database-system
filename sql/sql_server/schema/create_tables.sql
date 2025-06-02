-- HOTEL table
CREATE TABLE Hotel (
    hotelId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    phoneNumber NVARCHAR(20),
    emailAddress NVARCHAR(100)
);

-- ROOM table
CREATE TABLE Room (
    roomId INT IDENTITY(1,1) PRIMARY KEY,
    hotelId INT NOT NULL,
    roomNumber NVARCHAR(20),
    roomType NVARCHAR(50),
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
    status NVARCHAR(50),
    FOREIGN KEY (roomId) REFERENCES Room(roomId)
);

-- GUEST table
CREATE TABLE Guest (
    guestId INT IDENTITY(1,1) PRIMARY KEY,
    firstName NVARCHAR(50),
    lastName NVARCHAR(50),
    phoneNumber NVARCHAR(20),
    emailAddress NVARCHAR(100),
    address NVARCHAR(255)
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
    paymentMethod NVARCHAR(50),
    status NVARCHAR(50),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
