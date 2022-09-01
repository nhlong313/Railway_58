CREATE DATABASE testing_system_assignment_1;
USE testing_system_assignment_1;

CREATE TABLE departments(
	department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL
);

CREATE TABLE positions(
	position_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name ENUM('Dev','Test','Scrum','Master','PM')
);

CREATE TABLE accounts(
	account_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    department_id INT UNSIGNED NOT NULL,
    position_id INT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW()
);

CREATE TABLE `groups`(
	group_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL,
    create_id INT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW()
);

CREATE TABLE group_accounts(
	group_id INT UNSIGNED NOT NULL,
    account_id INT UNSIGNED NOT NULL,
	join_date DATETIME DEFAULT NOW()
);

CREATE TABLE type_questions(
	type_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay','Multiple-Choice') NOT NULL
);

CREATE TABLE category_questions(
	category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name ENUM('Java','.NET','SQL','Postman','Ruby') NOT NULL
);

CREATE TABLE questions(
	question_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content LONGTEXT NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    type_id INT UNSIGNED NOT NULL,
    creator_id INT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW()
);

CREATE TABLE answers(
	answer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content LONGTEXT,
    question_id INT UNSIGNED NOT NULL,
	is_correct BOOLEAN NOT NULL
);

CREATE TABLE exams(
	exam_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(5) NOT NULL,
    title TEXT NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    duration TIME NOT NULL,
    creator_id INT UNSIGNED NOT NULL,
    create_date DATETIME DEFAULT NOW()
);

CREATE TABLE exam_questions(
	exam_id INT UNSIGNED NOT NULL,
    question_id INT UNSIGNED NOT NULL
);

ALTER TABLE accounts ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE accounts ADD FOREIGN KEY (position_id) REFERENCES positions(position_id);

ALTER TABLE group_accounts ADD PRIMARY KEY (group_id,account_id);
ALTER TABLE group_accounts ADD FOREIGN KEY (group_id) REFERENCES `groups`(group_id);
ALTER TABLE group_accounts ADD FOREIGN KEY (account_id) REFERENCES accounts(account_id);

ALTER TABLE questions ADD FOREIGN KEY (category_id) REFERENCES category_questions(category_id);
ALTER TABLE questions ADD FOREIGN KEY (type_id) REFERENCES type_questions(type_id);

ALTER TABLE answers ADD FOREIGN KEY (question_id) REFERENCES questions(question_id);

ALTER TABLE exams ADD FOREIGN KEY (category_id) REFERENCES category_questions(category_id);

ALTER TABLE exam_questions ADD PRIMARY KEY (exam_id,question_id);
ALTER TABLE exam_questions ADD FOREIGN KEY (exam_id) REFERENCES exams(exam_id);
ALTER TABLE exam_questions ADD FOREIGN KEY (question_id) REFERENCES questions(question_id);
