CREATE DATABASE extra_assignment_1_exercise_1;
USE extra_assignment_1_exercise_1;

CREATE TABLE trainees(
	trainee_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    gender TINYINT UNSIGNED,
    et_iq TINYINT UNSIGNED CHECK(et_iq<=20),
    et_gmath TINYINT UNSIGNED CHECK(et_gmath<=20),
    et_english TINYINT UNSIGNED CHECK(et_english<=50),
    training_class VARCHAR(50) NOT NULL,
    evaluation_notes TEXT,
    vti_account VARCHAR(255) NOT NULL UNIQUE
);