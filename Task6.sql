--В таблице response (отклики) определена связь между вакансией и резюме
--Работодатель будет просматривать резюме людей, откликнувшихся на вакансию
--Соискатель будет просматривать вакансии, от которых получил отклик
CREATE INDEX vacancy_response_resume ON response(vacancy_id, resume_id);

--Работодателя в первую очередь интересует резюме по требуемой специализации
CREATE INDEX required_specialization_resume ON resume(specialization_id);

--Соискателя тоже интересует вакансия по своей специализации
CREATE INDEX required_specialization_vacancy ON vacancy(specialization_id);

--Соискателя интересует зарплата
CREATE INDEX vacancy_by_compensation ON vacancy(compensation_from, compensation_to);
