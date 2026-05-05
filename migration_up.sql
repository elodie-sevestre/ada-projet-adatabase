-- resource_type enum permettant de limiter le type de ressources possible à une liste prédéterminée : guide, video, exercice, projet (⚠️ n'existe qu'avec Postgres)

CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');

-- themes permet de grouper l'ensemble des ressources sur un thème précis (comme 'Frontend' ou 'Base de données' par exemple)

CREATE TABLE themes(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- skills représente une compétence en particulier qui est abordée par la ressource. Contrairement au thème, une ressource peut concerner plusieurs compétences

CREATE TABLE skills (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- resources contient toutes les informations sur une ressource, notamment son titre et le lien vers la ressource (url)

CREATE TABLE resources(
    id SERIAL PRIMARY KEY,
    type resource_type,
    title VARCHAR(255),
    description VARCHAR(255),
    url VARCHAR(255),
    is_ada BOOLEAN,
    theme_id INT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT "fk_themes" FOREIGN KEY (theme_id)
        REFERENCES themes (id)
);

-- resources_skills permet de faire le lien entre une ressource et une compétence

CREATE TABLE resources_skills (
    resource_id INT,
    skill_id INT,
    PRIMARY KEY (resource_id, skill_id),
    CONSTRAINT "fk_resource" FOREIGN KEY (resource_id)
        REFERENCES resources (id),
    CONSTRAINT "fk_skill" FOREIGN KEY (skill_id)
        REFERENCES skills (id)
);