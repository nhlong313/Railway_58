CREATE DATABASE extra_assignment_1_exercise_2;
USE extra_assignment_1_exercise_2;

CREATE TABLE demo_table_ex_2(
	id MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `code` VARCHAR(5) NOT NULL,
    modified_date DATETIME DEFAULT NOW()
);