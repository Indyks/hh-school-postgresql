DROP TABLE vacancy CASCADE;
DROP TABLE employer CASCADE;
DROP TABLE area CASCADE;
DROP TABLE applicant CASCADE;
DROP TABLE response CASCADE;
DROP TABLE resume CASCADE;
DROP TABLE specialization CASCADE;

CREATE TABLE area (
    area_id SERIAL PRIMARY KEY,
    area_name TEXT NOT NULL
);

CREATE TABLE employer (
    employer_id SERIAL PRIMARY KEY,
    employer_name TEXT NOT NULL,
    area_id INTEGER NOT NULL REFERENCES area (area_id)
);

CREATE TABLE applicant (
    applicant_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    middle_name TEXT NOT NULL,
    birth DATE,
    area_id INTEGER NOT NULL REFERENCES area (area_id)
);

CREATE TABLE specialization (
    specialization_id SERIAL PRIMARY KEY,
    specialization_name TEXT NOT NULL
);

CREATE TABLE vacancy (
    vacancy_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    vacancy_date DATE NOT NULL,
    employer_id INTEGER NOT NULL REFERENCES employer (employer_id),
    compensation_from INTEGER,
    compensation_to INTEGER,
    compensation_gross BOOLEAN,
    specialization_id INTEGER NOT NULL REFERENCES specialization (specialization_id),
    contacts TEXT NOT NULL
);

CREATE TABLE resume (
    resume_id SERIAL PRIMARY KEY,
    applicant_id INTEGER NOT NULL REFERENCES applicant (applicant_id),
    title TEXT NOT NULL,
    resume_date DATE NOT NULL,
    specialization_id INTEGER NOT NULL REFERENCES specialization (specialization_id),
    description TEXT,
    desired_compensation INTEGER,
    contacts TEXT NOT NULL
);

CREATE TABLE response (
    response_id SERIAL PRIMARY KEY,
    response_date DATE NOT NULL,
    resume_id INTEGER NOT NULL REFERENCES resume (resume_id),
    vacancy_id INTEGER NOT NULL REFERENCES vacancy (vacancy_id)
);
