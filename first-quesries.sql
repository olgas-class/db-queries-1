-- Seleziona tutti insegnanti
SELECT *
FROM `teachers`;

-- Vedere solo alcune colonne
SELECT `id`, `name`, `surname`
FROM `teachers`;

-- Trovare tutti insegnati che hanno nome Arduino
SELECT *
FROM `teachers`
WHERE `name` = 'arduino';

-- Trovare tutti gli insegnanti che hanno nome Arduino e numero di ufficio maggiore di 100
SELECT *
FROM `teachers`
WHERE `name` = 'arduino'
AND `office_number` > 100;

-- Trovare tutti gli insegnanti che hanno id > 20 e ordinare in modo crescente per numero di ufficio
SELECT *
FROM `teachers`
WHERE `id` > 20
ORDER BY `office_number` ASC;

-- Selezionare tutti i referenti per ogni dipartimento
SELECT `id`, `name`, `head_of_department`
FROM `departments`;

-- Selezionare tutti gli studenti il cui nome inizia per "E"
-- % - wildecard
SELECT *
FROM `students`
WHERE `name` LIKE 'E%'
ORDER BY `name` ASC;

-- Selezionare tutti gli studenti che si sono iscritti nel 2021 (734)
SELECT *
FROM `students`
WHERE `enrolment_date` LIKE '2021-%';

SELECT *
FROM `students`
WHERE `enrolment_date` BETWEEN '2021-01-01' AND '2021-12-31'
ORDER BY `enrolment_date` ASC;

SELECT *
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021
ORDER BY `enrolment_date` ASC;

SELECT `name`, `surname`, YEAR(`enrolment_date`) AS `enrolment_year`
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021
ORDER BY `enrolment_date` ASC;

-- Selezionare tutti i corsi che non hanno un sito web (676)
-- IS NULL
-- IS NOT NULL

SELECT * 
FROM `courses`
WHERE `website` IS NULL;

-- Selezionare tutti gli insegnanti che hanno un numero di telefono (50)
SELECT * 
FROM `teachers`
WHERE `phone` IS NOT NULL;

-- Selezionare tutti gli appelli d'esame dei mesi di giugno e luglio 2020 (2634)
SELECT * 
FROM `exams`
WHERE `date` BETWEEN '2020-06-01' AND '2020-07-31'
ORDER BY `date` ASC;

-- Qual è il numero totale degli studenti iscritti? (5000)
SELECT COUNT(*) AS `num_students`
FROM `students`;