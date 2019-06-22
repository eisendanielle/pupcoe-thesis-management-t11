--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-1.pgdg16.04+1)
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: brsaoynqhwfbam
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


--
-- Name: user_type; Type: TYPE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TYPE "public"."user_type" AS ENUM (
    'student',
    'faculty',
    'guest'
);


ALTER TYPE public.user_type OWNER TO brsaoynqhwfbam;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: classStudents; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."classStudents" (
    "id" integer NOT NULL,
    "class_id" integer,
    "student_id" integer
);


ALTER TABLE public."classStudents" OWNER TO brsaoynqhwfbam;

--
-- Name: classStudents_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."classStudents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."classStudents_id_seq" OWNER TO brsaoynqhwfbam;

--
-- Name: classStudents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."classStudents_id_seq" OWNED BY "public"."classStudents"."id";


--
-- Name: classes; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."classes" (
    "id" integer NOT NULL,
    "batch" character varying(4) NOT NULL,
    "section" character varying(2) NOT NULL,
    "adviser" integer
);


ALTER TABLE public.classes OWNER TO brsaoynqhwfbam;

--
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."classes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classes_id_seq OWNER TO brsaoynqhwfbam;

--
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."classes_id_seq" OWNED BY "public"."classes"."id";


--
-- Name: facultyCommittee; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."facultyCommittee" (
    "id" integer NOT NULL,
    "faculty_id" integer
);


ALTER TABLE public."facultyCommittee" OWNER TO brsaoynqhwfbam;

--
-- Name: facultyCommittee_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."facultyCommittee_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."facultyCommittee_id_seq" OWNER TO brsaoynqhwfbam;

--
-- Name: facultyCommittee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."facultyCommittee_id_seq" OWNED BY "public"."facultyCommittee"."id";


--
-- Name: groupStudents; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."groupStudents" (
    "id" integer NOT NULL,
    "group_id" integer,
    "student_id" integer
);


ALTER TABLE public."groupStudents" OWNER TO brsaoynqhwfbam;

--
-- Name: groupStudents_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."groupStudents_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."groupStudents_id_seq" OWNER TO brsaoynqhwfbam;

--
-- Name: groupStudents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."groupStudents_id_seq" OWNED BY "public"."groupStudents"."id";


--
-- Name: groups; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."groups" (
    "id" integer NOT NULL,
    "groupname" character varying(10) NOT NULL,
    "class" integer
);


ALTER TABLE public.groups OWNER TO brsaoynqhwfbam;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO brsaoynqhwfbam;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."groups_id_seq" OWNED BY "public"."groups"."id";


--
-- Name: thesis; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."thesis" (
    "id" integer NOT NULL,
    "thesis_title" character varying(200),
    "group_id" integer,
    "stage" character varying DEFAULT 'pending'::character varying,
    "abstract" character varying(1000),
    "comment" character varying,
    "head_panelist" integer,
    "date_updated" timestamp with time zone
);


ALTER TABLE public.thesis OWNER TO brsaoynqhwfbam;

--
-- Name: thesis_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."thesis_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thesis_id_seq OWNER TO brsaoynqhwfbam;

--
-- Name: thesis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."thesis_id_seq" OWNED BY "public"."thesis"."id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "email" character varying(80) NOT NULL,
    "password" character varying(80) NOT NULL,
    "first_name" character varying(80),
    "last_name" character varying(80) NOT NULL,
    "student_number" character varying(20),
    "phone" character varying(80),
    "user_type" "public"."user_type" DEFAULT 'student'::"public"."user_type" NOT NULL,
    "is_admin" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO brsaoynqhwfbam;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: brsaoynqhwfbam
--

CREATE SEQUENCE "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO brsaoynqhwfbam;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brsaoynqhwfbam
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- Name: classStudents id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classStudents" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."classStudents_id_seq"'::"regclass");


--
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."classes_id_seq"'::"regclass");


--
-- Name: facultyCommittee id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."facultyCommittee" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."facultyCommittee_id_seq"'::"regclass");


--
-- Name: groupStudents id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groupStudents" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."groupStudents_id_seq"'::"regclass");


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."groups_id_seq"'::"regclass");


--
-- Name: thesis id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."thesis" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."thesis_id_seq"'::"regclass");


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- Data for Name: classStudents; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."classStudents" ("id", "class_id", "student_id") FROM stdin;
1	1	2
\.


--
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."classes" ("id", "batch", "section", "adviser") FROM stdin;
1	2019	1	1
\.


--
-- Data for Name: facultyCommittee; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."facultyCommittee" ("id", "faculty_id") FROM stdin;
1	1
\.


--
-- Data for Name: groupStudents; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."groupStudents" ("id", "group_id", "student_id") FROM stdin;
1	1	2
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."groups" ("id", "groupname", "class") FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: thesis; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."thesis" ("id", "thesis_title", "group_id", "stage", "abstract", "comment", "head_panelist", "date_updated") FROM stdin;
2	Try	1	MOR	Try Abstract 	\N	1	2018-10-31 00:00:00+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: brsaoynqhwfbam
--

COPY "public"."users" ("id", "email", "password", "first_name", "last_name", "student_number", "phone", "user_type", "is_admin") FROM stdin;
1	patgnavarro@gmail.com	$2b$10$56TiTPyhOyO4j4P8ugsN4uL0ejbWrLYfUOOgLx/ETmQlDVIaOnZc.	Patricia	Navarro		09174444444	faculty	t
2	marquez.josealfonso@gmail.com	$2b$10$EQb56szCRtTFYjsOqqMQae5DiI6Q9CtfP.6uwPUKSrwB5MoCj9Rle	Jose Alfonso	Marquez	2014-00061-MN-0	09174444444	student	f
4	try@gmail.com	$2b$10$gYcT18vKzVQJ3M3IN8HBIemIbI5aPgum4hfHbscdxJLqFQpgEC5pe	Lalisa	Manoban	2014-00051-MN-0	0955555555	faculty	t
37	jun@gmail.com	$2b$10$OuFWVamd2n11ZrCw3FC8XuCKZ9sjUlUmOZ94ilCnGYq/fux/TbXaG	Jun	Tenerife		1234	faculty	f
38	gino.tr14@gmail.com	$2b$10$rn5hhIGwVfkk4hEehWxehetI1BLbUjX.M0rDifi3favMsspCsWbE2	Gino	Tria	123141213	123	student	f
\.


--
-- Name: classStudents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."classStudents_id_seq"', 34, true);


--
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."classes_id_seq"', 34, true);


--
-- Name: facultyCommittee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."facultyCommittee_id_seq"', 33, true);


--
-- Name: groupStudents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."groupStudents_id_seq"', 1, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."groups_id_seq"', 2, true);


--
-- Name: thesis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."thesis_id_seq"', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brsaoynqhwfbam
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 39, true);


--
-- Name: classStudents classStudents_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classStudents"
    ADD CONSTRAINT "classStudents_pkey" PRIMARY KEY ("id");


--
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_pkey" PRIMARY KEY ("id");


--
-- Name: facultyCommittee facultyCommittee_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."facultyCommittee"
    ADD CONSTRAINT "facultyCommittee_pkey" PRIMARY KEY ("id");


--
-- Name: groupStudents groupStudents_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groupStudents"
    ADD CONSTRAINT "groupStudents_pkey" PRIMARY KEY ("id");


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groups"
    ADD CONSTRAINT "groups_pkey" PRIMARY KEY ("id");


--
-- Name: thesis thesis_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."thesis"
    ADD CONSTRAINT "thesis_pkey" PRIMARY KEY ("id");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: classStudents classStudents_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classStudents"
    ADD CONSTRAINT "classStudents_class_id_fkey" FOREIGN KEY ("class_id") REFERENCES "public"."classes"("id");


--
-- Name: classStudents classStudents_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classStudents"
    ADD CONSTRAINT "classStudents_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id");


--
-- Name: classes classes_adviser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."classes"
    ADD CONSTRAINT "classes_adviser_fkey" FOREIGN KEY ("adviser") REFERENCES "public"."users"("id");


--
-- Name: facultyCommittee facultyCommittee_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."facultyCommittee"
    ADD CONSTRAINT "facultyCommittee_faculty_id_fkey" FOREIGN KEY ("faculty_id") REFERENCES "public"."users"("id");


--
-- Name: groupStudents groupStudents_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groupStudents"
    ADD CONSTRAINT "groupStudents_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id");


--
-- Name: groupStudents groupStudents_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groupStudents"
    ADD CONSTRAINT "groupStudents_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "public"."users"("id");


--
-- Name: groups groups_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."groups"
    ADD CONSTRAINT "groups_class_fkey" FOREIGN KEY ("class") REFERENCES "public"."classes"("id");


--
-- Name: thesis thesis_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."thesis"
    ADD CONSTRAINT "thesis_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id");


--
-- Name: thesis thesis_head_panelist_fkey; Type: FK CONSTRAINT; Schema: public; Owner: brsaoynqhwfbam
--

ALTER TABLE ONLY "public"."thesis"
    ADD CONSTRAINT "thesis_head_panelist_fkey" FOREIGN KEY ("head_panelist") REFERENCES "public"."users"("id");


--
-- PostgreSQL database dump complete
--

