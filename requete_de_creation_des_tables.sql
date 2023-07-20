--   Owner Table :
  
  CREATE TABLE "Owners" (
  "owner_id" INT PRIMARY KEY NOT NULL,
  "owner_Name" TEXT   NOT NULL,
  "type_of_owner" TEXT  NOT NULL
);
-- 
 CREATE TABLE "Contributors" (
  "contributor_id" INT PRIMARY KEY NOT NULL,
  "contributor" TEXT NOT NULL);

--   
      CREATE TABLE "Languages" (
  "language_id" INT PRIMARY KEY NOT NULL,
  "language_name" TEXT NOT NULL
);
-- 
 DROP TABLE IF EXISTS  "Licences" ;
 CREATE TABLE "Licences" (
  "license_id" INT PRIMARY KEY NOT NULL,
  "license" TEXT NOT NULL
);
-- 
 CREATE TABLE "Topics" (
  "topic_Id" INT PRIMARY KEY NOT NULL,
  "topics" TEXT  NOT NULL
);
-- 
DROP TABLE IF EXISTS  Repositories ;
CREATE TABLE "Repositories" (
  "repo_id" INT PRIMARY KEY NOT NULL,
  "repo_Name" TEXT  NOT NULL,
  "url" TEXT  NOT NULL,
  "description" TEXT,
  "stars" INT,
  "created_at" date,
  "forks" INT,
  "updated_at" date,
  "owner_id" INT NOT NULL,
  "license_id" INT NOT NULL,
  "language_id" INT NOT NULL ,
  CONSTRAINT "FK_Repositories.language_id"
    FOREIGN KEY ("language_id")
      REFERENCES "Languages"("language_id"),
  CONSTRAINT "FK_Repositories.license_id"
    FOREIGN KEY ("license_id")
      REFERENCES "Licences"("license_id"),
  CONSTRAINT "FK_Repositories.owner_ID"
    FOREIGN KEY ("owner_id")
      REFERENCES "Owners"("owner_id")
);

-- bridge table 

CREATE TABLE "Repositories_contributors" (
  "contributor_id" INT NOT NULL,
  "repo_id" INT NOT NULL,
  "number_of_contributions" INT ,
  CONSTRAINT "FK_Repositories_contributors.contributor_id"
    FOREIGN KEY ("contributor_id")
      REFERENCES "Contributors"("contributor_id"),
  CONSTRAINT "FK_Repositories_contributors.Id_Repo"
    FOREIGN KEY ("repo_id")
      REFERENCES "Repositories"("repo_id")
);

-- indexation 

CREATE INDEX "INDEX_FK/PK_Repositories_contributors" ON  "Repositories_contributors" ("contributor_id", "repo_id");


-- bridge table 
CREATE TABLE "Topic_Repositories" (
  "repo_id" INT NOT NULL,
  "topic_Id" INT NOT NULL,
  CONSTRAINT "FK_Topic_Repositories.repo_id"
    FOREIGN KEY ("repo_id")
      REFERENCES "Repositories"("repo_id"),
  CONSTRAINT "FK_Topic_Repositories.topic_Id"
    FOREIGN KEY ("topic_Id")
      REFERENCES "Topics"("topic_Id")
);
-- indexation 
  CREATE INDEX "INDEX_FK/PK_Topic_Repositories" ON  "Topic_Repositories" ("repo_id", "topic_Id");

