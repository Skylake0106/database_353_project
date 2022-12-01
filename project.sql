SPOOL project.txt
SET ECHO ON

/*
CIS 353 - Database Design Project
Finney, Jazzmin
Goodling, Andrew
Johnson, Justin
Ruiter, Skyler
Taylor, Kyle
*/

---- Drop Tables if they already exist ----

DROP TABLE Makes_Up;
DROP TABLE Part_Of;
DROP TABLE Takes;
DROP TABLE Teaches;
DROP TABLE Languages;
DROP TABLE Sections;
DROP TABLE Professors;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Curriculum;


---- Database Schema (Create Tables) ----


CREATE TABLE Professors (
    p_gnumber INTEGER PRIMARY KEY,
    p_email CHAR(25)  NOT NULL,
    p_position INTEGER NOT NULL,
    p_name CHAR(25) NOT NULL
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name CHAR(75) NOT NULL,
    num_credits INTEGER NOT NULL,
    CONSTRAINT one_att CHECK (num_credits >= 1 AND num_credits <= 5)
);

CREATE TABLE Curriculum (
    currID INTEGER PRIMARY KEY,
    curr_name CHAR(25) NOT NULL,
    credit_hours INTEGER NOT NULL
);

CREATE TABLE Students (
    s_gnumber INTEGER PRIMARY KEY,
    s_name CHAR(25) NOT NULL,
    s_credits INTEGER NOT NULL,
    s_standing INTEGER NOT NULL,
    s_curriculum INTEGER NOT NULL,

    -- Foreign Key Constraint --
    CONSTRAINT f0 FOREIGN KEY (s_curriculum) REFERENCES Curriculum(currID),
    -- Two Attribute One Row Constraint --
    CONSTRAINT two_one CHECK ((s_standing = 3 AND (s_credits >= 60 AND s_credits <= 84)) OR s_standing != 3)
);

CREATE TABLE Sections (
    course_num INTEGER,
    section_num INTEGER,
    room CHAR(10),
    sec_time char(25),

    -- Primary Key Constraint --
    CONSTRAINT p_key PRIMARY KEY(course_num, section_num),
    CONSTRAINT f1 FOREIGN KEY (course_num) REFERENCES Courses(course_id)
);

CREATE TABLE Languages (
    lang CHAR(15),
    l_gnumber INTEGER,
    
    PRIMARY KEY(lang, l_gnumber),
    CONSTRAINT f2 FOREIGN KEY (l_gnumber) REFERENCES Students(s_gnumber)
);

CREATE TABLE Teaches (
    t_gnumber INTEGER,
    t_course_num INTEGER,
    preference INTEGER,
    
    PRIMARY KEY(t_gnumber, t_course_num),
    CONSTRAINT f3 FOREIGN KEY (t_gnumber) REFERENCES Professors(p_gnumber),
    CONSTRAINT f4 FOREIGN KEY (t_course_num) REFERENCES Courses(course_id)
);

CREATE TABLE Takes (
    gnum INTEGER,
    sec_num INTEGER,
    crs_num INTEGER,
    grade CHAR(25),

    PRIMARY KEY(gnum, sec_num, crs_num),
    CONSTRAINT f5 FOREIGN KEY (gnum) REFERENCES Students(s_gnumber),
    CONSTRAINT f6 FOREIGN KEY (sec_num, crs_num) REFERENCES Sections(section_num, course_num)
);

CREATE TABLE Part_Of (
    curr_id INTEGER,
    gnumber INTEGER,
    PRIMARY KEY(curr_id, gnumber),
    CONSTRAINT f7 FOREIGN KEY (curr_id) REFERENCES Curriculum(currID),
    CONSTRAINT f8 FOREIGN KEY (gnumber) REFERENCES Students(s_gnumber)
);

CREATE TABLE Makes_Up (
    curr_num INTEGER,
    course_number INTEGER,
    req INTEGER,

    PRIMARY KEY(curr_num, course_number),
    CONSTRAINT f9 FOREIGN KEY (curr_num) REFERENCES Curriculum(currID),
    CONSTRAINT f10 FOREIGN KEY (course_number) REFERENCES Courses(course_id)
);


SET FEEDBACK OFF;

---- Populate Databse ----

-- Populate Professors
INSERT INTO Professors VALUES(11111111, 'adamsr@gvsu.edu', 1, 'Robert Adams');
INSERT INTO Professors VALUES(2222222,'alsabbaj@gvsu.edu', 1, 'Jamal Alsabbagh');
INSERT INTO Professors VALUES(3333333, 'bhusevji@gvsu.edu', 2, 'Vijay Bhuse');
INSERT INTO Professors VALUES(4444444, 'bobeldyd@gvsu.edu', 3, 'Denton Bobeldyk');
INSERT INTO Professors VALUES(11223344, 'bowmnath@gvsu.edu', 3, 'Nathaniel Bowman');
INSERT INTO Professors VALUES(55567892, 'carrieer@gvsu.edu', 3, 'Erin Carrier');
INSERT INTO Professors VALUES(20304050, 'dowlinmi@gvsu.edu', 3, 'Michelle Dowling');
INSERT INTO Professors VALUES(56565656, 'dulimarh@gvsu.edu', 2, 'Hans Dulimarta');
INSERT INTO Professors VALUES(17895345, 'elsaidm@gvsu.edu', 1, 'Mostafa El-Said');
INSERT INTO Professors VALUES(09090943, 'kurmasz@gvsu.edu', 2, 'Zachary Kurmas');

-- Populate Courses
INSERT INTO Courses VALUES(290, 'Professional Responsibilities and Practices', 3);
INSERT INTO Courses VALUES(331, 'Data Analysis Tools and Techniques', 2);
INSERT INTO Courses VALUES(350, 'Introduction to Software Engineering', 4);
INSERT INTO Courses VALUES(353, 'Database', 3);
INSERT INTO Courses VALUES(358, 'Information Assurance', 4);
INSERT INTO Courses VALUES(458, 'System Security', 3);
INSERT INTO Courses VALUES(241, 'System Level Programming', 5);
INSERT INTO Courses VALUES(357, 'Mobile App', 5);

-- Curriculum
INSERT INTO Curriculum VALUES(10, 'Computer Science', 120);
INSERT INTO Curriculum VALUES(20, 'Information Systems', 120);
INSERT INTO Curriculum VALUES(30, 'Information Technology', 120);
INSERT INTO Curriculum VALUES(40, 'Cybersecurity', 120);

-- Populate Students
INSERT INTO Students VALUES(23232323, 'Kyle Taylor', 113, 4, 10);
INSERT INTO Students VALUES(56543245, 'Skyler Ruiter', 80, 3, 20);
INSERT INTO Students VALUES(09384543, 'Jazzmin Finney', 81, 3, 10);
INSERT INTO Students VALUES(12131415, 'Andrew Goodling', 69, 3, 30);
INSERT INTO Students VALUES(34474039, 'Justin Johnson', 70, 3, 20);
INSERT INTO Students VALUES(13467899, 'Janice Harold', 109, 2, 40);
INSERT INTO Students VALUES(87432445, 'Hunter Bolt', 100, 2, 10);
INSERT INTO Students VALUES(20983432, 'Paula Shargaloo', 123, 2, 10);
INSERT INTO Students VALUES(14764545, 'Tom Gargle', 84, 3, 40);

-- Populate Sections
INSERT INTO Sections VALUES(290, 3, 'MAK A1115', '1:30 PM');
INSERT INTO Sections VALUES(331, 2, 'MAK D2110', '3:00 PM');
INSERT INTO Sections VALUES(350, 2, 'MAK A2115', '8:00 AM');
INSERT INTO Sections VALUES(353, 1, 'MAK A1126', '10:00 AM');
INSERT INTO Sections VALUES(353, 2, 'MAK A1118', '2:00 PM');
INSERT INTO Sections VALUES(358, 1, 'Online', 'Async');
INSERT INTO Sections VALUES(458, 1, 'MAK A118', '4:00 PM');
INSERT INTO Sections VALUES(290, 1, NULL, NULL);
INSERT INTO Sections VALUES(353, 3, NULL, NULL);
INSERT INTO Sections VALUES(458, 2, NULL, NULL);

-- Populate Languages
----Kyle
INSERT INTO Languages VALUES('Scheme', 23232323);
INSERT INTO Languages VALUES('C', 23232323);
INSERT INTO Languages VALUES('Java', 23232323);
INSERT INTO Languages VALUES('JavaScript', 23232323);
INSERT INTO Languages VALUES('Python', 23232323);
INSERT INTO Languages VALUES('Ruby', 23232323);
INSERT INTO Languages VALUES('C#', 23232323);
----Skyler
INSERT INTO Languages VALUES('C', 56543245);
INSERT INTO Languages VALUES('C++', 56543245);
INSERT INTO Languages VALUES('C#', 56543245);
----Jazz
INSERT INTO Languages VALUES('C', 09384543);
INSERT INTO Languages VALUES('Java', 09384543);
INSERT INTO Languages VALUES('Rust', 09384543);
----Andrew
INSERT INTO Languages VALUES('C', 12131415);
INSERT INTO Languages VALUES('Java', 12131415);
INSERT INTO Languages VALUES('Ruby', 12131415);
----Justin
INSERT INTO Languages VALUES('C', 34474039);
INSERT INTO Languages VALUES('Rust', 34474039);
INSERT INTO Languages VALUES('Ruby', 34474039);
INSERT INTO Languages VALUES('C++', 34474039);
INSERT INTO Languages VALUES('Java', 34474039);
---Other
INSERT INTO Languages VALUES('Java', 13467899);
INSERT INTO Languages VALUES('Rust', 87432445);
INSERT INTO Languages VALUES('Python', 87432445);
INSERT INTO Languages VALUES('C', 20983432);
INSERT INTO Languages VALUES('C++', 20983432);
INSERT INTO Languages VALUES('C#', 20983432);
INSERT INTO Languages VALUES('Java', 20983432);
INSERT INTO Languages VALUES('JavaScript', 20983432);
INSERT INTO Languages VALUES('Python', 20983432);

-- Populate Teaches
INSERT INTO Teaches VALUES(11111111, 290, 1);
INSERT INTO Teaches VALUES(11111111, 458, 3);
INSERT INTO Teaches VALUES(2222222, 290, 1);
INSERT INTO Teaches VALUES(3333333, 331, 1);
INSERT INTO Teaches VALUES(4444444, 350, 2);
INSERT INTO Teaches VALUES(11223344, 353, 3);
INSERT INTO Teaches VALUES(11223344, 290, 3);
INSERT INTO Teaches VALUES(55567892, 290, 1);
INSERT INTO Teaches VALUES(20304050, 353, 2);
INSERT INTO Teaches VALUES(56565656, 350, 1);
INSERT INTO Teaches VALUES(56565656, 358, 1);
INSERT INTO Teaches VALUES(56565656, 331, 1);
INSERT INTO Teaches VALUES(17895345, 358, 2);
INSERT INTO Teaches VALUES(09090943, 353, 1);

-- Populate Takes
INSERT INTO Takes VALUES(23232323, 3, 290, 'A');
INSERT INTO Takes VALUES(87432445, 1, 458, 'B+');
INSERT INTO Takes VALUES(56543245, 2, 331, 'A');
INSERT INTO Takes VALUES(13467899, 1, 358, 'C');
INSERT INTO Takes VALUES(09384543, 2, 350, 'A');
INSERT INTO Takes VALUES(20983432, 1, 353, 'B');
INSERT INTO Takes VALUES(12131415, 1, 353, 'A');
INSERT INTO Takes VALUES(14764545, 3, 290, 'F');
INSERT INTO Takes VALUES(34474039, 2, 353, 'A-');

-- Populate Part_Of -- (currID, s_gnumber)
INSERT INTO Part_Of VALUES(10, 23232323);
INSERT INTO Part_Of VALUES(30, 56543245);
INSERT INTO Part_Of VALUES(20, 09384543);
INSERT INTO Part_Of VALUES(40, 12131415);
INSERT INTO Part_Of VALUES(10, 34474039);
INSERT INTO Part_Of VALUES(30, 13467899);
INSERT INTO Part_Of VALUES(40, 87432445);
INSERT INTO Part_Of VALUES(20, 20983432);
INSERT INTO Part_Of VALUES(10, 14764545);

-- Populate Makes_Up
INSERT INTO Makes_Up VALUES(10, 290, 1);
INSERT INTO Makes_Up VALUES(10, 331, 0);
INSERT INTO Makes_Up VALUES(10, 458, 1);
INSERT INTO Makes_Up VALUES(20, 458, 1);
INSERT INTO Makes_Up VALUES(20, 331, 1);
INSERT INTO Makes_Up VALUES(20, 350, 0);
INSERT INTO Makes_Up VALUES(20, 353, 1);
INSERT INTO Makes_Up VALUES(30, 350, 0);
INSERT INTO Makes_Up VALUES(40, 353, 1);
INSERT INTO Makes_Up VALUES(40, 358, 1);


---- End of Populating Database ----

SET FEEDBACK ON
COMMIT;

---- Select Statements to View Tables ----
SELECT * FROM Professors;
SELECT * FROM Courses;
SELECT * FROM Students;
SELECT * FROM Sections;
SELECT * FROM Curriculum;
SELECT * FROM Languages;
SELECT * FROM Teaches;
SELECT * FROM Takes;
SELECT * FROM Part_Of;
SELECT * FROM Makes_Up;

---- SQL Queries ----

-- Query 1: A join involving at least 4 relations


-- Query 2: A self-join
---- Find pairs of students in the same year that are juniors or above
SELECT S1.s_gnumber, S1.s_name, S2.s_gnumber, S2.s_name
FROM Students S1, Students S2
WHERE S1.s_standing > 2
      AND S1.s_standing = S2.s_standing
      AND S1.s_gnumber < S2.s_gnumber;


-- Query 3: Union, Intersect, and/or Minus
---- Find the gnumber and name of students who are named Andrew or are seniors
SELECT s_gnumber, s_name
FROM Students
WHERE s_name LIKE 'Andrew%'
UNION
SELECT s_gnumber, s_name
FROM Students
WHERE s_standing = 4;


-- Query 4: Sum, Avg, Max, and/or Min
---- Find the maximum number of credits of all students
SELECT MAX(s_credits) AS MaxCredits
FROM Students;


-- Query 5: Group By, Having, and Order By Query
---- Find all curriculums that have at least 2 students
SELECT S.s_curriculum, C.curr_name, COUNT(*)
FROM Curriculum C, Students S
WHERE S.s_curriculum = C.currID
GROUP BY S.s_curriculum, C.curr_name
HAVING COUNT(*) > 1
ORDER BY S.s_curriculum;


-- Query 6: A Correlated Subquery
---- Find all courses that have a section without a room assigned
SELECT C.course_name
FROM Courses C
WHERE C.course_id IN (SELECT S.course_num
		FROM Sections S
		WHERE S.course_num = C.course_id
		AND S.room IS NULL);


-- Query 7: A Non-Correlated Subquery
---- Find all students with at least 120 credits in the Computer Science curriculum
SELECT S.s_gnumber, S.s_name, S.s_credits
FROM Students S
WHERE S.s_credits > 120
      AND S.s_curriculum IN (SELECT Cu.currID
                            FROM Curriculum Cu
                            WHERE Cu.currID = 10);


-- Query 8: A Relational Division Query
---- 


-- Query 9: An Outer Join Query
---- Find the course name and id for every course. Also show the sections for each course
SELECT C.course_name, C.course_id, S.section_num
FROM Courses C LEFT OUTER JOIN Sections S ON (C.course_id = S.course_num);


---- Testing of Constraints ----

-- Testing <p_key>
INSERT INTO Sections VALUES(378, NULL, 'MAK A1105', '8:30 AM');

-- Testing <f0>
INSERT INTO Students VALUES(12144623, 'Natalie Kline', 90, 3, 80);

-- Testing <one_att>
INSERT INTO Courses VALUES(287, 'George Has Fun', 6);

-- Testing <two_one>
INSERT INTO Students VALUES(12144623, 'Natalie Kline', 400, 3, 10);

---- End of Testing Constraints ----

COMMIT;
SPOOL OFF
