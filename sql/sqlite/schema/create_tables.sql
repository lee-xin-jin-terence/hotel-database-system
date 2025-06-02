
-- HOTEL table
CREATE TABLE Hotel (
    hotelId INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    address TEXT,
    phoneNumber TEXT,
    emailAddress TEXT
);

-- ROOM table
CREATE TABLE Room (
    roomId INTEGER PRIMARY KEY AUTOINCREMENT,
    hotelId INTEGER NOT NULL,
    roomNumber TEXT,
    roomType TEXT,
    capacity INTEGER CHECK (capacity > 0),
    pricePerNight REAL CHECK (pricePerNight >= 0),
    FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId)
);

-- BOOKING table
CREATE TABLE Booking (
    bookingId INTEGER PRIMARY KEY AUTOINCREMENT,
    roomId INTEGER NOT NULL,
    checkingInDate DATE,
    checkingOutDate DATE,
    bookingDate DATE DEFAULT (DATE('now')),
    status TEXT,
    FOREIGN KEY (roomId) REFERENCES Room(roomId)
);

-- GUEST table
CREATE TABLE Guest (
    guestId INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    phoneNumber TEXT,
    emailAddress TEXT,
    address TEXT
);

-- BOOKINGGUEST (Join Table)
CREATE TABLE BookingGuest (
    bookingGuestId INTEGER PRIMARY KEY AUTOINCREMENT,
    bookingId INTEGER NOT NULL,
    guestId INTEGER NOT NULL,
    isPrimary INTEGER,  -- 0 or 1
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    FOREIGN KEY (guestId) REFERENCES Guest(guestId)
);

-- PAYMENT table
CREATE TABLE Payment (
    paymentId INTEGER PRIMARY KEY AUTOINCREMENT,
    bookingId INTEGER NOT NULL,
    paymentDate DATE DEFAULT (DATE('now')),
    amount REAL CHECK (amount >= 0),
    paymentMethod TEXT,
    status TEXT,
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
