-- 1.Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE `date_of_birth`
LIKE "1990%";

SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = "1990";

SELECT *
FROM `students`
WHERE `date_of_birth`
BETWEEN "1990-01-01" AND "1990-12-31";

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE YEAR(CURRENT_DATE) - YEAR(`date_of_birth`) > 30;

-- più preciso
-- SPIEGAZIONE:
-- 1. NOW() ci permette di ottenere la data odierna
-- 2. DATEDIFF ci permette di ottenere la differenza in giorni tra 2 date
-- 3. FROM_DAYS usato per ottenere i giorni di differenza in formato data, ad esempio 18615 giorni equivalgono a 0051-01-01 perchè sono 51 anni
-- 4. DATE_FORMAT usato per prendere solo l'anno dalla data ottenuta
-- 5. + 0 invece serve a trasformare la stringa con il risultato in numero in modo da togliere gli zeri di troppo 
SELECT `id`, `name`, `date_of_birth`, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), `date_of_birth`)), '%Y') + 0 AS `age`
FROM `students`;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM `courses`
WHERE `period` = "I semestre"
AND `year`= "1";

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `date` = "2020-06-20"
AND HOUR(`hour`) > "13";

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`) AS `departments_number`
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`) AS `teachers_number`
FROM `teachers`
WHERE `phone` IS NULL;

-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
INSERT INTO `students` (`degree_id`, `name`, `surname`, `date_of_birth`, `fiscal_code`, `enrolment_date`, `registration_number`, `email`)
VALUES ("1", "Kejdi", "Kishta", "2001-11-11", "KSHKJD01S11A479T", "2024-05-29", "620032", "kishtakejdi@gmail.com");

-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE `teachers`
SET `office_number` = "126"
WHERE `name` = "Pietro"
AND `surname` = "Rizzo";

-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM `students`
WHERE `id` = 5001;