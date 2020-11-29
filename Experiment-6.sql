--(1). Find names of all departments whose building name includes the substring “Hall”.
      
      SELECT dept_name, building
      FROM department
      WHERE building LIKE '%HALL%';
      
--(2). Find names of all instructors who have their salaries between Rs. 50,000 and Rs. 80,000.
     
     SELECT name, salary
     FROM instructor
     WHERE salary>=50000 AND salary<=80000;
     
--(3). Find names of all students whose names begin with string "Sa":

     SELECT name
     FROM student
     WHERE name LIKE 'Sa%';

--(4). Find names of all students belonging to Computer Engg. department and their names begin
with character "Sa":

    SELECT name,dept_name
    FROM student
    WHERE name LIKE 'Sa%' AND dept_name='Computer Engg' ;

--(5). Retrieve list of courses taught by teachers whose names begin with character "S".

--(6). Retrieve list of courses beginning their titles with word "Computer".

--(7). Retrieve list of courses containing the word "language" in their titles.

--(8). Retrieve names of the instructors who teach courses containing word "language" in their
titles.

--(9). Find IDs of all students whose names include "Kumari" and their department is IT.

--(10). Find average salary of all instructors.

--(11). Find average salary of the instructors belonging to Computer Engg, department.

--(12). Find average salary of the instructors belonging to each department.

--(13). Find names and average salaries of all departments whose average salary is greater than
Rs. 60000.

--(14). Find total number of courses offered by the university.

--(15). Find total number of courses offered by the Computer Engg department.

--(16). Find total number of courses taught in the Spring 2016 semester.

--(17). Find total number of instructors who teach a course in the Spring 2016 semester.

--(18). Find maximum salary of an instructor belonging to Computer Engg, department.

--(19). Find minimum salary of an instructor belonging to Computer Engg, department.

--(20). Find maximum salary of an instructor in the university.

--(21). Find total number of students enrolled in the university.

--(22). Find total number of students enrolled in each department of the university.

--(23). Find instructors whose average salaries are greater than Rs. 42,000.

----(24). Find instructors whose average salaries are greater than that of the instructors belonging
to the 'Physics' department.

--(25). Retrieve total no. of students in each department who earned total credits more than 8.
