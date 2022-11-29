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
---< The SQL/DDL code that creates your schema >
---In the DDL, every IC must have a unique name; e.g. IC5, IC10, IC15, etc.
--
SET FEEDBACK OFF
--< The INSERT statements that populate the tables>
---Important: Keep the number of rows in each table small enough so that the results of your
---queries can be verified by hand. See the Sailors database as an example.

DROP TABLE Professors;
DROP TABLE Courses;
DROP TABLE Students;
DROP TABLE Sections;
DROP TABLE Curriculum;
DROP TABLE Languages;
DROP TABLE Teaches;
DROP TABLE Takes;
DROP TABLE Part_Of;
DROP TABLE Makes_Up;



CREATE TABLE Professors (
    p_gnumber INTEGER PRIMARY KEY,
    p_email CHAR(25)  NOT NULL,
    p_position INTEGER NOT NULL,
    p_name CHAR(25) NOT NULL


);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name CHAR(25) NOT NULL,
    num_credits INTEGER NOT NULL
);

CREATE TABLE Students (
    s_gnumber INTEGER PRIMARY KEY,
    s_name CHAR(25) NOT NULL,
    s_credits INTEGER NOT NULL
);

CREATE TABLE Sections (
    course_num INTEGER,
    section_num INTEGER,
    room CHAR(10),
    sec_time char(25),

    PRIMARY KEY(course_num, section_num),
    CONSTRAINT f1 FOREIGN KEY (course_num) REFERENCES Courses(course_id)
    
);

CREATE TABLE Curriculum (
    currID INTEGER PRIMARY KEY,
    curr_name CHAR(25) NOT NULL,
    credit_hours INTEGER NOT NULL
);

CREATE TABLE Languages (
    lang CHAR(15),
    l_gnumber INTEGER,
    
    PRIMARY KEY(lang, l_gnumber)
);

CREATE TABLE Teaches (
    t_gnumber INTEGER,
    t_course_num INTEGER,
    preference INTEGER,
    
    PRIMARY KEY(t_gnumber, t_course_num)
);

CREATE TABLE Takes (
    gnum INTEGER,
    sec_num INTEGER,
    grade CHAR(25),

    PRIMARY KEY(gnum, sec_num)
);

CREATE TABLE Part_Of (
    curr_id INTEGER,
    gnumber INTEGER,
    status CHAR(25),
    PRIMARY KEY(curr_id, gnumber)
);

CREATE TABLE Makes_Up (
    curr_num INTEGER,
    course_number INTEGER,
    ---req BOOLEAN NOT NULL,

    PRIMARY KEY(curr_num, course_number)
);


INSERT INTO Professors VALUES(11111111, 'adamsr@gvsu.edu', 1, 'Robert Adams');
INSERT INTO Professors VALUES(2222222,'alsabbaj@gvsu.edu', 1, 'Jamal Alsabbagh');
INSERT INTO Professors VALUES(3333333, 'bhusevji@gvsu.edu', 1, 'Vijay Bhuse');
INSERT INTO Professors VALUES(4444444, 'bobeldyd@gvsu.edu', 1, 'Denton Bobeldyk');
INSERT INTO Professors VALUES(12345678, 'boitj@gvsu.edu', 1, 'Sorio Boit');
INSERT INTO Professors VALUES(11223344, 'bowmnath@gvsu.edu', 1, 'Nathaniel Bowman');
INSERT INTO Professors VALUES(99887766, 'caox@gvsu.edu', 1, 'Xiang Cao');
INSERT INTO Professors VALUES(55567892, 'carrieer@gvsu.edu', 1, 'Erin Carrier');
INSERT INTO Professors VALUES(90045564, 'debruinz@gvsu.edu', 1, 'Zachary DeBruine');
INSERT INTO Professors VALUES(17193040, 'devrieby@gvsu.edu', 1, 'Byron DeVries');
INSERT INTO Professors VALUES(20304050, 'dowlinmi@gvsu.edu', 1, 'Michelle Dowling');
INSERT INTO Professors VALUES(98654321, 'dujie@gvsu.edu', 1, 'Jie Du');
INSERT INTO Professors VALUES(56565656, 'dulimarh@gvsu.edu', 1, 'Hans Dulimarta');
INSERT INTO Professors VALUES(17895345, 'elsaidm@gvsu.edu', 1, 'Mostafa El-Said');
INSERT INTO Professors VALUES(09090943, 'kurmasz@gvsu.edu', 1, 'Zachary Kurmas');



INSERT INTO Students VALUES(23232323, 'Kyle Taylor', 113);
INSERT INTO Students VALUES(56543245, 'Skyler Ruiter', ???);
INSERT INTO Students VALUES(09384543, 'Jazzmin Finney', ???);
INSERT INTO Students VALUES(12131415, 'Andrew Goodling', ???);
INSERT INTO Students VALUES(34474039, 'Justin Johnson', ???);
INSERT INTO Students VALUES(34474039, 'Janice Harold', 109);
INSERT INTO Students VALUES(87432445, 'Hunter Bolt', 100);
INSERT INTO Students VALUES(20983432, 'Paula Shargaloo', 94);
INSERT INTO Students VALUES(14764545, 'Tom Gargle', 112);

----Kyle
INSERT INTO Languages VALUES('Sheme', 23232323);
INSERT INTO Languages VALUES('C', 23232323);
INSERT INTO Languages VALUES('Java', 23232323);
INSERT INTO Languages VALUES('JavaScript', 23232323);
INSERT INTO Languages VALUES('Python', 23232323);
INSERT INTO Languages VALUES('Ruby', 23232323);
INSERT INTO Languages VALUES('C#', 23232323);
----Skyler
INSERT INTO Languages VALUES('C', 56543245);
----Jazz
INSERT INTO Languages VALUES('C', 09384543);
----Andrew
INSERT INTO Languages VALUES('C', 12131415);
----Justin
INSERT INTO Languages VALUES('C', 34474039);

INSERT INTO Languages VALUES('Rust', 34474039);
INSERT INTO Languages VALUES('Ruby', 34474039);
INSERT INTO Languages VALUES('C++', 34474039);
INSERT INTO Languages VALUES('Java', 34474039);
INSERT INTO Languages VALUES('Rust', 87432445);
INSERT INTO Languages VALUES('Python', 87432445);
INSERT INTO Languages VALUES('C', 20983432);
INSERT INTO Languages VALUES('C++', 20983432);
INSERT INTO Languages VALUES('C#', 20983432);
INSERT INTO Languages VALUES('Java', 20983432);
INSERT INTO Languages VALUES('JavaScript', 20983432);
INSERT INTO Languages VALUES('Python', 20983432);
--- INSERT INTO Languages VALUES('C', 14764545); --- Remove this if Languages allows for NULL





SELECT *
FROM Professors;

SET FEEDBACK ON
COMMIT;
--
---< One query (per table) of the form: SELECT * FROM table; in order to display your database >
--
---< The SQL queries>. Include the following for each query:
--- A comment line stating the query number and the feature(s) it demonstrates
---(e.g. -- Q25 – correlated subquery).
--- A comment line stating the query in English.
--- The SQL code for the query.
--
---< The insert/delete/update statements to test the enforcement of ICs >
---Include the following items for every IC that you test (Important: see the next section titled
---“Submit a final report” regarding which ICs you need to test).
--- A comment line stating: Testing: < IC name>
--- A SQL INSERT, DELETE, or UPDATE that will test the IC.
COMMIT;
--
SPOOL OFF
