SELECT v.vacancy_id, title
FROM vacancy v
LEFT JOIN response r ON v.vacancy_id = r.vacancy_id
WHERE response_date - vacancy_date <= 7
GROUP BY v.vacancy_id, title
HAVING count(*) > 5
ORDER BY v.vacancy_id;
