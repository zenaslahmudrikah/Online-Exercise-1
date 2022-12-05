-- create a table
CREATE TABLE students (
  student_id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(30) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE classroom (
  classroom_id INT NOT NULL,
  student_id INTEGER PRIMARY KEY
);

-- insert some values
INSERT INTO students VALUES (1, 'john', 15);
INSERT INTO students VALUES (2, 'marqueez', 16);
INSERT INTO students VALUES (3, 'chip', 14);
INSERT INTO students VALUES (4, 'marley', 14);

INSERT INTO classroom VALUES (123,1);
INSERT INTO classroom VALUES (234,2);
INSERT INTO classroom VALUES (123,4);

-- question 1.A
SELECT classroom_id FROM classroom
WHERE classroom_id IS NULL;

-- question 1.B
SELECT name,classroom_id from students
INNER JOIN classroom
ON student.student_id = classroom.student_id

-- question 1.C
SELECT name,
CASE
    WHEN age>15 then 'SMA'
    ELSE 'SMP'
END AS Kelompok,
COUNT(*) AS Jumlah
FROM students
GROUP BY Kelompok;

-- question 1.D
SELECT student_id,name,age
FROM students
ORDER BY age DESC
LIMIT 1;

-- question 1.E
SELECT student_id,name,age,SUM(age) OVER (ORDER BY student_id) AS cumulative_age
FROM students;

-- question 1.F 
-- tabel student berisikan daftar nama setiap siswa dan usianya, table classroom berisi daftar nama kelas dan siswanya
-- antara tabel student dan table classroom dihubungkan dengan student_id
-- dari kedua tabel tersebut dapat dihitung berapa proporsi atau dalam persentase banyaknya siswa dalam setiap kelas
-- berapa banyak jumlah siswa dalam setiap kelas
-- usia siswa tertua dalam setiap kelas
-- rata-rata usia siswa dalam setiap kelas
