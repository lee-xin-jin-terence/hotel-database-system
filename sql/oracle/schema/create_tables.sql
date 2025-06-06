
-- HOTEL table
CREATE TABLE Hotel (
    hotelId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name NVARCHAR2(100) NOT NULL,
    address NVARCHAR2(255),
    phoneNumber NVARCHAR2(20),
    emailAddress NVARCHAR2(100)
);

-- ROOM table
CREATE TABLE Room (
    roomId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    hotelId NUMBER NOT NULL,
    roomNumber NVARCHAR2(20),
    roomType NVARCHAR2(50),
    capacity NUMBER CHECK (capacity > 0),
    pricePerNight NUMBER(10, 2) CHECK (pricePerNight >= 0),
    CONSTRAINT fk_room_hotel FOREIGN KEY (hotelId) REFERENCES Hotel(hotelId)
);

-- BOOKING table
CREATE TABLE Booking (
    bookingId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    roomId NUMBER NOT NULL,
    checkingInDate DATE,
    checkingOutDate DATE,
    bookingDate DATE DEFAULT SYSDATE,
    status NVARCHAR2(50),
    CONSTRAINT fk_booking_room FOREIGN KEY (roomId) REFERENCES Room(roomId)
);

-- GUEST table
CREATE TABLE Guest (
    guestId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    firstName NVARCHAR2(50),
    lastName NVARCHAR2(50),
    phoneNumber NVARCHAR2(20),
    emailAddress NVARCHAR2(100),
    address NVARCHAR2(255)
);

-- BOOKINGGUEST (Join Table)
CREATE TABLE BookingGuest (
    bookingGuestId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    bookingId NUMBER NOT NULL,
    guestId NUMBER NOT NULL,
    isPrimary NUMBER(1),  -- use 0 or 1
    CONSTRAINT fk_bookingguest_booking FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
    CONSTRAINT fk_bookingguest_guest FOREIGN KEY (guestId) REFERENCES Guest(guestId)
);

-- PAYMENT table
CREATE TABLE Payment (
    paymentId NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    bookingId NUMBER NOT NULL,
    paymentDate DATE DEFAULT SYSDATE,
    amount NUMBER(10, 2) CHECK (amount >= 0),
    paymentMethod NVARCHAR2(50),
    status NVARCHAR2(50),
    CONSTRAINT fk_payment_booking FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
