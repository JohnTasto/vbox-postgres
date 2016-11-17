CREATE SCHEMA IF NOT EXISTS education;

SET search_path TO education;

CREATE TABLE IF NOT EXISTS performance (
	DistrictID INTEGER NOT NULL,
	District VARCHAR(32) NOT NULL,
	SchoolID INTEGER NOT NULL,
	School VARCHAR(65) NOT NULL,
	AcademicYear INTEGER NOT NULL,
	Subject VARCHAR(21) NOT NULL,
	Subgroup VARCHAR(32) NOT NULL,
	GradeLevel VARCHAR(3) NOT NULL,
	ParticipationRate2014to2015 FLOAT,
	PercentageMeetsORExceeds2014to2015 FLOAT
);

CREATE TABLE IF NOT EXISTS schools (
	SchoolID INTEGER NOT NULL,
	School VARCHAR(60) NOT NULL,
	District VARCHAR(46) NOT NULL,
	DistID INTEGER NOT NULL
);

COPY performance
FROM '/home/vagrant/proj/edu_test/pg/performance.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',');

COPY schools
FROM '/home/vagrant/proj/edu_test/pg/schools.csv'
WITH (FORMAT csv, HEADER, DELIMITER ',');
