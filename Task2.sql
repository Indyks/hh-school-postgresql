DELETE FROM response;
DELETE FROM resume;
DELETE FROM applicant;
DELETE FROM vacancy;
DELETE FROM employer;
DELETE FROM area;
DELETE FROM specialization;
--Везде заполняю первичные ключи вручную, поскольку нужно точно знать, какие id присутствуют в таблице, чтобы ссылаться на них
WITH test_data(id) AS (
    SELECT generate_series(1, 1000) AS id
)
INSERT INTO area(area_id, area_name)
SELECT
       id,
       concat('area', cast(id AS TEXT))
FROM test_data;

WITH test_data(id) AS (
    SELECT generate_series(1, 1000) AS id
)
INSERT INTO employer(employer_id,
                     employer_name,
                     area_id)
SELECT
       id,
       concat('employer', cast(id AS TEXT)),
       (random() * 999 + 1)::INTEGER
FROM test_data;

WITH test_data(id) AS (
    SELECT generate_series(1, 10000) AS id
)
INSERT INTO applicant(applicant_id,
                      first_name,
                      second_name,
                      middle_name,
                      birth,
                      area_id)
SELECT
       id,
       concat('first_name', cast(id AS TEXT)),
       concat('second_name', cast(id AS TEXT)),
       concat('middle_name', cast(id AS TEXT)),
       to_timestamp(316310417 + random() * 756863988),
       (random() * 999 + 1)::INTEGER
FROM test_data;

WITH test_data(id) AS (
    SELECT generate_series(1, 1000) AS id
)
INSERT INTO specialization(specialization_id,
                           specialization_name)
SELECT
       id,
       concat('specialization', cast(id AS TEXT))
FROM test_data;

WITH test_data(id) AS (
    SELECT
           generate_series(1, 10000) AS id,
           round((random() * 80000 + 20000)::INTEGER, -3) AS salary
)
INSERT INTO vacancy(vacancy_id,
                    title,
                    vacancy_date,
                    employer_id,
                    compensation_from,
                    compensation_to,
                    compensation_gross,
                    specialization_id,
                    contacts)
SELECT
       id,
       concat('title', cast(id AS TEXT)),
       to_timestamp(1388534400 + random() * 252287996),
       (random() * 999 + 1)::INTEGER,
       salary,
       salary + round((random() * 9999)::INTEGER, -3),
       random() > 0.5,
       (random() * 999 + 1)::INTEGER,
       concat('contacts', cast(id AS TEXT))
FROM test_data;

WITH test_data(id) AS (
    SELECT generate_series(1, 100000) AS id
)
INSERT INTO resume(resume_id,
                   applicant_id,
                   title,
                   resume_date,
                   specialization_id,
                   description,
                   desired_compensation,
                   contacts)
SELECT
       id,
       (random() * 9999 + 1)::INTEGER,
       concat('title', cast(id AS TEXT)),
       to_timestamp(1388534400 + random() * 252287996),
       (random() * 999 + 1)::INTEGER,
       concat('description', cast(id AS TEXT)),
       round((random() * 80000 + 20000)::INTEGER, -3),
       concat('contacts', cast(id AS TEXT))
FROM test_data;

WITH test_data(id) AS (
    SELECT
           generate_series(1, 100000) AS id,
           (random() * 9999 + 1)::INTEGER AS vacancy_id
)
INSERT INTO response(response_id,
                     vacancy_id,
                     resume_id,
                     response_date)
SELECT
       id,
       v.vacancy_id,
       (random() * 99999 + 1)::INTEGER,
       vacancy_date + (random() * 30) * INTERVAL '1 day'
FROM test_data t
LEFT JOIN vacancy v ON v.vacancy_id = t.vacancy_id;
