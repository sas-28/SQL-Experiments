# SQL-Experiments
Lab Manual

Schema for a University Database
Create a relational database for a University described by the following relational schema and
populate it by tuples.
CLASSROOM (Building, Room Number, capacity)
DEPARTMENT (Dept name, building, budget)
COURSE (Course id, title, dept name, credits)
INSTRUCTER (I-ID, name, dept name, salary)
SECTION (Course id, sec id, semester, year, building, room number, time slot id)
TEACHES (I-ID, course id, sec id, semester, year)
STUDENT (S-ID, name, dept name, tot credit)
TAKES (ID, Course-id, sec-id, semester, year, grade)
ADVISOR (S-ID, I-ID)
TIME SLOT (Time-slot-id, day, start time, end time)
PREREQ (Course-id, Prereq-id)

Experiment No.-05
Write the following queries in the SQL for the above mentioned database of a university.
(update, retrieve, rename)
(1). Increase Salary by 20 percent of all instructors who are working in Department IT.
(2). Retrieve names of all instructors along with their department names.
(3). Retrieve names of all instructors along with their department names and building names in
which the departments are housed.
(4). Retrieve names of all departments along with names of the buildings in which they are
situated.
(5). Change name of the building "Lecture Hall Complex" to "Lecture Theatre Complex".
(6). Find name of the department of a student with ID _____. (Take a valid ID value of a
student)
(7). Retrieve names of all instructors along with the Course IDs of the courses they teach.
(8). Retrieve Course ID, semester, year and title of each course being taught by "Computer
Engg." department.
(9). Compute monthly salary of all instructors and display it as 'monthly salary' attribute in
place of attribute 'salary'.
(10). Retrieve names of all departments housed in the building named _______. (Consider a
valid Building name)
(11). Find the names of all instructors belonging to Computer Engg. department who have
salary greater than Rs. 70,000.
(12). Find titles of the courses that have credits 3 and offered by the department IT.
(13). Find course names and their credits running in semester 4.
(14). List classes as year and semester wise engaged in room no. LHC-102.
(15). List classes as year, semester and section wise engaged in room no. LHC-102.
(16). List classes as year, semester and section wise engaged in room no. LHC-101.
(17). Retrieve list of room number & time slot where all classes of Computer Engg.. Semester
7th are scheduled.
(18). Retrieve Course titles taught by instructor _______. (Take a valid instructor ID or name)
(19). For all instructors in the university who have taught some course, display their names
along with their department names.
(20). Find the names of all instructors who have a higher salary than some instructor in
"Computer Engg." department. 
