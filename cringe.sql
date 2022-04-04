--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: info; Type: TABLE; Schema: public; Owner: u0_a282
--

CREATE TABLE public.info (
    id integer NOT NULL,
    "position" character varying(32),
    grip_type character varying(6),
    skate_size numeric(4,2),
    player_id integer,
    CONSTRAINT check_valid_position CHECK (((("position")::text ~~* 'нападающий (%)'::text) OR (("position")::text ~~* 'защитник (%)'::text) OR (("position")::text ~~* 'голкипер'::text))),
    CONSTRAINT info_grip_type_check CHECK (((lower((grip_type)::text) = 'левша'::text) OR (lower((grip_type)::text) = 'правша'::text)))
);


ALTER TABLE public.info OWNER TO u0_a282;

--
-- Name: info_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a282
--

ALTER TABLE public.info ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: player; Type: TABLE; Schema: public; Owner: u0_a282
--

CREATE TABLE public.player (
    id integer NOT NULL,
    name character varying(64),
    height numeric(5,2),
    weight numeric(5,2),
    salary money,
    CONSTRAINT player_height_check CHECK (((height >= (170)::numeric) AND (height <= (220)::numeric)))
);


ALTER TABLE public.player OWNER TO u0_a282;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a282
--

ALTER TABLE public.player ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stat; Type: TABLE; Schema: public; Owner: u0_a282
--

CREATE TABLE public.stat (
    id integer NOT NULL,
    goals integer,
    assists integer,
    playtime interval,
    penalty_time interval,
    player_id integer
);


ALTER TABLE public.stat OWNER TO u0_a282;

--
-- Name: stat_id_seq; Type: SEQUENCE; Schema: public; Owner: u0_a282
--

ALTER TABLE public.stat ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: u0_a282
--

COPY public.info (id, "position", grip_type, skate_size, player_id) FROM stdin;
1	Нападающий (правый)	Правша	42.00	17
2	Защитник (правый)	Правша	43.00	13
3	Нападающий (центральный)	Правша	43.50	10
4	Нападающий (левый)	Левша	47.00	18
5	Нападающий (центральный)	Правша	45.50	3
6	Голкипер	Правша	43.00	5
7	Защитник (левый)	Правша	41.50	11
8	Нападающий (правый)	Правша	43.50	4
9	Нападающий (правый)	Левша	47.50	8
10	Нападающий (правый)	Правша	42.00	14
11	Нападающий (правый)	Правша	41.50	16
12	Защитник (левый)	Правша	47.00	15
13	Нападающий (правый)	Правша	43.50	7
14	Защитник (левый)	Левша	47.50	20
15	Нападающий (центральный)	Правша	40.00	9
16	Защитник (левый)	Правша	47.50	2
17	Нападающий (левый)	Левша	41.50	1
18	Нападающий (левый)	Правша	41.50	19
19	Голкипер	Правша	40.00	12
20	Голкипер	Левша	40.50	6
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: u0_a282
--

COPY public.player (id, name, height, weight, salary) FROM stdin;
1	Белоусов Максимильян Алексеевич	191.00	101.00	$115,000.00
2	Богданов Симон Евстигнеевич	197.00	88.00	$145,000.00
3	Рыбаков Алексей Эдгардович	203.00	88.00	$110,000.00
4	Гедеон Игнатьевич Исаков	181.00	85.00	$90,000.00
5	Пимен Давыдович Терентьев	187.00	79.00	$110,000.00
6	Мирон Алексеевич Ковалев	197.00	100.00	$110,000.00
7	Любим Витальевич Буров	192.00	102.00	$85,000.00
8	Ерофей Бориславович Буров	181.00	79.00	$105,000.00
9	Ираклий Матвеевич Петров	190.00	102.00	$110,000.00
10	Антонов Леонтий Трифонович	191.00	104.00	$145,000.00
11	Фомин Никифор Фролович	174.00	81.00	$55,000.00
12	Ефимов Евстафий Димитриевич	175.00	83.00	$130,000.00
13	Родион Демидович Зиновьев	206.00	94.00	$65,000.00
14	Вячеслав Евстигнеевич Фомин	187.00	90.00	$120,000.00
15	Поляков Сократ Федосьевич	198.00	106.00	$65,000.00
16	Исай Ермолаевич Родионов	184.00	96.00	$75,000.00
17	Исаков Любосмысл Владиславович	170.00	78.00	$65,000.00
18	Боян Ефимович Соловьев	188.00	95.00	$145,000.00
19	Иванов Якуб Герасимович	194.00	102.00	$125,000.00
20	Андроник Ефимович Селиверстов	196.00	108.00	$55,000.00
\.


--
-- Data for Name: stat; Type: TABLE DATA; Schema: public; Owner: u0_a282
--

COPY public.stat (id, goals, assists, playtime, penalty_time, player_id) FROM stdin;
1	63	28	07:25:00	02:25:00	2
2	45	69	25:25:00	00:30:00	11
3	98	80	19:45:00	03:35:00	16
4	89	57	18:25:00	00:30:00	10
5	53	24	05:15:00	03:15:00	12
6	18	33	34:50:00	03:55:00	9
7	48	81	03:55:00	00:35:00	6
8	84	74	03:00:00	01:30:00	20
9	39	24	03:15:00	00:50:00	7
10	83	89	01:50:00	01:15:00	18
11	87	6	21:35:00	02:10:00	14
12	16	7	07:00:00	02:50:00	15
13	1	34	09:00:00	01:25:00	4
14	30	39	14:55:00	02:30:00	1
15	62	8	11:00:00	02:55:00	8
16	19	69	20:00:00	03:35:00	17
17	0	67	12:05:00	00:00:00	5
18	63	18	12:35:00	03:20:00	3
19	88	24	31:00:00	01:35:00	13
20	80	1	20:35:00	00:55:00	19
\.


--
-- Name: info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a282
--

SELECT pg_catalog.setval('public.info_id_seq', 20, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a282
--

SELECT pg_catalog.setval('public.player_id_seq', 20, true);


--
-- Name: stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: u0_a282
--

SELECT pg_catalog.setval('public.stat_id_seq', 20, true);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a282
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a282
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: stat stat_pkey; Type: CONSTRAINT; Schema: public; Owner: u0_a282
--

ALTER TABLE ONLY public.stat
    ADD CONSTRAINT stat_pkey PRIMARY KEY (id);


--
-- Name: info info_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: u0_a282
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;


--
-- Name: stat stat_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: u0_a282
--

ALTER TABLE ONLY public.stat
    ADD CONSTRAINT stat_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.player(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

