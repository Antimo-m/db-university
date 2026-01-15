--1.Selezionare tutti gli studenti nati nel 1990 (160)
SELECT COUNT(*)
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990 (160)

--2.Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT COUNT(*) AS "RISULTATO"
FROM `courses`
WHERE (`cfu`) > 10

--3.Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *, TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS "AGE"--sezione age
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30; --grazie alla ricerca, la lista delle persone con età > 30 con la sezione age, 

SELECT COUNT(*) AS "RISULTATO"
FROM `students` 
WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30 --il risultato in count(3803)

--4.Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT COUNT(*) AS "RISULTATO"
FROM `courses`
WHERE (`period`) =  "I semestre" AND YEAR = 1

--5.Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT COUNT(*) AS "RISULTATO"
FROM `exams`
WHERE date = '2020-06-20' AND `hour` > '14:00:01'--qui oltre che scrivere i minuti e secondi possiamo aggiungere la %

--6.Selezionare tutti i corsi di laurea magistrale (38)
SELECT COUNT(*) AS "N_CORSI_MAGISTRALI"
FROM `degrees`
WHERE `level` = "magistrale"

--7.Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS "DIPARTIMENTO_D'UNIVERSITA" 
FROM `departments`

--8.Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS "RISULTATO"
FROM `teachers`
WHERE `phone` IS NULL



--BONUS

--1.Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) As "anno", COUNT(*) AS "iscritti"
FROM `students`
GROUP BY YEAR(enrolment_date)
ORDER BY anno

--2.Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(*) AS "numero_insegnanti"
FROM `teachers`
GROUP BY `office_address`
ORDER BY numero_insegnanti DESC

--3.Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG(`vote`) 
FROM `exam_student`
GROUP BY `exam_id`

--4.Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(*) AS "NUMERO DI CORSI"
FROM `degrees`
GROUP BY `department_id`