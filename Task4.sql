SELECT (
           SELECT date_part('month', vacancy_date) AS month_with_most_vacancies
           FROM vacancy
           GROUP BY date_part('month', vacancy_date)
           ORDER BY count(*) DESC
           LIMIT 1
),
       (
           SELECT date_part('month', resume_date) AS month_with_most_resumes
           FROM resume
           GROUP BY date_part('month', resume_date)
           ORDER BY count(*) DESC
           LIMIT 1
);
