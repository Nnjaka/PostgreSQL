--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: subscriptions_communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions_communities (
    user_id integer NOT NULL,
    community_id integer NOT NULL,
    subscribed_at timestamp without time zone
);


ALTER TABLE public.subscriptions_communities OWNER TO gb_user;

--
-- Name: subscriptions_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.subscriptions_users (
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    subscribed_at timestamp without time zone
);


ALTER TABLE public.subscriptions_users OWNER TO gb_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
1	interdum enim non	84	2021-02-24 01:21:44
2	diam vel arcu.	83	2021-12-16 04:29:43
3	ac mattis ornare,	12	2021-12-26 22:53:40
4	Aliquam ornare, libero	13	2022-06-16 03:19:04
5	In ornare sagittis	97	2022-10-18 22:25:39
6	lobortist tellus justo	33	2021-11-16 16:45:59
7	fermentum vel, mauris.	87	2021-10-02 15:02:25
8	risus. Donec egestas.	47	2021-11-28 00:39:59
9	egestas ligula. Nullam	24	2021-10-18 13:41:19
10	convallis ligula. Donec	27	2022-04-25 07:17:26
11	felis. Donec tempor,	19	2022-07-06 07:15:27
12	aliquet diam. Sed	59	2022-07-30 11:30:34
13	molestie dapibus ligula.	15	2021-11-21 15:24:54
14	porttitor eros nec	26	2021-01-05 20:39:35
15	odioio. Aliquam vulputate	12	2022-10-03 08:15:13
16	Proin non massa	16	2021-10-22 18:23:24
17	eleifend, nunc risus	42	2021-05-16 20:00:00
18	dignissim pharetra. Nam	89	2022-05-06 20:21:08
19	ante ipsum primis	44	2022-02-09 05:55:37
20	In faucibus. Morbi	70	2021-03-25 22:48:48
21	aliquet. Phasellus fermentum	58	2021-06-02 05:01:09
22	lorem ut aliquam	12	2022-02-23 10:05:17
23	luctus felis purus	24	2022-05-18 21:51:18
24	enim, condimentum eget,	10	2022-08-20 11:28:41
25	cursus luctus, ipsum	18	2022-11-05 06:04:15
26	sollicitudin adipiscing ligula.	62	2022-07-06 08:42:17
27	velit. Quisque varius.	81	2021-01-15 04:43:05
28	molestie tellus. Aenean	52	2021-03-12 22:44:33
29	vel, mauris. Integer	39	2021-12-05 22:13:09
30	eros nec tellus.	75	2021-10-31 00:51:17
31	magna, malesuada vel,	58	2021-08-08 05:32:54
32	mauris elit, dictum	97	2022-02-10 07:59:36
33	Vivamus rhoncus. Donec	14	2022-04-11 20:17:12
34	Cras vulputate velit	57	2022-01-20 20:45:24
35	sit amet, consectetuer	87	2021-02-23 03:30:06
36	montes, nascetur ridiculus	78	2022-11-07 08:45:35
37	elit, pretium et,	94	2022-02-20 07:44:21
38	Curabitur consequat, lectus	62	2021-01-13 02:14:49
39	neque pellentesque massa	55	2021-06-16 12:17:02
40	sed dui. Fusce	16	2021-11-08 10:19:00
41	Fusce mollis. Duis	66	2022-05-14 15:49:47
42	eget metus. In	69	2021-12-02 08:05:27
43	lectus ante dictum	13	2021-12-12 23:38:31
44	Integer urna. Vivamus	58	2022-02-02 08:44:49
45	malesuada vel, venenatis	12	2021-12-27 07:25:00
46	nulla. Integer vulputate,	74	2021-11-24 01:56:03
47	ante dictum cursus.	93	2021-07-23 17:56:27
48	orci lobortis augue	25	2021-05-22 23:38:01
49	eget odio. Aliquam	39	2021-10-06 05:04:57
50	libero nec ligula	40	2022-08-07 18:27:06
51	Sed diam lorem,	48	2021-07-11 04:54:34
52	Fusce mi lorem,	47	2021-10-22 17:38:50
53	orci tincidunt adipiscing.	13	2022-08-05 03:01:17
54	ut ipsum ac	85	2022-11-06 14:28:50
55	ut nisi a	6	2021-07-30 20:55:57
56	ultrices, mauris ipsum	30	2022-09-08 06:15:08
57	ornare, elit elit	33	2022-07-17 14:59:34
58	aliquam eu, accumsan	87	2021-10-27 09:10:27
59	interdum. Curabitur dictum.	51	2021-12-22 03:44:03
60	molestie orci tincidunt	10	2021-03-23 17:54:51
61	luctus lobortis. Class	13	2022-10-13 17:56:49
62	nisi a odio	49	2022-11-05 23:43:28
63	semper Nam tempor	80	2021-01-15 03:41:10
64	ultricies dignissim lacus.	21	2022-05-04 21:08:45
65	vel pede blandit	93	2022-05-22 17:29:17
66	lobortis tellus justo	62	2022-05-10 06:46:06
67	Sed et libero.	33	2022-01-05 00:02:22
68	sodales purus, in	49	2022-02-25 10:43:40
69	eget metus eu	10	2022-09-14 22:23:33
70	tincidunt dui augue	55	2022-05-08 18:20:17
71	Duis gravida. Praesent	3	2022-03-28 04:20:56
72	velit eu sem.	27	2021-04-29 14:49:33
73	penatibus et magnis	67	2021-10-13 17:49:30
74	vel arcu. Curabitur	8	2021-09-16 12:07:38
75	aliquet odio. Etiam	43	2021-05-23 12:15:19
76	a neque. Nullam	22	2022-07-11 20:51:47
77	sit amet orci.	66	2022-10-22 13:50:09
78	pellentesque eget, dictum	48	2022-09-14 11:02:14
79	ullamcorper, velit in	90	2021-10-25 09:34:05
80	lectus. Cum sociis	37	2022-10-09 16:14:27
81	ultrices a, auctor	56	2021-01-22 03:23:06
82	non ante bibendum	63	2022-02-21 00:43:39
83	In at pede.	3	2021-04-22 12:13:27
84	odio. Aliquam vulputate	38	2020-12-28 18:10:28
85	elit, pellentesque a,	20	2021-07-22 14:42:00
86	mus. Proin vel	88	2022-10-11 07:08:41
87	turpis vitae purus	15	2021-05-21 12:58:02
88	mattis velit justo	26	2021-04-19 16:50:08
89	eget, dictum placerat,	58	2022-05-22 05:11:21
90	Vivamus non lorem	64	2021-08-09 20:58:12
91	odio. Phasellus at	86	2021-10-14 01:57:48
92	mauris eu elit.	80	2021-01-04 12:18:26
93	venenatis a, magna.	11	2022-03-27 18:15:54
94	ac, eleifend vitae,	34	2021-06-25 14:11:42
95	sagittis placerat. Cras	5	2021-08-06 01:43:39
96	dictum eleifend, nunc	99	2022-07-18 16:21:18
97	posuere vulputate, lacus.	90	2022-09-23 11:16:57
98	eu enim. Etiam	2	2022-09-02 07:53:38
99	cursus a, enim.	85	2021-04-05 13:33:36
100	eu eros. Nam	42	2021-01-18 11:04:17
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
43	27	2021-12-10 05:09:40
50	83	2022-04-05 20:06:14
91	81	2021-09-18 13:05:29
34	35	2021-10-22 01:35:54
46	15	2022-02-11 04:07:43
50	46	2020-12-18 00:24:31
82	68	2021-11-21 13:00:13
7	38	2021-12-31 08:25:27
92	62	2021-10-23 11:44:14
42	65	2021-09-04 16:35:21
53	13	2022-01-24 13:03:29
65	42	2021-03-30 20:06:51
2	41	2022-08-02 04:49:26
90	9	2022-10-08 15:57:39
93	31	2021-02-28 03:36:34
29	5	2021-06-01 23:58:35
75	66	2022-08-01 14:58:24
14	19	2020-12-02 19:57:46
35	35	2022-08-03 18:41:19
16	81	2022-06-28 14:09:29
9	50	2021-05-11 02:02:01
49	83	2022-07-11 01:05:16
47	24	2021-11-20 08:33:55
37	66	2022-06-07 05:39:39
90	62	2022-03-12 19:33:06
46	95	2022-10-19 14:43:34
64	88	2022-09-17 12:40:45
93	44	2022-03-27 01:21:29
9	52	2021-07-01 06:40:54
60	50	2021-05-28 01:12:49
20	54	2022-06-13 13:17:39
71	29	2022-03-28 04:22:13
66	20	2021-04-23 01:04:12
3	85	2020-12-25 18:41:45
93	41	2021-03-06 09:56:43
58	28	2022-05-02 23:19:47
56	45	2022-01-28 01:05:45
32	70	2022-11-19 16:19:38
11	89	2021-03-04 23:17:33
62	14	2021-02-01 13:41:22
20	80	2022-10-06 06:20:07
100	10	2022-06-04 15:19:17
71	67	2022-08-01 13:19:41
51	47	2022-01-17 12:17:12
36	15	2022-10-18 17:30:02
5	73	2021-12-23 15:26:07
34	18	2021-08-24 02:53:27
16	42	2022-05-16 18:50:17
21	5	2021-07-10 04:21:29
13	51	2021-04-12 14:59:03
42	14	2022-11-12 23:50:12
64	25	2021-07-09 15:42:41
72	87	2022-09-13 10:30:53
91	24	2021-06-05 08:37:43
40	28	2022-01-05 14:32:37
49	36	2022-04-21 18:18:36
75	20	2021-02-25 01:44:53
35	70	2022-05-22 20:51:00
17	87	2021-01-09 11:17:41
48	9	2022-01-20 02:57:56
14	73	2021-01-18 20:22:38
34	85	2022-06-12 19:25:55
15	77	2022-05-10 05:21:43
5	76	2020-12-14 16:31:22
44	56	2021-10-30 23:34:25
21	1	2021-04-25 03:29:58
74	53	2021-09-23 03:14:35
45	10	2022-03-30 16:36:12
3	61	2021-09-29 00:35:27
26	28	2021-07-12 10:13:24
38	41	2022-08-17 20:47:18
48	65	2021-05-17 16:03:08
61	22	2022-01-26 15:22:00
21	81	2021-05-08 23:35:31
42	24	2021-12-30 11:32:58
36	25	2022-10-20 15:36:15
97	90	2022-03-03 20:14:49
28	28	2021-04-16 04:43:13
77	92	2022-11-10 04:26:35
25	31	2021-04-26 02:28:24
50	79	2022-03-02 20:07:46
58	15	2022-07-13 14:45:31
79	36	2021-05-23 15:29:56
87	33	2022-07-26 17:21:31
36	72	2021-06-23 18:58:03
84	57	2022-11-16 21:44:59
95	73	2022-07-01 10:37:03
66	31	2021-02-25 11:07:39
80	40	2022-07-13 23:24:26
98	50	2021-08-21 00:41:32
49	6	2021-01-22 00:53:21
29	69	2021-07-13 16:53:27
5	96	2022-11-21 20:47:29
7	5	2020-12-27 06:03:55
11	31	2021-02-26 04:38:53
67	67	2022-04-02 04:45:32
19	5	2022-10-24 06:01:51
63	85	2021-09-10 05:32:05
17	67	2022-04-26 23:15:32
15	16	2022-04-05 12:21:35
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	35	78	2	2020-12-30 22:40:45	2021-07-15 17:42:18
2	73	76	1	2021-07-07 14:23:45	2021-05-08 18:13:47
3	20	92	2	2021-04-09 09:08:35	2022-11-11 11:50:44
4	33	9	2	2022-02-18 20:09:30	2022-06-22 07:29:07
5	32	73	2	2021-01-26 07:54:14	2022-02-12 02:28:32
6	90	7	2	2021-11-09 17:29:16	2021-02-22 16:54:21
7	8	53	2	2021-03-11 12:19:26	2022-05-18 11:16:44
8	16	11	4	2021-11-17 14:11:54	2021-10-21 02:34:05
9	64	89	1	2022-09-08 11:15:35	2021-04-17 11:04:02
10	28	1	2	2022-07-31 11:05:31	2021-01-14 01:33:44
11	56	94	3	2022-01-04 23:14:58	2021-07-19 01:28:17
12	50	18	2	2021-06-01 18:51:58	2022-11-11 00:29:54
13	58	12	4	2021-07-04 01:26:01	2022-04-02 11:36:31
14	56	30	2	2022-04-28 15:49:23	2022-02-27 11:51:32
15	82	56	2	2021-03-29 15:59:48	2022-10-29 16:54:35
16	68	86	3	2021-07-31 07:28:02	2021-03-31 22:56:42
17	50	46	4	2021-08-22 00:10:51	2021-06-11 19:16:55
18	38	98	4	2021-12-15 21:24:13	2021-08-15 09:20:45
19	59	56	2	2021-08-06 00:47:59	2022-09-15 04:37:08
20	84	4	3	2022-03-16 02:15:30	2021-11-25 13:00:57
21	42	20	4	2022-07-29 21:57:42	2022-09-05 03:19:35
22	85	34	2	2022-05-25 06:40:35	2022-04-09 03:57:08
23	70	24	3	2021-04-23 18:36:10	2021-11-12 08:04:45
24	49	11	2	2022-09-26 21:37:41	2021-03-21 05:10:29
25	65	78	2	2022-05-12 01:42:06	2021-05-22 18:03:09
26	94	61	1	2021-12-27 00:30:01	2022-01-25 21:57:59
27	81	84	2	2021-12-14 21:14:28	2021-07-11 06:18:34
28	10	32	1	2022-04-17 09:10:51	2021-10-28 12:14:55
29	69	98	1	2022-03-14 19:50:44	2022-01-12 08:29:30
30	67	38	4	2021-03-29 10:45:53	2022-04-23 18:19:07
31	9	20	1	2021-05-07 05:07:55	2022-01-23 00:01:38
32	15	83	3	2022-06-14 11:16:17	2021-08-15 22:31:24
33	75	70	2	2021-09-25 07:37:40	2022-03-18 22:39:28
34	40	7	2	2021-04-04 16:14:00	2022-03-10 03:57:19
35	21	88	1	2022-11-20 11:00:31	2021-04-30 05:56:28
36	29	30	2	2021-05-14 11:30:19	2021-04-07 08:19:52
37	30	55	4	2021-12-04 02:14:18	2022-09-28 13:04:40
38	48	7	2	2021-09-13 12:50:34	2021-07-26 09:22:39
39	8	96	3	2021-03-13 09:43:20	2022-01-27 13:20:14
40	65	3	2	2021-08-08 16:14:02	2021-02-11 03:27:39
41	64	100	3	2022-06-15 17:23:10	2021-10-08 14:30:08
42	58	66	4	2021-09-21 01:05:16	2021-06-18 22:56:38
43	20	77	2	2022-04-13 11:23:27	2022-07-30 13:18:16
44	70	72	4	2021-08-12 11:25:59	2021-07-21 23:10:59
45	40	5	3	2022-01-16 11:48:03	2022-01-28 19:37:11
46	62	73	2	2022-03-13 06:24:32	2022-08-15 10:13:02
47	77	2	2	2022-02-01 07:36:20	2022-02-02 13:14:24
48	93	91	2	2021-11-05 19:18:51	2021-10-03 22:50:54
49	28	4	4	2021-10-15 16:29:18	2022-01-26 13:32:45
50	32	81	1	2021-12-25 13:46:07	2022-02-23 10:07:17
51	65	83	2	2022-01-14 11:17:55	2021-06-02 19:18:13
52	85	86	4	2022-09-04 20:33:16	2021-01-08 09:59:17
53	12	81	1	2021-08-01 23:20:24	2022-09-24 13:38:49
54	73	100	1	2021-10-07 02:56:57	2022-08-04 08:38:19
55	61	7	3	2021-05-11 00:26:05	2022-07-21 23:02:53
56	50	97	2	2022-10-03 10:48:54	2022-08-31 23:11:44
57	33	64	3	2022-08-21 06:16:45	2021-04-27 04:25:25
58	4	73	2	2021-04-20 10:53:57	2021-03-12 00:29:44
59	75	59	3	2022-04-26 20:31:33	2021-11-30 12:52:27
60	46	50	1	2021-05-10 11:15:03	2022-05-18 00:44:06
61	41	18	4	2021-10-21 18:10:04	2022-02-05 01:51:17
62	93	60	2	2020-12-17 02:03:47	2021-11-24 18:34:29
63	89	98	2	2021-06-26 20:22:19	2021-11-14 02:53:39
64	90	12	1	2021-03-11 21:45:49	2021-04-27 09:37:15
65	15	45	4	2021-01-16 22:29:54	2021-09-01 05:42:37
66	16	90	2	2021-04-29 01:36:35	2021-02-19 00:56:21
67	3	78	2	2022-06-22 02:48:34	2021-05-17 23:06:43
68	51	43	4	2021-11-22 20:40:10	2022-09-08 09:20:24
69	95	30	3	2022-07-28 10:43:13	2022-04-28 00:40:00
70	8	80	3	2021-12-06 00:44:40	2022-11-22 05:42:12
71	65	65	3	2022-06-12 03:10:10	2022-11-23 20:27:23
72	20	94	1	2022-10-19 17:59:57	2022-10-06 22:19:08
73	20	74	3	2021-12-05 06:27:54	2021-05-28 19:41:39
74	75	21	3	2021-10-26 13:43:51	2022-03-06 23:47:21
75	54	98	4	2022-07-19 07:40:30	2022-08-02 05:10:54
76	86	46	2	2022-06-13 12:39:49	2022-06-04 00:13:51
77	18	20	1	2021-02-11 09:57:25	2022-10-29 01:44:54
78	80	89	4	2021-05-27 07:46:20	2022-01-06 11:51:26
79	28	70	2	2021-01-12 13:03:53	2022-04-26 21:29:01
80	35	68	3	2021-07-19 19:01:41	2021-12-20 05:07:36
81	58	82	3	2021-09-27 07:37:49	2022-05-31 05:52:06
82	32	94	1	2022-02-14 17:15:11	2022-04-22 12:51:19
83	65	33	4	2022-01-28 05:44:10	2021-05-13 14:02:53
84	1	90	3	2021-09-08 21:14:04	2022-08-19 06:36:20
85	58	39	2	2021-02-14 18:20:09	2022-06-20 16:52:16
86	42	69	3	2022-10-28 03:51:59	2022-08-18 00:27:51
87	8	85	4	2022-07-22 12:49:03	2020-12-29 14:20:24
88	21	46	3	2022-06-27 22:33:24	2022-01-28 01:02:17
89	2	39	3	2022-10-10 12:45:03	2021-12-23 23:53:23
90	79	41	3	2022-03-03 09:43:37	2021-05-04 17:54:28
91	77	81	3	2021-04-22 20:51:52	2021-01-08 20:40:33
92	6	85	2	2022-05-16 05:07:08	2022-01-10 00:16:50
93	34	57	2	2021-02-23 23:21:18	2021-08-19 11:51:55
94	86	81	3	2021-03-31 08:29:46	2021-05-01 07:40:56
95	51	63	3	2021-02-03 07:41:03	2022-09-14 23:43:30
96	75	84	2	2021-10-11 14:26:01	2020-12-24 08:48:03
97	78	63	2	2022-02-24 02:34:40	2022-10-05 00:33:12
98	39	78	3	2022-01-25 13:21:32	2021-04-05 11:00:37
99	69	64	4	2022-05-08 12:23:31	2022-08-04 20:03:54
100	65	62	3	2022-02-26 12:43:20	2021-10-26 12:51:38
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	requested
2	approved
3	declined
4	unfrended
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	38	35	Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis	t	f	2021-06-04 14:57:12
2	37	12	semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque	t	t	2022-04-21 15:39:19
3	69	31	at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam	t	t	2021-11-22 04:50:10
4	82	43	Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus	t	f	2020-12-12 15:49:22
5	17	99	non, luctus sit amet, faucibus ut, nulla. Cras eu tellus	t	t	2021-10-08 14:01:52
6	50	76	eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum.	f	t	2022-08-31 00:02:21
7	81	19	Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu	f	f	2021-02-28 15:24:17
8	74	25	malesuada fames ac turpis egestas. Fusce aliquet magna a neque.	f	t	2022-08-11 10:27:43
9	2	15	ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,	t	t	2022-06-01 02:19:03
10	74	70	adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis	f	f	2021-05-27 09:42:42
11	15	40	Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus	f	f	2022-09-03 10:48:14
12	5	83	Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor	t	f	2021-01-14 09:26:23
13	36	42	eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet	t	f	2021-04-08 16:56:13
14	14	7	velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod	f	f	2022-10-25 16:01:21
15	8	52	tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis,	f	f	2021-05-27 21:03:56
16	58	32	in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer	f	f	2022-02-07 00:39:09
17	93	12	ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id	t	t	2022-09-18 05:47:07
18	81	12	ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula.	t	f	2022-03-09 13:31:52
19	97	55	semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	f	f	2021-11-28 09:49:08
20	70	2	leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,	f	t	2021-09-30 09:48:07
21	59	25	mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed	t	f	2021-07-04 18:47:12
22	31	35	luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed	t	t	2021-12-14 14:42:07
23	98	23	Nulla eget metus eu erat semper rutrum. Fusce dolor quam,	t	t	2021-05-12 16:13:28
24	6	7	orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce	f	t	2022-03-30 16:28:27
25	84	48	Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id,	f	t	2020-12-24 16:16:25
26	89	21	sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra,	t	t	2022-10-25 02:39:55
27	10	52	ac nulla. In tincidunt congue turpis. In condimentum. Donec at	t	t	2022-06-11 09:51:23
28	97	15	a purus. Duis elementum, dui quis accumsan convallis, ante lectus	f	f	2022-03-08 11:06:08
29	8	37	sagittis felis. Donec tempor, est ac mattis semper, dui lectus	t	f	2022-05-28 04:29:56
30	64	53	tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam	f	t	2022-04-24 22:09:16
31	89	35	dui lectus rutrum urna, nec luctus felis purus ac tellus.	t	t	2020-11-28 08:38:33
32	38	5	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis,	t	t	2021-05-27 00:34:47
33	16	59	libero. Proin sed turpis nec mauris blandit mattis. Cras eget	t	t	2022-03-10 09:12:42
34	100	100	iaculis, lacus pede sagittis augue, eu tempor erat neque non	t	t	2021-07-04 15:10:54
35	42	6	in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	t	f	2022-02-25 09:45:21
36	90	44	diam at pretium aliquet, metus urna convallis erat, eget tincidunt	t	t	2021-03-26 21:28:02
37	94	1	lobortis risus. In mi pede, nonummy ut, molestie in, tempus	t	f	2022-09-04 13:18:57
38	85	23	at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et	f	t	2021-07-07 07:06:05
39	73	23	vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non	f	t	2021-10-14 17:49:36
40	15	97	laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,	t	f	2022-10-09 20:48:41
41	19	29	gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat.	t	t	2021-10-26 01:15:23
42	66	15	elit, a feugiat tellus lorem eu metus. In lorem. Donec	f	t	2022-05-01 15:21:04
43	20	6	urna justo faucibus lectus, a sollicitudin orci sem eget massa.	f	f	2021-09-10 15:53:26
44	38	94	et, rutrum eu, ultrices sit amet, risus. Donec nibh enim,	t	t	2021-02-26 03:35:44
45	47	83	auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris	f	t	2022-05-15 07:27:04
46	51	77	Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet	f	t	2021-09-20 10:54:33
47	66	50	tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum.	t	t	2022-02-07 18:57:55
48	70	86	odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a,	f	t	2022-07-01 05:21:28
49	43	39	sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem	t	t	2021-05-05 09:28:51
50	78	83	Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla.	t	f	2022-10-17 06:48:52
51	47	93	consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate	t	t	2020-12-26 19:26:36
52	87	60	rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi	f	f	2021-04-19 06:41:51
53	26	22	a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	f	t	2022-03-03 20:47:52
54	30	53	Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh	t	f	2021-07-07 18:51:39
55	5	36	et netus et malesuada fames ac turpis egestas. Fusce aliquet	t	f	2021-12-04 21:41:11
56	39	74	nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque	t	f	2022-05-23 04:39:35
57	17	94	mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,	t	f	2021-11-20 19:19:52
58	61	61	Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque	f	f	2022-05-04 19:21:52
59	19	54	aliquet magna a neque. Nullam ut nisi a odio semper	f	t	2021-11-03 14:30:43
60	91	23	Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat	f	f	2021-02-17 04:55:19
61	15	11	id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut	f	f	2021-04-17 21:30:19
62	80	84	lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis	t	t	2021-09-21 01:54:20
63	16	40	sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus	f	f	2022-10-29 03:03:32
64	69	15	semper pretium neque. Morbi quis urna. Nunc quis arcu vel	f	f	2021-09-19 07:06:53
65	19	21	ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin	t	f	2021-05-05 08:39:04
66	93	25	placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,	t	t	2022-10-21 04:48:56
67	3	3	dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur	f	t	2021-05-19 00:45:34
68	16	44	tellus justo sit amet nulla. Donec non justo. Proin non	t	t	2021-09-30 05:26:38
69	4	95	dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus.	t	f	2022-01-13 14:45:21
70	77	34	et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus	f	t	2021-10-21 01:21:07
71	45	38	lorem eu metus. In lorem. Donec elementum, lorem ut aliquam	t	f	2021-04-04 09:03:24
72	6	14	tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id,	f	f	2021-11-24 08:37:05
73	82	71	risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed	t	t	2022-11-12 13:15:35
74	44	65	cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit	t	t	2021-01-08 13:20:00
75	92	8	risus. Nulla eget metus eu erat semper rutrum. Fusce dolor	t	t	2022-11-09 16:13:58
76	61	13	Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla	t	f	2022-05-31 03:20:29
77	12	71	nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis	t	f	2021-09-26 01:15:05
78	98	6	lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam.	f	f	2021-01-22 03:25:00
79	43	65	Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed	t	f	2020-12-21 23:33:42
80	71	26	eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce	t	t	2021-07-13 03:10:17
81	35	15	ornare lectus justo eu arcu. Morbi sit amet massa. Quisque	f	t	2022-07-30 11:04:07
82	11	88	ut eros non enim commodo hendrerit. Donec porttitor tellus non	t	f	2021-06-08 05:04:49
83	85	60	senectus et netus et malesuada fames ac turpis egestas. Aliquam	f	f	2021-04-26 21:04:01
84	45	3	sagittis augue, eu tempor erat neque non quam. Pellentesque habitant	f	f	2021-11-07 14:49:41
85	8	89	amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	f	t	2021-11-03 07:14:27
86	90	12	Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique	f	f	2022-10-25 17:41:38
87	33	85	sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum	f	f	2021-03-18 08:59:16
88	57	78	magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus.	f	t	2022-04-30 18:15:27
89	78	56	libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus	t	f	2020-11-26 07:54:54
90	13	31	aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non	t	f	2022-01-05 21:32:32
91	74	67	arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi.	f	t	2021-12-21 23:53:57
92	40	36	quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus	t	f	2021-08-05 21:09:17
93	81	99	posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede	t	f	2021-10-13 07:21:24
94	52	8	mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec,	t	t	2022-07-29 03:42:13
95	55	23	nunc ac mattis ornare, lectus ante dictum mi, ac mattis	f	t	2021-06-12 05:28:39
96	27	23	placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl.	f	f	2021-09-21 11:48:24
97	45	91	amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	f	f	2022-01-09 21:51:17
98	86	97	Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare	t	t	2021-12-17 16:47:26
99	97	56	massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis	t	t	2022-05-26 08:21:51
100	88	88	at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac	f	f	2020-12-19 11:34:57
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	%B5449484365311242^FgyoszgFlbsxh^8106851309?7	28	non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget	2022-01-05 00:42:58	8
2	%B3731163685208160^PypdmuvFfpwvu^6810684272?1	71	malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat.	2020-11-25 13:49:20	13
3	%B5672520457158253^KfruxywNnoyiq^97074782?5	54	Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,	2022-06-07 14:34:13	7
4	%B5538481469491438^JzuptcdYdqlct^8610712544?1	18	id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo	2021-04-29 17:25:17	20
5	%B5493962284482441^LubfmzhYheppw^6202799223?6	52	Sed molestie. Sed id risus quis diam luctus lobortis.	2021-10-06 19:27:48	1
6	%B9551261375812741^OljwmftNxxwew^94021766?7	79	sem, vitae	2021-12-31 01:11:06	11
7	%B6270204015356533^RqyphufRuitih^96069966?7	97	lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus	2021-05-02 03:12:11	19
8	%B7473948433952782^JkoujjuJgzvpt^9202728689?7	79	ligula eu enim. Etiam imperdiet dictum	2022-05-30 18:19:18	17
9	%B8625523276179724^BasxcmfFqbknb^30032803429?2	63	a ultricies adipiscing, enim mi tempor	2021-06-17 19:13:40	8
10	%B3231616215524116^QpyiifxJapenx^8911263904?4	77	risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas	2021-04-27 17:59:25	12
11	%B2437638363942841^JrlwromUwinpp^1410402887?1	1	Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt,	2022-10-30 09:51:52	8
12	%B3981763255378804^MpqjkryNpabxs^38076902252?2	69	iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus	2021-11-18 23:16:20	7
13	%B8560164101643883^LgjkrxrFdangk^2607976707?2	82	nec, eleifend non, dapibus rutrum, justo. Praesent luctus.	2021-03-24 21:24:19	15
14	%B6332671754619885^EqujaplWtxdkj^41074428?7	62	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque	2021-01-04 23:38:54	8
15	%B7655269486649324^ClygisnNgbrig^4710496698?9	17	parturient montes, nascetur ridiculus mus. Proin vel arcu eu	2022-11-12 16:03:04	2
16	%B7407531297223033^QbtjglrLtjuto^2410333286?2	79	Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna	2021-08-04 13:10:25	16
17	%B7440673506831462^PgyeorvRxncqq^64043887239?7	67	Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem	2021-02-02 01:21:44	17
18	%B8922535131141224^RjomjjgBekywk^46124588376?7	99	Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi	2022-05-06 16:18:47	15
19	%B6529988844721967^KfrmeowQcoojr^87126735435?4	25	sem, consequat nec, mollis vitae, posuere at, velit.	2021-12-07 09:55:48	18
20	%B8777371141178488^YfdhuywKiiiqn^98043816?8	23	eu nulla at sem molestie sodales. Mauris blandit enim	2021-10-31 19:27:15	5
21	%B1345538255166223^UnmrjgoJwdiit^6005558229?1	45	laoreet ipsum. Curabitur consequat, lectus sit	2021-01-19 16:09:31	18
22	%B7359912101011871^QoimiygSlspkf^0307781430?9	48	tempor erat neque non	2022-02-25 10:00:42	12
23	%B4358687475178954^DwuhtnaMhoujp^9804686353?4	38	non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida.	2020-11-24 13:44:35	16
24	%B4956833022222144^DkkhlfmFlmwpa^5108150534?8	60	velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet	2021-11-01 19:11:37	2
25	%B3802612587883508^OyhfofhGebikk^40115594270?8	44	cursus et, magna. Praesent interdum ligula eu	2022-01-11 03:57:56	7
26	%B5691524721108781^OirrrqiKsfybm^22046801?9	20	urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula	2022-03-16 06:27:40	11
27	%B3886431201626131^QnxbqniSfecfx^27076823959?1	61	mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu	2021-09-09 16:39:48	13
28	%B7577130739341157^ToymodsSfgsfq^39058279249?7	24	Vivamus non lorem vitae odio	2022-03-14 10:34:28	15
29	%B6038132583525783^PaoqesdGnhtyg^0502534400? 	59	dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse	2022-08-20 19:32:11	10
30	%B8689778835587825^OlysbwmDdcosi^23091194809?4	42	sed dolor. Fusce mi lorem, vehicula et, rutrum eu,	2022-06-12 18:34:06	8
31	%B6487379586134486^EqnghnmVydbxx^2602778865?1	11	hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam	2022-08-31 19:37:06	5
32	%B5228626894060478^OqoqfggVfeknq^4203706465?1	36	commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis	2021-09-18 12:35:39	20
33	%B3649859101163708^HnpwsjmSfdlgg^65062507112?1	76	ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros	2021-01-12 19:56:08	1
34	%B6120376938382177^YfqincjXgtwyo^04095676952?6	17	urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas	2021-10-01 01:03:45	11
35	%B3050625345696384^HmydqefEvjode^19074297000?7	86	a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat	2022-02-20 14:17:08	14
36	%B3032175654139441^JnhjyqoFfhntz^1309602785?8	37	sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis	2022-08-08 10:53:31	10
37	%B4083746189849038^RikqrlqWgneue^6901941287?3	46	Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante	2022-01-10 12:02:55	16
38	%B4786727558847222^FhbhnjyQknsue^8508667626?9	25	convallis	2021-02-03 22:43:51	10
39	%B5620390665434567^YhgodlqEcivms^02054879?7	39	enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras	2022-02-11 02:37:41	8
40	%B6018384874567655^SlbvwmoTgdxqf^4205526175?1	86	aliquet molestie tellus. Aenean egestas hendrerit neque.	2021-04-19 06:24:02	18
41	%B8354611145473441^JkxyndrBkcejd^2111971634?8	41	Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat	2022-06-16 07:10:51	20
42	%B7227230475463609^MpzuvuoTuxqwr^26037773?4	81	ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,	2022-06-23 15:14:19	4
43	%B4211922991566968^LswiyclKlpchr^4706390251?3	98	Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl.	2021-05-03 03:30:45	5
44	%B6103974880001793^UrnltzvHnkpwk^9306473527?3	66	turpis. Nulla aliquet. Proin velit. Sed malesuada augue	2021-09-06 11:58:58	9
45	%B1746737357817154^OojyhlqBvvmei^0710738512?3	12	ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id,	2022-06-22 13:41:17	10
46	%B1468775556488217^EpyekclWzirga^19073977153?4	21	fames ac	2021-07-28 05:40:40	15
47	%B3293685469668763^WbbhfjuPjxtfl^7907907264?3	68	orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames	2022-09-24 10:47:13	3
48	%B8831922810597660^ToshjmbWpzjbu^44059709066?8	47	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum.	2021-05-29 03:08:30	11
49	%B8749644229373311^XwqcrpvBgenmw^5811682348?6	18	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis.	2021-06-16 13:10:26	20
50	%B3315272348535262^EqcpflwIjsqgr^7505844680?6	77	luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris	2021-10-30 05:16:18	20
51	%B9366145621103018^AsifnvlUvxewk^16039793322?7	19	pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales	2021-10-01 22:34:23	10
52	%B2911403291515755^JvebcwcHnyomo^44036902673?6	78	mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac	2022-10-10 16:17:15	11
53	%B4753196393675646^ImisnrjVtjigp^2303714527?8	18	luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum	2022-09-02 20:36:30	19
54	%B4412283737696132^BdmhfpoYhbgnu^9902826650?8	66	natoque penatibus et	2022-07-04 18:16:39	9
55	%B6583023825153381^MlgjmtxUqhvcp^57109315?4	89	libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus	2022-09-24 04:21:18	12
56	%B6022336837220123^TywgvjbFgtsmd^20061757?9	52	vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id	2022-05-22 19:25:36	4
57	%B8187846990772403^WxffhduHpxkqm^8503199391?5	25	dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id,	2021-07-05 22:47:04	17
58	%B4218630387928571^BrmzoykUlwbql^98068917901?8	5	Mauris molestie pharetra	2022-01-03 23:32:11	14
59	%B7087376187591680^SstjcfjVgkhth^0404774859?7	47	Aliquam nec enim. Nunc ut erat. Sed nunc est,	2021-09-16 18:11:14	20
60	%B8258618494245358^UpnjjuiWdkmkr^62028565?4	43	scelerisque sed, sapien. Nunc	2021-05-17 23:08:35	18
61	%B5467393022533622^WjmtnoxDwjrds^98093113?4	21	Phasellus elit pede, malesuada vel,	2020-12-28 14:15:50	5
62	%B2968065430574767^RweqimaYdcpyw^1411746259?2	31	quam dignissim pharetra. Nam ac nulla. In tincidunt	2022-07-13 09:45:58	9
63	%B2687865430326341^SxkwibvGmgvky^83021886? 	64	lacus vestibulum lorem, sit amet ultricies sem magna	2022-10-25 00:16:02	9
64	%B2420555232738454^DillfweCfobul^9305505697?8	28	at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	2022-06-07 16:07:09	6
65	%B7362213954294150^MuohapkUsllgh^8702507780?8	89	In scelerisque scelerisque dui. Suspendisse ac	2022-01-05 23:39:06	2
66	%B6972348873634181^EerpzkuYnrgtd^7904983597?2	38	auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.	2021-08-20 13:07:58	11
67	%B5416072417333414^QtqygylRyfmwk^3209956709?5	83	erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel,	2021-02-01 17:28:33	14
68	%B4522581769936877^XvrlidkEqryvv^96128922564?1	54	Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,	2021-11-05 14:50:54	13
69	%B8350452066737903^CuqkuexHynnfm^6111305868?7	27	amet massa. Quisque porttitor eros nec tellus. Nunc lectus	2021-04-25 23:56:49	14
70	%B2264080488278242^TzbspddYgnpvy^15027276?8	86	ac, feugiat non, lobortis quis, pede. Suspendisse dui.	2022-02-04 12:03:17	19
71	%B7641368687516474^TllihgpGbuuga^2804916734?2	11	amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim.	2021-09-14 08:43:31	17
72	%B7541854549524326^MocvfekSbvfid^61074548832?2	96	egestas a, dui. Cras pellentesque. Sed dictum. Proin eget	2021-03-02 22:00:37	4
73	%B7583766219275316^MbkjsyrRmbecm^4511342980?8	94	sapien imperdiet ornare. In faucibus.	2021-07-10 20:32:20	15
74	%B5083161655818143^QgeyuqiZncfqm^9112842356?3	32	risus. Morbi metus. Vivamus euismod urna. Nullam lobortis	2021-08-01 04:14:51	10
75	%B7752775788657297^JhnqiusGkcnmp^5702187589?5	73	augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis	2021-08-28 21:38:25	4
76	%B6163131121678531^KbtlvfrRvilkt^12097673670?7	90	montes, nascetur ridiculus mus.	2021-04-24 20:54:06	17
77	%B2519841541455730^TdrctyjRuzdsg^38093676?3	37	eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus	2021-07-23 09:03:05	8
78	%B5850888311921378^WcrhtkiEinbfw^0609590343?8	80	et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed	2021-09-22 20:41:05	16
79	%B6374765217881474^IxbhifoHxicwr^1907764957?8	85	Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas	2021-07-09 12:43:06	5
80	%B7395787277646672^RwjbhmvLjxezu^4607324340?4	49	Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor	2022-09-02 15:33:54	7
81	%B5663286612871949^VhafyciBattdd^3208978991?5	98	ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius	2021-03-11 15:40:51	6
82	%B2541717274448022^UficzqjBlnkcn^7312256675?8	93	Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum	2022-03-17 19:03:39	5
83	%B5254485502718806^NwrbpmhLvcdvl^5104728948?8	60	a, malesuada id,	2022-02-08 16:45:09	10
84	%B9866212474033027^WdfjrhtPpqbsb^63071276150?5	23	dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem	2021-09-14 16:28:37	13
85	%B1461764289671661^RuecsedMwkyof^5407512790?4	55	in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu	2021-01-12 00:36:02	9
86	%B9395013822278596^QusprmnWvixft^75026259?2	20	Nulla interdum. Curabitur	2022-11-05 10:13:37	16
87	%B2962561332435975^NbctvgxOgtcft^0711700206?4	81	faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris.	2022-05-02 20:03:46	2
88	%B3095517641588628^OgmushkFzlpje^48034651879?3	15	orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu	2021-08-11 22:51:35	8
89	%B9525366597322446^IgsqlqkIkeuuk^31092699?7	7	vitae purus gravida sagittis. Duis gravida. Praesent eu nulla	2021-05-27 01:28:23	13
90	%B8696474659861298^GrfvjvpLvqkmn^2501620894?3	12	orci, adipiscing non, luctus sit	2022-02-15 11:14:55	5
91	%B5287869939010897^HlcyguqDbhnfs^21024336750?1	59	pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu	2022-07-07 04:14:14	11
92	%B3421372854817267^UqxicviHldvyh^19084602?2	11	a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi	2021-09-06 20:10:54	4
93	%B2839119569644786^DiltvbkWyooyd^6406726136?3	34	eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant	2022-02-02 23:08:25	11
94	%B6189157443400444^DmgifqrYrqgcv^38079947232?9	10	Nunc mauris elit, dictum	2022-09-14 04:37:11	10
95	%B7138071132651756^HmiisiyCxclix^83068827781?7	74	velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc	2021-10-05 11:27:34	3
96	%B5248189339351926^NlbntmdJcwggs^55053365999?9	22	Quisque libero lacus,	2022-06-01 11:39:20	4
97	%B8579471238475457^KbfpqyrVndcjp^9109201721?1	16	magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna.	2021-10-06 08:08:00	4
98	%B6555328778477545^BewfgrjDjzbjq^05091248714?7	86	non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer	2022-10-15 21:36:34	10
99	%B1415035445178414^GpbtiaiNyxdcj^53095092?9	12	Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam	2022-02-20 21:30:14	15
100	%B5207356195654615^QtqvukxFvkqfq^07043059?6	32	consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum	2022-07-12 08:30:18	19
\.


--
-- Data for Name: subscriptions_communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions_communities (user_id, community_id, subscribed_at) FROM stdin;
8	46	2021-10-21 23:27:20
82	28	2021-04-27 20:22:29
77	82	2021-08-29 09:38:53
18	53	2021-06-30 07:21:44
39	95	2022-09-29 05:42:33
70	48	2021-08-28 03:36:20
73	78	2022-09-19 03:16:26
5	38	2021-01-22 11:37:39
52	55	2022-07-08 01:06:41
74	51	2022-06-26 21:37:29
60	2	2021-01-10 07:11:40
61	22	2022-02-01 15:49:26
46	66	2022-01-22 15:16:54
42	16	2022-05-19 23:08:05
66	88	2020-11-27 03:28:35
78	9	2021-08-04 03:18:55
27	4	2021-11-01 01:02:24
75	41	2021-12-30 15:01:07
52	15	2022-01-08 08:17:26
35	68	2022-10-21 10:26:06
47	42	2022-09-12 11:20:31
14	91	2021-04-20 19:50:16
10	20	2021-11-04 23:57:55
81	77	2022-09-11 16:29:27
43	23	2022-05-15 08:32:27
68	52	2022-03-17 06:55:36
76	30	2022-01-25 05:12:58
40	29	2022-11-20 13:49:41
94	81	2021-12-05 15:00:25
9	96	2022-08-30 06:03:07
83	91	2021-10-02 03:35:03
81	10	2021-08-02 21:23:18
39	85	2022-05-20 00:47:18
14	56	2021-03-31 13:46:56
31	94	2021-04-24 20:43:36
79	41	2021-06-13 18:47:45
32	58	2022-08-27 12:13:45
42	17	2022-05-17 15:21:01
54	5	2022-08-06 00:50:11
65	63	2021-01-12 15:54:58
78	16	2021-09-13 08:18:40
48	68	2021-07-20 20:34:14
23	17	2022-10-06 06:28:43
21	60	2021-04-20 19:42:56
53	81	2020-12-26 02:34:39
50	38	2022-02-25 13:05:20
24	43	2021-08-25 12:30:23
39	17	2022-03-10 11:36:19
53	2	2021-02-04 10:42:02
19	26	2021-12-23 06:37:24
51	89	2021-12-23 23:43:57
97	52	2022-02-27 14:05:18
63	77	2022-07-31 12:51:21
42	18	2022-04-01 02:06:02
29	73	2021-09-28 07:39:24
20	56	2021-11-26 11:05:09
75	3	2021-03-03 22:12:10
31	49	2021-10-11 09:38:47
77	17	2021-08-24 12:36:13
72	97	2021-09-14 17:49:15
81	76	2022-04-19 16:43:01
95	69	2021-03-07 19:03:06
31	9	2022-09-22 14:51:06
32	98	2021-09-11 03:26:52
33	3	2022-11-07 18:48:15
40	39	2021-03-09 16:07:44
66	7	2020-12-06 09:19:01
62	69	2020-12-07 16:07:25
78	37	2021-01-03 04:29:58
61	67	2021-02-16 01:53:30
62	78	2022-01-11 05:38:42
37	76	2022-08-06 23:53:44
50	42	2021-07-01 22:39:37
18	31	2022-01-01 23:19:37
22	11	2022-08-11 12:43:38
92	42	2021-08-22 06:28:21
50	11	2021-10-08 16:40:26
80	90	2021-09-11 08:45:22
67	67	2022-10-10 04:43:58
22	67	2021-09-14 22:24:01
66	80	2022-05-12 07:55:12
27	38	2021-08-30 21:55:38
74	2	2021-10-23 18:06:02
89	87	2021-06-10 00:21:04
99	88	2022-05-05 18:32:03
48	92	2022-10-16 08:02:40
90	78	2022-02-21 21:36:31
54	91	2022-03-26 21:25:51
25	25	2022-02-19 03:45:30
4	3	2021-03-25 12:34:21
8	16	2021-06-25 04:48:37
43	22	2022-07-17 23:07:01
90	73	2021-09-07 02:17:14
26	39	2021-11-28 17:01:36
37	15	2021-05-27 20:28:11
11	8	2022-05-22 01:18:04
23	31	2021-03-27 14:00:13
65	16	2022-03-13 03:45:09
83	82	2022-02-17 07:52:07
40	92	2020-12-07 12:24:23
\.


--
-- Data for Name: subscriptions_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.subscriptions_users (from_user_id, to_user_id, subscribed_at) FROM stdin;
79	63	2022-02-20 15:17:02
67	58	2021-03-22 16:51:47
100	48	2021-01-08 18:41:02
92	39	2022-07-28 03:36:03
75	42	2022-02-15 01:23:13
83	24	2022-03-08 07:52:46
56	16	2021-09-30 03:10:27
42	11	2021-07-17 03:45:29
18	58	2022-06-29 05:58:47
15	50	2021-05-25 22:30:49
27	58	2020-11-28 01:06:38
47	49	2022-06-30 22:51:37
86	43	2022-03-31 11:50:43
80	74	2021-08-28 08:40:15
42	64	2022-10-10 03:01:30
41	65	2022-10-01 15:14:30
23	36	2021-01-02 07:16:10
85	60	2021-11-30 17:00:33
82	41	2021-04-23 21:49:03
44	37	2021-01-09 05:49:49
93	22	2021-06-22 14:47:23
40	73	2021-09-18 00:42:26
4	56	2022-04-02 17:02:50
24	7	2021-12-17 14:45:04
3	5	2021-09-20 08:32:49
73	99	2022-05-10 22:31:28
21	66	2021-12-11 06:20:14
24	26	2021-04-27 02:14:25
52	41	2021-06-03 14:08:48
88	66	2021-02-28 04:54:07
96	13	2022-06-06 16:22:00
79	8	2022-03-24 03:32:40
64	64	2020-12-25 23:32:24
43	11	2022-07-12 19:07:33
5	90	2021-10-23 00:20:30
96	60	2021-09-04 04:48:33
45	31	2022-06-14 02:06:16
27	87	2022-03-27 13:38:19
95	93	2022-01-30 14:57:35
3	46	2021-07-11 21:47:51
82	15	2021-03-14 11:17:43
58	94	2022-11-12 11:27:40
6	12	2021-02-18 08:16:29
36	71	2022-01-12 14:22:44
66	39	2021-04-30 01:56:52
59	12	2022-02-25 23:40:06
95	37	2022-07-21 23:27:46
16	23	2022-08-24 15:18:27
82	37	2022-01-11 04:58:30
62	11	2021-03-11 14:30:59
94	68	2022-02-13 14:10:49
81	21	2022-01-22 14:11:07
4	74	2022-09-29 02:15:40
91	14	2021-07-13 13:29:53
100	99	2022-09-12 14:03:38
18	29	2021-08-24 11:42:03
37	8	2022-09-25 03:19:00
66	79	2021-02-19 16:55:14
53	25	2021-10-03 14:56:40
78	22	2021-11-04 05:27:12
31	43	2021-04-07 21:53:07
84	90	2021-02-19 07:47:56
42	79	2022-09-13 09:14:42
36	24	2021-08-22 04:31:01
91	2	2021-01-31 07:09:42
87	8	2022-10-24 12:14:18
89	80	2021-05-03 00:11:46
7	25	2022-01-22 04:24:17
22	56	2021-10-26 19:03:36
59	30	2021-12-25 16:26:50
14	48	2022-11-03 21:47:03
95	66	2022-05-27 18:29:16
46	68	2022-07-20 13:10:06
72	54	2021-01-26 19:58:43
57	18	2021-12-24 14:38:05
82	59	2021-07-16 15:20:32
8	7	2021-03-14 16:54:34
15	33	2021-10-02 04:49:59
7	18	2021-11-11 10:32:23
94	69	2021-08-13 22:41:50
25	32	2021-01-07 07:24:26
76	94	2022-09-10 04:10:46
99	62	2020-12-29 10:50:41
100	37	2022-01-19 05:49:29
81	89	2022-04-14 07:38:46
70	6	2022-02-02 11:04:08
68	60	2021-01-11 05:41:41
58	24	2022-05-07 17:40:41
1	19	2022-06-25 09:01:40
50	27	2022-03-07 20:03:52
85	70	2022-10-25 05:50:00
72	19	2022-09-17 12:54:37
65	93	2022-01-22 08:48:06
26	59	2021-04-29 21:55:50
77	91	2022-09-20 15:25:05
70	91	2021-01-22 17:53:15
52	25	2021-02-26 10:46:37
10	1	2021-11-07 18:05:39
32	82	2021-10-22 03:03:00
97	34	2022-08-16 00:51:33
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Rhoda	Freeman	erat.in@hotmail.org	(281) 703-2775	33	2021-12-23 04:36:26
2	Alfonso	Ford	ligula.tortor@protonmail.edu	1-922-231-9611	4	2022-06-09 08:29:14
3	Xenos	Dennis	elit.pharetra@yahoo.net	(979) 856-4356	43	2022-10-31 03:46:50
4	Kyra	Petty	proin.vel.arcu@protonmail.ca	(888) 660-7704	89	2021-01-29 14:43:02
5	Amery	Baxter	eu.nibh@outlook.couk	1-953-147-2344	60	2021-11-03 02:08:14
6	Jesse	Callahan	eget.varius.ultrices@hotmail.com	(277) 624-9443	22	2021-11-30 09:04:52
7	Laura	Oneil	laoreet.libero.et@google.org	(754) 882-8464	85	2021-06-20 06:29:17
8	Randall	Cooper	nunc.risus@protonmail.edu	(123) 632-8183	27	2022-11-15 00:04:08
9	Hall	Figueroa	ligula.elit@outlook.edu	1-523-255-3382	97	2021-01-11 23:38:06
10	Murphy	Steele	lorem.vitae@outlook.ca	(576) 446-9373	82	2022-01-21 14:57:13
11	Eve	Franks	mi@hotmail.com	1-828-441-1824	11	2020-12-21 16:29:09
12	Cynthia	Michael	id.enim@aol.edu	1-243-919-4181	99	2020-11-29 04:51:06
13	Chaim	Roth	tortor.integer@protonmail.net	1-456-443-4216	21	2021-04-30 19:06:33
14	Tara	Livingston	magna.cras@hotmail.org	1-674-641-6434	87	2021-11-22 09:49:23
15	Maile	Salazar	et@aol.couk	1-279-515-9381	95	2021-04-18 23:58:55
16	Hiroko	Lowe	ac.libero.nec@protonmail.com	(628) 292-3428	78	2020-12-10 17:41:23
17	Zenia	Farmer	curabitur.massa@icloud.org	(843) 406-0555	94	2022-01-21 11:15:26
18	Libby	Gonzales	dolor.quam@protonmail.com	(705) 552-7441	44	2021-02-04 19:32:44
19	Piper	Riddle	augue@google.com	(745) 866-6739	78	2022-08-23 10:25:23
20	Brennan	Moreno	blandit.mattis@google.edu	1-285-357-5116	29	2020-11-30 03:18:13
21	Wesley	Bradshaw	gravida.praesent@icloud.com	(471) 889-7381	87	2022-09-07 22:11:40
22	Sybil	Castillo	vestibulum.ante@aol.ca	1-891-754-7212	29	2021-02-28 01:11:40
23	Colin	Monroe	sem.pellentesque@outlook.com	1-629-435-5774	11	2021-04-09 00:46:02
24	Troy	Travis	elit.erat.vitae@hotmail.edu	1-434-943-6546	69	2021-09-11 03:06:50
25	Kenneth	Hewitt	nibh.quisque.nonummy@yahoo.couk	1-322-512-9672	81	2022-06-18 03:27:52
26	Jaquelyn	Mullen	malesuada.ut.sem@hotmail.com	(899) 718-3308	65	2021-05-14 18:06:23
27	Summer	Rowe	morbi@icloud.org	1-337-630-5626	3	2022-04-12 02:09:49
28	Madaline	Riggs	suspendisse@yahoo.org	1-485-774-3140	61	2022-02-17 11:27:04
29	Ivan	Dalton	sapien.nunc@aol.com	1-525-402-2674	27	2022-01-21 11:03:40
30	Harding	Carey	vestibulum.lorem.sit@outlook.ca	(254) 851-5121	76	2022-06-07 12:23:57
31	Ursa	Evans	quis.diam@google.couk	(619) 202-8754	6	2021-07-29 20:13:19
32	Uta	Finch	vestibulum@google.com	1-238-823-1537	77	2021-03-05 12:51:38
33	Dorothy	Hancock	lorem@yahoo.edu	(752) 625-7012	61	2021-08-03 15:25:58
34	Stuart	Herrera	nunc.sed@hotmail.com	(217) 864-3734	43	2022-02-11 17:10:35
35	Jennifer	Lang	ante.maecenas.mi@aol.couk	1-533-392-5611	51	2022-05-13 16:25:17
36	Cleo	Alford	dictum.cursus.nunc@aol.org	1-308-780-7629	22	2021-12-03 10:16:40
37	Scott	Glenn	nunc@google.edu	(876) 335-5153	83	2022-05-12 21:48:45
38	Velma	Vance	in.felis.nulla@hotmail.ca	(447) 443-8475	45	2022-01-23 02:40:21
39	Jolie	Weber	maecenas@protonmail.ca	(486) 279-4117	67	2021-10-01 14:57:52
40	Ella	Beasley	iaculis.aliquet@google.org	1-761-416-3127	68	2021-09-01 21:16:38
41	Shelby	Mcdowell	dui.semper@icloud.net	(469) 534-3641	88	2021-03-02 09:51:12
42	Chava	Kaufman	nisi.cum@hotmail.org	1-278-510-3988	94	2022-03-15 17:31:03
43	Jordan	Knowles	non@yahoo.ca	1-523-859-6133	33	2021-04-17 12:05:05
44	Davis	Simpson	nisi.dictum@protonmail.ca	1-432-382-8680	15	2021-11-15 11:57:30
45	Emerson	Mercer	integer.eu@aol.com	(244) 683-3488	24	2021-11-15 17:36:00
46	Hiram	Guzman	in.consequat.enim@yahoo.net	1-211-875-4781	3	2021-04-25 04:37:32
47	Xyla	Soto	rutrum.eu.ultrices@yahoo.com	1-687-785-4412	40	2022-02-21 17:50:30
48	Malachi	Rasmussen	lorem.sit@yahoo.edu	1-789-659-4165	27	2021-11-25 21:02:27
49	Kelly	Dejesus	enim@icloud.ca	(231) 287-1197	21	2021-11-11 20:23:41
50	Hoyt	Pickett	integer.in@google.com	(211) 655-6831	72	2022-07-15 06:23:27
51	Burton	Dunn	convallis.convallis.dolor@yahoo.edu	(664) 814-9487	41	2021-07-02 01:15:25
52	Reagan	Jackson	varius.nam.porttitor@aol.org	1-343-201-8791	25	2022-10-01 20:54:16
53	Shafira	Case	dictum.eu.placerat@protonmail.edu	1-439-881-2124	20	2021-11-13 12:29:15
54	Ciaran	Zamora	curae@aol.edu	1-345-651-7553	34	2021-05-25 05:31:33
55	Stephen	Boyer	euismod.in@google.org	(784) 562-4249	30	2022-02-20 12:07:26
56	Barbara	Hardy	purus.ac@aol.edu	1-394-340-5720	3	2022-03-16 18:49:59
57	Whitney	Diaz	sollicitudin.a.malesuada@aol.ca	(571) 246-5772	59	2022-05-02 15:31:59
58	Aline	Mccarty	justo@protonmail.net	1-449-708-8262	35	2022-03-16 02:53:33
59	Ishmael	Trevino	nullam@google.org	1-303-322-4476	43	2021-07-17 10:40:55
60	Charlotte	Mcclure	vel.turpis@outlook.com	1-461-103-5829	98	2022-02-26 21:15:41
61	Dennis	Matthews	ultrices.posuere@outlook.couk	(526) 543-7460	33	2022-11-22 05:48:23
62	Harrison	Durham	egestas.ligula.nullam@icloud.net	(336) 473-3112	28	2021-10-30 03:31:53
63	Dale	Blackwell	pede@outlook.ca	(472) 412-7537	38	2022-09-30 14:30:50
64	Graiden	Gentry	nec@hotmail.com	1-538-419-1358	36	2021-09-11 04:21:21
65	Jena	Sampson	dui.fusce@google.edu	(338) 439-1012	64	2022-01-24 18:05:58
66	Mason	Conner	feugiat@outlook.org	(623) 742-4063	53	2020-12-14 09:41:49
67	Dahlia	Carey	amet@icloud.net	(815) 327-1765	74	2022-09-14 07:42:27
68	Murphy	Stanton	neque.sed.dictum@google.net	1-335-232-4116	73	2022-11-16 16:32:03
69	Jordan	Hogan	montes.nascetur@google.org	1-722-678-4582	88	2021-09-08 05:03:37
70	Raphael	Watts	luctus.felis.purus@yahoo.com	(651) 177-7851	55	2022-03-25 05:55:25
71	Wylie	Mercer	vel@icloud.edu	1-101-835-2806	62	2021-03-04 12:25:07
72	Angela	Munoz	nam.tempor@protonmail.couk	(268) 558-5375	12	2022-06-19 12:29:55
73	Clementine	Reilly	tempor@outlook.couk	1-248-350-6482	69	2021-02-15 08:34:26
74	Amery	Weaver	vulputate.lacus.cras@icloud.com	(325) 927-8323	58	2021-09-15 05:37:08
75	Raven	Knox	dolor.tempus@yahoo.com	(617) 464-0074	51	2020-12-23 10:56:23
76	Amela	Wade	risus.varius.orci@hotmail.couk	1-843-468-9202	73	2022-06-24 17:30:41
77	Ezra	Sanford	cum.sociis.natoque@aol.edu	1-778-243-2826	18	2021-12-05 00:37:14
78	Phillip	Wiggins	lacus.varius@aol.com	1-924-458-7375	90	2022-08-29 21:39:40
79	Drake	Kaufman	vulputate.ullamcorper@aol.com	1-462-662-8777	22	2022-06-21 22:52:50
80	Rashad	Whitney	sociis@yahoo.ca	(679) 828-2071	66	2022-03-26 06:07:05
81	Wanda	Petersen	tempor@google.org	(626) 145-8588	80	2021-12-31 20:50:56
82	Ava	Beck	integer.tincidunt@outlook.org	(231) 426-8365	31	2021-09-02 17:21:14
83	Zorita	Schneider	posuere.vulputate@hotmail.edu	1-349-741-5935	9	2021-01-18 20:04:31
84	Lisandra	Fitzgerald	in.cursus@hotmail.net	1-344-769-3697	70	2022-05-21 15:22:48
85	Quin	Barry	consectetuer.adipiscing.elit@protonmail.org	(559) 686-2782	78	2021-05-05 12:07:54
86	Maile	Harper	lectus.cum@outlook.org	1-247-382-5484	46	2022-08-10 02:20:27
87	Fallon	Kidd	fusce.aliquet@outlook.org	(752) 956-4233	21	2022-04-13 11:02:22
88	Basil	Holmes	fusce.dolor.quam@icloud.com	(311) 746-9727	84	2021-09-05 18:18:53
89	Nayda	Skinner	quisque.libero.lacus@hotmail.ca	1-805-857-3886	18	2020-11-30 22:31:37
90	Leonard	Dixon	vel.convallis@protonmail.net	1-345-778-0825	78	2022-07-04 07:28:15
91	Shellie	Jarvis	vitae.erat.vivamus@icloud.couk	(362) 873-8383	58	2021-04-12 21:04:44
92	Merritt	Sanchez	urna.et@hotmail.couk	(369) 678-8361	38	2022-11-20 20:07:42
93	Lawrence	Baldwin	in.dolor@yahoo.couk	(848) 894-2333	18	2021-08-02 04:52:28
94	Mark	Ellison	fringilla@google.edu	1-614-325-2437	56	2022-05-28 23:28:00
95	Brian	Ferrell	eleifend.vitae@hotmail.couk	1-817-566-6561	81	2022-05-01 01:16:05
96	Audra	Peterson	sed.eu.eros@outlook.ca	(666) 740-3037	89	2022-02-09 08:36:30
97	Levi	Alexander	libero.lacus@outlook.ca	(674) 611-7145	5	2021-03-18 19:26:30
98	Howard	Ewing	eu@hotmail.org	(535) 344-9778	61	2021-05-18 14:48:24
99	Ivor	Castaneda	orci.luctus@outlook.edu	1-681-303-9324	70	2020-12-01 17:56:41
100	Gemma	Singleton	adipiscing@aol.org	1-338-812-3086	23	2021-11-26 18:31:00
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
1	%B8738281984074898^VxsmepmPixccg^8110598167?6	9	consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales	2021-12-04 05:56:16	1353
2	%B4734075974556766^YsiecuhSukigs^9111873434?6	72	Sed congue,	2021-02-23 09:49:09	1362
3	%B6355878358281228^MnaitzjLmkeyp^34031349182?6	55	nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus	2021-04-27 22:14:02	255
4	%B4526581743856135^CrjjcmtFnfwpp^15116287?7	51	ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida	2022-10-25 15:22:24	1590
5	%B6207117346385218^QtdllnuRbadyh^54054115306?2	27	euismod ac, fermentum vel, mauris. Integer sem	2021-12-16 08:53:53	508
6	%B6184863700682824^PusibdhByjynk^8611946883?5	25	Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse	2022-05-21 06:27:27	303
7	%B2551825670611656^OqvjbhoYxhiig^3904925528?4	93	imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.	2021-05-19 21:22:09	237
8	%B5296577475886676^ChnbvkmFtkoua^98061622162?6	75	ut quam vel	2020-12-15 18:25:23	629
9	%B5686864287298854^SmypuubIdhsgt^42019363303? 	23	nec ante blandit viverra.	2021-05-10 22:21:27	444
10	%B6315546610353178^PurlwesYjqmhp^66045444?1	64	eu, ligula. Aenean euismod mauris eu elit. Nulla	2022-09-14 22:27:42	1698
11	%B8406142727835720^FwmxhdfNvrtdq^62084568?7	50	Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.	2020-12-11 06:19:44	1429
12	%B2645918128046859^VvdztgsLzeerh^7005787169?3	25	sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales	2022-09-10 06:43:07	750
13	%B1216241841374538^CvfajquUizxcj^2405337175?2	58	Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum	2022-05-15 10:10:31	1878
14	%B6428575688046594^MsurwfiCbutic^0102879261?1	68	quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per	2021-04-07 01:09:13	807
15	%B3707314253955161^KbodkuyTbefuh^73069067?5	84	Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in	2022-09-11 20:25:49	616
16	%B3055359901572101^IufveuyFitqgt^0803969335?1	96	vitae nibh.	2022-02-01 03:46:27	1773
17	%B5196825155774617^SemgkidNtyxcb^7211338859?7	11	dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna	2022-05-15 05:24:06	1190
18	%B5136826224960285^YqqslvxYrjtov^34043541172?9	77	Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis	2022-10-10 23:24:10	399
19	%B6851623415526168^EhfvbqmYfcuhc^6801679866? 	7	sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus.	2022-05-12 17:56:13	1584
20	%B1778816636400564^MypulwgQffaly^77052233765? 	4	ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac	2021-07-08 10:00:26	1172
21	%B5488261163556371^TjnhjplYrhmhq^3207621601?7	73	arcu vel quam dignissim pharetra.	2022-07-17 05:55:49	1976
22	%B1776218577596179^MuuyjnaMlyzrt^45059961455? 	93	ut nisi a odio semper	2021-06-21 18:49:37	300
23	%B2214338355410991^SlpofhaEgiubc^5507132742?6	21	Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue	2021-09-02 16:49:59	1691
24	%B4675657855941577^DlxkhhuNspjys^9202419585?5	7	dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non	2021-11-25 02:32:30	1322
25	%B1614129722150348^KxivhrhOdiuhh^5606516579?1	81	risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,	2021-09-06 18:25:18	1288
26	%B8318326652536677^HzoklnvUlqwyw^29095824?1	30	In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc	2021-01-19 13:27:37	1832
27	%B6228535410768445^QybhubwPuldub^54107318?9	75	neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada	2021-06-15 19:54:23	1583
28	%B2049452181425359^RvgmuruEqdqjf^8602563545?4	27	Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,	2020-12-12 18:17:55	1416
29	%B2967137517150311^JtgcbkoYlfrvb^4902235924?7	83	Cum sociis natoque penatibus et magnis dis parturient	2021-03-15 11:08:47	302
30	%B7091762798235259^LgcdxddEuhiol^2103796328?3	79	Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.	2021-05-03 03:19:35	127
31	%B8559754683364274^JtuampoOigfui^66086618?4	65	euismod enim. Etiam gravida	2021-09-28 22:28:44	744
32	%B8605303732657142^DgqyfgtHsoefy^0802726719?2	60	Sed dictum. Proin eget	2021-07-28 21:17:38	1760
33	%B9152841656405132^HpztvghHvufri^19072393?8	36	eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis.	2022-10-16 19:13:06	1648
34	%B7645627782762718^VyjijbdPbpiir^63081685?3	56	mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu	2022-03-27 21:09:15	1844
35	%B3967570414696562^YcshhsfDekivs^14058608410?1	54	Aliquam vulputate ullamcorper magna. Sed eu eros.	2021-01-03 20:14:03	1257
36	%B8417967229208474^QnsfanoEifjir^4308756636?5	35	orci lobortis augue scelerisque	2021-03-28 16:21:33	290
37	%B4753463551527152^FklmijvEdgihn^7202461803? 	42	neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa.	2022-04-01 00:01:29	890
38	%B1318508741201515^CdvexqrUichye^29108181504?4	34	Cum sociis natoque penatibus et magnis dis parturient	2021-03-11 23:55:28	642
39	%B6210441222872843^IytypnbYfjiuk^8709900531?1	33	ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam	2022-03-03 07:21:18	1824
40	%B1318406684084838^UqjgellJbhibw^47123405066?8	32	tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam,	2021-06-13 17:08:29	1399
41	%B6872321547224800^YfvbyfgFosgsg^1502981714?6	98	velit.	2022-10-12 01:08:03	1205
42	%B2903545313566404^DlqpgqtVvrqdu^52105938?5	56	purus sapien, gravida non, sollicitudin	2021-09-10 21:35:34	1887
43	%B6509124535964148^KggmcilWncfwd^8608837750?7	75	Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate	2022-10-28 18:45:30	1782
44	%B3668578922151165^WvijkxkKpanhs^37022293?2	87	Quisque nonummy ipsum non arcu. Vivamus sit	2021-02-15 00:49:06	765
45	%B7289394975444481^GttssupFsvjgg^86091656933?8	15	cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui.	2021-09-29 18:41:53	1038
46	%B8197348482062312^MxtkirmJoxfbt^83083172?3	73	facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede.	2022-03-20 07:25:15	931
47	%B2016724574987343^KouihbiOsfpny^07027063584?6	66	Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer	2022-10-25 08:12:52	1483
48	%B5762824740773752^LtgmbfqWwbekh^8711465351?7	97	euismod	2022-08-31 05:22:26	362
49	%B8454997870917811^ByjkvqaLmchbf^91023693410?4	65	inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.	2021-01-03 07:52:47	756
50	%B9155841345084627^YmmegpmVlxkqo^0708597507?5	48	augue ut lacus. Nulla tincidunt, neque	2021-07-13 16:03:54	807
51	%B6527607661817051^WhuyrbpLkjwbe^04128482?3	91	erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc	2021-12-02 00:20:59	583
52	%B3136625437443911^XnyocebGoqulg^06096183686?4	84	tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,	2021-06-30 06:04:17	1127
53	%B3718833113739615^RfhbotcQkyvem^2402454500?1	58	eros. Nam consequat dolor vitae	2021-06-29 17:50:56	1597
54	%B4388068182655858^MgjpsezRtsnqj^7104416224?3	51	in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum	2022-04-05 03:24:53	1331
55	%B7053416812037373^SnlqooaSifsqu^06093721939?8	56	ipsum non	2022-05-08 05:02:20	192
56	%B6865944032744881^EkcbpqhPugjum^2709143424?7	59	quam.	2021-04-23 19:59:23	478
57	%B4913720537575575^GioybpdYryiqr^68048919586?7	76	sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus	2020-12-24 01:09:23	1539
58	%B6806413021175642^BkuuxskClrzpz^4208553756?5	46	Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.	2022-02-17 23:45:22	595
59	%B9964854481933442^OlzbjlzDtpvoi^8709919276?2	28	Nullam velit dui, semper et,	2022-01-31 09:10:22	1750
60	%B5147683323381243^FcgavgvQlgabs^9305600477?1	37	dolor	2022-11-05 02:26:53	988
61	%B2613326334661298^XkxqyqjVwiiwb^7808723439? 	6	Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In	2022-11-02 14:38:45	277
62	%B8441425798861729^DfsonqhFwrnfn^4609978126?1	34	enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui.	2022-11-21 13:32:34	882
63	%B3544712796348342^TyvikkhDneyai^79051118687?8	70	Nam	2022-01-14 00:10:52	1748
64	%B8547404235053871^QzkxibxKyshjp^44023318?6	64	nec, leo. Morbi neque tellus,	2021-11-27 08:25:29	897
65	%B2745630096377336^AmgwqcwRiqstk^41025176300?1	77	risus. Donec egestas. Aliquam nec enim. Nunc	2021-08-06 17:57:01	1112
66	%B9748459322338050^IcdbwyyGredny^7606296251?7	29	in felis. Nulla tempor	2021-07-31 18:13:18	1615
67	%B8027364887579536^HofcbshPxcywm^3506919789?7	74	orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit	2022-04-07 16:43:04	880
68	%B4664650219685330^XeykdewWhjhve^9610523792?9	6	pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc	2022-10-11 14:30:28	769
69	%B7225350231050326^IhzogjgYnxjdp^5905204689?4	87	pede ac urna. Ut tincidunt vehicula	2021-12-30 11:48:43	1203
70	%B6567704817348860^IvxofybQjystn^3709341258?4	53	semper tellus id nunc interdum feugiat. Sed	2021-04-02 13:54:45	1462
71	%B2179897966446029^IydicnuLmslel^05069691?1	52	Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac,	2020-12-30 00:57:34	1336
72	%B4325812106687154^GdhinshCoriyi^8910520140?5	54	sed dictum eleifend, nunc risus varius orci,	2021-03-17 23:06:50	960
73	%B6253533952722661^SzmvhwfHyothh^7006205626?4	67	augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a	2021-04-13 20:17:51	196
74	%B7772414468334326^IwdagbxHtkwtr^22061354?7	29	dis parturient montes, nascetur ridiculus mus.	2022-05-26 10:46:35	1478
75	%B9933131781757262^KeilruuBnxeit^0312671976?4	23	lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam	2022-04-06 12:57:45	1992
76	%B3698285293225768^MvixmmgXdigiq^8806381270?3	89	Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,	2021-06-07 20:24:19	327
77	%B8230340387180388^TjkzvnkHtbjly^95056203?8	91	nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc	2021-07-01 11:05:16	557
78	%B3020323671894678^VssxkrlMxfdgf^35094275?3	45	magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat	2021-07-07 20:59:53	886
79	%B5777192281937332^QozkjqaUybyhh^36031951?1	76	sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a	2021-06-07 06:41:25	999
80	%B8416589345444553^UqxkevtPrdllh^44074435?4	2	Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum	2022-04-27 06:54:15	1097
81	%B6173068553369450^ClsfvigKfkimz^55088743?3	14	Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus	2022-06-10 21:24:16	226
82	%B1668478064525021^KhvzxdkWwblvc^12059133280?9	33	Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,	2022-08-10 01:55:18	143
83	%B8574669931812768^YxxqgaoJbapri^90087943?5	98	ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium	2021-03-01 01:20:50	1915
84	%B9360142438385527^GblhyleKoywwb^2505987255?7	61	mattis velit justo nec ante. Maecenas mi	2022-08-24 02:40:47	423
85	%B5420446556578457^QbyftzvDyszta^5305714674?4	81	auctor odio a purus.	2022-06-15 02:25:24	532
86	%B2805691735544215^LrnxkwaYagjoc^44099894640?6	28	lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet	2022-05-08 18:48:18	961
87	%B2206370558295822^ZdsweeuQilxuo^9103947144?5	49	enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis	2022-10-30 12:41:55	113
88	%B8721014565143372^XlnnoofBuyvte^4004827823?1	91	auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa	2021-07-23 15:04:37	1587
89	%B2778285902530018^PuotncrEjqxts^6602881653?1	53	pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,	2021-06-12 23:14:41	1546
90	%B5695206111932956^KqdnlrdSverqi^6212182585?5	24	a purus. Duis elementum, dui quis	2021-11-16 13:05:04	1110
91	%B5575521334572419^TprixwqXnkbul^4411576309?3	88	sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel	2021-08-29 04:25:25	502
92	%B3823568291786238^BuwidxuFinleb^3311201955?6	11	elit pede, malesuada vel, venenatis vel,	2022-01-31 20:24:22	954
93	%B7813285685353269^HmhimhyRmcpol^5412486964?2	66	convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	2022-04-14 05:49:48	1917
94	%B9343332533927747^CwfxuxhXdtrid^6006731132?6	63	nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit	2022-08-21 11:14:01	684
95	%B8838168964570965^RgdwlthWmmhpl^6208279457?3	94	In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus	2021-05-14 07:09:05	1654
96	%B7289476766253963^XkqozqiIehagl^05038992726?1	68	mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi	2022-06-12 14:50:43	139
97	%B7525789863528883^UwsbuyfOntcox^7706627111?5	96	Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut,	2022-06-21 14:36:10	1652
98	%B4076253696225373^SwgnuwfMtsvjq^7908409121?9	43	nec luctus felis purus ac tellus. Suspendisse	2021-09-15 06:45:01	361
99	%B2271013726233333^MkxzsxuGqgrim^7009601720?2	62	ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla	2022-06-25 00:50:45	356
100	%B2478617888819981^OfnqsvcMqbmyd^2007680973?5	65	dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris	2022-10-29 05:54:55	687
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 341, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 4, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: subscriptions_communities subscription_communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_communities
    ADD CONSTRAINT subscription_communities_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: subscriptions_users subscription_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.subscriptions_users
    ADD CONSTRAINT subscription_users_pkey PRIMARY KEY (from_user_id, to_user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

