--
-- Class AuthUser as table auth_user
--

CREATE TABLE "auth_user" (
  "id" serial,
  "username" text NOT NULL,
  "password" text,
  "isAdmin" boolean NOT NULL
);

ALTER TABLE ONLY "auth_user"
  ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Class Language as table language
--

CREATE TABLE "language" (
  "id" serial,
  "name" text NOT NULL,
  "code" text NOT NULL
);

ALTER TABLE ONLY "language"
  ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Class Test as table test
--

CREATE TABLE "test" (
  "id" serial,
  "languageId" integer NOT NULL,
  "authUserId" integer NOT NULL,
  "result" integer,
  "length" integer NOT NULL,
  "finished" boolean NOT NULL,
  "timeStarted" timestamp without time zone NOT NULL,
  "timeFinished" timestamp without time zone,
  "timeLimit" integer
);

ALTER TABLE ONLY "test"
  ADD CONSTRAINT test_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "test"
  ADD CONSTRAINT test_fk_0
    FOREIGN KEY("languageId")
      REFERENCES language(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "test"
  ADD CONSTRAINT test_fk_1
    FOREIGN KEY("authUserId")
      REFERENCES auth_user(id)
        ON DELETE CASCADE;

--
-- Class Word as table word
--

CREATE TABLE "word" (
  "id" serial,
  "languageId" integer NOT NULL,
  "word" text NOT NULL,
  "translations" json NOT NULL
);

ALTER TABLE ONLY "word"
  ADD CONSTRAINT word_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "word"
  ADD CONSTRAINT word_fk_0
    FOREIGN KEY("languageId")
      REFERENCES language(id)
        ON DELETE CASCADE;

--
-- Class TestWord as table test_word
--

CREATE TABLE "test_word" (
  "id" serial,
  "testId" integer NOT NULL,
  "wordId" integer NOT NULL,
  "askingWord" text NOT NULL,
  "choices" json NOT NULL,
  "correctChoice" text NOT NULL,
  "answer" text,
  "correct" boolean
);

ALTER TABLE ONLY "test_word"
  ADD CONSTRAINT test_word_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "test_word"
  ADD CONSTRAINT test_word_fk_0
    FOREIGN KEY("testId")
      REFERENCES test(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "test_word"
  ADD CONSTRAINT test_word_fk_1
    FOREIGN KEY("wordId")
      REFERENCES word(id)
        ON DELETE CASCADE;

