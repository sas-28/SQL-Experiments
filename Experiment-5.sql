-- ROOM_NO VARCHAR(7)
-- ID INT
-- COURSE_ID VARCHAR(10)

-- Table 1 classroom
        CREATE TABLE classroom(
        building varchar(30) NOT NULL,
        room_no varchar(7) NOT NULL,
        capacity int NOT NULL,
        CONSTRAINT PK_classroom PRIMARY KEY (building,room_no)
        );
-- Table 2 department
        CREATE TABLE department(
        dept_name varchar(30) NOT NULL PRIMARY KEY,
        building varchar(30) NOT NULL,
        budget int NOT NULL
        );
-- Table 3 course
        CREATE TABLE course(
        course_id varchar(10) NOT NULL PRIMARY KEY,
        title varchar(30) NOT NULL,
        dept_name varchar(30) NOT NULL,
        credits int,
        FOREIGN KEY (dept_name) REFERENCES department(dept_name)
        );
 -- Table 4 instructor
        CREATE TABLE instructor(
        id int NOT NULL PRIMARY KEY,
        name varchar(30) NOT NULL,
        dept_name varchar(30) NOT NULL,
        salary float(10),
        FOREIGN KEY (dept_name) REFERENCES department(dept_name)
        );
        
 -- Table 5 section
        CREATE TABLE section(
        course_id varchar(10) NOT NULL,
        sec_id varchar(10) NOT NULL,
        semester int NOT NULL,
        year int NOT NULL,
        building varchar(30) NOT NULL,
        room_no varchar(7) NOT NULL,
        time_slot_id int NOT NULL,
        CONSTRAINT PK_section PRIMARY KEY (course_id, sec_id, semester, year), -- multiple primary key
        CONSTRAINT FK_section FOREIGN KEY(building, room_no) REFERENCES classroom(building, room_no) -- multiple foreign key
        );
        
 -- Table 6 teaches
        CREATE TABLE teaches(
        ID int NOT NULL PRIMARY KEY,
        course_id varchar(10) NOT NULL,
        sec_id varchar(10) NOT NULL,
        semester int NOT NULL,
        year int NOT NULL,
        CONSTRAINT FK_teaches FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
        );
-- Table 7 student
        CREATE TABLE student(
        ID int NOT NULL PRIMARY KEY,
        name varchar(30) NOT NULL,
        dept_name varchar(30) NOT NULL,
        tot_cred int,
        CONSTRAINT FOREIGN KEY (dept_name) REFERENCES department(dept_name)
        );
     
     -- Table 8 takes
     CREATE TABLE takes(
     ID int NOT NULL,
     course_id varchar(10) NOT NULL,
     sec_id varchar(10) NOT NULL,
     semester int NOT NULL,
     year int NOT NULL,
     grade varchar(2),
     CONSTRAINT FOREIGN KEY (ID) REFERENCES student(ID),
     CONSTRAINT FOREIGN KEY (course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
     );
     
     -- Table 9 advisor
      CREATE TABLE advisor(
      s_id int NOT NULL,
      i_id int NOT NULL,
      CONSTRAINT FOREIGN KEY (s_id) REFERENCES student(ID),
      CONSTRAINT FOREIGN KEY (i_id) REFERENCES instructor(ID)
      );
      
    -- Table 10 time_slot
     CREATE TABLE time_slot(
     time_slot_id int NOT NULL,
     day varchar(10) NOT NULL,
     start_time time NOT NULL,
     end_time time NOT NULL,
     CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id, day, start_time)
     );
    
  -- Table 11 prereq
        CREATE TABLE prereq(
        course_id varchar(10) NOT NULL,
        prereq_id varchar(10) NOT NULL,
        CONSTRAINT FOREIGN KEY (course_id) REFERENCES course(course_id),
        CONSTRAINT FOREIGN KEY (prereq_id) REFERENCES course(course_id)
        );
     
