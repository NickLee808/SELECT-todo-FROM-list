\c postgres;

DROP USER IF EXISTS "michael";

CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS "todo_app";

CREATE DATABASE "todo_app";

\c todo_app;

CREATE TABLE "tasks" (
  id INTEGER PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
  completed BOOLEAN NOT NULL DEFAULT FALSE
);

ALTER TABLE "tasks" DROP COLUMN "completed";

ALTER TABLE "tasks" ADD COLUMN "completed_at" TIMESTAMP DEFAULT NULL;

ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT NULL;

ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();

INSERT INTO "tasks" VALUES (DEFAULT , 'Study SQL', 'Complete this exercise'); 
