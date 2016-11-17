\connect django

CREATE SCHEMA IF NOT EXISTS education;

CREATE TABLE IF NOT EXISTS education.performance (
	district_id INTEGER NOT NULL,
	district VARCHAR(32) NOT NULL,
	school_id INTEGER NOT NULL,
	school VARCHAR(65) NOT NULL,
	academic_year INTEGER NOT NULL,
	subject VARCHAR(21) NOT NULL,
	subgroup VARCHAR(32) NOT NULL,
	grade_level VARCHAR(3) NOT NULL,
	participation_rate_2014_to_2015 FLOAT,
	percentage_meets_or_exceeds_2014_to_2015 FLOAT
);

CREATE TABLE IF NOT EXISTS education.schools (
	school_id INTEGER NOT NULL,
	school VARCHAR(60) NOT NULL,
	district VARCHAR(46) NOT NULL,
	dist_id INTEGER NOT NULL
);

COPY education.performance
FROM '/home/vagrant/proj/edu_test/pg/performance.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',');

COPY education.schools
FROM '/home/vagrant/proj/edu_test/pg/schools.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',');

INSERT INTO public.edu_data_performance (
	district_id,
	district,
	school_id,
	school,
	academic_year,
	subject,
	subgroup,
	grade_level,
	participation_rate_2014_to_2015,
	percentage_meets_or_exceeds_2014_to_2015
)
SELECT * FROM education.performance;

INSERT INTO public.edu_data_school (
	school_id,
	school,
	district,
	dist_id
)
SELECT * FROM education.schools;

