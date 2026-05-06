-- queries.sql contient les requêtes SELECT pour récupérer certaines données de la base

-- Dernière étape, récupérer les données. Écris les requêtes SQL de sélection suivantes :

-- [ ] Récupérer la liste des thèmes
SELECT themes.name FROM themes;

-- [ ] Récupérer toutes les ressources triées par date de mise à jour
SELECT * FROM resources ORDER BY updated_at DESC;

-- [ ] Récupérer uniquement le nom et l'url des ressources de type exercice
SELECT resources.title, resources.url FROM resources WHERE type = 'exercice';

-- [ ] Récupérer le titre et la description des ressources d'Ada uniquement
SELECT resources.title FROM resources WHERE is_ada = TRUE;

-- [ ] Récupérer les ressources qui ont la compétence JavaScript associée
-- JOIN = INNER JOIN sous entendu
-- ici on ne peut pas directement relié resources à skills donc on doit passer par resources_skills (table de liaison)
SELECT resources.title FROM resources
JOIN resources_skills ON resources.id = resources_skills.resource_id
JOIN skills ON resources_skills.skill_id = skills.id
WHERE skills.name ILIKE 'JavaScript';

-- [ ] Récupérer les ressources dont le titre contient le mot "react" (avec ou sans majuscules)
SELECT resources.title FROM resources WHERE title ILIKE '%react%';

-- [ ] Récupérer la liste des thèmes avec le nombre de ressources par thème
SELECT themes.name, COUNT(resources.id) AS nb_of_resources FROM themes
JOIN resources ON resources.theme_id = themes.id
GROUP BY themes.name;

-- [ ] Récupérer le nom et l'url de toutes les ressources avec un tableau/liste contenant l'ensemble de leurs skills associés

SELECT resources.title, resources.url, STRING_AGG(skills.name, ', ') AS skills FROM resources
JOIN resources_skills ON resources.id = resources_skills.resource_id
JOIN skills ON resources_skills.skill_id = skills.id
GROUP BY resources.title, resources.url;

-- [ ] Récupérer les 5 ressources les plus récentes avec leur thème (ici 3 car je n'ai que 4 ressources et màj d'un statut pour avoir une date différente)

UPDATE resources SET is_ada = TRUE, updated_at = NOW() WHERE resources.id = 3;

SELECT resources.updated_at, resources.title, themes.name FROM resources
JOIN themes ON themes.id = resources.theme_id
ORDER BY resources.updated_at DESC
LIMIT 3;

-- [ ] Récupérer toutes les compétences qui ne sont associées à aucune ressource

INSERT INTO skills (name) VALUES 
('HTML');

SELECT * FROM skills;

SELECT skills.id, skills.name FROM skills
LEFT JOIN resources_skills ON skills.id = resources_skills.skill_id
WHERE resources_skills.skill_id IS NULL;