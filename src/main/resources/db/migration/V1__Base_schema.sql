------------------------------------------------------------------------------------------------------------------------
--- EXTENSIONS
------------------------------------------------------------------------------------------------------------------------
CREATE EXTENSION citext;
CREATE EXTENSION "uuid-ossp";

------------------------------------------------------------------------------------------------------------------------
--- TYPES
------------------------------------------------------------------------------------------------------------------------
CREATE TYPE USER_ROLE AS ENUM ('USER', 'ADMIN');

------------------------------------------------------------------------------------------------------------------------
--- TABLES
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE "user"
(
  id             UUID                     DEFAULT uuid_generate_v4() NOT NULL PRIMARY KEY,

  email          CITEXT                                              NOT NULL UNIQUE,
  password_hash  TEXT                                                NOT NULL,
  phone          TEXT                                                NOT NULL,
  first_name     TEXT                                                NOT NULL,
  last_name      TEXT                                                NOT NULL,
  activated      BOOLEAN                  DEFAULT FALSE              NOT NULL,
  activation_key TEXT                                                NULL UNIQUE,
  reset_date     TIMESTAMP WITH TIME ZONE                            NULL,
  reset_key      TEXT                                                NULL UNIQUE,
  role           USER_ROLE                DEFAULT 'USER'         NOT NULL,

  created_at     TIMESTAMP WITH TIME ZONE DEFAULT now()              NOT NULL,
  updated_at     TIMESTAMP WITH TIME ZONE                            NULL,
  deleted_at     TIMESTAMP WITH TIME ZONE                            NULL
);
