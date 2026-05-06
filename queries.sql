-- queries.sql contient les requêtes SELECT pour récupérer certaines données de la base

-- Dernière étape, récupérer les données. Écris les requêtes SQL de sélection suivantes :

-- [ ] Récupérer la liste des thèmes
SELECT themes.name FROM themes;

-- [ ] Récupérer toutes les ressources triées par date de mise à jour
SELECT * FROM resources ORDER BY updated_at DESC;

-- [ ] Récupérer uniquement le nom et l'url des ressources de type exercice
SELECT title, url FROM resources WHERE type = 'exercice';

-- [ ] Récupérer le titre et la description des ressources d'Ada uniquement
SELECT title, description FROM resources WHERE is_ada = TRUE;

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