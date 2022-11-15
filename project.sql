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

    PRIMARY KEY(course_num, section_num)
);

CREATE TABLE Curriculum (
    currID INTEGER PRIMARY KEY,
    curr_name CHAR(25) NOT NULL,
    credit_hours INTEGER NOT NULL
);

CREATE TABLE Languages (
    lang CHAR(15),
    l_gnumber INTEGER
);

CREATE TABLE Teaches (
    t_gnumber INTEGER,
    t_course_num INTEGER,
    preference INTEGER
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

INSERT INTO Professors VALUES(11111111, 'kurmasz@gvsu.edu', 1, 'Zachary Kurmas');

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
