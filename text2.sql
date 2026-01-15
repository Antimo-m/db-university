 --non funziona piu il tasto per i backtick, oggi faremo senza 😂

 
--1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM students
INNER JOIN degrees
ON degrees.id = students.degree_id
WHERE degrees.name = "Corso di Laurea in Economia"


--2.Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM degrees
INNER JOIN departments
ON departments.id = degrees.department_id
WHERE departments.name = "Dipartimento di Neuroscienze" 
AND degrees.level = "magistrale"


--3.Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.name AS "Nome Corso", courses.id AS "Id del Corso", teachers.name, teachers.surname
FROM courses 
INNER JOIN course_teacher
ON courses.id = course_teacher.course_id
INNER JOIN teachers
ON teachers.id = course_teacher.teacher_id
WHERE teachers.id = 44
ORDER BY courses.name

--4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.name, students.surname, degrees.name AS "Corso di Laurea seguito", departments.name AS "departimento associato"
FROM departments
INNER JOIN degrees
ON departments.id = degrees.department_id
INNER JOIN students
ON degrees.id = students.degree_id

--5.Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS "Corsi di Laurea", courses.name AS "Corso da seguire", teachers.name AS "Nome Insegnante", teachers.surname AS "Cognome dell'insegnate"
FROM degrees
INNER JOIN courses
ON degrees.id = courses.degree_id
INNER JOIN course_teacher
ON courses.id = course_teacher.course_id
INNER JOIN teachers
ON teachers.id = course_teacher.teacher_id
ORDER BY degrees.name


--6.Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT departments.name AS "Nome dipartimento", teachers.name AS "Nome insegnante", teachers.surname AS "Cognome dell insegnante"
FROM teachers
INNER JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
INNER JOIN courses
ON courses.id = course_teacher.course_id
INNER JOIN degrees
ON degrees.id = courses.degree_id
INNER JOIN departments
ON departments.id = degrees.department_id
WHERE departments.name = "Dipartimento di Matematica"
ORDER BY teachers.name

--7.BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami  
SELECT students.id AS "ID Studente", students.name, students.surname, courses.name AS "Nome Esame", COUNT(*) AS "TENTATIVI"
FROM students
INNER JOIN exam_student
ON students.id = exam_student.student_id
iNNER JOIN exams
ON exams.id = exam_student.exam_id
INNER JOIN courses
ON courses.id = exams.course_id
GROUP BY students.id, students.name, students.surname, courses.name
ORDER BY students.id


