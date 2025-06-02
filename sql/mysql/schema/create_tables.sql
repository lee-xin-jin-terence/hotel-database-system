-- HOTEL table
CREATE TABLE Hotel (
    hotelId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100)
) ENGINE=InnoDB;

-- ROOM table
CREATE TABLE Room (
    roomId INT AUTO_INCREMENT PRIMARY KEY,
    hotelId INT NOT NULL,
    roomNumber VARCHAR(20),
    roomType VARCHAR(50),
    capacity INT,
    pricePerNight DECIMAL(10, 2),
    FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId),
    CHECK (capacity > 0),
    CHECK (pricePerNight >= 0)
) ENGINE=InnoDB;

-- BOOKING table
CREATE TABLE Booking (
    bookingId INT AUTO_INCREMENT PRIMARY KEY,
    roomId INT NOT NULL,
    checkingInDate DATE,
    checkingOutDate DATE,
    bookingDate DATE DEFAULT CURRENT_DATE,
    status VARCHAR(50),
    FOREIGN KEY (roomId) REFERENCES Room(roomId)
) ENGINE=InnoDB;

-- GUEST table
CREATE TABLE Guest (
    guestId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    phoneNumber VARCHAR(20),
    emailAddress VARCHAR(100),
    address VARCHAR(255)
) ENGINE=InnoDB;

-- BOOKINGGUEST (Join Table)
CREATE TABLE BookingGuest (
    bookingGuestId INT AUTO_INCREMENT PRIMARY KEY,
    bookingId INT NOT NULL,
    guestId INT NOT NULL,
    isPrimary TINYINT(1),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    FOREIGN KEY (guestId) REFERENCES Guest(guestId)
) ENGINE=InnoDB;

-- PAYMENT table
CREATE TABLE Payment (
    paymentId INT AUTO_INCREMENT PRIMARY KEY,
    bookingId INT NOT NULL,
    paymentDate DATE DEFAULT CURRENT_DATE,
    amount DECIMAL(10, 2),
    paymentMethod VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    CHECK (amount >= 0)
) ENGINE=InnoDB;
