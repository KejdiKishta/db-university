-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`students`.`enrolment_date`) AS year, COUNT(*) AS new_students
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `teachers`.`office_address`, COUNT(*) AS teachers_num
FROM `teachers`
GROUP BY `teachers`.`office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG(`exam_student`.`vote`) AS average_vote
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `degrees`.`department_id`, COUNT(*) AS degrees_num
FROM `degrees`
GROUP BY `degrees`.`department_id`;