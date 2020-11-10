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
        
    -- Data
    
    INSERT INTO department VALUES
    -> ('Computer Engg', 'Building No. 1', 500000),
    -> ('Civil Engg', 'Building No 2', 500000),
    -> ('Mechanical Engg', 'Building No 3', 500000),
    -> ('Electrical Engg', 'Building No 4', 500000),
    -> ('Electronics & Communication', 'Building No 5', 600000),
    -> ('Physics' , 'Building No 6', 400000),
    -> ('Chemistry', 'Building No 6', 300000),
    -> ('Mathematics', 'Building No 6', 200000)
    -> ('IT','Building No 1', 600000);
    
    INSERT INTO course VALUES
    -> ('ITPC25', 'Database Systems', 'IT',5),
    -> ('ITPC27','Software Engnireeing','IT',4),
    -> ('ITPC29','Computer Organisation','IT',4);
    
    INSERT INTO course VALUES
    -> ('CSPC25', 'Database Systems', 'Computer Engg',5),
    -> ('CSPC27','Software Engnireeing','Computer Engg',4),
    -> ('CSPC29','Computer Organisation','Computer Engg',4);
    
    INSERT INTO course VALUES
    -> ('ITIR13','Discipline Engineering','IT',3),
    -> ('ITPC10','Digital System Design','IT',3);
    
    INSERT INTO instructor VALUES
    -> (1, 'S.K. Jain', 'IT', 100000),
    -> (2, 'J.K. Chabbra', 'IT', 100000);
    
    INSERT INTO instructor VALUES
    -> (3, 'M.K. Verma', 'Computer Engg', 50000),
    -> (4, 'Mayank Dave','Computer Engg', 70000),
    -> (5, 'Priyanka Alhawat','Computer Engg', 80000),
    -> (6, 'B.K. Mars','Computer Engg', 100000);
    
    INSERT INTO classroom VALUES
    -> ('Lecture Hall Complex','LHC102', 120),
    -> ('Lecture Hall Complex','LHC101', 120),
    -> ('Lecture Hall Complex','LHC202', 120),
    -> ('Lecture Hall Complex','LHC201', 120),
    -> ('A-Block','A100',120),
    -> ('A-Block','A101',120);
    
    INSERT INTO student VALUES
    -> (11913102, 'Sahil Shende','IT', 76);
    
    INSERT INTO section VALUES
    -> ('ITPC25','IT-B',3,2,"Lecture Theatre Complex",'LHC101',1),
    -> ('ITPC27','IT-B',1,1,"A-Block",'A100',1);
    
    INSERT INTO teaches VALUES
    -> (1, 'ITPC25','IT-B',3,2),
    -> (2,'ITPC27','IT-B',1,1);
    
    
-- Queries

    -- 1. Increase Salary by 20 percent of all instructors who are working in Department IT
        UPDATE instructor
        SET salary=salary+salary*(0.2)
        WHERE dept_name='IT';

    -- 2. Retrieve names of all instructors along with their department names. 
        SELECT name, dept_name FROM instructor;
        
   -- 3. . Retrieve names of all instructors along with their department names and building names in which the departments are housed.
        SELECT a.name, a.dept_name, b.building
        FROM instructor a INNER JOIN department b
        ON a.dept_name=b.dept_name;
    
  -- 4. Retrieve names of all departments along with names of the buildings in which they are situated
        SELECT dept_name, building
        FROM department;
      
  -- 5. Change name of the building "Lecture Hall Complex" to "Lecture Theatre Complex".
  
        UPDATE classroom
        SET building='Lecture Theatre Complex'
        WHERE building='Lecture Hall Complex';

-- 6. Find name of the department of a student with ID _____. (Take a valid ID value of a student) 

        SELECT name, dept_name FROM student WHERE ID=11913102;

-- 7. Retrieve names of all instructors along with the Course IDs of the courses they teach. 
        
        SELECT a.name, b.course_id FROM
        instructor a INNER JOIN teaches b
        ON a.ID=b.ID;
  
  -- 8. Retrieve Course ID, semester, year and title of each course being taught by "Computer Engg." department.
  
        SELECT a.course_id, a.semester, a.year, b.title
        FROM section a INNER JOIN course b
        ON a.course_id=b.course_id
        WHERE b.dept_name='Computer Engg';
        
  -- 9. Compute monthly salary of all instructors and display it as 'monthly salary' attribute in place of attribute 'salary'. 
        SELECT SUM(salary) AS 'monthly salary' FROM instructor;
        
  -- 10. Retrieve names of all departments housed in the building named _______. (Consider a valid Building name)
        SELECT * FROM department
        WHERE building='Building No 6';
        
   -- 11. Find the names of all instructors belonging to Computer Engg. department who have salary greater than Rs. 70,000.
   
         SELECT name, salary
         FROM instructor
         WHERE dept_name='Computer Engg' AND salary > 70000;
         
   -- 12. Find titles of the courses that have credits 3 and offered by the department IT. 
   
        SELECT title, credits FROM  courses
        WHERE dept_name='IT' AND credits=3;
        
   -- 13. 
   
