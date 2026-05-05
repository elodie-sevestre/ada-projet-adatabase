-- migration_down.sql contient le SQL qui permet de supprimer toutes les tables (l'inverse de migration_up)

DROP TABLE IF EXISTS resources_skills;
DROP TABLE IF EXISTS resources;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS themes;
DROP TYPE IF EXISTS resource_type;