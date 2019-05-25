PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS "main"."category";
CREATE TABLE category(
    cid INTEGER PRIMARY KEY autoincrement NOT NULL, -- category id of a course
    ctitle TEXT NOT NULL -- detailed description of a category
);

DROP TABLE IF EXISTS "main"."lg";
CREATE TABLE lg(
    level TEXT,
    gpa REAL,
    lower_grade INT,
    upper_grade INT,
    UNIQUE (level)
);

DROP TABLE IF EXISTS "main"."curriculum";
CREATE TABLE curriculum(
  ID INTEGER PRIMARY KEY autoincrement NOT NULL,
  semester TEXT,
  code TEXT,
  title TEXT,
  level TEXT, -- ABCDEFP +-
  grade REAL,
  credit REAL, 
  compulsory CHAR CHECK(compulsory in ('0','1')), -- 1: compulsory, 0: selective
  cid INTEGER, -- category of the course
  FOREIGN KEY(level) REFERENCES lg(level),
  FOREIGN KEY(cid) REFERENCES category(cid)
);

DROP TABLE IF EXISTS "main"."info";
CREATE TABLE info(
    pid TEXT,
    name TEXT
);

DROP TABLE IF EXISTS "main"."customize";
CREATE TABLE customize(
    ID INTEGER,
    cal INT CHECK(cal in (0,1)), -- 1: participate in customize gpa, 0: not
    FOREIGN KEY(ID) REFERENCES curriculum(ID),
    UNIQUE (ID)
);
