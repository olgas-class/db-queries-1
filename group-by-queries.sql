-- Contare i corsi raggruppati per cfu

SELECT `cfu`, COUNT(*) AS `num_corsi`
FROM `courses`
GROUP BY `cfu`;

-- Contare gli studenti raggruppati per anno di nascita
SELECT COUNT(*) as `num_students`, YEAR(`date_of_birth`) as `year_of_birth`
FROM `students`
GROUP BY YEAR(`date_of_birth`);


-- 3. Selezionare il voto più basso dato ad ogni appello d'esame
SELECT `exam_id`, MIN(`vote`) as `voto_minimo`
FROM `exam_student`
GROUP BY `exam_id`;

-- Contare gli appelli d'esame del mese di luglio raggruppati per giorno
SELECT DAY(`date`), COUNT(*) as `num_exams`
FROM `exams`
WHERE MONTH(`date`) = 7
GROUP BY DAY(`date`);