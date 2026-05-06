-- seed.sql remplit les tables de la base de données avec des données

-- INSERT INTO themes (name) VALUES
--     ('Frontend'),
--     ('Backend'),
--     ('Base de données'),
--     ('DevOps');

SELECT * FROM themes;

-- INSERT INTO skills (name) VALUES 
-- ('JavaScript'),
-- ('React'),
-- ('SQL'),
-- ('PostgreSQL'),
-- ('Node.js');

SELECT * FROM skills;

-- INSERT INTO resources (title, url, description, type, is_ada, theme_id) VALUES
-- ('Introduction à React','https://react.dev','Guide officiel React','guide','false','1'),
-- ('SQL pour débutants','https://example.com/sql','Cours SQL complet','video','false','3'),
-- ('Exercices JavaScript','https://example.com/js','Pratique JS','exercice','false','1'),
-- ('Créer une API en node','https://example.com/node','Projet node','projet','false','2');

SELECT * FROM resources;


-- INSERT INTO resources_skills (resource_id, skill_id) VALUES
-- ('1','1'),
-- ('1','2'),
-- ('2','3'),
-- ('2','4'),
-- ('3','1'),
-- ('4','1'),
-- ('4','5');

SELECT * FROM resources_skills;



