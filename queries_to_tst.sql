-- Requête pour récupérer les dépôts ayant le plus grand nombre d'étoiles, ainsi que les informations de leur propriétaire :
SELECT r."repo_Name", r."stars", o."owner_Name"
FROM "Repositories" r
JOIN "Owners" o ON r."owner_id" = o."owner_id"
ORDER BY r."stars" DESC
LIMIT 10000;

-- Requête pour trouver les contributeurs ayant le plus grand nombre de contributions à travers tous les dépôts :

SELECT c."contributor", SUM(rc."number_of_contributions") AS total_contributions
FROM "Contributors" c
JOIN "Repositories_contributors" rc ON c."contributor_id" = rc."contributor_id"
GROUP BY c."contributor"
ORDER BY total_contributions DESC
LIMIT 10;


-- Requête pour compter le nombre de dépôts pour chaque langage de programmation :
SELECT l."language_name", COUNT(r."repo_id") AS num_repositories
FROM "Languages" l
LEFT JOIN "Repositories" r ON l."language_id" = r."language_id"
GROUP BY l."language_name" order by "num_repositories" desc ;


SELECT AVG("number_of_contributions") AS avg_contributions
FROM "Repositories_contributors";
