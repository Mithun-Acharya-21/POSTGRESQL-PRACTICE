SELECT * FROM subjects;
SELECT * FROM staff;
SELECT * FROM classes;

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name VARCHAR(50)
);
CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    age INT,
    staff_type VARCHAR(20)  -- Teaching / Non-Teaching
);

CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(50),
    subject_id INT,
    teacher_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id),
    FOREIGN KEY (teacher_id) REFERENCES staff(staff_id)
);

INSERT INTO subjects (subject_name) VALUES
('Mathematics'),
('Science'),
('Music'),
('English'),
('History');

INSERT INTO staff (first_name, last_name, gender, age, staff_type) VALUES
('John', 'Doe', 'M', 35, 'Teaching'),
('Alice', 'Smith', 'F', 30, 'Teaching'),
('Robert', 'Brown', 'M', 40, 'Teaching'),
('Emma', 'Wilson', 'F', 28, 'Non-Teaching'),
('David', 'Lee', 'M', 45, 'Non-Teaching');

INSERT INTO classes (class_name, subject_id, teacher_id) VALUES
('Grade 8', 1, 1),
('Grade 9', 1, 2),
('Grade 10', 1, 3),
('Grade 7', 3, 2),
('Grade 6', 2, 1);


---fetch all the class name  where music is taught as a subject
SELECT CLASS_NAME
FROM SUBJECTS SUB
JOIN CLASSES CLS ON SUB.SUBJECT_ID = CLS.SUBJECT_ID
WHERE subject_name = 'Music';

--FETCH ALL THE CLASS NAME WHERE SUBJECT SCIENCE IS TAUGHT.

SELECT CLASS_NAME
FROM SUBJECTS SUB
JOIN CLASSES CLS ON SUB.SUBJECT_ID=CLS.SUBJECT_ID
WHERE SUBJECT_NAME= 'Science';


---locally run sql queery in my code editor and connect to postgresql database to fetch the data.
-- FETCH THE FULL NAME OF ALL STAF WHO TEACHES MATHEMATICS
SELECT DISTINCT (STAFF.FIRST_NAME || ' ' || STAFF.LAST_NAME) AS FULL_NAME
FROM SUBJECTS SUB
JOIN CLASSES CLS ON CLS.SUBJECT_ID = SUB.SUBJECT_ID
JOIN STAFF STF ON CLS.TEACHER_ID= STF.STAFF_ID
WHERE SUB.SUBJECT_NAME = 'Mathematics';

