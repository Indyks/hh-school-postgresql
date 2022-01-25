SELECT area_id,
       round(avg(compensation_from), 0) AS avg_compensation_from,
       round(avg(compensation_to), 0) AS avg_compensation_to,
       round(avg(compensation_to + compensation_from) / 2, 0) AS avg_compensation_from_to
FROM vacancy v
LEFT JOIN employer e ON v.employer_id = e.employer_id
GROUP BY area_id
ORDER BY area_id;
