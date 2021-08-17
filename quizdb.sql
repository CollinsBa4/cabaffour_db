
BEGIN;
-- Database: quiz

-- DROP DATABASE quiz;

CREATE DATABASE quiz
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE public.contestants
(
    id integer NOT NULL,
    fname character varying(100),
    lname character varying(100),
    score integer,
    quiz_session_id integer,
    username character varying(100),
    PRIMARY KEY (id)
    UNIQUE(username)
);

CREATE TABLE public.questions
(
    id integer NOT NULL,
    question character varying(500),
    answer character varying(200),
    quizmaster_id integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.quiz_sessions
(
    session_id integer NOT NULL,
    date_created date,
    max_question_point integer,
    min_question_point integer,
    seconds_per_question integer,
    number_of_questions integer,
    quizmaster_id integer,
    PRIMARY KEY (session_id)
);

CREATE TABLE public.quizmasters
(
    id integer NOT NULL,
    fname character varying(100) NOT NULL,
    lname character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    isadmin boolean,
    username character varying(100) NOT NULL
    PRIMARY KEY (id),
    UNIQUE(username)
);

ALTER TABLE public.contestants
    ADD FOREIGN KEY (quiz_session_id)
    REFERENCES public.quiz_sessions (session_id)
    ;


ALTER TABLE public.questions
    ADD FOREIGN KEY (quizmaster_id)
    REFERENCES public.quizmasters (id)
    ;


ALTER TABLE public.quiz_sessions
    ADD FOREIGN KEY (quizmaster_id)
    REFERENCES public.quizmasters (id)
    ;

END

insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Stanyforth', 'Flacke', 'GhIi8qgU', false, 'bflacke0');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Dyne', 'Lowrie', 'o575LpG', false, 'wlowrie1');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Davidge', 'Westmerland', 'eWPFDLCioJ4', false, 'awestmerland2');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Rushbury', 'McGahern', 'WLD1BCljncM', false, 'imcgahern3');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Buchett', 'Coggeshall', 'fMJUvQsX', false, 'mcoggeshall4');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Dudley', 'Redmayne', 'iVgDQNW', false, 'dredmayne5');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Robbey', 'Brooks', 'nQMvCPB83gRw', true, 'gbrooks6');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Necolds', 'Burborough', 'QTZwWkHjuuiM', true, 'tburborough7');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Dionisii', 'Poulson', 'T9MSUt', false, 'opoulson8');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('MacSkeagan', 'Leith', 'TzYoKhPfcB2', true, 'jleith9');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Jeaves', 'Epilet', 'bdBVTY', true, 'repileta');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Jannaway', 'Twiddle', 'TXZjyhnFy3', false, 'atwiddleb');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Frohock', 'Pendred', 'gaVACW', true, 'apendredc');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Streeter', 'Parrett', 'oDw3j9gxIpI', true, 'lparrettd');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Hinners', 'Birch', 'H4TDZqStyb64', true, 'mbirche');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('McBrady', 'Spriggin', 'zD9xBTIT', false, 'fsprigginf');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Pickthorne', 'Jursch', 'Pjrx5y', false, 'sjurschg');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Magrannell', 'Ridhole', 'G7N9An', true, 'dridholeh');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Hoy', 'Youle', 'qxueZY', false, 'kyoulei');
insert into quizmasters (fname, lname, user_password, isadmin, username) values ('Kinker', 'Chaff', 'SCEyhlkfbDC', true, 'echaffj');
;