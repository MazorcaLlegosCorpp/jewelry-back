--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-07-04 18:18:09 -05

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 25442)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    reference character varying(255),
    name character varying(255),
    price double precision
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25450)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    status character varying(255),
    type character varying(255),
    date date,
    hour time without time zone,
    subtotal double precision,
    total double precision,
    user_id uuid
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25463)
-- Name: orders_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_details (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    order_id uuid,
    amount integer,
    subtotal double precision,
    total double precision
);


ALTER TABLE public.orders_details OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25401)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25413)
-- Name: rolescope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rolescope (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    role_id uuid,
    scope_id uuid
);


ALTER TABLE public.rolescope OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25407)
-- Name: scopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scopes (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.scopes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25474)
-- Name: user_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_metrics (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid,
    my_businessmen integer,
    my_entrepreneurs integer,
    monthly_orders integer,
    monthly_daily_average integer
);


ALTER TABLE public.user_metrics OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25429)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    image character varying(255),
    role_id uuid,
    office_leader character varying(255),
    invitation_user character varying(255),
    date_of_admission date,
    city character varying(255),
    phone_number character varying(255),
    email character varying(255),
    instagram character varying(255),
    facebook character varying(255),
    web character varying(255),
    "roleId" uuid,
    clave character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3660 (class 0 OID 25442)
-- Dependencies: 220
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, reference, name, price) FROM stdin;
\.


--
-- TOC entry 3661 (class 0 OID 25450)
-- Dependencies: 221
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, status, type, date, hour, subtotal, total, user_id) FROM stdin;
\.


--
-- TOC entry 3662 (class 0 OID 25463)
-- Dependencies: 222
-- Data for Name: orders_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_details (id, order_id, amount, subtotal, total) FROM stdin;
\.


--
-- TOC entry 3656 (class 0 OID 25401)
-- Dependencies: 216
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
efb34eff-ccc4-46da-97fa-499b4f2071a9	Admin
\.


--
-- TOC entry 3658 (class 0 OID 25413)
-- Dependencies: 218
-- Data for Name: rolescope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rolescope (id, role_id, scope_id) FROM stdin;
\.


--
-- TOC entry 3657 (class 0 OID 25407)
-- Dependencies: 217
-- Data for Name: scopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scopes (id, name) FROM stdin;
\.


--
-- TOC entry 3663 (class 0 OID 25474)
-- Dependencies: 223
-- Data for Name: user_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_metrics (id, user_id, my_businessmen, my_entrepreneurs, monthly_orders, monthly_daily_average) FROM stdin;
\.


--
-- TOC entry 3659 (class 0 OID 25429)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, image, role_id, office_leader, invitation_user, date_of_admission, city, phone_number, email, instagram, facebook, web, "roleId", clave) FROM stdin;
6ebd780f-f1b6-4376-bc25-2c4695e1c1db	Juanito	\N	efb34eff-ccc4-46da-97fa-499b4f2071a9	\N	\N	\N	\N	\N	juandagallego.dev@gmail.com	\N	\N	\N	\N	$2a$10$R08/Ra8Jdf2BOGmr1g/ldObL.IcK7VP1Vg6C6hJLWrCfbU/5P8YVC
\.


--
-- TOC entry 3500 (class 2606 OID 25449)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3504 (class 2606 OID 25468)
-- Name: orders_details orders_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_details
    ADD CONSTRAINT orders_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 25457)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3492 (class 2606 OID 25406)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 25418)
-- Name: rolescope rolescope_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolescope
    ADD CONSTRAINT rolescope_pkey PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 25412)
-- Name: scopes scopes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scopes
    ADD CONSTRAINT scopes_pkey PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 25479)
-- Name: user_metrics user_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_metrics
    ADD CONSTRAINT user_metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 3498 (class 2606 OID 25436)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3509 (class 2606 OID 33522)
-- Name: users FK_368e146b785b574f42ae9e53d5e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_368e146b785b574f42ae9e53d5e" FOREIGN KEY ("roleId") REFERENCES public.roles(id);


--
-- TOC entry 3511 (class 2606 OID 25469)
-- Name: orders_details orders_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_details
    ADD CONSTRAINT orders_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 3510 (class 2606 OID 25458)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3507 (class 2606 OID 25419)
-- Name: rolescope rolescope_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolescope
    ADD CONSTRAINT rolescope_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3508 (class 2606 OID 25424)
-- Name: rolescope rolescope_scope_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rolescope
    ADD CONSTRAINT rolescope_scope_id_fkey FOREIGN KEY (scope_id) REFERENCES public.scopes(id);


--
-- TOC entry 3512 (class 2606 OID 25480)
-- Name: user_metrics user_metrics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_metrics
    ADD CONSTRAINT user_metrics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-07-04 18:18:09 -05

--
-- PostgreSQL database dump complete
--

