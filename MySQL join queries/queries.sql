-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT 
`students`.`id`, 
`students`.`name`, 
`students`.`surname`, 
`degrees`.`name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT 
`degrees`.`name`,
`degrees`.`level`, 
`departments`.`name` AS department
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "magistrale";

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT 
`courses`.`id`, 
`courses`.`name` AS course_name, 
`courses`.`description`, 
`teachers`.`name` AS teacher_name, 
`teachers`.`surname` AS teacher_surname
FROM `courses`
INNER JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT 
`students`.`registration_number` AS student_code, 
`students`.`name` AS student_name, 
`students`.`surname` AS student_surname, 
`degrees`.*, 
`departments`.*
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `student_name`, `student_surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT
`degrees`.`name` AS degree_name,
`degrees`.`level`AS degree_level,
`courses`.`name` AS course_name,
`courses`.`description`,
`teachers`.`name` AS teacher_name,
`teachers`.`surname` as teacher_surname
FROM `degrees`
INNER JOIN `courses`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
ORDER BY `degrees`.`name`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT
`teachers`.`name` AS teacher_name,
`teachers`.`surname` AS teacher_surname,
`departments`.`name` AS department_name
FROM `teachers`
INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
ORDER BY `teachers`.`name`;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
