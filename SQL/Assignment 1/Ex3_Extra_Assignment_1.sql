CREATE DATABASE extra_assignment_1_exercise_3;
USE extra_assignment_1_exercise_3;

CREATE TABLE demo_table_ex_3(
	id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    birth_date DATE,
    gender TINYINT UNSIGNED,
    is_deleted_flag BOOLEAN
);