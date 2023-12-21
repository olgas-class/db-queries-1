-- Selezionare tutti i corsi del Corso di Laurea in Informatica (22)
SELECT *
FROM `courses`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica";

-- 2. Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT `courses`.`name`, `exams`.`date`, `exams`.`hour`, `exams`.`location`
FROM `exams`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
WHERE `courses`.`id` = 144;

-- Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)

SELECT *
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia";

-- Selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno

SELECT *
FROM `exams`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`level` = "magistrale" 
AND `degrees`.`name` = "Corso di Laurea Magistrale in Fisica"
AND `courses`.`year` = 1

-- Trovare tutti gli studenti che non hanno dato nessun exame
SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `exam_student`.`vote`
FROM `students`
LEFT JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
WHERE `exam_student`.`vote` IS NULL


SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `exam_student`.`vote`
FROM `exam_student`
RIGHT JOIN `students`
ON `students`.`id` = `exam_student`.`student_id`
WHERE `exam_student`.`vote` IS NULL

-- 5. Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere (21)

SELECT DISTINCT `teachers`.`id`, `teachers`.`name`, `teachers`.`surname`, `teachers`.`phone`
FROM `teachers`
JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `teachers`.`id`

-- 6. Selezionare il libretto universitario di Mirco Messina (matricola n. 620320)

-- nome esame | data | voto

SELECT `courses`.`name`, `exams`.`date`, `exam_student`.`vote`
FROM `students`
JOIN `exam_student`
ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
WHERE `students`.`registration_number` = 620320
AND `exam_student`.`vote` >= 18

-- Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati del corso di laurea associato, ordinati per media voto decrescente

-- nome corso | nome_degree | voto_medio
SELECT `courses`.`name`, `degrees`.`name`, AVG(`exam_student`.`vote`) AS `vote_avg`
FROM `exam_student`
JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY `vote_avg` DESC;