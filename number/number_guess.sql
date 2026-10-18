--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

ALTER TABLE ONLY public.game_sessions DROP CONSTRAINT game_session_user_id_fkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.game_sessions DROP CONSTRAINT game_session_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.game_sessions ALTER COLUMN game_id DROP DEFAULT;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.game_session_game_id_seq;
DROP TABLE public.game_sessions;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: game_sessions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_sessions (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.game_sessions OWNER TO freecodecamp;

--
-- Name: game_session_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_session_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_session_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_session_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_session_game_id_seq OWNED BY public.game_sessions.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game_sessions game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_sessions ALTER COLUMN game_id SET DEFAULT nextval('public.game_session_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_sessions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_sessions VALUES (1, 1, 5);
INSERT INTO public.game_sessions VALUES (2, 1, 3);
INSERT INTO public.game_sessions VALUES (3, 2, 183);
INSERT INTO public.game_sessions VALUES (4, 2, 589);
INSERT INTO public.game_sessions VALUES (5, 3, 349);
INSERT INTO public.game_sessions VALUES (6, 3, 425);
INSERT INTO public.game_sessions VALUES (7, 2, 173);
INSERT INTO public.game_sessions VALUES (8, 2, 968);
INSERT INTO public.game_sessions VALUES (9, 2, 903);
INSERT INTO public.game_sessions VALUES (10, 4, 280);
INSERT INTO public.game_sessions VALUES (11, 4, 619);
INSERT INTO public.game_sessions VALUES (12, 5, 614);
INSERT INTO public.game_sessions VALUES (13, 5, 498);
INSERT INTO public.game_sessions VALUES (14, 4, 947);
INSERT INTO public.game_sessions VALUES (15, 4, 370);
INSERT INTO public.game_sessions VALUES (16, 4, 891);
INSERT INTO public.game_sessions VALUES (17, 6, 231);
INSERT INTO public.game_sessions VALUES (18, 6, 641);
INSERT INTO public.game_sessions VALUES (19, 7, 14);
INSERT INTO public.game_sessions VALUES (20, 7, 540);
INSERT INTO public.game_sessions VALUES (21, 6, 603);
INSERT INTO public.game_sessions VALUES (22, 6, 613);
INSERT INTO public.game_sessions VALUES (23, 6, 821);
INSERT INTO public.game_sessions VALUES (24, 8, 405);
INSERT INTO public.game_sessions VALUES (25, 8, 55);
INSERT INTO public.game_sessions VALUES (26, 9, 488);
INSERT INTO public.game_sessions VALUES (27, 9, 997);
INSERT INTO public.game_sessions VALUES (28, 8, 459);
INSERT INTO public.game_sessions VALUES (29, 8, 561);
INSERT INTO public.game_sessions VALUES (30, 8, 136);
INSERT INTO public.game_sessions VALUES (31, 10, 656);
INSERT INTO public.game_sessions VALUES (32, 10, 247);
INSERT INTO public.game_sessions VALUES (33, 11, 442);
INSERT INTO public.game_sessions VALUES (34, 11, 497);
INSERT INTO public.game_sessions VALUES (35, 10, 930);
INSERT INTO public.game_sessions VALUES (36, 10, 460);
INSERT INTO public.game_sessions VALUES (37, 10, 125);
INSERT INTO public.game_sessions VALUES (38, 12, 262);
INSERT INTO public.game_sessions VALUES (39, 12, 967);
INSERT INTO public.game_sessions VALUES (40, 13, 706);
INSERT INTO public.game_sessions VALUES (41, 13, 12);
INSERT INTO public.game_sessions VALUES (42, 12, 703);
INSERT INTO public.game_sessions VALUES (43, 12, 361);
INSERT INTO public.game_sessions VALUES (44, 12, 542);
INSERT INTO public.game_sessions VALUES (45, 14, 907);
INSERT INTO public.game_sessions VALUES (46, 14, 268);
INSERT INTO public.game_sessions VALUES (47, 15, 572);
INSERT INTO public.game_sessions VALUES (48, 15, 804);
INSERT INTO public.game_sessions VALUES (49, 14, 403);
INSERT INTO public.game_sessions VALUES (50, 14, 220);
INSERT INTO public.game_sessions VALUES (51, 14, 724);
INSERT INTO public.game_sessions VALUES (52, 16, 9);
INSERT INTO public.game_sessions VALUES (53, 17, 889);
INSERT INTO public.game_sessions VALUES (54, 17, 894);
INSERT INTO public.game_sessions VALUES (55, 18, 650);
INSERT INTO public.game_sessions VALUES (56, 18, 482);
INSERT INTO public.game_sessions VALUES (57, 17, 974);
INSERT INTO public.game_sessions VALUES (58, 17, 159);
INSERT INTO public.game_sessions VALUES (59, 17, 982);
INSERT INTO public.game_sessions VALUES (60, 19, 88);
INSERT INTO public.game_sessions VALUES (61, 19, 756);
INSERT INTO public.game_sessions VALUES (62, 20, 359);
INSERT INTO public.game_sessions VALUES (63, 20, 131);
INSERT INTO public.game_sessions VALUES (64, 19, 130);
INSERT INTO public.game_sessions VALUES (65, 19, 490);
INSERT INTO public.game_sessions VALUES (66, 19, 44);
INSERT INTO public.game_sessions VALUES (67, 21, 7);
INSERT INTO public.game_sessions VALUES (68, 22, 224);
INSERT INTO public.game_sessions VALUES (69, 22, 270);
INSERT INTO public.game_sessions VALUES (70, 23, 659);
INSERT INTO public.game_sessions VALUES (71, 23, 887);
INSERT INTO public.game_sessions VALUES (72, 22, 650);
INSERT INTO public.game_sessions VALUES (73, 22, 479);
INSERT INTO public.game_sessions VALUES (74, 22, 180);
INSERT INTO public.game_sessions VALUES (75, 24, 153);
INSERT INTO public.game_sessions VALUES (76, 24, 463);
INSERT INTO public.game_sessions VALUES (77, 25, 787);
INSERT INTO public.game_sessions VALUES (78, 25, 423);
INSERT INTO public.game_sessions VALUES (79, 24, 238);
INSERT INTO public.game_sessions VALUES (80, 24, 469);
INSERT INTO public.game_sessions VALUES (81, 24, 730);
INSERT INTO public.game_sessions VALUES (82, 26, 880);
INSERT INTO public.game_sessions VALUES (83, 26, 661);
INSERT INTO public.game_sessions VALUES (84, 27, 788);
INSERT INTO public.game_sessions VALUES (85, 27, 879);
INSERT INTO public.game_sessions VALUES (86, 26, 1001);
INSERT INTO public.game_sessions VALUES (87, 26, 859);
INSERT INTO public.game_sessions VALUES (88, 26, 250);
INSERT INTO public.game_sessions VALUES (89, 28, 713);
INSERT INTO public.game_sessions VALUES (90, 28, 899);
INSERT INTO public.game_sessions VALUES (91, 29, 414);
INSERT INTO public.game_sessions VALUES (92, 29, 931);
INSERT INTO public.game_sessions VALUES (93, 28, 93);
INSERT INTO public.game_sessions VALUES (94, 28, 289);
INSERT INTO public.game_sessions VALUES (95, 28, 347);
INSERT INTO public.game_sessions VALUES (96, 30, 594);
INSERT INTO public.game_sessions VALUES (97, 30, 127);
INSERT INTO public.game_sessions VALUES (98, 31, 828);
INSERT INTO public.game_sessions VALUES (99, 31, 194);
INSERT INTO public.game_sessions VALUES (100, 30, 289);
INSERT INTO public.game_sessions VALUES (101, 30, 218);
INSERT INTO public.game_sessions VALUES (102, 30, 470);
INSERT INTO public.game_sessions VALUES (103, 32, 371);
INSERT INTO public.game_sessions VALUES (104, 32, 590);
INSERT INTO public.game_sessions VALUES (105, 33, 876);
INSERT INTO public.game_sessions VALUES (106, 33, 654);
INSERT INTO public.game_sessions VALUES (107, 32, 352);
INSERT INTO public.game_sessions VALUES (108, 32, 38);
INSERT INTO public.game_sessions VALUES (109, 32, 43);
INSERT INTO public.game_sessions VALUES (110, 34, 740);
INSERT INTO public.game_sessions VALUES (111, 34, 132);
INSERT INTO public.game_sessions VALUES (112, 35, 703);
INSERT INTO public.game_sessions VALUES (113, 35, 299);
INSERT INTO public.game_sessions VALUES (114, 34, 90);
INSERT INTO public.game_sessions VALUES (115, 34, 956);
INSERT INTO public.game_sessions VALUES (116, 34, 145);
INSERT INTO public.game_sessions VALUES (117, 36, 404);
INSERT INTO public.game_sessions VALUES (118, 36, 136);
INSERT INTO public.game_sessions VALUES (119, 37, 465);
INSERT INTO public.game_sessions VALUES (120, 37, 85);
INSERT INTO public.game_sessions VALUES (121, 36, 691);
INSERT INTO public.game_sessions VALUES (122, 36, 381);
INSERT INTO public.game_sessions VALUES (123, 36, 161);
INSERT INTO public.game_sessions VALUES (124, 38, 915);
INSERT INTO public.game_sessions VALUES (125, 38, 829);
INSERT INTO public.game_sessions VALUES (126, 39, 385);
INSERT INTO public.game_sessions VALUES (127, 39, 187);
INSERT INTO public.game_sessions VALUES (128, 38, 564);
INSERT INTO public.game_sessions VALUES (129, 38, 615);
INSERT INTO public.game_sessions VALUES (130, 38, 676);
INSERT INTO public.game_sessions VALUES (131, 40, 646);
INSERT INTO public.game_sessions VALUES (132, 40, 862);
INSERT INTO public.game_sessions VALUES (133, 41, 9);
INSERT INTO public.game_sessions VALUES (134, 41, 585);
INSERT INTO public.game_sessions VALUES (135, 40, 110);
INSERT INTO public.game_sessions VALUES (136, 40, 130);
INSERT INTO public.game_sessions VALUES (137, 40, 186);
INSERT INTO public.game_sessions VALUES (138, 42, 490);
INSERT INTO public.game_sessions VALUES (139, 42, 81);
INSERT INTO public.game_sessions VALUES (140, 43, 167);
INSERT INTO public.game_sessions VALUES (141, 43, 955);
INSERT INTO public.game_sessions VALUES (142, 42, 199);
INSERT INTO public.game_sessions VALUES (143, 42, 236);
INSERT INTO public.game_sessions VALUES (144, 42, 353);
INSERT INTO public.game_sessions VALUES (145, 44, 665);
INSERT INTO public.game_sessions VALUES (146, 44, 452);
INSERT INTO public.game_sessions VALUES (147, 45, 968);
INSERT INTO public.game_sessions VALUES (148, 45, 358);
INSERT INTO public.game_sessions VALUES (149, 44, 440);
INSERT INTO public.game_sessions VALUES (150, 44, 269);
INSERT INTO public.game_sessions VALUES (151, 44, 477);
INSERT INTO public.game_sessions VALUES (152, 46, 346);
INSERT INTO public.game_sessions VALUES (153, 46, 359);
INSERT INTO public.game_sessions VALUES (154, 47, 657);
INSERT INTO public.game_sessions VALUES (155, 47, 354);
INSERT INTO public.game_sessions VALUES (156, 46, 833);
INSERT INTO public.game_sessions VALUES (157, 46, 563);
INSERT INTO public.game_sessions VALUES (158, 46, 292);
INSERT INTO public.game_sessions VALUES (159, 1, 12);
INSERT INTO public.game_sessions VALUES (160, 48, 536);
INSERT INTO public.game_sessions VALUES (161, 48, 554);
INSERT INTO public.game_sessions VALUES (162, 49, 301);
INSERT INTO public.game_sessions VALUES (163, 49, 412);
INSERT INTO public.game_sessions VALUES (164, 48, 954);
INSERT INTO public.game_sessions VALUES (165, 48, 4);
INSERT INTO public.game_sessions VALUES (166, 48, 503);
INSERT INTO public.game_sessions VALUES (167, 50, 685);
INSERT INTO public.game_sessions VALUES (168, 50, 437);
INSERT INTO public.game_sessions VALUES (169, 51, 895);
INSERT INTO public.game_sessions VALUES (170, 51, 190);
INSERT INTO public.game_sessions VALUES (171, 50, 263);
INSERT INTO public.game_sessions VALUES (172, 50, 709);
INSERT INTO public.game_sessions VALUES (173, 50, 6);
INSERT INTO public.game_sessions VALUES (174, 52, 768);
INSERT INTO public.game_sessions VALUES (175, 52, 216);
INSERT INTO public.game_sessions VALUES (176, 53, 539);
INSERT INTO public.game_sessions VALUES (177, 53, 147);
INSERT INTO public.game_sessions VALUES (178, 52, 773);
INSERT INTO public.game_sessions VALUES (179, 52, 937);
INSERT INTO public.game_sessions VALUES (180, 52, 381);
INSERT INTO public.game_sessions VALUES (181, 54, 817);
INSERT INTO public.game_sessions VALUES (182, 54, 973);
INSERT INTO public.game_sessions VALUES (183, 55, 393);
INSERT INTO public.game_sessions VALUES (184, 55, 659);
INSERT INTO public.game_sessions VALUES (185, 54, 831);
INSERT INTO public.game_sessions VALUES (186, 54, 313);
INSERT INTO public.game_sessions VALUES (187, 54, 46);
INSERT INTO public.game_sessions VALUES (214, 87, 478);
INSERT INTO public.game_sessions VALUES (215, 87, 351);
INSERT INTO public.game_sessions VALUES (216, 88, 960);
INSERT INTO public.game_sessions VALUES (217, 88, 470);
INSERT INTO public.game_sessions VALUES (218, 87, 764);
INSERT INTO public.game_sessions VALUES (219, 87, 386);
INSERT INTO public.game_sessions VALUES (220, 87, 110);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'TseoH');
INSERT INTO public.users VALUES (2, 'user_1792350920077');
INSERT INTO public.users VALUES (3, 'user_1792350920076');
INSERT INTO public.users VALUES (4, 'user_1792350988269');
INSERT INTO public.users VALUES (5, 'user_1792350988268');
INSERT INTO public.users VALUES (6, 'user_1792351012239');
INSERT INTO public.users VALUES (7, 'user_1792351012238');
INSERT INTO public.users VALUES (8, 'user_1792351076056');
INSERT INTO public.users VALUES (9, 'user_1792351076055');
INSERT INTO public.users VALUES (10, 'user_1792351092935');
INSERT INTO public.users VALUES (11, 'user_1792351092934');
INSERT INTO public.users VALUES (12, 'user_1792351144890');
INSERT INTO public.users VALUES (13, 'user_1792351144889');
INSERT INTO public.users VALUES (14, 'user_1792351165267');
INSERT INTO public.users VALUES (15, 'user_1792351165266');
INSERT INTO public.users VALUES (16, 'Coucou');
INSERT INTO public.users VALUES (17, 'user_1792351373108');
INSERT INTO public.users VALUES (18, 'user_1792351373107');
INSERT INTO public.users VALUES (19, 'user_1792351410328');
INSERT INTO public.users VALUES (20, 'user_1792351410327');
INSERT INTO public.users VALUES (21, 'Milan');
INSERT INTO public.users VALUES (22, 'user_1792351486855');
INSERT INTO public.users VALUES (23, 'user_1792351486854');
INSERT INTO public.users VALUES (24, 'user_1792351673489');
INSERT INTO public.users VALUES (25, 'user_1792351673488');
INSERT INTO public.users VALUES (26, 'user_1792351682907');
INSERT INTO public.users VALUES (27, 'user_1792351682906');
INSERT INTO public.users VALUES (28, 'user_1792351734244');
INSERT INTO public.users VALUES (29, 'user_1792351734243');
INSERT INTO public.users VALUES (30, 'user_1792351769036');
INSERT INTO public.users VALUES (31, 'user_1792351769035');
INSERT INTO public.users VALUES (32, 'user_1792351787747');
INSERT INTO public.users VALUES (33, 'user_1792351787746');
INSERT INTO public.users VALUES (34, 'user_1792351862407');
INSERT INTO public.users VALUES (35, 'user_1792351862406');
INSERT INTO public.users VALUES (36, 'user_1792351871653');
INSERT INTO public.users VALUES (37, 'user_1792351871652');
INSERT INTO public.users VALUES (38, 'user_1792351877070');
INSERT INTO public.users VALUES (39, 'user_1792351877069');
INSERT INTO public.users VALUES (40, 'user_1792351885656');
INSERT INTO public.users VALUES (41, 'user_1792351885655');
INSERT INTO public.users VALUES (42, 'user_1792352076157');
INSERT INTO public.users VALUES (43, 'user_1792352076156');
INSERT INTO public.users VALUES (44, 'user_1792352107193');
INSERT INTO public.users VALUES (45, 'user_1792352107192');
INSERT INTO public.users VALUES (46, 'user_1792352237231');
INSERT INTO public.users VALUES (47, 'user_1792352237230');
INSERT INTO public.users VALUES (48, 'user_1792352489749');
INSERT INTO public.users VALUES (49, 'user_1792352489748');
INSERT INTO public.users VALUES (50, 'user_1792352523214');
INSERT INTO public.users VALUES (51, 'user_1792352523213');
INSERT INTO public.users VALUES (52, 'user_1792352525630');
INSERT INTO public.users VALUES (53, 'user_1792352525629');
INSERT INTO public.users VALUES (54, 'user_1792352576257');
INSERT INTO public.users VALUES (55, 'user_1792352576256');
INSERT INTO public.users VALUES (87, 'user_1792352658951');
INSERT INTO public.users VALUES (88, 'user_1792352658950');


--
-- Name: game_session_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_session_game_id_seq', 220, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 88, true);


--
-- Name: game_sessions game_session_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT game_session_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game_sessions game_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_sessions
    ADD CONSTRAINT game_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

