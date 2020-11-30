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

      SELECT title FROM course
      WHERE course_id IN
      ( SELECT course_id FROM teaches
        WHERE id IN 
        (SELECT id FROM instructor WHERE name LIKE 'S%')
      );
      
--(6). Retrieve list of courses beginning their titles with word "Computer".

      SELECT * FROM course
      WHERE title LIKE 'Computer%';

--(7). Retrieve list of courses containing the word "language" in their titles.

      SELECT * FROM course
      WHERE title LIKE '%language%';

--(8). Retrieve names of the instructors who teach courses containing word "language" in their
titles.

      SELECT * FROM instructor
      WHERE id IN
      (SELECT id FROM teaches WHERE course_id IN
            (SELECT course_id FROM course WHERE title LIKE '%language%')
      );

--(9). Find IDs of all students whose names include "Kumari" and their department is IT.

      SELECT * FROM student
      WHERE name LIKE '%Kumari%' AND dept_name='IT';

--(10). Find average salary of all instructors.

      SELECT AVG(salary) FROM instructor;

--(11). Find average salary of the instructors belonging to Computer Engg, department.

      SELECT AVG(salary) FROM instructor
      WHERE dept_name='Computer Engg';

--(12). Find average salary of the instructors belonging to each department.

      SELECT dept_name,AVG(salary) FROM instructor
      GROUP BY dept_name;

--(13). Find names and average salaries of all departments whose average salary is greater than
Rs. 60000.

      SELECT dept_name, AVG(salary) FROM instructor
      GROUP BY dept_name
      HAVING AVG(salary)>60000;

--(14). Find total number of courses offered by the university.

      SELECT COUNT(course_id) FROM course;

--(15). Find total number of courses offered by the Computer Engg department.

      SELECT COUNT(course_id) FROM course
      WHERE dept_name='Computer Engg';    

--(16). Find total number of courses taught in the Spring 2016 semester.



--(17). Find total number of instructors who teach a course in the Spring 2016 semester.



--(18). Find maximum salary of an instructor belonging to Computer Engg, department.

      SELECT MAX(salary) FROM instructor
      WHERE dept_name='Computer Engg';
      
--(19). Find minimum salary of an instructor belonging to Computer Engg, department.

      SELECT MIN(salary) FROM instructor
      WHERE dept_name='Computer Engg';

--(20). Find maximum salary of an instructor in the university.

      SELECT MAX(salary) from instructor;

--(21). Find total number of students enrolled in the university.

      SELECT COUNT(*) FROM student;

--(22). Find total number of students enrolled in each department of the university.

      SELECT dept_name,COUNT(*) FROM student
      GROUP BY dept_name;

--(23). Find instructors whose average salaries are greater than Rs. 42,000.



----(24). Find instructors whose average salaries are greater than that of the instructors belonging
to the 'Physics' department.

--(25). Retrieve total no. of students in each department who earned total credits more than 8.

      SELECT dept_name, COUNT(*), tot_cred FROM student
      WHERE tot_cred>8
      GROUP BY dept_name;
