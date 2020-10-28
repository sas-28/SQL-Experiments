-- Table 1 classroom
        CREATE TABLE classroom(
        building varchar(30) NOT NULL,
        room_no varchar(7) NOT NULL,
        capacity int NOT NULL,
        CONSTRAINT PK_classroom PRIMARY KEY (building,room_no)
        );
-- Table 2 department
