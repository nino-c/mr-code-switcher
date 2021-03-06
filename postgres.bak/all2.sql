--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ninopq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ninopq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ninopq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ninopq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ninopq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ninopq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtools_user; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authtools_user OWNER TO ninopq;

--
-- Name: authtools_user_groups; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authtools_user_groups OWNER TO ninopq;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_groups_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_groups_id_seq OWNED BY authtools_user_groups.id;


--
-- Name: authtools_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_id_seq OWNED BY authtools_user.id;


--
-- Name: authtools_user_user_permissions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authtools_user_user_permissions OWNER TO ninopq;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_user_permissions_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_user_permissions_id_seq OWNED BY authtools_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ninopq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ninopq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ninopq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ninopq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ninopq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ninopq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ninopq;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO ninopq;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: game_category; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_category (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description text,
    image character varying(100),
    parent_id integer,
    popularity integer NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.game_category OWNER TO ninopq;

--
-- Name: game_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_category_id_seq OWNER TO ninopq;

--
-- Name: game_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_category_id_seq OWNED BY game_category.id;


--
-- Name: game_codemodule; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_codemodule (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(255),
    language character varying(20) NOT NULL,
    source text NOT NULL
);


ALTER TABLE public.game_codemodule OWNER TO ninopq;

--
-- Name: game_codemodule_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_codemodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_codemodule_id_seq OWNER TO ninopq;

--
-- Name: game_codemodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_codemodule_id_seq OWNED BY game_codemodule.id;


--
-- Name: game_gameinstance; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_gameinstance (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    seed text NOT NULL,
    game_id integer NOT NULL,
    instantiator_id integer NOT NULL,
    updated timestamp with time zone NOT NULL,
    popularity integer NOT NULL,
    vector character varying(5000)
);


ALTER TABLE public.game_gameinstance OWNER TO ninopq;

--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_gameinstance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_gameinstance_id_seq OWNER TO ninopq;

--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_gameinstance_id_seq OWNED BY game_gameinstance.id;


--
-- Name: game_gameinstance_seedParams; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE "game_gameinstance_seedParams" (
    id integer NOT NULL,
    gameinstance_id integer NOT NULL,
    seedkeyval_id integer NOT NULL
);


ALTER TABLE public."game_gameinstance_seedParams" OWNER TO ninopq;

--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE "game_gameinstance_seedParams_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."game_gameinstance_seedParams_id_seq" OWNER TO ninopq;

--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE "game_gameinstance_seedParams_id_seq" OWNED BY "game_gameinstance_seedParams".id;


--
-- Name: game_gameinstancesnapshot; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_gameinstancesnapshot (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    "time" double precision NOT NULL,
    instance_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.game_gameinstancesnapshot OWNER TO ninopq;

--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_gameinstancesnapshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_gameinstancesnapshot_id_seq OWNER TO ninopq;

--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_gameinstancesnapshot_id_seq OWNED BY game_gameinstancesnapshot.id;


--
-- Name: game_jslibrary; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_jslibrary (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "scriptPath" character varying(200) NOT NULL
);


ALTER TABLE public.game_jslibrary OWNER TO ninopq;

--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_jslibrary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_jslibrary_id_seq OWNER TO ninopq;

--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_jslibrary_id_seq OWNED BY game_jslibrary.id;


--
-- Name: game_zeroplayergame; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_zeroplayergame (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    description text NOT NULL,
    created timestamp with time zone NOT NULL,
    category_id integer NOT NULL,
    owner_id integer NOT NULL,
    "scriptType" character varying(100),
    source text NOT NULL,
    "seedStructure" text NOT NULL,
    "mainImage" character varying(255),
    parent_id integer,
    updated timestamp with time zone NOT NULL,
    popularity integer NOT NULL
);


ALTER TABLE public.game_zeroplayergame OWNER TO ninopq;

--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_plerpingapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_plerpingapp_id_seq OWNER TO ninopq;

--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_plerpingapp_id_seq OWNED BY game_zeroplayergame.id;


--
-- Name: game_savedfunction; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_savedfunction (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source text NOT NULL,
    owner_id integer NOT NULL,
    title character varying(255),
    language character varying(20) NOT NULL
);


ALTER TABLE public.game_savedfunction OWNER TO ninopq;

--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_savedfunction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_savedfunction_id_seq OWNER TO ninopq;

--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_savedfunction_id_seq OWNED BY game_savedfunction.id;


--
-- Name: game_seedkeyval; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_seedkeyval (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    val character varying(5000) NOT NULL,
    jsonval text NOT NULL,
    ordering integer NOT NULL,
    valtype character varying(25) NOT NULL
);


ALTER TABLE public.game_seedkeyval OWNER TO ninopq;

--
-- Name: game_seedkeyval_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_seedkeyval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_seedkeyval_id_seq OWNER TO ninopq;

--
-- Name: game_seedkeyval_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_seedkeyval_id_seq OWNED BY game_seedkeyval.id;


--
-- Name: game_seedkeyvalrelationship; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_seedkeyvalrelationship (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    keyval_id integer NOT NULL
);


ALTER TABLE public.game_seedkeyvalrelationship OWNER TO ninopq;

--
-- Name: game_seedkeyvalrelationship_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_seedkeyvalrelationship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_seedkeyvalrelationship_id_seq OWNER TO ninopq;

--
-- Name: game_seedkeyvalrelationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_seedkeyvalrelationship_id_seq OWNED BY game_seedkeyvalrelationship.id;


--
-- Name: game_zeroplayergame_extraIncludes; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE "game_zeroplayergame_extraIncludes" (
    id integer NOT NULL,
    zeroplayergame_id integer NOT NULL,
    jslibrary_id integer NOT NULL
);


ALTER TABLE public."game_zeroplayergame_extraIncludes" OWNER TO ninopq;

--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE "game_zeroplayergame_extraIncludes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."game_zeroplayergame_extraIncludes_id_seq" OWNER TO ninopq;

--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE "game_zeroplayergame_extraIncludes_id_seq" OWNED BY "game_zeroplayergame_extraIncludes".id;


--
-- Name: game_zeroplayergame_required_modules; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_zeroplayergame_required_modules (
    id integer NOT NULL,
    zeroplayergame_id integer NOT NULL,
    codemodule_id integer NOT NULL
);


ALTER TABLE public.game_zeroplayergame_required_modules OWNER TO ninopq;

--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_zeroplayergame_required_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_zeroplayergame_required_modules_id_seq OWNER TO ninopq;

--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_zeroplayergame_required_modules_id_seq OWNED BY game_zeroplayergame_required_modules.id;


--
-- Name: portfolio_imagegallery; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_imagegallery (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.portfolio_imagegallery OWNER TO ninopq;

--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_imagegallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_imagegallery_id_seq OWNER TO ninopq;

--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_imagegallery_id_seq OWNED BY portfolio_imagegallery.id;


--
-- Name: portfolio_imagemodel; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_imagemodel (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    gallery_id integer
);


ALTER TABLE public.portfolio_imagemodel OWNER TO ninopq;

--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_imagemodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_imagemodel_id_seq OWNER TO ninopq;

--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_imagemodel_id_seq OWNED BY portfolio_imagemodel.id;


--
-- Name: portfolio_portfoliocategory; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_portfoliocategory (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    image character varying(100)
);


ALTER TABLE public.portfolio_portfoliocategory OWNER TO ninopq;

--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_portfoliocategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_portfoliocategory_id_seq OWNER TO ninopq;

--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_portfoliocategory_id_seq OWNED BY portfolio_portfoliocategory.id;


--
-- Name: portfolio_portfolioitem; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_portfolioitem (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    subtitle character varying(500) NOT NULL,
    description text NOT NULL,
    sourcecode character varying(200),
    image character varying(100),
    creationdate date NOT NULL,
    category_id integer NOT NULL,
    url character varying(150)
);


ALTER TABLE public.portfolio_portfolioitem OWNER TO ninopq;

--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_portfolioitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_portfolioitem_id_seq OWNER TO ninopq;

--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_portfolioitem_id_seq OWNED BY portfolio_portfolioitem.id;


--
-- Name: portfolio_proprietaryportfolioitem; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_proprietaryportfolioitem (
    portfolioitem_ptr_id integer NOT NULL,
    company character varying(100) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE public.portfolio_proprietaryportfolioitem OWNER TO ninopq;

--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE profiles_profile (
    user_id integer NOT NULL,
    slug uuid NOT NULL,
    picture character varying(100),
    bio character varying(200),
    email_verified boolean NOT NULL
);


ALTER TABLE public.profiles_profile OWNER TO ninopq;

--
-- Name: profiles_profile_followers; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE profiles_profile_followers (
    id integer NOT NULL,
    from_profile_id integer NOT NULL,
    to_profile_id integer NOT NULL
);


ALTER TABLE public.profiles_profile_followers OWNER TO ninopq;

--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE profiles_profile_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_profile_followers_id_seq OWNER TO ninopq;

--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE profiles_profile_followers_id_seq OWNED BY profiles_profile_followers.id;


--
-- Name: static_precompiler_dependency; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE static_precompiler_dependency (
    id integer NOT NULL,
    source character varying(255) NOT NULL,
    depends_on character varying(255) NOT NULL
);


ALTER TABLE public.static_precompiler_dependency OWNER TO ninopq;

--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE static_precompiler_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.static_precompiler_dependency_id_seq OWNER TO ninopq;

--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE static_precompiler_dependency_id_seq OWNED BY static_precompiler_dependency.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user ALTER COLUMN id SET DEFAULT nextval('authtools_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups ALTER COLUMN id SET DEFAULT nextval('authtools_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('authtools_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_category ALTER COLUMN id SET DEFAULT nextval('game_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_codemodule ALTER COLUMN id SET DEFAULT nextval('game_codemodule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance ALTER COLUMN id SET DEFAULT nextval('game_gameinstance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_gameinstance_seedParams" ALTER COLUMN id SET DEFAULT nextval('"game_gameinstance_seedParams_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstancesnapshot ALTER COLUMN id SET DEFAULT nextval('game_gameinstancesnapshot_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_jslibrary ALTER COLUMN id SET DEFAULT nextval('game_jslibrary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_savedfunction ALTER COLUMN id SET DEFAULT nextval('game_savedfunction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedkeyval ALTER COLUMN id SET DEFAULT nextval('game_seedkeyval_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedkeyvalrelationship ALTER COLUMN id SET DEFAULT nextval('game_seedkeyvalrelationship_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame ALTER COLUMN id SET DEFAULT nextval('game_plerpingapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes" ALTER COLUMN id SET DEFAULT nextval('"game_zeroplayergame_extraIncludes_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules ALTER COLUMN id SET DEFAULT nextval('game_zeroplayergame_required_modules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagegallery ALTER COLUMN id SET DEFAULT nextval('portfolio_imagegallery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagemodel ALTER COLUMN id SET DEFAULT nextval('portfolio_imagemodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfoliocategory ALTER COLUMN id SET DEFAULT nextval('portfolio_portfoliocategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfolioitem ALTER COLUMN id SET DEFAULT nextval('portfolio_portfolioitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers ALTER COLUMN id SET DEFAULT nextval('profiles_profile_followers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY static_precompiler_dependency ALTER COLUMN id SET DEFAULT nextval('static_precompiler_dependency_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_group (id, name) FROM stdin;
1	Level 1 user
2	Level 2 user
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	52
2	2	46
3	2	49
4	2	50
5	2	52
6	2	53
7	2	55
8	2	57
9	2	67
10	2	68
11	2	69
12	2	47
13	2	48
14	2	51
15	2	54
16	2	56
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 16, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add log entry	3	add_logentry
8	Can change log entry	3	change_logentry
9	Can delete log entry	3	delete_logentry
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add source	7	add_source
20	Can change source	7	change_source
21	Can delete source	7	delete_source
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add profile	10	add_profile
29	Can change profile	10	change_profile
30	Can delete profile	10	delete_profile
31	Can add portfolio category	11	add_portfoliocategory
32	Can change portfolio category	11	change_portfoliocategory
33	Can delete portfolio category	11	delete_portfoliocategory
34	Can add portfolio item	12	add_portfolioitem
35	Can change portfolio item	12	change_portfolioitem
36	Can delete portfolio item	12	delete_portfolioitem
37	Can add image gallery	13	add_imagegallery
38	Can change image gallery	13	change_imagegallery
39	Can delete image gallery	13	delete_imagegallery
40	Can add image model	14	add_imagemodel
41	Can change image model	14	change_imagemodel
42	Can delete image model	14	delete_imagemodel
43	Can add proprietary portfolio item	15	add_proprietaryportfolioitem
44	Can change proprietary portfolio item	15	change_proprietaryportfolioitem
45	Can delete proprietary portfolio item	15	delete_proprietaryportfolioitem
46	Can add category	16	add_category
47	Can change category	16	change_category
48	Can delete category	16	delete_category
49	Can add zero player game	17	add_zeroplayergame
50	Can change zero player game	17	change_zeroplayergame
51	Can delete zero player game	17	delete_zeroplayergame
52	Can add game instance	18	add_gameinstance
53	Can change game instance	18	change_gameinstance
54	Can delete game instance	18	delete_gameinstance
55	Can add game instance snapshot	19	add_gameinstancesnapshot
56	Can change game instance snapshot	19	change_gameinstancesnapshot
57	Can delete game instance snapshot	19	delete_gameinstancesnapshot
64	Can add dependency	22	add_dependency
65	Can change dependency	22	change_dependency
66	Can delete dependency	22	delete_dependency
67	Can add js library	23	add_jslibrary
68	Can change js library	23	change_jslibrary
69	Can delete js library	23	delete_jslibrary
70	Can add category	24	add_category
71	Can change category	24	change_category
72	Can delete category	24	delete_category
73	Can add js library	25	add_jslibrary
74	Can change js library	25	change_jslibrary
75	Can delete js library	25	delete_jslibrary
76	Can add app	26	add_app
77	Can change app	26	change_app
78	Can delete app	26	delete_app
79	Can add app instance	27	add_appinstance
80	Can change app instance	27	change_appinstance
81	Can delete app instance	27	delete_appinstance
82	Can add snapshot	28	add_snapshot
83	Can change snapshot	28	change_snapshot
84	Can delete snapshot	28	delete_snapshot
88	Can add saved function	30	add_savedfunction
89	Can change saved function	30	change_savedfunction
90	Can delete saved function	30	delete_savedfunction
91	Can add code module	31	add_codemodule
92	Can change code module	31	change_codemodule
93	Can delete code module	31	delete_codemodule
94	Can add seed key val	32	add_seedkeyval
95	Can change seed key val	32	change_seedkeyval
96	Can delete seed key val	32	delete_seedkeyval
97	Can add seed key val relationship	33	add_seedkeyvalrelationship
98	Can change seed key val relationship	33	change_seedkeyvalrelationship
99	Can delete seed key val relationship	33	delete_seedkeyvalrelationship
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_permission_id_seq', 99, true);


--
-- Data for Name: authtools_user; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user (id, password, last_login, is_superuser, email, is_staff, is_active, date_joined, name) FROM stdin;
2	pbkdf2_sha256$24000$cf6EYbM5geV5$2drkBTWNRr5BHVkKugLa05ZbvyBvGSo9aob4gCXkgkk=	2016-04-18 19:46:57.960071+00	f	mrcodeswitcher@gmail.com	f	t	2016-04-18 18:57:19.152012+00	Mr. Code-Switcher
1	pbkdf2_sha256$24000$FjBYgpxyCPgp$QyiNe1HT60XGPtKcAaTDnHiLajVkkHo99/2Tit3PFhc=	2016-04-25 20:33:54.892905+00	t	nino.cocchiarella@gmail.com	t	t	2016-01-28 01:45:34.23439+00	Nino P. Cocchiarella
\.


--
-- Data for Name: authtools_user_groups; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user_groups (id, user_id, group_id) FROM stdin;
1	1	2
\.


--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_groups_id_seq', 1, true);


--
-- Name: authtools_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_id_seq', 2, true);


--
-- Data for Name: authtools_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-01-28 01:47:27.700943+00	1	Mazes	1	Added.	16	1
2	2016-01-28 01:48:40.369918+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	1	Added.	17	1
3	2016-01-28 01:58:16.621353+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	1	Added.	17	1
4	2016-01-29 03:00:46.80575+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seedStruct and source.	17	1
5	2016-01-29 04:05:20.435543+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seedStruct. Added game param "GameParam object".	17	1
6	2016-01-29 20:07:55.189922+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seedStructure.	17	1
7	2016-01-29 20:14:32.594538+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
8	2016-01-29 21:07:03.238402+00	2	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	3		18	1
9	2016-01-29 23:18:25.040593+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
10	2016-01-29 23:47:14.663537+00	2	Mathematics	1	Added.	16	1
11	2016-01-29 23:48:06.502087+00	3	"Test", by Nino P. Cocchiarella	1	Added.	17	1
12	2016-01-29 23:57:16.277988+00	3	"Test", by Nino P. Cocchiarella	2	Changed source.	17	1
13	2016-01-29 23:58:04.816405+00	4	Nino P. Cocchiarella's instance of "Test", by Nino P. Cocchiarella	3		18	1
14	2016-01-29 23:58:04.835702+00	3	Nino P. Cocchiarella's instance of "Test", by Nino P. Cocchiarella	3		18	1
15	2016-01-30 00:28:59.530265+00	5	Nino P. Cocchiarella's instance of "Test", by Nino P. Cocchiarella	2	Changed source.	18	1
16	2016-01-30 00:31:04.16745+00	1	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	18	1
17	2016-01-30 00:33:33.901737+00	6	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed and source.	18	1
18	2016-01-30 00:36:03.062344+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
19	2016-01-30 00:36:20.307774+00	6	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	3		18	1
20	2016-01-30 00:36:20.395975+00	1	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	3		18	1
21	2016-01-30 02:19:37.751364+00	9	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed.	18	1
22	2016-01-30 02:19:48.186781+00	8	Nino P. Cocchiarella's instance of "2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed.	18	1
23	2016-01-30 02:50:16.867484+00	1	"2-dimensional interactive Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed description.	17	1
24	2016-01-30 02:51:07.990815+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed description.	17	1
25	2016-01-30 04:29:37.152309+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed title.	17	1
26	2016-01-30 06:36:56.549286+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
27	2016-01-30 21:21:45.864177+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
28	2016-01-30 21:22:40.981475+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
37	2016-01-31 02:27:33.221388+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
38	2016-01-31 02:28:27.249254+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
39	2016-01-31 02:29:57.247359+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
40	2016-01-31 02:32:24.06655+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
41	2016-01-31 02:33:58.285461+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
42	2016-01-31 03:43:04.323785+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source.	17	1
43	2016-01-31 03:43:53.968305+00	9	Nino P. Cocchiarella's instance of "2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed.	18	1
44	2016-01-31 03:44:14.159965+00	8	Nino P. Cocchiarella's instance of "2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed.	18	1
45	2016-01-31 03:44:38.722613+00	7	Nino P. Cocchiarella's instance of "2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seed.	18	1
46	2016-01-31 03:52:53.443235+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed seedStructure.	17	1
47	2016-02-01 19:35:18.265689+00	1	Level 1 user	1	Added.	2	1
48	2016-02-01 19:36:25.121257+00	2	Level 2 user	1	Added.	2	1
49	2016-02-01 19:36:33.75104+00	1	Nino P. Cocchiarella <nino.cocchiarella@gmail.com>	2	Changed groups.	6	1
50	2016-02-02 00:00:48.075102+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	1	Added.	17	1
51	2016-02-02 00:03:48.883288+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	2	No fields changed.	17	1
52	2016-02-02 00:04:39.421893+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	2	Changed seedStructure.	17	1
53	2016-02-02 00:05:29.865624+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	2	Changed seedStructure.	17	1
54	2016-02-02 00:36:32.529452+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	2	Changed source.	17	1
55	2016-02-02 01:48:13.770165+00	5	"Function in 1 variable with time parameter", by Nino P. Cocchiarella	1	Added.	17	1
56	2016-02-02 09:01:18.52974+00	13	Nino P. Cocchiarella's instance of "Function in 1 variable with time parameter", by Nino P. Cocchiarella	3		18	1
57	2016-02-02 09:01:18.577913+00	5	Nino P. Cocchiarella's instance of "Test", by Nino P. Cocchiarella	3		18	1
58	2016-02-02 09:04:01.14474+00	5	"Function in 1 variable with time parameter", by Nino P. Cocchiarella	2	Changed source and seedStructure.	17	1
59	2016-02-02 09:04:46.661892+00	5	"Function in 1 variable with time parameter", by Nino P. Cocchiarella	2	Changed seedStructure.	17	1
60	2016-02-04 07:10:40.868447+00	3	"Test", by Nino P. Cocchiarella	3		17	1
61	2016-02-04 07:11:58.972916+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed source and seedStructure.	17	1
62	2016-02-04 07:29:18.436802+00	1	JSLibrary object	1	Added.	23	1
63	2016-02-04 07:30:35.554499+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed source and extraIncludes.	17	1
64	2016-02-04 07:44:49.520596+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed source.	17	1
65	2016-02-04 08:18:50.923287+00	41	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 08:16:33.344232+00:00	3		19	1
66	2016-02-04 08:18:50.934047+00	40	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 08:12:21.762028+00:00	3		19	1
67	2016-02-04 08:18:50.944281+00	39	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 08:11:40.674877+00:00	3		19	1
68	2016-02-04 08:18:50.955265+00	38	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:45:07.952702+00:00	3		19	1
69	2016-02-04 08:18:50.966227+00	37	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:21:36.492645+00:00	3		19	1
70	2016-02-04 08:18:50.977288+00	35	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:18:07.345077+00:00	3		19	1
71	2016-02-04 08:18:50.988413+00	34	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:18:02.663271+00:00	3		19	1
72	2016-02-04 08:18:50.999312+00	33	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:17:57.341122+00:00	3		19	1
73	2016-02-04 08:18:51.010311+00	32	3-dimensional "Wolfenstein" Maze Generator, 2016-02-04 07:17:53.179290+00:00	3		19	1
29	2016-01-30 21:35:43.560644+00	8	ImageTest object	3		\N	1
30	2016-01-30 21:35:43.61517+00	7	ImageTest object	3		\N	1
31	2016-01-30 21:35:43.648126+00	6	ImageTest object	3		\N	1
32	2016-01-30 21:35:43.659143+00	5	ImageTest object	3		\N	1
33	2016-01-30 21:35:43.670146+00	4	ImageTest object	3		\N	1
34	2016-01-30 21:35:43.681172+00	3	ImageTest object	3		\N	1
35	2016-01-30 21:35:43.692139+00	2	ImageTest object	3		\N	1
36	2016-01-30 21:35:43.703166+00	1	ImageTest object	3		\N	1
74	2016-02-22 10:31:25.003504+00	1	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source and seedStructure.	17	1
75	2016-03-01 02:57:30.376716+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed source.	17	1
76	2016-03-05 11:18:14.239689+00	2	Level 2 user	2	Changed permissions.	2	1
77	2016-03-23 11:04:06.525843+00	5	   _.each(B, function(b) {\r\n            prod.push([a,b]);\r\n        });\r\n    });\r\n    return prod;\r\n}	1	Added.	30	1
78	2016-03-23 11:06:45.643342+00	6	drawAxes: function drawAxes() {\r\n\r\nDARK_GREY = new Color(0.3...	1	Added.	30	1
79	2016-03-23 23:13:00.085966+00	1	Cartesian Axes, 2 dimensions: function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new...	1	Added.	31	1
80	2016-03-23 23:16:56.20569+00	1	Cartesian Axes, 2 dimensions: function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new...	2	Changed source.	31	1
81	2016-03-23 23:18:07.318022+00	2	Pure Mathematical Function: MFunction = function(func, extrema) {\r\n    //conso...	1	Added.	31	1
82	2016-03-23 23:18:37.688858+00	5	"Function in 1 var, time parameter, and contour", by Nino P. Cocchiarella	2	Changed source, seedStructure and required_modules.	17	1
83	2016-03-23 23:29:05.332737+00	27	"Plain Function in 1 variable", by Nino P. Cocchiarella	2	Changed source, seedStructure and required_modules.	17	1
84	2016-03-24 00:01:52.136561+00	1	Cartesian Axes, 2 dimensions: function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new...	2	Changed source.	31	1
85	2016-03-24 00:02:06.712941+00	1	Cartesian Axes, 2 dimensions: function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new...	2	Changed source.	31	1
86	2016-03-24 03:00:32.052791+00	2	Pure Mathematical Function: MFunction = function(func, extrema) {\r\n    //conso...	2	No fields changed.	31	1
87	2016-03-24 10:44:00.691475+00	71	Nino P. Cocchiarella's instance of "Fractal Tree Creatures", by Nino P. Cocchiarella	2	No fields changed.	18	1
88	2016-03-25 09:30:56.488167+00	3	Fractals	1	Added.	16	1
89	2016-03-25 09:31:02.950789+00	4	Tests	1	Added.	16	1
90	2016-03-25 09:33:41.834929+00	28	"Fractal Tree Creatures", by Nino P. Cocchiarella	2	Changed category, source and seedStructure.	17	1
91	2016-03-25 09:33:52.005432+00	25	"Neenbox", by Nino P. Cocchiarella	2	Changed category, source and seedStructure.	17	1
92	2016-04-03 03:57:55.844146+00	5	Pure Mathematics	1	Added.	16	1
93	2016-04-03 03:58:42.851071+00	2	Mathematics ∩ Art	2	Changed name, parent and description.	16	1
94	2016-04-03 03:58:53.164669+00	3	Fractals	2	No fields changed.	16	1
95	2016-04-03 03:59:04.030137+00	6	Abstract Algebra	1	Added.	16	1
96	2016-04-03 03:59:43.544641+00	4	Music	2	Changed name.	16	1
97	2016-04-03 04:01:09.776377+00	7	Tests	1	Added.	16	1
98	2016-04-03 04:11:48.130406+00	2	Mathematics ∩ Art	2	Changed popularity.	16	1
99	2016-04-03 04:12:00.63976+00	3	Fractals	2	Changed popularity.	16	1
100	2016-04-03 04:12:09.878185+00	1	Mazes	2	Changed popularity.	16	1
101	2016-04-03 04:15:52.404334+00	5	Pure Mathematics	2	Changed popularity.	16	1
102	2016-04-03 04:15:56.465996+00	4	Music	2	Changed popularity.	16	1
103	2016-04-07 06:38:12.972273+00	35	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	2	Changed source and seedStructure.	17	1
104	2016-04-07 06:45:32.383297+00	35	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	2	Changed source and seedStructure.	17	1
105	2016-04-07 06:45:42.634519+00	34	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	3		17	1
106	2016-04-09 17:55:21.851759+00	35	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
107	2016-04-09 17:55:42.754326+00	33	"Bivariate Polynomial Landscape", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
108	2016-04-09 17:55:58.092617+00	28	"Fractal Tree Creatures", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
109	2016-04-09 17:56:13.375376+00	24	"2-dimensional Maze Generator and Solver", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
110	2016-04-09 17:56:27.785654+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed source and popularity.	17	1
111	2016-04-09 17:56:52.0048+00	5	"Function in 1 var, time parameter, and contour", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
112	2016-04-09 17:57:04.466498+00	27	"Plain Function in 1 variable", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
113	2016-04-09 18:06:08.240027+00	35	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	2	No fields changed.	17	1
114	2016-04-10 03:52:35.02888+00	35	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	3		17	1
115	2016-04-10 04:13:30.798799+00	36	"Subgroups of multiplicative group of integers mod(n)", by Nino P. Cocchiarella	2	Changed source, seedStructure and popularity.	17	1
116	2016-04-10 04:13:59.948624+00	33	"Bivariate Polynomial Landscape", by Nino P. Cocchiarella	2	Changed popularity.	17	1
117	2016-04-10 22:23:51.432244+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed popularity.	17	1
118	2016-04-10 22:24:07.047118+00	2	"3-dimensional "Wolfenstein" Maze Generator", by Nino P. Cocchiarella	2	Changed popularity.	17	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 118, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	admin	logentry
4	contenttypes	contenttype
5	sessions	session
6	authtools	user
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	profiles	profile
11	portfolio	portfoliocategory
12	portfolio	portfolioitem
13	portfolio	imagegallery
14	portfolio	imagemodel
15	portfolio	proprietaryportfolioitem
16	game	category
17	game	zeroplayergame
18	game	gameinstance
19	game	gameinstancesnapshot
22	static_precompiler	dependency
23	game	jslibrary
24	exhibitions	category
25	exhibitions	jslibrary
26	exhibitions	app
27	exhibitions	appinstance
28	exhibitions	snapshot
30	game	savedfunction
31	game	codemodule
32	game	seedkeyval
33	game	seedkeyvalrelationship
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_content_type_id_seq', 33, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-01-28 00:29:09.657917+00
2	auth	0001_initial	2016-01-28 00:29:10.36432+00
3	authtools	0001_initial	2016-01-28 00:29:11.003785+00
4	admin	0001_initial	2016-01-28 00:29:11.246166+00
5	admin	0002_logentry_remove_auto_add	2016-01-28 00:29:11.345112+00
6	contenttypes	0002_remove_content_type_name	2016-01-28 00:29:11.433158+00
7	auth	0002_alter_permission_name_max_length	2016-01-28 00:29:11.48828+00
8	auth	0003_alter_user_email_max_length	2016-01-28 00:29:11.529092+00
9	auth	0004_alter_user_username_opts	2016-01-28 00:29:11.567364+00
10	auth	0005_alter_user_last_login_null	2016-01-28 00:29:11.615745+00
11	auth	0006_require_contenttypes_0002	2016-01-28 00:29:11.636105+00
12	auth	0007_alter_validators_add_error_messages	2016-01-28 00:29:11.685856+00
13	authtools	0002_django18	2016-01-28 00:29:11.730451+00
14	authtools	0003_auto_20160119_0110	2016-01-28 00:29:12.083018+00
15	easy_thumbnails	0001_initial	2016-01-28 00:29:12.821142+00
16	easy_thumbnails	0002_thumbnaildimensions	2016-01-28 00:29:13.010288+00
17	game	0001_initial	2016-01-28 00:29:13.341116+00
18	game	0002_auto_20160126_1004	2016-01-28 00:29:13.382257+00
19	game	0003_auto_20160126_2325	2016-01-28 00:29:13.46204+00
20	game	0004_auto_20160127_0729	2016-01-28 00:29:14.046475+00
21	game	0005_auto_20160127_0938	2016-01-28 00:29:14.498796+00
22	game	0006_auto_20160128_0029	2016-01-28 00:29:14.828707+00
23	portfolio	0001_initial	2016-01-28 00:29:15.413418+00
24	portfolio	0002_portfolioitem_url	2016-01-28 00:29:15.457852+00
25	portfolio	0003_auto_20160119_0804	2016-01-28 00:29:15.493712+00
26	profiles	0001_initial	2016-01-28 00:29:15.611238+00
27	sessions	0001_initial	2016-01-28 00:29:15.864685+00
28	game	0007_zeroplayergame_seedstruct	2016-01-29 02:56:51.119154+00
29	game	0008_gameparam	2016-01-29 03:55:40.48746+00
30	game	0009_auto_20160129_0358	2016-01-29 03:58:09.648095+00
31	game	0010_remove_zeroplayergame_seedstruct	2016-01-29 04:08:37.100551+00
32	game	0011_auto_20160129_2004	2016-01-29 20:05:16.332071+00
33	game	0012_auto_20160129_2037	2016-01-29 20:37:26.816915+00
34	game	0013_auto_20160129_2108	2016-01-29 21:08:13.190762+00
35	game	0014_remove_gameinstance_source	2016-01-30 06:23:41.475212+00
36	game	0015_imagetest	2016-01-30 08:07:50.293203+00
37	game	0016_auto_20160130_2158	2016-01-30 21:58:17.789642+00
38	game	0017_zeroplayergame_updated	2016-01-31 22:52:10.84083+00
39	game	0018_remove_zeroplayergame_updated	2016-02-01 20:45:08.377417+00
40	static_precompiler	0001_initial	2016-02-03 00:36:38.784478+00
41	game	0019_auto_20160204_0727	2016-02-04 07:27:26.839165+00
42	profiles	0002_profile_followers	2016-02-06 01:00:14.407172+00
43	exhibitions	0001_initial	2016-02-18 12:26:06.187906+00
44	game	0020_auto_20160218_1434	2016-02-18 14:34:47.7967+00
45	game	0002_auto_20160220_0240	2016-02-20 02:40:40.003093+00
46	game	0003_auto_20160220_1718	2016-02-20 17:18:11.897276+00
47	game	0004_auto_20160220_1719	2016-02-20 17:19:19.113146+00
48	authtools	0003_auto_20160323_1057	2016-03-23 10:57:49.842871+00
49	game	0005_savedfunction	2016-03-23 10:57:50.185536+00
50	game	0006_savedfunction_title	2016-03-23 10:58:47.543235+00
51	game	0007_auto_20160323_1103	2016-03-23 11:03:31.639695+00
52	game	0008_auto_20160323_2310	2016-03-23 23:10:17.149244+00
53	game	0009_zeroplayergame_required_modules	2016-03-23 23:15:48.314405+00
54	game	0010_auto_20160325_0933	2016-03-25 09:33:19.566678+00
55	game	0011_auto_20160401_1948	2016-04-01 19:48:27.569766+00
56	game	0012_category_popularity	2016-04-03 04:11:18.432656+00
57	game	0013_auto_20160409_1749	2016-04-09 17:49:52.720809+00
58	game	0014_auto_20160410_0738	2016-04-10 07:38:26.320551+00
59	game	0015_seedkeyval_ordering	2016-04-10 21:43:42.905928+00
60	game	0016_auto_20160410_2251	2016-04-10 22:52:06.996281+00
61	game	0017_auto_20160410_2327	2016-04-10 23:27:19.395905+00
62	game	0018_gameinstance_vector	2016-04-11 03:17:54.008074+00
63	game	0019_auto_20160411_0622	2016-04-11 06:23:01.913898+00
64	game	0020_seedkeyval_valtype	2016-04-11 06:45:42.324288+00
65	game	0021_auto_20160411_0730	2016-04-11 07:30:24.95305+00
66	game	0022_auto_20160411_1117	2016-04-11 11:17:24.522084+00
67	authtools	0003_auto_20160426_0645	2016-04-26 06:45:56.747604+00
68	game	0023_category_enabled	2016-04-26 06:45:57.460619+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_migrations_id_seq', 68, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
o5euotw6b22qh8jfg9lspow6daibgg46	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-13 02:49:10.471831+00
6dx7q6va4bq8gbfkr5fznk0d3zj2s2xn	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-16 22:41:29.393568+00
iqmsse0hhdq50kgzszfar8fi3sgzq7y0	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-20 00:56:20.951166+00
nknuc7mud0exywtdr1zgkszsnybup3nx	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-03 13:55:13.99241+00
eqiuzs007bc4pyzu5yrrfm7cuidvkdc4	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-19 11:18:49.698756+00
8q58bzkii0d3ciqd2wibih4rgloo9psn	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-04 05:06:23.451787+00
d2pp7ia3jv2lrtek1la8z87wb8mw1mlw	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-04 21:00:35.943579+00
rq3kdyzitzcia1wpo7tf4nil7jl4nw5a	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-23 05:45:18.13726+00
16irfq4de8d6eblz4zf8hqdona3hrklo	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-24 21:50:39.636851+00
5svkwmo12wm1mq2uhlrbpjyz2hw9beu9	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-25 08:48:35.900976+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2016-02-02/97.jpg	2016-02-02 22:42:54.578053+00
2	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png	2016-04-18 19:28:47.505215+00
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-02-02/97.jpg.30x30_q85_crop.png	2016-02-02 22:42:54.401698+00	1
2	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-02-02/97.jpg.140x140_q85_crop.png	2016-02-02 22:42:54.621918+00	1
3	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png.30x30_q85_crop.png	2016-04-18 19:28:47.416587+00	2
4	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png.140x140_q85_crop.png	2016-04-18 19:28:47.516384+00	2
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 4, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: game_category; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_category (id, name, description, image, parent_id, popularity, enabled) FROM stdin;
6	Abstract Algebra			5	1	t
2	Mathematics ∩ Art			5	10	t
3	Fractals			2	9	t
1	Mazes	sdfg		\N	8	t
5	Pure Mathematics			\N	5	t
7	Tests			\N	1	f
4	Music			\N	4	f
\.


--
-- Name: game_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_category_id_seq', 7, true);


--
-- Data for Name: game_codemodule; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_codemodule (id, created, updated, title, language, source) FROM stdin;
2	2016-03-23 23:18:07.315886+00	2016-03-24 03:00:32.050637+00	Pure Mathematical Function	paperscript	MFunction = function(func, extrema) {\r\n    //console.log(func.length);\r\n    this.func = func;\r\n    if (!extrema) { extrema = [-5,5]; }\r\n\r\n    this.domain = {\r\n        elements: [],\r\n        min: (extrema[0] || -5),\r\n        max: (extrema[1] || 5)\r\n    };\r\n\r\n    this.codomain = {\r\n        elements: [],\r\n        min: null,\r\n        max: null\r\n    };\r\n\r\n    this.mapping = null;\r\n}\r\n\r\nMFunction.prototype = {\r\n    \r\n    compute: function(delta) {\r\n        if (!delta) { delta = 50; }\r\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\r\n        this.codomain.elements = _.map(this.domain.elements, this.func);\r\n        this.codomain.min = _.min(this.codomain.elements);\r\n        this.codomain.max = _.max(this.codomain.elements);\r\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\r\n\r\n        this._w = Math.abs(this.domain.max - this.domain.min);\r\n        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\r\n\r\n        this.transformation_matrix = new Matrix(\r\n            (view.size.width / this._w), 0,\r\n            0, (view.size.height / (-1*this._h)), \r\n            view.center.x, view.center.y);\r\n\r\n        this.computed = true;\r\n        console.log("computed.  transform-matrix: ", this.transformation_matrix)\r\n    },\r\n\r\n    // "flattens" mapping\r\n    // i.e. [[1,2],3] -> [1,2,3]\r\n    getPoints: function() {\r\n        if (!this.computed) { this.compute(); }\r\n        this.points = _.map(this.mapping, function(pair) {\r\n            return _.flatten(pair);\r\n        });\r\n        return this.points;\r\n    },\r\n\r\n\r\n    draw: function(path, matrix_premult, map3d, tmatrix) {\r\n\r\n        if (!this.computed) { this.compute(); }\r\n\r\n        if (map3d) {\r\n            this.points = this.points3d;\r\n        } else {\r\n            this.points = this.getPoints();\r\n        }\r\n\r\n        if (matrix_premult) {\r\n            this.points = _.map(this.points, function(p) {\r\n                return numeric.dot(matrix_premult, p);\r\n            })\r\n        }\r\n\r\n        _.each(this.points, function(p) {\r\n            path.add(new Point(p));\r\n        })\r\n\r\n        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\r\n        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\r\n        \r\n        if (tmatrix) {\r\n            path.transform(tmatrix);\r\n        } else {\r\n            path.transform(this.transformation_matrix);\r\n        } \r\n    }\r\n}
1	2016-03-23 23:13:00.084048+00	2016-03-24 00:02:06.711331+00	Cartesian Axes, 2 dimensions	paperscript	function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\r\n    LIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.4);\r\n\r\n    view.viewSize = new Size(Canvas.width, Canvas.height);\r\n\r\n    x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    x_axis.add(new Point(-view.size.width/2, 0));\r\n    x_axis.add(new Point(view.size.width/2, 0));\r\n    x_axis.closed = true;\r\n    project.activeLayer.insertChild(0,x_axis)\r\n\r\n    y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    y_axis.add(new Point(0, -view.size.height/2));\r\n    y_axis.add(new Point(0, view.size.height/2));\r\n\r\n    x_lines = [];\r\n    _.each(_.range(-10,10), function(n) {\r\n        line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(n, view.size.height/2) );\r\n        line.add( new Point(n, -view.size.height/2) );\r\n        line.closed = true;\r\n        project.activeLayer.insertChild(0, line);\r\n        x_lines.push( line );\r\n    });\r\n\r\n    y_lines = [];\r\n    _.each(_.range(-10,10), function(n) {\r\n        line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(view.size.width/2, n) );\r\n        line.add( new Point(-view.size.width/2, n) );\r\n        line.closed = true;\r\n        project.activeLayer.insertChild(0, line);\r\n        y_lines.push( line );\r\n    });\r\n\r\n\r\n    _layer.transform( new Matrix((view.size.width / 10),0,0,\r\n        (view.size.height / -10), view.center.x, view.center.y) \r\n    );\r\n\r\n}
\.


--
-- Name: game_codemodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_codemodule_id_seq', 2, true);


--
-- Data for Name: game_gameinstance; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_gameinstance (id, created, seed, game_id, instantiator_id, updated, popularity, vector) FROM stdin;
47	2016-03-23 08:54:27.883639+00	{"solutionPathColor": {"type": "color", "value": "#3673ab", "parsing": false}, "cellSize": {"type": "number", "value": "15", "parsing": false}}	24	1	2016-04-11 16:44:06.482277+00	1	\N
371	2016-04-10 03:56:31.674262+00	{"integer_group": {"type": "number", "value": 18, "parsing": false}}	36	1	2016-04-11 16:44:06.51556+00	1	\N
72	2016-03-24 10:34:47.281749+00	{"polynomial_degree": {"type": "number", "value": "7", "parsing": false}}	4	1	2016-04-11 16:44:06.549008+00	1	\N
64	2016-03-23 21:08:09.928913+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "string": "(1/x) cos(x)", "javascript": "Math.cos(x)/x", "value": "(1/x) cos(x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	27	1	2016-04-11 16:44:06.632279+00	1	\N
17	2016-02-04 07:15:16.00152+00	{}	2	1	2016-04-11 16:44:06.642965+00	1	\N
38	2016-03-22 10:30:57.067414+00	{"solutionPathColor": {"type": "color", "value": "#cc0055"}, "cellSize": {"type": "number", "value": 30}}	24	1	2016-04-11 16:44:06.782236+00	1	\N
53	2016-03-23 09:12:59.693881+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "string": "(x^7 - 2x^6)*(1/x)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "value": "(x^7 - 2x^6)*(1/x)", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	5	1	2016-04-11 16:44:06.890689+00	1	\N
74	2016-03-24 10:36:01.190997+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": 200, "parsing": false}}	25	1	2016-04-11 16:44:06.974013+00	1	\N
65	2016-03-23 22:39:01.575238+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "value": "(1/x) cos(2x) + (1/2x) cos(16x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	27	1	2016-04-11 16:44:07.065689+00	1	\N
54	2016-03-23 09:18:51.931859+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": "25", "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "string": "1/(x^2 - 3x^3)", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "value": "1/(x^2 - 3x^3)", "parsing": false, "type": "math"}}	5	1	2016-04-11 16:44:07.174043+00	1	\N
59	2016-03-23 10:37:42.426444+00	{"polynomial_degree": {"type": "number", "value": 5}}	4	1	2016-04-11 16:44:07.207341+00	1	\N
63	2016-03-23 11:28:03.349652+00	{"x_min": {"type": "number", "value": -5}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}, "x_max": {"type": "number", "value": 5}}	27	1	2016-04-11 16:44:07.29068+00	1	\N
494	2016-04-10 04:01:14.616112+00	{"integer_group": {"type": "number", "value": 141, "parsing": false}}	36	1	2016-04-11 16:44:07.324143+00	1	\N
668	2016-04-10 04:18:09.04142+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 11, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:07.507562+00	1	\N
55	2016-03-23 09:19:47.981376+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	5	1	2016-04-11 16:44:07.615958+00	1	\N
376	2016-04-10 03:56:43.002746+00	{"integer_group": {"type": "number", "value": 23, "parsing": false}}	36	1	2016-04-11 16:44:07.649323+00	1	\N
49	2016-03-23 09:01:05.469675+00	{"color": {"type": "color", "value": "#375fc7", "parsing": false}, "width": {"type": "number", "value": "200", "parsing": false}, "height": {"type": "number", "value": "500", "parsing": false}}	25	1	2016-04-11 16:44:07.732591+00	1	\N
93	2016-03-26 20:19:20.860679+00	{}	30	1	2016-04-11 16:44:07.743067+00	1	\N
52	2016-03-23 09:11:19.890382+00	{"color": {"type": "color", "value": "#3fa38b", "parsing": false}, "width": {"type": "number", "value": "600", "parsing": false}, "height": {"type": "number", "value": "300", "parsing": false}}	25	1	2016-04-11 16:44:07.824357+00	1	\N
365	2016-04-10 03:56:18.456704+00	{"integer_group": {"type": "number", "value": 12, "parsing": false}}	36	1	2016-04-11 16:44:07.857644+00	1	\N
35	2016-03-22 05:04:51.340616+00	{"color": {"type": "color", "value": "#cccc00"}, "width": {"type": "number", "value": 400}, "height": {"type": "number", "value": 200}}	25	1	2016-04-11 16:44:07.949309+00	1	\N
60	2016-03-23 10:39:29.985073+00	{"polynomial_degree": {"type": "number", "value": "8", "parsing": false}}	4	1	2016-04-11 16:44:07.982583+00	1	\N
62	2016-03-23 10:40:12.194292+00	{"polynomial_degree": {"type": "number", "value": "12", "parsing": false}}	4	1	2016-04-11 16:44:08.016042+00	1	\N
48	2016-03-23 08:55:23.81744+00	{"solutionPathColor": {"type": "color", "value": "#6727f0", "parsing": false}, "cellSize": {"type": "number", "value": "45", "parsing": false}}	24	1	2016-04-11 16:44:08.074431+00	1	\N
51	2016-03-23 09:10:29.352264+00	{"color": {"type": "color", "value": "#41a33f", "parsing": false}, "width": {"type": "number", "value": "600", "parsing": false}, "height": {"type": "number", "value": "400", "parsing": false}}	25	1	2016-04-11 16:44:08.157817+00	1	\N
381	2016-04-10 03:56:54.206707+00	{"integer_group": {"type": "number", "value": 28, "parsing": false}}	36	1	2016-04-11 16:44:08.191055+00	1	\N
66	2016-03-24 00:03:27.648282+00	{"x_min": {"type": "number", "value": -5, "parsing": false}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "string": "x cos(x) + (1/5) cos(10x)", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "value": "x cos(x) + (1/5) cos(10x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": 5, "parsing": false}}	27	1	2016-04-11 16:44:06.415523+00	1	\N
75	2016-03-24 10:36:41.303234+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x^3) cos(2x) + (1/2x)", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "value": "(1/x^3) cos(2x) + (1/2x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	27	1	2016-04-11 16:44:06.723949+00	1	\N
102	2016-04-04 07:47:34.820864+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	28	1	2016-04-11 16:44:08.624489+00	1	\N
390	2016-04-10 03:57:22.347338+00	{"integer_group": {"type": "number", "value": 37, "parsing": false}}	36	1	2016-04-11 16:44:11.877189+00	1	\N
111	2016-04-04 19:45:13.324274+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#499948", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "30", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:08.807776+00	1	\N
101	2016-04-04 07:47:13.888289+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "17", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	28	1	2016-04-11 16:44:08.991198+00	1	\N
103	2016-04-04 07:47:57.142102+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:09.17468+00	1	\N
106	2016-04-04 07:55:44.437638+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "10", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	28	1	2016-04-11 16:44:09.357954+00	1	\N
105	2016-04-04 07:54:29.494834+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "60", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:09.541325+00	1	\N
576	2016-04-10 04:05:55.54514+00	{"integer_group": {"type": "number", "value": 223, "parsing": false}}	36	1	2016-04-11 16:44:09.574646+00	1	\N
688	2016-04-10 04:19:01.501943+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 31, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:09.758093+00	1	\N
113	2016-04-04 19:46:43.127026+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "40", "parsing": false}}	24	1	2016-04-11 16:44:09.816536+00	1	\N
112	2016-04-04 19:45:38.782356+00	{"NUM_ITERATIONS": {"type": "number", "value": "5", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#499948", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "30", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,8,9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	28	1	2016-04-11 16:44:10.000006+00	1	\N
366	2016-04-10 03:56:20.678952+00	{"integer_group": {"type": "number", "value": 13, "parsing": false}}	36	1	2016-04-11 16:44:10.033262+00	1	\N
107	2016-04-04 10:10:52.558519+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "string": "3 cos(2x) + sin(3x) cos(5x)", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "value": "3 cos(2x) + sin(3x) cos(5x)", "parsing": false, "type": "math"}}	5	1	2016-04-11 16:44:10.141582+00	1	\N
108	2016-04-04 10:32:12.944725+00	{"solutionPathColor": {"type": "color", "value": "#e6228c", "parsing": false}, "cellSize": {"type": "number", "value": "10", "parsing": false}}	24	1	2016-04-11 16:44:10.200018+00	1	\N
104	2016-04-04 07:49:38.987263+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,7,17,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	28	1	2016-04-11 16:44:10.391608+00	1	\N
99	2016-04-04 07:45:32.788779+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15, "parsing": false}}	28	1	2016-04-11 16:44:10.575053+00	1	\N
115	2016-04-04 19:48:27.285357+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) + x^7", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "value": "x cos(x) + x^7", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	5	1	2016-04-11 16:44:08.299513+00	1	\N
675	2016-04-10 04:18:27.334444+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 18, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:11.27679+00	1	\N
140	2016-04-05 09:41:18.851042+00	{"NUM_ITERATIONS": {"type": "number", "value": "5", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,-5,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "10", "parsing": false}}	28	1	2016-04-11 16:44:11.460111+00	1	\N
382	2016-04-10 03:56:56.413851+00	{"integer_group": {"type": "number", "value": 29, "parsing": false}}	36	1	2016-04-11 16:44:11.910314+00	1	\N
406	2016-04-10 03:57:58.295978+00	{"integer_group": {"type": "number", "value": 53, "parsing": false}}	36	1	2016-04-11 16:44:11.943714+00	1	\N
153	2016-04-06 18:16:30.997859+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{x^{2} + 1}", "string": "1/(x^2+1)", "javascript": "1/(Math.pow(x, 2) + 1)", "value": "1/(x^2+1)", "parsing": false, "type": "math"}}	5	1	2016-04-11 16:44:12.060295+00	1	\N
410	2016-04-10 03:58:07.23711+00	{"integer_group": {"type": "number", "value": 57, "parsing": false}}	36	1	2016-04-11 16:44:12.277178+00	1	\N
394	2016-04-10 03:57:31.328562+00	{"integer_group": {"type": "number", "value": 41, "parsing": false}}	36	1	2016-04-11 16:44:12.318941+00	1	\N
177	2016-04-07 11:22:21.498062+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	25	1	2016-04-11 16:44:12.40214+00	1	\N
151	2016-04-06 18:15:14.925567+00	{"x_min": {"type": "number", "value": -5, "parsing": false}, "func1": {"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) sin(2x)", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "value": "x cos(x) sin(2x)", "parsing": true, "type": "math"}, "x_max": {"type": "number", "value": 5, "parsing": false}}	27	1	2016-04-11 16:44:12.485529+00	1	\N
148	2016-04-06 18:13:10.907124+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7,16,18]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "25", "parsing": false}}	28	1	2016-04-11 16:44:12.668924+00	1	\N
701	2016-04-10 04:19:35.645194+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 44, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:13.060935+00	1	\N
372	2016-04-10 03:56:33.905507+00	{"integer_group": {"type": "number", "value": 19, "parsing": false}}	36	1	2016-04-11 16:44:13.1856+00	1	\N
141	2016-04-05 09:55:33.780039+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:13.368965+00	1	\N
398	2016-04-10 03:57:40.32331+00	{"integer_group": {"type": "number", "value": 45, "parsing": false}}	36	1	2016-04-11 16:44:13.402274+00	1	\N
402	2016-04-10 03:57:49.332303+00	{"integer_group": {"type": "number", "value": 49, "parsing": false}}	36	1	2016-04-11 16:44:13.577366+00	1	\N
367	2016-04-10 03:56:22.894481+00	{"integer_group": {"type": "number", "value": 14, "parsing": false}}	36	1	2016-04-11 16:44:13.610547+00	1	\N
175	2016-04-07 10:47:16.063761+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	25	1	2016-04-11 16:44:11.543502+00	1	\N
386	2016-04-10 03:57:05.5499+00	{"integer_group": {"type": "number", "value": 33, "parsing": false}}	36	1	2016-04-11 16:44:13.643937+00	1	\N
174	2016-04-07 10:28:20.844211+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	25	1	2016-04-11 16:44:13.727334+00	1	\N
146	2016-04-06 18:11:31.543572+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	28	1	2016-04-11 16:44:11.72707+00	1	\N
176	2016-04-07 10:48:02.789058+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "200", "parsing": false}}	25	1	2016-04-11 16:44:11.81028+00	1	\N
377	2016-04-10 03:56:45.26359+00	{"integer_group": {"type": "number", "value": 24, "parsing": false}}	36	1	2016-04-11 16:44:11.843694+00	1	\N
144	2016-04-05 20:17:29.969007+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "15", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "35", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "35", "parsing": false}}	28	1	2016-04-11 16:44:12.243738+00	1	\N
426	2016-04-10 03:58:42.546931+00	{"integer_group": {"type": "number", "value": 73, "parsing": false}}	36	1	2016-04-11 16:44:14.127617+00	1	\N
435	2016-04-10 03:59:02.450427+00	{"integer_group": {"type": "number", "value": 82, "parsing": false}}	36	1	2016-04-11 16:44:14.160712+00	1	\N
391	2016-04-10 03:57:24.550586+00	{"integer_group": {"type": "number", "value": 38, "parsing": false}}	36	1	2016-04-11 16:44:14.194121+00	1	\N
417	2016-04-10 03:58:22.695608+00	{"integer_group": {"type": "number", "value": 64, "parsing": false}}	36	1	2016-04-11 16:44:14.227416+00	1	\N
255	2016-04-10 00:48:52.246514+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "52", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:14.410803+00	1	\N
438	2016-04-10 03:59:09.074118+00	{"integer_group": {"type": "number", "value": 85, "parsing": false}}	36	1	2016-04-11 16:44:14.444156+00	1	\N
256	2016-04-10 00:49:14.86687+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "52", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:14.769377+00	1	\N
429	2016-04-10 03:58:49.159253+00	{"integer_group": {"type": "number", "value": 76, "parsing": false}}	36	1	2016-04-11 16:44:14.810861+00	1	\N
378	2016-04-10 03:56:47.506214+00	{"integer_group": {"type": "number", "value": 25, "parsing": false}}	36	1	2016-04-11 16:44:14.85252+00	1	\N
411	2016-04-10 03:58:09.453379+00	{"integer_group": {"type": "number", "value": 58, "parsing": false}}	36	1	2016-04-11 16:44:14.885841+00	1	\N
407	2016-04-10 03:58:00.504133+00	{"integer_group": {"type": "number", "value": 54, "parsing": false}}	36	1	2016-04-11 16:44:14.919126+00	1	\N
253	2016-04-10 00:48:23.624195+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:15.352491+00	1	\N
252	2016-04-10 00:47:07.458277+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "49", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	28	1	2016-04-11 16:44:15.535887+00	1	\N
420	2016-04-10 03:58:29.350245+00	{"integer_group": {"type": "number", "value": 67, "parsing": false}}	36	1	2016-04-11 16:44:15.569374+00	1	\N
254	2016-04-10 00:48:35.479621+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "51", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:15.894325+00	1	\N
383	2016-04-10 03:56:58.774504+00	{"integer_group": {"type": "number", "value": 30, "parsing": false}}	36	1	2016-04-11 16:44:15.927589+00	1	\N
403	2016-04-10 03:57:51.5316+00	{"integer_group": {"type": "number", "value": 50, "parsing": false}}	36	1	2016-04-11 16:44:15.961085+00	1	\N
257	2016-04-10 00:49:27.006606+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "53", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:16.144351+00	1	\N
373	2016-04-10 03:56:36.245683+00	{"integer_group": {"type": "number", "value": 20, "parsing": false}}	36	1	2016-04-11 16:44:13.760733+00	1	\N
414	2016-04-10 03:58:16.065974+00	{"integer_group": {"type": "number", "value": 61, "parsing": false}}	36	1	2016-04-11 16:44:13.794034+00	1	\N
395	2016-04-10 03:57:33.591493+00	{"integer_group": {"type": "number", "value": 42, "parsing": false}}	36	1	2016-04-11 16:44:13.827337+00	1	\N
423	2016-04-10 03:58:35.911841+00	{"integer_group": {"type": "number", "value": 70, "parsing": false}}	36	1	2016-04-11 16:44:13.860661+00	1	\N
432	2016-04-10 03:58:55.812022+00	{"integer_group": {"type": "number", "value": 79, "parsing": false}}	36	1	2016-04-11 16:44:13.89398+00	1	\N
399	2016-04-10 03:57:42.624687+00	{"integer_group": {"type": "number", "value": 46, "parsing": false}}	36	1	2016-04-11 16:44:13.9275+00	1	\N
387	2016-04-10 03:57:07.753787+00	{"integer_group": {"type": "number", "value": 34, "parsing": false}}	36	1	2016-04-11 16:44:13.960812+00	1	\N
439	2016-04-10 03:59:11.262783+00	{"integer_group": {"type": "number", "value": 86, "parsing": false}}	36	1	2016-04-11 16:44:16.61933+00	1	\N
408	2016-04-10 03:58:02.753739+00	{"integer_group": {"type": "number", "value": 55, "parsing": false}}	36	1	2016-04-11 16:44:16.652561+00	1	\N
418	2016-04-10 03:58:24.903141+00	{"integer_group": {"type": "number", "value": 65, "parsing": false}}	36	1	2016-04-11 16:44:16.686043+00	1	\N
424	2016-04-10 03:58:38.111031+00	{"integer_group": {"type": "number", "value": 71, "parsing": false}}	36	1	2016-04-11 16:44:16.71947+00	1	\N
396	2016-04-10 03:57:35.856662+00	{"integer_group": {"type": "number", "value": 43, "parsing": false}}	36	1	2016-04-11 16:44:16.752783+00	1	\N
444	2016-04-10 03:59:22.412533+00	{"integer_group": {"type": "number", "value": 91, "parsing": false}}	36	1	2016-04-11 16:44:16.794478+00	1	\N
446	2016-04-10 03:59:26.917455+00	{"integer_group": {"type": "number", "value": 93, "parsing": false}}	36	1	2016-04-11 16:44:16.836218+00	1	\N
415	2016-04-10 03:58:18.260244+00	{"integer_group": {"type": "number", "value": 62, "parsing": false}}	36	1	2016-04-11 16:44:16.869509+00	1	\N
260	2016-04-10 00:58:51.365326+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "60", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:17.236164+00	1	\N
458	2016-04-10 03:59:53.750184+00	{"integer_group": {"type": "number", "value": 105, "parsing": false}}	36	1	2016-04-11 16:44:17.269469+00	1	\N
448	2016-04-10 03:59:31.389297+00	{"integer_group": {"type": "number", "value": 95, "parsing": false}}	36	1	2016-04-11 16:44:17.302763+00	1	\N
261	2016-04-10 00:59:01.922627+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "61", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:17.627817+00	1	\N
427	2016-04-10 03:58:44.762376+00	{"integer_group": {"type": "number", "value": 74, "parsing": false}}	36	1	2016-04-11 16:44:17.661131+00	1	\N
392	2016-04-10 03:57:26.811476+00	{"integer_group": {"type": "number", "value": 39, "parsing": false}}	36	1	2016-04-11 16:44:17.694462+00	1	\N
379	2016-04-10 03:56:49.749622+00	{"integer_group": {"type": "number", "value": 26, "parsing": false}}	36	1	2016-04-11 16:44:17.7279+00	1	\N
433	2016-04-10 03:58:58.044921+00	{"integer_group": {"type": "number", "value": 80, "parsing": false}}	36	1	2016-04-11 16:44:17.769624+00	1	\N
384	2016-04-10 03:57:01.008223+00	{"integer_group": {"type": "number", "value": 31, "parsing": false}}	36	1	2016-04-11 16:44:17.802934+00	1	\N
452	2016-04-10 03:59:40.256331+00	{"integer_group": {"type": "number", "value": 99, "parsing": false}}	36	1	2016-04-11 16:44:17.836211+00	1	\N
454	2016-04-10 03:59:44.749263+00	{"integer_group": {"type": "number", "value": 101, "parsing": false}}	36	1	2016-04-11 16:44:17.869577+00	1	\N
460	2016-04-10 03:59:58.275588+00	{"integer_group": {"type": "number", "value": 107, "parsing": false}}	36	1	2016-04-11 16:44:17.902878+00	1	\N
404	2016-04-10 03:57:53.828686+00	{"integer_group": {"type": "number", "value": 51, "parsing": false}}	36	1	2016-04-11 16:44:17.936244+00	1	\N
430	2016-04-10 03:58:51.386527+00	{"integer_group": {"type": "number", "value": 77, "parsing": false}}	36	1	2016-04-11 16:44:17.969663+00	1	\N
441	2016-04-10 03:59:15.716613+00	{"integer_group": {"type": "number", "value": 88, "parsing": false}}	36	1	2016-04-11 16:44:18.002862+00	1	\N
251	2016-04-10 00:46:56.196318+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "48", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	28	1	2016-04-11 16:44:18.328031+00	1	\N
456	2016-04-10 03:59:49.26529+00	{"integer_group": {"type": "number", "value": 103, "parsing": false}}	36	1	2016-04-11 16:44:18.361261+00	1	\N
462	2016-04-10 04:00:02.714259+00	{"integer_group": {"type": "number", "value": 109, "parsing": false}}	36	1	2016-04-11 16:44:16.177643+00	1	\N
436	2016-04-10 03:59:04.652828+00	{"integer_group": {"type": "number", "value": 83, "parsing": false}}	36	1	2016-04-11 16:44:16.211064+00	1	\N
421	2016-04-10 03:58:31.523138+00	{"integer_group": {"type": "number", "value": 68, "parsing": false}}	36	1	2016-04-11 16:44:16.244405+00	1	\N
412	2016-04-10 03:58:11.646575+00	{"integer_group": {"type": "number", "value": 59, "parsing": false}}	36	1	2016-04-11 16:44:16.27762+00	1	\N
400	2016-04-10 03:57:44.829072+00	{"integer_group": {"type": "number", "value": 47, "parsing": false}}	36	1	2016-04-11 16:44:16.447264+00	1	\N
450	2016-04-10 03:59:35.836712+00	{"integer_group": {"type": "number", "value": 97, "parsing": false}}	36	1	2016-04-11 16:44:18.394616+00	1	\N
369	2016-04-10 03:56:27.322283+00	{"integer_group": {"type": "number", "value": 16, "parsing": false}}	36	1	2016-04-11 16:44:16.486183+00	1	\N
388	2016-04-10 03:57:10.009102+00	{"integer_group": {"type": "number", "value": 35, "parsing": false}}	36	1	2016-04-11 16:44:16.51939+00	1	\N
442	2016-04-10 03:59:17.961894+00	{"integer_group": {"type": "number", "value": 89, "parsing": false}}	36	1	2016-04-11 16:44:16.552661+00	1	\N
464	2016-04-10 04:00:07.162186+00	{"integer_group": {"type": "number", "value": 111, "parsing": false}}	36	1	2016-04-11 16:44:16.586005+00	1	\N
457	2016-04-10 03:59:51.497+00	{"integer_group": {"type": "number", "value": 104, "parsing": false}}	36	1	2016-04-11 16:44:18.577885+00	1	\N
459	2016-04-10 03:59:55.995597+00	{"integer_group": {"type": "number", "value": 106, "parsing": false}}	36	1	2016-04-11 16:44:18.611257+00	1	\N
461	2016-04-10 04:00:00.459003+00	{"integer_group": {"type": "number", "value": 108, "parsing": false}}	36	1	2016-04-11 16:44:18.780263+00	1	\N
463	2016-04-10 04:00:04.914636+00	{"integer_group": {"type": "number", "value": 110, "parsing": false}}	36	1	2016-04-11 16:44:18.819658+00	1	\N
465	2016-04-10 04:00:09.402327+00	{"integer_group": {"type": "number", "value": 112, "parsing": false}}	36	1	2016-04-11 16:44:18.852958+00	1	\N
467	2016-04-10 04:00:13.871192+00	{"integer_group": {"type": "number", "value": 114, "parsing": false}}	36	1	2016-04-11 16:44:18.886325+00	1	\N
469	2016-04-10 04:00:18.316866+00	{"integer_group": {"type": "number", "value": 116, "parsing": false}}	36	1	2016-04-11 16:44:18.919598+00	1	\N
471	2016-04-10 04:00:22.85069+00	{"integer_group": {"type": "number", "value": 118, "parsing": false}}	36	1	2016-04-11 16:44:18.952903+00	1	\N
473	2016-04-10 04:00:27.278342+00	{"integer_group": {"type": "number", "value": 120, "parsing": false}}	36	1	2016-04-11 16:44:18.986285+00	1	\N
475	2016-04-10 04:00:31.794591+00	{"integer_group": {"type": "number", "value": 122, "parsing": false}}	36	1	2016-04-11 16:44:19.01958+00	1	\N
477	2016-04-10 04:00:36.299965+00	{"integer_group": {"type": "number", "value": 124, "parsing": false}}	36	1	2016-04-11 16:44:19.05309+00	1	\N
479	2016-04-10 04:00:40.778357+00	{"integer_group": {"type": "number", "value": 126, "parsing": false}}	36	1	2016-04-11 16:44:19.086364+00	1	\N
481	2016-04-10 04:00:45.311782+00	{"integer_group": {"type": "number", "value": 128, "parsing": false}}	36	1	2016-04-11 16:44:19.119504+00	1	\N
483	2016-04-10 04:00:49.759409+00	{"integer_group": {"type": "number", "value": 130, "parsing": false}}	36	1	2016-04-11 16:44:19.152875+00	1	\N
485	2016-04-10 04:00:54.235681+00	{"integer_group": {"type": "number", "value": 132, "parsing": false}}	36	1	2016-04-11 16:44:19.186166+00	1	\N
489	2016-04-10 04:01:03.2681+00	{"integer_group": {"type": "number", "value": 136, "parsing": false}}	36	1	2016-04-11 16:44:19.369774+00	1	\N
490	2016-04-10 04:01:05.556155+00	{"integer_group": {"type": "number", "value": 137, "parsing": false}}	36	1	2016-04-11 16:44:19.403056+00	1	\N
491	2016-04-10 04:01:07.77446+00	{"integer_group": {"type": "number", "value": 138, "parsing": false}}	36	1	2016-04-11 16:44:19.436376+00	1	\N
355	2016-04-10 03:55:56.090606+00	{"integer_group": {"type": "number", "value": "2", "parsing": false}}	36	1	2016-04-11 16:44:19.469503+00	1	\N
449	2016-04-10 03:59:33.618233+00	{"integer_group": {"type": "number", "value": 96, "parsing": false}}	36	1	2016-04-11 16:44:19.503061+00	1	\N
356	2016-04-10 03:55:58.360607+00	{"integer_group": {"type": "number", "value": 3, "parsing": false}}	36	1	2016-04-11 16:44:19.536266+00	1	\N
357	2016-04-10 03:56:00.544163+00	{"integer_group": {"type": "number", "value": 4, "parsing": false}}	36	1	2016-04-11 16:44:19.569858+00	1	\N
358	2016-04-10 03:56:02.762357+00	{"integer_group": {"type": "number", "value": 5, "parsing": false}}	36	1	2016-04-11 16:44:19.603084+00	1	\N
359	2016-04-10 03:56:05.017393+00	{"integer_group": {"type": "number", "value": 6, "parsing": false}}	36	1	2016-04-11 16:44:19.636304+00	1	\N
360	2016-04-10 03:56:07.258356+00	{"integer_group": {"type": "number", "value": 7, "parsing": false}}	36	1	2016-04-11 16:44:19.6697+00	1	\N
361	2016-04-10 03:56:09.505473+00	{"integer_group": {"type": "number", "value": 8, "parsing": false}}	36	1	2016-04-11 16:44:19.703113+00	1	\N
362	2016-04-10 03:56:11.788589+00	{"integer_group": {"type": "number", "value": 9, "parsing": false}}	36	1	2016-04-11 16:44:19.736362+00	1	\N
363	2016-04-10 03:56:13.981485+00	{"integer_group": {"type": "number", "value": 10, "parsing": false}}	36	1	2016-04-11 16:44:19.769691+00	1	\N
364	2016-04-10 03:56:16.231315+00	{"integer_group": {"type": "number", "value": 11, "parsing": false}}	36	1	2016-04-11 16:44:19.944891+00	1	\N
492	2016-04-10 04:01:10.092128+00	{"integer_group": {"type": "number", "value": 139, "parsing": false}}	36	1	2016-04-11 16:44:19.978003+00	1	\N
493	2016-04-10 04:01:12.325835+00	{"integer_group": {"type": "number", "value": 140, "parsing": false}}	36	1	2016-04-11 16:44:20.011336+00	1	\N
495	2016-04-10 04:01:16.921114+00	{"integer_group": {"type": "number", "value": 142, "parsing": false}}	36	1	2016-04-11 16:44:20.044672+00	1	\N
496	2016-04-10 04:01:19.154934+00	{"integer_group": {"type": "number", "value": 143, "parsing": false}}	36	1	2016-04-11 16:44:20.078028+00	1	\N
375	2016-04-10 03:56:40.765157+00	{"integer_group": {"type": "number", "value": 22, "parsing": false}}	36	1	2016-04-11 16:44:20.111456+00	1	\N
380	2016-04-10 03:56:51.974071+00	{"integer_group": {"type": "number", "value": 27, "parsing": false}}	36	1	2016-04-11 16:44:20.144648+00	1	\N
385	2016-04-10 03:57:03.307567+00	{"integer_group": {"type": "number", "value": 32, "parsing": false}}	36	1	2016-04-11 16:44:20.178057+00	1	\N
389	2016-04-10 03:57:20.119174+00	{"integer_group": {"type": "number", "value": 36, "parsing": false}}	36	1	2016-04-11 16:44:20.211353+00	1	\N
393	2016-04-10 03:57:29.074764+00	{"integer_group": {"type": "number", "value": 40, "parsing": false}}	36	1	2016-04-11 16:44:20.244798+00	1	\N
397	2016-04-10 03:57:38.113732+00	{"integer_group": {"type": "number", "value": 44, "parsing": false}}	36	1	2016-04-11 16:44:20.278216+00	1	\N
401	2016-04-10 03:57:47.062472+00	{"integer_group": {"type": "number", "value": 48, "parsing": false}}	36	1	2016-04-11 16:44:20.319748+00	1	\N
405	2016-04-10 03:57:56.062577+00	{"integer_group": {"type": "number", "value": 52, "parsing": false}}	36	1	2016-04-11 16:44:20.353094+00	1	\N
413	2016-04-10 03:58:13.869239+00	{"integer_group": {"type": "number", "value": 60, "parsing": false}}	36	1	2016-04-11 16:44:20.51963+00	1	\N
416	2016-04-10 03:58:20.480401+00	{"integer_group": {"type": "number", "value": 63, "parsing": false}}	36	1	2016-04-11 16:44:20.561363+00	1	\N
419	2016-04-10 03:58:27.083234+00	{"integer_group": {"type": "number", "value": 66, "parsing": false}}	36	1	2016-04-11 16:44:20.594622+00	1	\N
422	2016-04-10 03:58:33.745706+00	{"integer_group": {"type": "number", "value": 69, "parsing": false}}	36	1	2016-04-11 16:44:20.628052+00	1	\N
425	2016-04-10 03:58:40.351673+00	{"integer_group": {"type": "number", "value": 72, "parsing": false}}	36	1	2016-04-11 16:44:20.661699+00	1	\N
428	2016-04-10 03:58:46.960544+00	{"integer_group": {"type": "number", "value": 75, "parsing": false}}	36	1	2016-04-11 16:44:20.695056+00	1	\N
434	2016-04-10 03:59:00.238195+00	{"integer_group": {"type": "number", "value": 81, "parsing": false}}	36	1	2016-04-11 16:44:20.728344+00	1	\N
437	2016-04-10 03:59:06.852958+00	{"integer_group": {"type": "number", "value": 84, "parsing": false}}	36	1	2016-04-11 16:44:20.761555+00	1	\N
440	2016-04-10 03:59:13.475055+00	{"integer_group": {"type": "number", "value": 87, "parsing": false}}	36	1	2016-04-11 16:44:20.794927+00	1	\N
443	2016-04-10 03:59:20.181532+00	{"integer_group": {"type": "number", "value": 90, "parsing": false}}	36	1	2016-04-11 16:44:20.828288+00	1	\N
445	2016-04-10 03:59:24.66602+00	{"integer_group": {"type": "number", "value": 92, "parsing": false}}	36	1	2016-04-11 16:44:20.861682+00	1	\N
354	2016-04-10 03:55:33.744711+00	{"integer_group": {"type": "number", "value": 840}}	36	1	2016-04-11 16:44:20.894978+00	1	\N
447	2016-04-10 03:59:29.149132+00	{"integer_group": {"type": "number", "value": 94, "parsing": false}}	36	1	2016-04-11 16:44:21.063333+00	1	\N
451	2016-04-10 03:59:38.074512+00	{"integer_group": {"type": "number", "value": 98, "parsing": false}}	36	1	2016-04-11 16:44:21.103486+00	1	\N
453	2016-04-10 03:59:42.493386+00	{"integer_group": {"type": "number", "value": 100, "parsing": false}}	36	1	2016-04-11 16:44:21.136712+00	1	\N
455	2016-04-10 03:59:47.014904+00	{"integer_group": {"type": "number", "value": 102, "parsing": false}}	36	1	2016-04-11 16:44:18.54483+00	1	\N
523	2016-04-10 04:02:20.989131+00	{"integer_group": {"type": "number", "value": 170, "parsing": false}}	36	1	2016-04-11 16:44:21.203293+00	1	\N
524	2016-04-10 04:02:23.292627+00	{"integer_group": {"type": "number", "value": 171, "parsing": false}}	36	1	2016-04-11 16:44:21.244986+00	1	\N
525	2016-04-10 04:02:25.66374+00	{"integer_group": {"type": "number", "value": 172, "parsing": false}}	36	1	2016-04-11 16:44:21.278328+00	1	\N
526	2016-04-10 04:02:27.932784+00	{"integer_group": {"type": "number", "value": 173, "parsing": false}}	36	1	2016-04-11 16:44:21.320227+00	1	\N
527	2016-04-10 04:02:30.192454+00	{"integer_group": {"type": "number", "value": 174, "parsing": false}}	36	1	2016-04-11 16:44:21.353431+00	1	\N
528	2016-04-10 04:02:32.52621+00	{"integer_group": {"type": "number", "value": 175, "parsing": false}}	36	1	2016-04-11 16:44:21.386712+00	1	\N
529	2016-04-10 04:02:34.835564+00	{"integer_group": {"type": "number", "value": 176, "parsing": false}}	36	1	2016-04-11 16:44:21.419831+00	1	\N
530	2016-04-10 04:02:37.137682+00	{"integer_group": {"type": "number", "value": 177, "parsing": false}}	36	1	2016-04-11 16:44:21.453172+00	1	\N
531	2016-04-10 04:02:39.44341+00	{"integer_group": {"type": "number", "value": 178, "parsing": false}}	36	1	2016-04-11 16:44:21.486704+00	1	\N
532	2016-04-10 04:02:41.754208+00	{"integer_group": {"type": "number", "value": 179, "parsing": false}}	36	1	2016-04-11 16:44:21.661987+00	1	\N
533	2016-04-10 04:02:44.129291+00	{"integer_group": {"type": "number", "value": 180, "parsing": false}}	36	1	2016-04-11 16:44:21.695108+00	1	\N
534	2016-04-10 04:02:46.495267+00	{"integer_group": {"type": "number", "value": 181, "parsing": false}}	36	1	2016-04-11 16:44:21.728351+00	1	\N
535	2016-04-10 04:02:48.879273+00	{"integer_group": {"type": "number", "value": 182, "parsing": false}}	36	1	2016-04-11 16:44:21.76155+00	1	\N
536	2016-04-10 04:02:51.23812+00	{"integer_group": {"type": "number", "value": 183, "parsing": false}}	36	1	2016-04-11 16:44:21.794965+00	1	\N
537	2016-04-10 04:02:53.511784+00	{"integer_group": {"type": "number", "value": 184, "parsing": false}}	36	1	2016-04-11 16:44:21.828386+00	1	\N
538	2016-04-10 04:02:55.876717+00	{"integer_group": {"type": "number", "value": 185, "parsing": false}}	36	1	2016-04-11 16:44:21.861673+00	1	\N
539	2016-04-10 04:02:58.225092+00	{"integer_group": {"type": "number", "value": 186, "parsing": false}}	36	1	2016-04-11 16:44:21.895138+00	1	\N
540	2016-04-10 04:03:00.565154+00	{"integer_group": {"type": "number", "value": 187, "parsing": false}}	36	1	2016-04-11 16:44:21.928435+00	1	\N
541	2016-04-10 04:03:02.84507+00	{"integer_group": {"type": "number", "value": 188, "parsing": false}}	36	1	2016-04-11 16:44:21.961793+00	1	\N
543	2016-04-10 04:03:07.531843+00	{"integer_group": {"type": "number", "value": 190, "parsing": false}}	36	1	2016-04-11 16:44:21.995142+00	1	\N
544	2016-04-10 04:03:09.884364+00	{"integer_group": {"type": "number", "value": 191, "parsing": false}}	36	1	2016-04-11 16:44:22.028387+00	1	\N
545	2016-04-10 04:03:12.243374+00	{"integer_group": {"type": "number", "value": 192, "parsing": false}}	36	1	2016-04-11 16:44:22.061735+00	1	\N
546	2016-04-10 04:03:14.547248+00	{"integer_group": {"type": "number", "value": 193, "parsing": false}}	36	1	2016-04-11 16:44:22.236779+00	1	\N
547	2016-04-10 04:03:16.843568+00	{"integer_group": {"type": "number", "value": 194, "parsing": false}}	36	1	2016-04-11 16:44:22.270179+00	1	\N
548	2016-04-10 04:03:19.109172+00	{"integer_group": {"type": "number", "value": 195, "parsing": false}}	36	1	2016-04-11 16:44:22.303375+00	1	\N
549	2016-04-10 04:03:21.453156+00	{"integer_group": {"type": "number", "value": 196, "parsing": false}}	36	1	2016-04-11 16:44:22.336801+00	1	\N
550	2016-04-10 04:03:23.741202+00	{"integer_group": {"type": "number", "value": 197, "parsing": false}}	36	1	2016-04-11 16:44:22.370079+00	1	\N
551	2016-04-10 04:03:26.052135+00	{"integer_group": {"type": "number", "value": 198, "parsing": false}}	36	1	2016-04-11 16:44:22.40345+00	1	\N
552	2016-04-10 04:03:28.416128+00	{"integer_group": {"type": "number", "value": 199, "parsing": false}}	36	1	2016-04-11 16:44:22.436791+00	1	\N
553	2016-04-10 04:03:30.715531+00	{"integer_group": {"type": "number", "value": 200, "parsing": false}}	36	1	2016-04-11 16:44:22.478508+00	1	\N
554	2016-04-10 04:05:01.142096+00	{"integer_group": {"type": "number", "value": "201", "parsing": false}}	36	1	2016-04-11 16:44:22.511789+00	1	\N
556	2016-04-10 04:05:06.235209+00	{"integer_group": {"type": "number", "value": 203, "parsing": false}}	36	1	2016-04-11 16:44:22.545143+00	1	\N
557	2016-04-10 04:05:08.677706+00	{"integer_group": {"type": "number", "value": 204, "parsing": false}}	36	1	2016-04-11 16:44:22.57859+00	1	\N
500	2016-04-10 04:01:28.235691+00	{"integer_group": {"type": "number", "value": 147, "parsing": false}}	36	1	2016-04-11 16:44:22.611837+00	1	\N
501	2016-04-10 04:01:30.497911+00	{"integer_group": {"type": "number", "value": 148, "parsing": false}}	36	1	2016-04-11 16:44:22.787796+00	1	\N
502	2016-04-10 04:01:32.731719+00	{"integer_group": {"type": "number", "value": 149, "parsing": false}}	36	1	2016-04-11 16:44:22.828421+00	1	\N
503	2016-04-10 04:01:34.979645+00	{"integer_group": {"type": "number", "value": 150, "parsing": false}}	36	1	2016-04-11 16:44:22.861757+00	1	\N
505	2016-04-10 04:01:39.589761+00	{"integer_group": {"type": "number", "value": 152, "parsing": false}}	36	1	2016-04-11 16:44:22.895099+00	1	\N
504	2016-04-10 04:01:37.230104+00	{"integer_group": {"type": "number", "value": 151, "parsing": false}}	36	1	2016-04-11 16:44:22.92846+00	1	\N
507	2016-04-10 04:01:44.106287+00	{"integer_group": {"type": "number", "value": 154, "parsing": false}}	36	1	2016-04-11 16:44:22.961985+00	1	\N
506	2016-04-10 04:01:41.865271+00	{"integer_group": {"type": "number", "value": 153, "parsing": false}}	36	1	2016-04-11 16:44:22.995157+00	1	\N
508	2016-04-10 04:01:46.463163+00	{"integer_group": {"type": "number", "value": 155, "parsing": false}}	36	1	2016-04-11 16:44:23.028392+00	1	\N
510	2016-04-10 04:01:51.071501+00	{"integer_group": {"type": "number", "value": 157, "parsing": false}}	36	1	2016-04-11 16:44:23.061898+00	1	\N
511	2016-04-10 04:01:53.366246+00	{"integer_group": {"type": "number", "value": 158, "parsing": false}}	36	1	2016-04-11 16:44:23.09521+00	1	\N
512	2016-04-10 04:01:55.730185+00	{"integer_group": {"type": "number", "value": 159, "parsing": false}}	36	1	2016-04-11 16:44:23.128533+00	1	\N
513	2016-04-10 04:01:57.956713+00	{"integer_group": {"type": "number", "value": 160, "parsing": false}}	36	1	2016-04-11 16:44:23.161946+00	1	\N
514	2016-04-10 04:02:00.183033+00	{"integer_group": {"type": "number", "value": 161, "parsing": false}}	36	1	2016-04-11 16:44:23.195107+00	1	\N
515	2016-04-10 04:02:02.448118+00	{"integer_group": {"type": "number", "value": 162, "parsing": false}}	36	1	2016-04-11 16:44:23.228412+00	1	\N
516	2016-04-10 04:02:04.748716+00	{"integer_group": {"type": "number", "value": 163, "parsing": false}}	36	1	2016-04-11 16:44:23.261769+00	1	\N
517	2016-04-10 04:02:07.103467+00	{"integer_group": {"type": "number", "value": 164, "parsing": false}}	36	1	2016-04-11 16:44:23.295136+00	1	\N
518	2016-04-10 04:02:09.433353+00	{"integer_group": {"type": "number", "value": 165, "parsing": false}}	36	1	2016-04-11 16:44:23.32855+00	1	\N
519	2016-04-10 04:02:11.77404+00	{"integer_group": {"type": "number", "value": 166, "parsing": false}}	36	1	2016-04-11 16:44:23.361911+00	1	\N
520	2016-04-10 04:02:14.100098+00	{"integer_group": {"type": "number", "value": 167, "parsing": false}}	36	1	2016-04-11 16:44:23.395335+00	1	\N
521	2016-04-10 04:02:16.420482+00	{"integer_group": {"type": "number", "value": 168, "parsing": false}}	36	1	2016-04-11 16:44:23.428564+00	1	\N
522	2016-04-10 04:02:18.679592+00	{"integer_group": {"type": "number", "value": 169, "parsing": false}}	36	1	2016-04-11 16:44:21.169898+00	1	\N
584	2016-04-10 04:06:17.146112+00	{"integer_group": {"type": "number", "value": 231, "parsing": false}}	36	1	2016-04-11 16:44:23.503518+00	1	\N
585	2016-04-10 04:06:19.884766+00	{"integer_group": {"type": "number", "value": 232, "parsing": false}}	36	1	2016-04-11 16:44:23.570424+00	1	\N
586	2016-04-10 04:06:22.725832+00	{"integer_group": {"type": "number", "value": 233, "parsing": false}}	36	1	2016-04-11 16:44:23.611824+00	1	\N
587	2016-04-10 04:06:25.668113+00	{"integer_group": {"type": "number", "value": 234, "parsing": false}}	36	1	2016-04-11 16:44:23.645505+00	1	\N
589	2016-04-10 04:06:31.575688+00	{"integer_group": {"type": "number", "value": 236, "parsing": false}}	36	1	2016-04-11 16:44:23.678681+00	1	\N
590	2016-04-10 04:06:34.78839+00	{"integer_group": {"type": "number", "value": 237, "parsing": false}}	36	1	2016-04-11 16:44:23.712089+00	1	\N
591	2016-04-10 04:06:37.958653+00	{"integer_group": {"type": "number", "value": 238, "parsing": false}}	36	1	2016-04-11 16:44:23.745271+00	1	\N
559	2016-04-10 04:05:13.418067+00	{"integer_group": {"type": "number", "value": 206, "parsing": false}}	36	1	2016-04-11 16:44:23.778652+00	1	\N
593	2016-04-10 04:06:44.652254+00	{"integer_group": {"type": "number", "value": 240, "parsing": false}}	36	1	2016-04-11 16:44:23.811902+00	1	\N
594	2016-04-10 04:06:48.298101+00	{"integer_group": {"type": "number", "value": 241, "parsing": false}}	36	1	2016-04-11 16:44:23.845319+00	1	\N
595	2016-04-10 04:06:52.207058+00	{"integer_group": {"type": "number", "value": 242, "parsing": false}}	36	1	2016-04-11 16:44:23.887024+00	1	\N
596	2016-04-10 04:06:56.011442+00	{"integer_group": {"type": "number", "value": 243, "parsing": false}}	36	1	2016-04-11 16:44:23.920352+00	1	\N
597	2016-04-10 04:07:00.371716+00	{"integer_group": {"type": "number", "value": 244, "parsing": false}}	36	1	2016-04-11 16:44:23.962133+00	1	\N
598	2016-04-10 04:07:04.561794+00	{"integer_group": {"type": "number", "value": 245, "parsing": false}}	36	1	2016-04-11 16:44:24.012008+00	1	\N
599	2016-04-10 04:07:09.191965+00	{"integer_group": {"type": "number", "value": 246, "parsing": false}}	36	1	2016-04-11 16:44:24.045513+00	1	\N
600	2016-04-10 04:07:14.233436+00	{"integer_group": {"type": "number", "value": 247, "parsing": false}}	36	1	2016-04-11 16:44:24.078845+00	1	\N
601	2016-04-10 04:07:18.959801+00	{"integer_group": {"type": "number", "value": 248, "parsing": false}}	36	1	2016-04-11 16:44:24.112049+00	1	\N
602	2016-04-10 04:07:22.981504+00	{"integer_group": {"type": "number", "value": 249, "parsing": false}}	36	1	2016-04-11 16:44:24.145311+00	1	\N
603	2016-04-10 04:07:27.798346+00	{"integer_group": {"type": "number", "value": 250, "parsing": false}}	36	1	2016-04-11 16:44:24.178757+00	1	\N
604	2016-04-10 04:07:33.255265+00	{"integer_group": {"type": "number", "value": 251, "parsing": false}}	36	1	2016-04-11 16:44:24.212017+00	1	\N
605	2016-04-10 04:07:37.689194+00	{"integer_group": {"type": "number", "value": 252, "parsing": false}}	36	1	2016-04-11 16:44:24.245373+00	1	\N
606	2016-04-10 04:07:41.903457+00	{"integer_group": {"type": "number", "value": 253, "parsing": false}}	36	1	2016-04-11 16:44:24.278869+00	1	\N
607	2016-04-10 04:07:46.181663+00	{"integer_group": {"type": "number", "value": 254, "parsing": false}}	36	1	2016-04-11 16:44:24.320443+00	1	\N
608	2016-04-10 04:07:50.164554+00	{"integer_group": {"type": "number", "value": 255, "parsing": false}}	36	1	2016-04-11 16:44:24.353885+00	1	\N
609	2016-04-10 04:07:54.33935+00	{"integer_group": {"type": "number", "value": 256, "parsing": false}}	36	1	2016-04-11 16:44:24.387173+00	1	\N
610	2016-04-10 04:07:58.216758+00	{"integer_group": {"type": "number", "value": 257, "parsing": false}}	36	1	2016-04-11 16:44:24.420527+00	1	\N
611	2016-04-10 04:08:03.139482+00	{"integer_group": {"type": "number", "value": 258, "parsing": false}}	36	1	2016-04-11 16:44:24.462056+00	1	\N
612	2016-04-10 04:08:06.888362+00	{"integer_group": {"type": "number", "value": 259, "parsing": false}}	36	1	2016-04-11 16:44:24.495429+00	1	\N
613	2016-04-10 04:08:11.946224+00	{"integer_group": {"type": "number", "value": 260, "parsing": false}}	36	1	2016-04-11 16:44:24.528826+00	1	\N
614	2016-04-10 04:08:16.557903+00	{"integer_group": {"type": "number", "value": 261, "parsing": false}}	36	1	2016-04-11 16:44:24.56211+00	1	\N
615	2016-04-10 04:08:21.194672+00	{"integer_group": {"type": "number", "value": 262, "parsing": false}}	36	1	2016-04-11 16:44:24.595433+00	1	\N
616	2016-04-10 04:08:25.108886+00	{"integer_group": {"type": "number", "value": 263, "parsing": false}}	36	1	2016-04-11 16:44:24.629066+00	1	\N
617	2016-04-10 04:08:29.678467+00	{"integer_group": {"type": "number", "value": 264, "parsing": false}}	36	1	2016-04-11 16:44:24.662173+00	1	\N
618	2016-04-10 04:08:34.564208+00	{"integer_group": {"type": "number", "value": 265, "parsing": false}}	36	1	2016-04-11 16:44:24.695604+00	1	\N
560	2016-04-10 04:05:15.764652+00	{"integer_group": {"type": "number", "value": 207, "parsing": false}}	36	1	2016-04-11 16:44:24.728941+00	1	\N
561	2016-04-10 04:05:18.138648+00	{"integer_group": {"type": "number", "value": 208, "parsing": false}}	36	1	2016-04-11 16:44:24.762166+00	1	\N
592	2016-04-10 04:06:41.212876+00	{"integer_group": {"type": "number", "value": 239, "parsing": false}}	36	1	2016-04-11 16:44:24.795516+00	1	\N
562	2016-04-10 04:05:20.530721+00	{"integer_group": {"type": "number", "value": 209, "parsing": false}}	36	1	2016-04-11 16:44:24.828828+00	1	\N
563	2016-04-10 04:05:22.963562+00	{"integer_group": {"type": "number", "value": 210, "parsing": false}}	36	1	2016-04-11 16:44:24.862179+00	1	\N
564	2016-04-10 04:05:25.403971+00	{"integer_group": {"type": "number", "value": 211, "parsing": false}}	36	1	2016-04-11 16:44:24.895571+00	1	\N
565	2016-04-10 04:05:27.819055+00	{"integer_group": {"type": "number", "value": 212, "parsing": false}}	36	1	2016-04-11 16:44:24.928868+00	1	\N
566	2016-04-10 04:05:30.267736+00	{"integer_group": {"type": "number", "value": 213, "parsing": false}}	36	1	2016-04-11 16:44:24.962355+00	1	\N
568	2016-04-10 04:05:35.174317+00	{"integer_group": {"type": "number", "value": 215, "parsing": false}}	36	1	2016-04-11 16:44:24.995617+00	1	\N
567	2016-04-10 04:05:32.803247+00	{"integer_group": {"type": "number", "value": 214, "parsing": false}}	36	1	2016-04-11 16:44:25.028983+00	1	\N
569	2016-04-10 04:05:37.767365+00	{"integer_group": {"type": "number", "value": 216, "parsing": false}}	36	1	2016-04-11 16:44:25.062325+00	1	\N
570	2016-04-10 04:05:40.255169+00	{"integer_group": {"type": "number", "value": 217, "parsing": false}}	36	1	2016-04-11 16:44:25.095669+00	1	\N
571	2016-04-10 04:05:42.786442+00	{"integer_group": {"type": "number", "value": 218, "parsing": false}}	36	1	2016-04-11 16:44:25.128862+00	1	\N
572	2016-04-10 04:05:45.218974+00	{"integer_group": {"type": "number", "value": 219, "parsing": false}}	36	1	2016-04-11 16:44:25.162206+00	1	\N
573	2016-04-10 04:05:47.834694+00	{"integer_group": {"type": "number", "value": 220, "parsing": false}}	36	1	2016-04-11 16:44:25.195502+00	1	\N
574	2016-04-10 04:05:50.358874+00	{"integer_group": {"type": "number", "value": 221, "parsing": false}}	36	1	2016-04-11 16:44:25.229025+00	1	\N
575	2016-04-10 04:05:52.899107+00	{"integer_group": {"type": "number", "value": 222, "parsing": false}}	36	1	2016-04-11 16:44:25.262283+00	1	\N
577	2016-04-10 04:05:58.232511+00	{"integer_group": {"type": "number", "value": 224, "parsing": false}}	36	1	2016-04-11 16:44:25.295484+00	1	\N
578	2016-04-10 04:06:00.750947+00	{"integer_group": {"type": "number", "value": 225, "parsing": false}}	36	1	2016-04-11 16:44:25.328863+00	1	\N
579	2016-04-10 04:06:03.295084+00	{"integer_group": {"type": "number", "value": 226, "parsing": false}}	36	1	2016-04-11 16:44:25.362255+00	1	\N
580	2016-04-10 04:06:06.029642+00	{"integer_group": {"type": "number", "value": 227, "parsing": false}}	36	1	2016-04-11 16:44:25.395578+00	1	\N
581	2016-04-10 04:06:08.768989+00	{"integer_group": {"type": "number", "value": 228, "parsing": false}}	36	1	2016-04-11 16:44:25.429095+00	1	\N
582	2016-04-10 04:06:11.445484+00	{"integer_group": {"type": "number", "value": 229, "parsing": false}}	36	1	2016-04-11 16:44:25.462381+00	1	\N
583	2016-04-10 04:06:14.306354+00	{"integer_group": {"type": "number", "value": 230, "parsing": false}}	36	1	2016-04-11 16:44:23.461863+00	1	\N
638	2016-04-10 04:10:11.326871+00	{"integer_group": {"type": "number", "value": 285, "parsing": false}}	36	1	2016-04-11 16:44:25.662266+00	1	\N
633	2016-04-10 04:09:44.754137+00	{"integer_group": {"type": "number", "value": 280, "parsing": false}}	36	1	2016-04-11 16:44:25.695651+00	1	\N
630	2016-04-10 04:09:29.075029+00	{"integer_group": {"type": "number", "value": 277, "parsing": false}}	36	1	2016-04-11 16:44:25.729135+00	1	\N
635	2016-04-10 04:09:55.182707+00	{"integer_group": {"type": "number", "value": 282, "parsing": false}}	36	1	2016-04-11 16:44:25.762383+00	1	\N
632	2016-04-10 04:09:39.906325+00	{"integer_group": {"type": "number", "value": 279, "parsing": false}}	36	1	2016-04-11 16:44:25.795648+00	1	\N
634	2016-04-10 04:09:50.020698+00	{"integer_group": {"type": "number", "value": 281, "parsing": false}}	36	1	2016-04-11 16:44:25.829064+00	1	\N
623	2016-04-10 04:08:57.412312+00	{"integer_group": {"type": "number", "value": 270, "parsing": false}}	36	1	2016-04-11 16:44:25.862336+00	1	\N
642	2016-04-10 04:10:31.880388+00	{"integer_group": {"type": "number", "value": 289, "parsing": false}}	36	1	2016-04-11 16:44:25.895748+00	1	\N
636	2016-04-10 04:10:00.572134+00	{"integer_group": {"type": "number", "value": 283, "parsing": false}}	36	1	2016-04-11 16:44:25.92912+00	1	\N
637	2016-04-10 04:10:05.679245+00	{"integer_group": {"type": "number", "value": 284, "parsing": false}}	36	1	2016-04-11 16:44:25.962531+00	1	\N
643	2016-04-10 04:10:37.646846+00	{"integer_group": {"type": "number", "value": 290, "parsing": false}}	36	1	2016-04-11 16:44:25.995695+00	1	\N
639	2016-04-10 04:10:16.519938+00	{"integer_group": {"type": "number", "value": 286, "parsing": false}}	36	1	2016-04-11 16:44:26.029158+00	1	\N
641	2016-04-10 04:10:26.935682+00	{"integer_group": {"type": "number", "value": 288, "parsing": false}}	36	1	2016-04-11 16:44:26.062463+00	1	\N
644	2016-04-10 04:10:42.903597+00	{"integer_group": {"type": "number", "value": 291, "parsing": false}}	36	1	2016-04-11 16:44:26.09577+00	1	\N
645	2016-04-10 04:10:48.078744+00	{"integer_group": {"type": "number", "value": 292, "parsing": false}}	36	1	2016-04-11 16:44:26.229032+00	1	\N
646	2016-04-10 04:10:53.932724+00	{"integer_group": {"type": "number", "value": 293, "parsing": false}}	36	1	2016-04-11 16:44:26.262557+00	1	\N
640	2016-04-10 04:10:21.263836+00	{"integer_group": {"type": "number", "value": 287, "parsing": false}}	36	1	2016-04-11 16:44:26.295821+00	1	\N
647	2016-04-10 04:10:59.437855+00	{"integer_group": {"type": "number", "value": 294, "parsing": false}}	36	1	2016-04-11 16:44:26.329098+00	1	\N
648	2016-04-10 04:11:05.26445+00	{"integer_group": {"type": "number", "value": 295, "parsing": false}}	36	1	2016-04-11 16:44:26.362501+00	1	\N
649	2016-04-10 04:11:10.60941+00	{"integer_group": {"type": "number", "value": 296, "parsing": false}}	36	1	2016-04-11 16:44:26.395827+00	1	\N
654	2016-04-10 04:11:38.805291+00	{"integer_group": {"type": "number", "value": 301, "parsing": false}}	36	1	2016-04-11 16:44:26.429155+00	1	\N
650	2016-04-10 04:11:16.267494+00	{"integer_group": {"type": "number", "value": 297, "parsing": false}}	36	1	2016-04-11 16:44:26.46254+00	1	\N
651	2016-04-10 04:11:21.77809+00	{"integer_group": {"type": "number", "value": 298, "parsing": false}}	36	1	2016-04-11 16:44:26.49584+00	1	\N
652	2016-04-10 04:11:27.201399+00	{"integer_group": {"type": "number", "value": 299, "parsing": false}}	36	1	2016-04-11 16:44:26.529172+00	1	\N
653	2016-04-10 04:11:32.470579+00	{"integer_group": {"type": "number", "value": 300, "parsing": false}}	36	1	2016-04-11 16:44:26.562473+00	1	\N
655	2016-04-10 04:11:45.320568+00	{"integer_group": {"type": "number", "value": 302, "parsing": false}}	36	1	2016-04-11 16:44:26.595866+00	1	\N
656	2016-04-10 04:11:50.639255+00	{"integer_group": {"type": "number", "value": 303, "parsing": false}}	36	1	2016-04-11 16:44:26.629253+00	1	\N
658	2016-04-10 04:12:03.683237+00	{"integer_group": {"type": "number", "value": 305, "parsing": false}}	36	1	2016-04-11 16:44:26.662504+00	1	\N
659	2016-04-10 04:12:10.773065+00	{"integer_group": {"type": "number", "value": 306, "parsing": false}}	36	1	2016-04-11 16:44:26.695854+00	1	\N
660	2016-04-10 04:12:16.024198+00	{"integer_group": {"type": "number", "value": 307, "parsing": false}}	36	1	2016-04-11 16:44:26.729195+00	1	\N
661	2016-04-10 04:12:22.484298+00	{"integer_group": {"type": "number", "value": 308, "parsing": false}}	36	1	2016-04-11 16:44:26.795868+00	1	\N
662	2016-04-10 04:12:28.015704+00	{"integer_group": {"type": "number", "value": 309, "parsing": false}}	36	1	2016-04-11 16:44:26.829207+00	1	\N
663	2016-04-10 04:12:34.248916+00	{"integer_group": {"type": "number", "value": 310, "parsing": false}}	36	1	2016-04-11 16:44:26.862591+00	1	\N
664	2016-04-10 04:12:41.067159+00	{"integer_group": {"type": "number", "value": 311, "parsing": false}}	36	1	2016-04-11 16:44:26.895951+00	1	\N
669	2016-04-10 04:18:11.648292+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 12, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:27.079382+00	1	\N
620	2016-04-10 04:08:43.747152+00	{"integer_group": {"type": "number", "value": 267, "parsing": false}}	36	1	2016-04-11 16:44:27.112619+00	1	\N
625	2016-04-10 04:09:05.557686+00	{"integer_group": {"type": "number", "value": 272, "parsing": false}}	36	1	2016-04-11 16:44:27.145938+00	1	\N
622	2016-04-10 04:08:52.829543+00	{"integer_group": {"type": "number", "value": 269, "parsing": false}}	36	1	2016-04-11 16:44:27.17927+00	1	\N
626	2016-04-10 04:09:09.403405+00	{"integer_group": {"type": "number", "value": 273, "parsing": false}}	36	1	2016-04-11 16:44:27.212561+00	1	\N
628	2016-04-10 04:09:18.830202+00	{"integer_group": {"type": "number", "value": 275, "parsing": false}}	36	1	2016-04-11 16:44:27.24601+00	1	\N
624	2016-04-10 04:09:01.253457+00	{"integer_group": {"type": "number", "value": 271, "parsing": false}}	36	1	2016-04-11 16:44:25.495698+00	1	\N
627	2016-04-10 04:09:14.175024+00	{"integer_group": {"type": "number", "value": 274, "parsing": false}}	36	1	2016-04-11 16:44:25.528996+00	1	\N
619	2016-04-10 04:08:39.1593+00	{"integer_group": {"type": "number", "value": 266, "parsing": false}}	36	1	2016-04-11 16:44:25.562253+00	1	\N
629	2016-04-10 04:09:23.904129+00	{"integer_group": {"type": "number", "value": 276, "parsing": false}}	36	1	2016-04-11 16:44:25.595636+00	1	\N
631	2016-04-10 04:09:34.412863+00	{"integer_group": {"type": "number", "value": 278, "parsing": false}}	36	1	2016-04-11 16:44:25.628994+00	1	\N
678	2016-04-10 04:18:35.166561+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 21, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:27.796369+00	1	\N
680	2016-04-10 04:18:40.405551+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 23, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:27.988015+00	1	\N
679	2016-04-10 04:18:37.77669+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 22, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:28.179678+00	1	\N
681	2016-04-10 04:18:43.038226+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 24, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:28.363084+00	1	\N
682	2016-04-10 04:18:45.652287+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 25, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:28.546561+00	1	\N
683	2016-04-10 04:18:48.262291+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 26, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:28.729841+00	1	\N
671	2016-04-10 04:18:16.93155+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:28.913218+00	1	\N
673	2016-04-10 04:18:22.1139+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 16, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:29.146639+00	1	\N
674	2016-04-10 04:18:24.732806+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 17, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:29.329933+00	1	\N
677	2016-04-10 04:18:32.552004+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 20, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:29.51335+00	1	\N
676	2016-04-10 04:18:29.94884+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 19, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:27.429283+00	1	\N
672	2016-04-10 04:18:19.537599+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 15, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:27.612762+00	1	\N
691	2016-04-10 04:19:09.399507+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 34, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:29.880218+00	1	\N
487	2016-04-10 04:00:58.720227+00	{"integer_group": {"type": "number", "value": 134, "parsing": false}}	36	1	2016-04-11 16:44:46.235871+00	1	\N
509	2016-04-10 04:01:48.762192+00	{"integer_group": {"type": "number", "value": 156, "parsing": false}}	36	1	2016-04-11 16:44:45.143983+00	1	\N
694	2016-04-10 04:19:17.244852+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 37, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.246943+00	1	\N
693	2016-04-10 04:19:14.635923+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 36, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.438578+00	1	\N
696	2016-04-10 04:19:22.521396+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 39, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.622058+00	1	\N
695	2016-04-10 04:19:19.897917+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 38, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.805367+00	1	\N
685	2016-04-10 04:18:53.515426+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 28, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.988798+00	1	\N
697	2016-04-10 04:19:25.149973+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 40, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:31.205546+00	1	\N
686	2016-04-10 04:18:56.197399+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 29, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:31.388676+00	1	\N
687	2016-04-10 04:18:58.839627+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 30, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:31.572096+00	1	\N
689	2016-04-10 04:19:04.145755+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 32, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:31.755558+00	1	\N
690	2016-04-10 04:19:06.800684+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:29.69673+00	1	\N
692	2016-04-10 04:19:12.030408+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 35, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:30.063504+00	1	\N
705	2016-04-10 04:19:46.10135+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 48, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:32.339169+00	1	\N
707	2016-04-10 04:19:51.32069+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 50, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:32.522364+00	1	\N
706	2016-04-10 04:19:48.716218+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 49, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:32.705856+00	1	\N
708	2016-04-10 04:19:53.957806+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 51, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:32.8892+00	1	\N
710	2016-04-10 04:20:30.471201+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:33.072596+00	1	\N
711	2016-04-10 04:20:33.334932+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 11, "parsing": false}}	28	1	2016-04-11 16:44:33.255944+00	1	\N
698	2016-04-10 04:19:27.82335+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 41, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:33.439427+00	1	\N
700	2016-04-10 04:19:33.022765+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 43, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:33.622823+00	1	\N
699	2016-04-10 04:19:30.419461+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 42, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:33.807683+00	1	\N
703	2016-04-10 04:19:40.861736+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 46, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:34.024498+00	1	\N
702	2016-04-10 04:19:38.235004+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 45, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:31.939016+00	1	\N
704	2016-04-10 04:19:43.47819+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 47, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:32.155763+00	1	\N
720	2016-04-10 04:20:57.092067+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 20, "parsing": false}}	28	1	2016-04-11 16:44:34.58294+00	1	\N
719	2016-04-10 04:20:54.439086+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 19, "parsing": false}}	28	1	2016-04-11 16:44:34.76624+00	1	\N
722	2016-04-10 04:21:02.445856+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 22, "parsing": false}}	28	1	2016-04-11 16:44:34.949624+00	1	\N
721	2016-04-10 04:20:59.774197+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 21, "parsing": false}}	28	1	2016-04-11 16:44:35.133029+00	1	\N
724	2016-04-10 04:21:07.790341+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 24, "parsing": false}}	28	1	2016-04-11 16:44:35.324778+00	1	\N
497	2016-04-10 04:01:21.469149+00	{"integer_group": {"type": "number", "value": 144, "parsing": false}}	36	1	2016-04-11 16:44:45.1785+00	1	\N
723	2016-04-10 04:21:05.084696+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 23, "parsing": false}}	28	1	2016-04-11 16:44:35.50828+00	1	\N
713	2016-04-10 04:20:38.584844+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 13, "parsing": false}}	28	1	2016-04-11 16:44:35.691351+00	1	\N
725	2016-04-10 04:21:10.413966+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 25, "parsing": false}}	28	1	2016-04-11 16:44:35.874926+00	1	\N
716	2016-04-10 04:20:46.529919+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 16, "parsing": false}}	28	1	2016-04-11 16:44:36.058228+00	1	\N
718	2016-04-10 04:20:51.827277+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 18, "parsing": false}}	28	1	2016-04-11 16:44:36.283288+00	1	\N
715	2016-04-10 04:20:43.89835+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 15, "parsing": false}}	28	1	2016-04-11 16:44:34.207737+00	1	\N
717	2016-04-10 04:20:49.169205+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 17, "parsing": false}}	28	1	2016-04-11 16:44:34.391226+00	1	\N
732	2016-04-10 04:21:29.238505+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 32, "parsing": false}}	28	1	2016-04-11 16:44:36.833376+00	1	\N
728	2016-04-10 04:21:18.452238+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 28, "parsing": false}}	28	1	2016-04-11 16:44:37.016937+00	1	\N
736	2016-04-10 04:21:39.816278+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 36, "parsing": false}}	28	1	2016-04-11 16:44:37.200233+00	1	\N
735	2016-04-10 04:21:37.192809+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 35, "parsing": false}}	28	1	2016-04-11 16:44:37.383668+00	1	\N
734	2016-04-10 04:21:34.547691+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 34, "parsing": false}}	28	1	2016-04-11 16:44:37.566981+00	1	\N
738	2016-04-10 04:21:45.138856+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 38, "parsing": false}}	28	1	2016-04-11 16:44:37.750378+00	1	\N
739	2016-04-10 04:21:47.790693+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 39, "parsing": false}}	28	1	2016-04-11 16:44:37.933724+00	1	\N
368	2016-04-10 03:56:25.117613+00	{"integer_group": {"type": "number", "value": 15, "parsing": false}}	36	1	2016-04-11 16:44:45.218982+00	1	\N
727	2016-04-10 04:21:15.756944+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 27, "parsing": false}}	28	1	2016-04-11 16:44:38.117168+00	1	\N
737	2016-04-10 04:21:42.479938+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 37, "parsing": false}}	28	1	2016-04-11 16:44:38.300592+00	1	\N
729	2016-04-10 04:21:21.098564+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 29, "parsing": false}}	28	1	2016-04-11 16:44:38.4839+00	1	\N
731	2016-04-10 04:21:26.564571+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 31, "parsing": false}}	28	1	2016-04-11 16:44:36.466708+00	1	\N
733	2016-04-10 04:21:31.897986+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 33, "parsing": false}}	28	1	2016-04-11 16:44:36.650074+00	1	\N
749	2016-04-10 04:23:42.923925+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 15, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:38.858967+00	1	\N
750	2016-04-10 04:23:45.707178+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 16, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:39.258977+00	1	\N
752	2016-04-10 04:23:50.95978+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 18, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:39.450763+00	1	\N
751	2016-04-10 04:23:48.333689+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 17, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:39.634126+00	1	\N
754	2016-04-10 04:23:56.269746+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 20, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:39.817606+00	1	\N
741	2016-04-10 04:21:53.055019+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 41, "parsing": false}}	28	1	2016-04-11 16:44:40.000936+00	1	\N
744	2016-04-10 04:23:29.748659+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:40.192444+00	1	\N
742	2016-04-10 04:21:55.693269+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 42, "parsing": false}}	28	1	2016-04-11 16:44:40.375958+00	1	\N
745	2016-04-10 04:23:32.479235+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 11, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:40.55941+00	1	\N
746	2016-04-10 04:23:35.07827+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 12, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:40.742869+00	1	\N
747	2016-04-10 04:23:37.682668+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 13, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:40.926126+00	1	\N
748	2016-04-10 04:23:40.290207+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:41.109538+00	1	\N
753	2016-04-10 04:23:53.612097+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 19, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:38.675504+00	1	\N
756	2016-04-10 04:24:01.593707+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 22, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:41.692847+00	1	\N
757	2016-04-10 04:24:04.214167+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 23, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:41.876277+00	1	\N
758	2016-04-10 04:24:06.896078+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 24, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:42.059722+00	1	\N
759	2016-04-10 04:24:09.533818+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 25, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:42.243154+00	1	\N
760	2016-04-10 04:24:12.156987+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 26, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:42.426616+00	1	\N
761	2016-04-10 04:24:14.787528+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 27, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:42.609972+00	1	\N
762	2016-04-10 04:24:17.458529+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 28, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:42.793258+00	1	\N
712	2016-04-10 04:20:35.97862+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 12, "parsing": false}}	28	1	2016-04-11 16:44:41.326265+00	1	\N
726	2016-04-10 04:21:13.066914+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 26, "parsing": false}}	28	1	2016-04-11 16:44:41.509585+00	1	\N
774	2016-04-10 09:25:06.845426+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "47", "parsing": false}}	24	1	2016-04-11 16:44:43.993441+00	1	\N
771	2016-04-10 09:01:06.41965+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "45", "parsing": false}}	24	1	2016-04-11 16:44:44.051999+00	1	\N
259	2016-04-10 00:52:48.503112+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "56", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:44.235265+00	1	\N
767	2016-04-10 07:57:16.997624+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	24	1	2016-04-11 16:44:44.652118+00	1	\N
776	2016-04-10 09:43:33.823936+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	24	1	2016-04-11 16:44:44.71047+00	1	\N
777	2016-04-10 09:50:58.891229+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "43", "parsing": false}}	24	1	2016-04-11 16:44:44.768817+00	1	\N
139	2016-04-05 07:17:39.129642+00	{"param1": {"type": "string", "value": "5", "parsing": false}}	32	1	2016-04-11 16:44:44.802193+00	1	\N
778	2016-04-10 09:54:43.435696+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "35", "parsing": false}}	24	1	2016-04-11 16:44:44.868717+00	1	\N
768	2016-04-10 08:39:08.424711+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	24	1	2016-04-11 16:44:44.927239+00	1	\N
116	2016-04-05 05:46:17.532814+00	{"x": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": 1}, "y": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 5}, "x^2y": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^3y": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 3}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1	2016-04-11 16:44:43.8185+00	1	\N
769	2016-04-10 08:56:46.582816+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "41", "parsing": false}}	24	1	2016-04-11 16:44:43.876806+00	1	\N
142	2016-04-05 10:05:14.305293+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:45.11065+00	1	\N
773	2016-04-10 09:22:48.308528+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "46", "parsing": false}}	24	1	2016-04-11 16:44:43.935132+00	1	\N
98	2016-04-04 07:40:38.858672+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a653d9", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15, "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 30, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "30", "parsing": false}}	28	1	2016-04-11 16:44:44.41863+00	1	\N
770	2016-04-10 09:00:11.979948+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "44", "parsing": false}}	24	1	2016-04-11 16:44:44.477139+00	1	\N
775	2016-04-10 09:25:49.300381+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "48", "parsing": false}}	24	1	2016-04-11 16:44:44.535592+00	1	\N
772	2016-04-10 09:22:31.074095+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "44", "parsing": false}}	24	1	2016-04-11 16:44:44.593754+00	1	\N
670	2016-04-10 04:18:14.265641+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 13, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:45.410719+00	1	\N
249	2016-04-10 00:46:13.346468+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "46", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:45.602327+00	1	\N
542	2016-04-10 04:03:05.226696+00	{"integer_group": {"type": "number", "value": 189, "parsing": false}}	36	1	2016-04-11 16:44:45.635767+00	1	\N
558	2016-04-10 04:05:11.069998+00	{"integer_group": {"type": "number", "value": 205, "parsing": false}}	36	1	2016-04-11 16:44:45.669084+00	1	\N
588	2016-04-10 04:06:28.521843+00	{"integer_group": {"type": "number", "value": 235, "parsing": false}}	36	1	2016-04-11 16:44:45.702342+00	1	\N
657	2016-04-10 04:11:57.976592+00	{"integer_group": {"type": "number", "value": 304, "parsing": false}}	36	1	2016-04-11 16:44:45.735797+00	1	\N
684	2016-04-10 04:18:50.86658+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 27, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:45.919103+00	1	\N
258	2016-04-10 00:52:07.766782+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "55", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:46.102555+00	1	\N
370	2016-04-10 03:56:29.481004+00	{"integer_group": {"type": "number", "value": 17, "parsing": false}}	36	1	2016-04-11 16:44:46.135859+00	1	\N
409	2016-04-10 03:58:05.041758+00	{"integer_group": {"type": "number", "value": 56, "parsing": false}}	36	1	2016-04-11 16:44:46.202751+00	1	\N
117	2016-04-05 06:17:50.017894+00	{"x^3y": {"type": "number", "value": 0, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": 5, "parsing": false}, "x^2y": {"type": "number", "value": "0", "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "4", "parsing": false}, "x^5": {"type": "number", "value": 3, "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	33	1	2016-04-11 16:44:47.519729+00	1	\N
667	2016-04-10 04:18:06.220942+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:47.702969+00	1	\N
119	2016-04-05 06:23:18.176285+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "14", "parsing": false}, "x^2y": {"type": "number", "value": "2", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": 3, "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "4", "parsing": false}}	33	1	2016-04-11 16:44:46.752838+00	1	\N
740	2016-04-10 04:21:50.424858+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 40, "parsing": false}}	28	1	2016-04-11 16:44:47.886358+00	1	\N
755	2016-04-10 04:23:58.963455+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 21, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:46.936207+00	1	\N
478	2016-04-10 04:00:38.496914+00	{"integer_group": {"type": "number", "value": 125, "parsing": false}}	36	1	2016-04-11 16:44:49.520124+00	1	\N
480	2016-04-10 04:00:43.052024+00	{"integer_group": {"type": "number", "value": 127, "parsing": false}}	36	1	2016-04-11 16:44:49.553565+00	1	\N
730	2016-04-10 04:21:23.783042+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 30, "parsing": false}}	28	1	2016-04-11 16:44:49.736812+00	1	\N
468	2016-04-10 04:00:16.092494+00	{"integer_group": {"type": "number", "value": 115, "parsing": false}}	36	1	2016-04-11 16:44:49.770195+00	1	\N
482	2016-04-10 04:00:47.516382+00	{"integer_group": {"type": "number", "value": 129, "parsing": false}}	36	1	2016-04-11 16:44:49.803594+00	1	\N
466	2016-04-10 04:00:11.629037+00	{"integer_group": {"type": "number", "value": 113, "parsing": false}}	36	1	2016-04-11 16:44:49.836819+00	1	\N
484	2016-04-10 04:00:52.018461+00	{"integer_group": {"type": "number", "value": 131, "parsing": false}}	36	1	2016-04-11 16:44:48.47012+00	1	\N
486	2016-04-10 04:00:56.492277+00	{"integer_group": {"type": "number", "value": 133, "parsing": false}}	36	1	2016-04-11 16:44:48.511685+00	1	\N
488	2016-04-10 04:01:01.025537+00	{"integer_group": {"type": "number", "value": 135, "parsing": false}}	36	1	2016-04-11 16:44:48.544944+00	1	\N
374	2016-04-10 03:56:38.550508+00	{"integer_group": {"type": "number", "value": 21, "parsing": false}}	36	1	2016-04-11 16:44:48.578469+00	1	\N
474	2016-04-10 04:00:29.567101+00	{"integer_group": {"type": "number", "value": 121, "parsing": false}}	36	1	2016-04-11 16:44:48.611674+00	1	\N
714	2016-04-10 04:20:41.241443+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 14, "parsing": false}}	28	1	2016-04-11 16:44:48.794984+00	1	\N
470	2016-04-10 04:00:20.581228+00	{"integer_group": {"type": "number", "value": 117, "parsing": false}}	36	1	2016-04-11 16:44:49.870142+00	1	\N
472	2016-04-10 04:00:25.089922+00	{"integer_group": {"type": "number", "value": 119, "parsing": false}}	36	1	2016-04-11 16:44:49.903483+00	1	\N
476	2016-04-10 04:00:34.013228+00	{"integer_group": {"type": "number", "value": 123, "parsing": false}}	36	1	2016-04-11 16:44:49.936869+00	1	\N
123	2016-04-05 06:25:40.164642+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "1", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": "30", "parsing": false}, "xy^3": {"type": "number", "value": "-75", "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}}	33	1	2016-04-11 16:44:50.995384+00	1	\N
143	2016-04-05 20:16:05.552189+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "15", "parsing": false}}	28	1	2016-04-11 16:44:51.178984+00	1	\N
431	2016-04-10 03:58:53.584102+00	{"integer_group": {"type": "number", "value": 78, "parsing": false}}	36	1	2016-04-11 16:44:51.212109+00	1	\N
250	2016-04-10 00:46:25.085775+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "47", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	28	1	2016-04-11 16:44:51.395572+00	1	\N
40	2016-03-22 10:38:55.463617+00	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 17}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}}	5	1	2016-04-11 16:44:51.503839+00	1	\N
621	2016-04-10 04:08:48.434477+00	{"integer_group": {"type": "number", "value": 268, "parsing": false}}	36	1	2016-04-11 16:44:49.970275+00	1	\N
121	2016-04-05 06:24:54.910974+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "0", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}}	33	1	2016-04-11 16:44:50.478788+00	1	\N
12	2016-02-02 00:05:36.312578+00	{"x1": 5}	4	1	2016-04-11 02:56:21.268787+00	1	\N
498	2016-04-10 04:01:23.736107+00	{"integer_group": {"type": "number", "value": 145, "parsing": false}}	36	1	2016-04-11 02:56:21.303043+00	1	\N
125	2016-04-05 06:26:50.118772+00	{"x^4": {"type": "number", "value": "-3", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": "-22", "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "45", "parsing": false}, "y^3": {"type": "number", "value": "-15", "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": "25", "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	33	1	2016-04-11 02:56:21.811647+00	1	\N
499	2016-04-10 04:01:25.981305+00	{"integer_group": {"type": "number", "value": 146, "parsing": false}}	36	1	2016-04-11 02:56:21.844099+00	1	\N
555	2016-04-10 04:05:03.761582+00	{"integer_group": {"type": "number", "value": 202, "parsing": false}}	36	1	2016-04-11 16:21:35.053391+00	1	\N
120	2016-04-05 06:23:49.753846+00	{"x^4": {"type": "number", "value": "4", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "0", "parsing": false}, "x^2y": {"type": "number", "value": "2", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	33	1	2016-04-11 02:56:22.362385+00	1	\N
124	2016-04-05 06:26:33.637942+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": "-22", "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "244", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": "25", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}}	33	1	2016-04-11 02:56:23.378942+00	1	\N
122	2016-04-05 06:25:11.60841+00	{"xy": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	33	1	2016-04-11 02:56:23.962081+00	1	\N
\.


--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_gameinstance_id_seq', 784, true);


--
-- Data for Name: game_gameinstance_seedParams; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY "game_gameinstance_seedParams" (id, gameinstance_id, seedkeyval_id) FROM stdin;
11874	66	41357
11875	66	41358
11876	66	41359
11877	47	41360
11878	47	41361
11879	371	41362
11880	72	41363
11881	64	41364
11882	64	41365
11883	64	41366
11884	75	41367
11885	75	41368
11886	75	41369
11887	38	41370
11888	38	41371
11889	53	41372
11890	53	41373
11891	53	41374
11892	53	41375
11893	74	41376
11894	74	41377
11895	74	41378
11896	65	41379
11897	65	41380
11898	65	41381
11899	54	41382
11900	54	41383
11901	54	41384
11902	54	41385
11903	59	41386
11904	63	41387
11905	63	41388
11906	63	41389
11907	494	41390
11908	668	41391
11909	668	41392
11910	668	41393
11911	668	41394
11912	668	41395
11913	668	41396
11914	668	41397
11915	55	41398
11916	55	41399
11917	55	41400
11918	55	41401
11919	376	41402
11920	49	41403
11921	49	41404
11922	49	41405
11923	52	41406
11924	52	41407
11925	52	41408
11926	365	41409
11927	35	41410
11928	35	41411
11929	35	41412
11930	60	41413
11931	62	41414
11932	48	41415
11933	48	41416
11934	51	41417
11935	51	41418
11936	51	41419
11937	381	41420
11938	115	41421
11939	115	41422
11940	115	41423
11941	115	41424
11942	102	41425
11943	102	41426
11944	102	41427
11945	102	41428
11946	102	41429
11947	102	41430
11948	102	41431
11949	111	41432
11950	111	41433
11951	111	41434
11952	111	41435
11953	111	41436
11954	111	41437
11955	111	41438
11956	101	41439
11957	101	41440
11958	101	41441
11959	101	41442
11960	101	41443
11961	101	41444
11962	101	41445
11963	103	41446
11964	103	41447
11965	103	41448
11966	103	41449
11967	103	41450
11968	103	41451
11969	103	41452
11970	106	41453
11971	106	41454
11972	106	41455
11973	106	41456
11974	106	41457
11975	106	41458
11976	106	41459
11977	105	41460
11978	105	41461
11979	105	41462
11980	105	41463
11981	105	41464
11982	105	41465
11983	105	41466
11984	576	41467
11985	688	41468
11986	688	41469
11987	688	41470
11988	688	41471
11989	688	41472
11990	688	41473
11991	688	41474
11992	113	41475
11993	113	41476
11994	112	41477
11995	112	41478
11996	112	41479
11997	112	41480
11998	112	41481
11999	112	41482
12000	112	41483
12001	366	41484
12002	107	41485
12003	107	41486
12004	107	41487
12005	107	41488
12006	108	41489
12007	108	41490
12008	104	41491
12009	104	41492
12010	104	41493
12011	104	41494
12012	104	41495
12013	104	41496
12014	104	41497
12015	99	41498
12016	99	41499
12017	99	41500
12018	99	41501
12019	99	41502
12020	99	41503
12021	99	41504
12042	675	41525
12043	675	41526
12044	675	41527
12045	675	41528
12046	675	41529
12047	675	41530
12048	675	41531
12049	140	41532
12050	140	41533
12051	140	41534
12052	140	41535
12053	140	41536
12054	140	41537
12055	140	41538
12056	175	41539
12057	175	41540
12058	175	41541
12059	146	41542
12060	146	41543
12061	146	41544
12062	146	41545
12063	146	41546
12064	146	41547
12065	146	41548
12066	176	41549
12067	176	41550
12068	176	41551
12069	377	41552
12070	390	41553
12071	382	41554
12072	406	41555
12073	153	41556
12074	153	41557
12075	153	41558
12076	153	41559
12077	144	41560
12078	144	41561
12079	144	41562
12080	144	41563
12081	144	41564
12082	144	41565
12083	144	41566
12084	410	41567
12085	394	41568
12086	177	41569
12087	177	41570
12088	177	41571
12089	151	41572
12090	151	41573
12091	151	41574
12092	148	41575
12093	148	41576
12094	148	41577
12095	148	41578
12096	148	41579
12097	148	41580
12098	148	41581
12099	701	41582
12100	701	41583
12101	701	41584
12102	701	41585
12103	701	41586
12104	701	41587
12105	701	41588
12106	372	41589
12107	141	41590
12108	141	41591
12109	141	41592
12110	141	41593
12111	141	41594
12112	141	41595
12113	141	41596
12114	398	41597
12115	402	41598
12116	367	41599
12117	386	41600
12118	174	41601
12119	174	41602
12120	174	41603
12121	373	41604
12122	414	41605
12123	395	41606
12124	423	41607
12125	432	41608
12126	399	41609
12127	387	41610
12128	426	41611
12129	435	41612
12130	391	41613
12131	417	41614
12132	255	41615
12133	255	41616
12134	255	41617
12135	255	41618
12136	255	41619
12137	255	41620
12138	255	41621
12139	438	41622
12140	256	41623
12141	256	41624
12142	256	41625
12143	256	41626
12144	256	41627
12145	256	41628
12146	256	41629
12147	429	41630
12148	378	41631
12149	411	41632
12150	407	41633
12151	253	41634
12152	253	41635
12153	253	41636
12154	253	41637
12155	253	41638
12156	253	41639
12157	253	41640
12158	252	41641
12159	252	41642
12160	252	41643
12161	252	41644
12162	252	41645
12163	252	41646
12164	252	41647
12165	420	41648
12166	254	41649
12167	254	41650
12168	254	41651
12169	254	41652
12170	254	41653
12171	254	41654
12172	254	41655
12173	383	41656
12174	403	41657
12175	257	41658
12176	257	41659
12177	257	41660
12178	257	41661
12179	257	41662
12180	257	41663
12181	257	41664
12182	462	41665
12183	436	41666
12184	421	41667
12185	412	41668
12186	400	41669
12187	369	41670
12188	388	41671
12189	442	41672
12190	464	41673
12191	439	41674
12192	408	41675
12193	418	41676
12194	424	41677
12195	396	41678
12196	444	41679
12197	446	41680
12198	415	41681
12199	260	41682
12200	260	41683
12201	260	41684
12202	260	41685
12203	260	41686
12204	260	41687
12205	260	41688
12206	458	41689
12207	448	41690
12208	261	41691
12209	261	41692
12210	261	41693
12211	261	41694
12212	261	41695
12213	261	41696
12214	261	41697
12215	427	41698
12216	392	41699
12217	379	41700
12218	433	41701
12219	384	41702
12220	452	41703
12221	454	41704
12222	460	41705
12223	404	41706
12224	430	41707
12225	441	41708
12226	251	41709
12227	251	41710
12228	251	41711
12229	251	41712
12230	251	41713
12231	251	41714
12232	251	41715
12233	456	41716
12234	450	41717
12235	455	41718
12236	457	41719
12237	459	41720
12238	461	41721
12239	463	41722
12240	465	41723
12241	467	41724
12242	469	41725
12243	471	41726
12244	473	41727
12245	475	41728
12246	477	41729
12247	479	41730
12248	481	41731
12249	483	41732
12250	485	41733
12251	489	41734
12252	490	41735
12253	491	41736
12254	355	41737
12255	449	41738
12256	356	41739
12257	357	41740
12258	358	41741
12259	359	41742
12260	360	41743
12261	361	41744
12262	362	41745
12263	363	41746
12264	364	41747
12265	492	41748
12266	493	41749
12267	495	41750
12268	496	41751
12269	375	41752
12270	380	41753
12271	385	41754
12272	389	41755
12273	393	41756
12274	397	41757
12275	401	41758
12276	405	41759
12277	413	41760
12278	416	41761
12279	419	41762
12280	422	41763
12281	425	41764
12282	428	41765
12283	434	41766
12284	437	41767
12285	440	41768
12286	443	41769
12287	445	41770
12288	354	41771
12289	447	41772
12290	451	41773
12291	453	41774
12292	522	41775
12293	523	41776
12294	524	41777
12295	525	41778
12296	526	41779
12297	527	41780
12298	528	41781
12299	529	41782
12300	530	41783
12301	531	41784
12302	532	41785
12303	533	41786
12304	534	41787
12305	535	41788
12306	536	41789
12307	537	41790
12308	538	41791
12309	539	41792
12310	540	41793
12311	541	41794
12312	543	41795
12313	544	41796
12314	545	41797
12315	546	41798
12316	547	41799
12317	548	41800
12318	549	41801
12319	550	41802
12320	551	41803
12321	552	41804
12322	553	41805
12323	554	41806
12324	556	41807
12325	557	41808
12326	500	41809
12327	501	41810
12328	502	41811
12329	503	41812
12330	505	41813
12331	504	41814
12332	507	41815
12333	506	41816
12334	508	41817
12335	510	41818
12336	511	41819
12337	512	41820
12338	513	41821
12339	514	41822
12340	515	41823
12341	516	41824
12342	517	41825
12343	518	41826
12344	519	41827
12345	520	41828
12346	521	41829
12347	583	41830
12348	584	41831
12349	585	41832
12350	586	41833
12351	587	41834
12352	589	41835
12353	590	41836
12354	591	41837
12355	559	41838
12356	593	41839
12357	594	41840
12358	595	41841
12359	596	41842
12360	597	41843
12361	598	41844
12362	599	41845
12363	600	41846
12364	601	41847
12365	602	41848
12366	603	41849
12367	604	41850
12368	605	41851
12369	606	41852
12370	607	41853
12371	608	41854
12372	609	41855
12373	610	41856
12374	611	41857
12375	612	41858
12376	613	41859
12377	614	41860
12378	615	41861
12379	616	41862
12380	617	41863
12381	618	41864
12382	560	41865
12383	561	41866
12384	592	41867
12385	562	41868
12386	563	41869
12387	564	41870
12388	565	41871
12389	566	41872
12390	568	41873
12391	567	41874
12392	569	41875
12393	570	41876
12394	571	41877
12395	572	41878
12396	573	41879
12397	574	41880
12398	575	41881
12399	577	41882
12400	578	41883
12401	579	41884
12402	580	41885
12403	581	41886
12404	582	41887
12405	624	41888
12406	627	41889
12407	619	41890
12408	629	41891
12409	631	41892
12410	638	41893
12411	633	41894
12412	630	41895
12413	635	41896
12414	632	41897
12415	634	41898
12416	623	41899
12417	642	41900
12418	636	41901
12419	637	41902
12420	643	41903
12421	639	41904
12422	641	41905
12423	644	41906
12424	645	41907
12425	646	41908
12426	640	41909
12427	647	41910
12428	648	41911
12429	649	41912
12430	654	41913
12431	650	41914
12432	651	41915
12433	652	41916
12434	653	41917
12435	655	41918
12436	656	41919
12437	658	41920
12438	659	41921
12439	660	41922
12441	661	41924
12442	662	41925
12443	663	41926
12444	664	41927
12445	669	41928
12446	669	41929
12447	669	41930
12448	669	41931
12449	669	41932
12450	669	41933
12451	669	41934
12452	620	41935
12453	625	41936
12454	622	41937
12455	626	41938
12456	628	41939
12457	676	41940
12458	676	41941
12459	676	41942
12460	676	41943
12461	676	41944
12462	676	41945
12463	676	41946
12464	672	41947
12465	672	41948
12466	672	41949
12467	672	41950
12468	672	41951
12469	672	41952
12470	672	41953
12471	678	41954
12472	678	41955
12473	678	41956
12474	678	41957
12475	678	41958
12476	678	41959
12477	678	41960
12478	680	41961
12479	680	41962
12480	680	41963
12481	680	41964
12482	680	41965
12483	680	41966
12484	680	41967
12485	679	41968
12486	679	41969
12487	679	41970
12488	679	41971
12489	679	41972
12490	679	41973
12491	679	41974
12492	681	41975
12493	681	41976
12494	681	41977
12495	681	41978
12496	681	41979
12497	681	41980
12498	681	41981
12499	682	41982
12500	682	41983
12501	682	41984
12502	682	41985
12503	682	41986
12504	682	41987
12505	682	41988
12506	683	41989
12507	683	41990
12508	683	41991
12509	683	41992
12510	683	41993
12511	683	41994
12512	683	41995
12513	671	41996
12514	671	41997
12515	671	41998
12516	671	41999
12517	671	42000
12518	671	42001
12519	671	42002
12520	673	42003
12521	673	42004
12522	673	42005
12523	673	42006
12524	673	42007
12525	673	42008
12526	673	42009
12527	674	42010
12528	674	42011
12529	674	42012
12530	674	42013
12531	674	42014
12532	674	42015
12533	674	42016
12534	677	42017
12535	677	42018
12536	677	42019
12537	677	42020
12538	677	42021
12539	677	42022
12540	677	42023
12541	690	42024
12542	690	42025
12543	690	42026
12544	690	42027
12545	690	42028
12546	690	42029
12547	690	42030
12548	691	42031
12549	691	42032
12550	691	42033
12551	691	42034
12552	691	42035
12553	691	42036
12554	691	42037
12555	692	42038
12556	692	42039
12557	692	42040
12558	692	42041
12559	692	42042
12560	692	42043
12561	692	42044
12562	694	42045
12563	694	42046
12564	694	42047
12565	694	42048
12566	694	42049
12567	694	42050
12568	694	42051
12569	693	42052
12570	693	42053
12571	693	42054
12572	693	42055
12573	693	42056
12574	693	42057
12575	693	42058
12576	696	42059
12577	696	42060
12578	696	42061
12579	696	42062
12580	696	42063
12581	696	42064
12582	696	42065
12583	695	42066
12584	695	42067
12585	695	42068
12586	695	42069
12587	695	42070
12588	695	42071
12589	695	42072
12590	685	42073
12591	685	42074
12592	685	42075
12593	685	42076
12594	685	42077
12595	685	42078
12596	685	42079
12597	697	42080
12598	697	42081
12599	697	42082
12600	697	42083
12601	697	42084
12602	697	42085
12603	697	42086
12604	686	42087
12605	686	42088
12606	686	42089
12607	686	42090
12608	686	42091
12609	686	42092
12610	686	42093
12611	687	42094
12612	687	42095
12613	687	42096
12614	687	42097
12615	687	42098
12616	687	42099
12617	687	42100
12618	689	42101
12619	689	42102
12620	689	42103
12621	689	42104
12622	689	42105
12623	689	42106
12624	689	42107
12625	702	42108
12626	702	42109
12627	702	42110
12628	702	42111
12629	702	42112
12630	702	42113
12631	702	42114
12632	704	42115
12633	704	42116
12634	704	42117
12635	704	42118
12636	704	42119
12637	704	42120
12638	704	42121
12639	705	42122
12640	705	42123
12641	705	42124
12642	705	42125
12643	705	42126
12644	705	42127
12645	705	42128
12646	707	42129
12647	707	42130
12648	707	42131
12649	707	42132
12650	707	42133
12651	707	42134
12652	707	42135
12653	706	42136
12654	706	42137
12655	706	42138
12656	706	42139
12657	706	42140
12658	706	42141
12659	706	42142
12660	708	42143
12661	708	42144
12662	708	42145
12663	708	42146
12664	708	42147
12665	708	42148
12666	708	42149
12667	710	42150
12668	710	42151
12669	710	42152
12670	710	42153
12671	710	42154
12672	710	42155
12673	710	42156
12674	711	42157
12675	711	42158
12676	711	42159
12677	711	42160
12678	711	42161
12679	711	42162
12680	711	42163
12681	698	42164
12682	698	42165
12683	698	42166
12684	698	42167
12685	698	42168
12686	698	42169
12687	698	42170
12688	700	42171
12689	700	42172
12690	700	42173
12691	700	42174
12692	700	42175
12693	700	42176
12694	700	42177
12695	699	42178
12696	699	42179
12697	699	42180
12698	699	42181
12699	699	42182
12700	699	42183
12701	699	42184
12702	703	42185
12703	703	42186
12704	703	42187
12705	703	42188
12706	703	42189
12707	703	42190
12708	703	42191
12709	715	42192
12710	715	42193
12711	715	42194
12712	715	42195
12713	715	42196
12714	715	42197
12715	715	42198
12716	717	42199
12717	717	42200
12718	717	42201
12719	717	42202
12720	717	42203
12721	717	42204
12722	717	42205
12723	720	42206
12724	720	42207
12725	720	42208
12726	720	42209
12727	720	42210
12728	720	42211
12729	720	42212
12730	719	42213
12731	719	42214
12732	719	42215
12733	719	42216
12734	719	42217
12735	719	42218
12736	719	42219
12737	722	42220
12738	722	42221
12739	722	42222
12740	722	42223
12741	722	42224
12742	722	42225
12743	722	42226
12744	721	42227
12745	721	42228
12746	721	42229
12747	721	42230
12748	721	42231
12749	721	42232
12750	721	42233
12751	724	42234
12752	724	42235
12753	724	42236
12754	724	42237
12755	724	42238
12756	724	42239
12757	724	42240
12758	723	42241
12759	723	42242
12760	723	42243
12761	723	42244
12762	723	42245
12763	723	42246
12764	723	42247
12765	713	42248
12766	713	42249
12767	713	42250
12768	713	42251
12769	713	42252
12770	713	42253
12771	713	42254
12772	725	42255
12773	725	42256
12774	725	42257
12775	725	42258
12776	725	42259
12777	725	42260
12778	725	42261
12779	716	42262
12780	716	42263
12781	716	42264
12782	716	42265
12783	716	42266
12784	716	42267
12785	716	42268
12786	718	42269
12787	718	42270
12788	718	42271
12789	718	42272
12790	718	42273
12791	718	42274
12792	718	42275
12793	731	42276
12794	731	42277
12795	731	42278
12796	731	42279
12797	731	42280
12798	731	42281
12799	731	42282
12800	733	42283
12801	733	42284
12802	733	42285
12803	733	42286
12804	733	42287
12805	733	42288
12806	733	42289
12807	732	42290
12808	732	42291
12809	732	42292
12810	732	42293
12811	732	42294
12812	732	42295
12813	732	42296
12814	728	42297
12815	728	42298
12816	728	42299
12817	728	42300
12818	728	42301
12819	728	42302
12820	728	42303
12821	736	42304
12822	736	42305
12823	736	42306
12824	736	42307
12825	736	42308
12826	736	42309
12827	736	42310
12828	735	42311
12829	735	42312
12830	735	42313
12831	735	42314
12832	735	42315
12833	735	42316
12834	735	42317
12835	734	42318
12836	734	42319
12837	734	42320
12838	734	42321
12839	734	42322
12840	734	42323
12841	734	42324
12842	738	42325
12843	738	42326
12844	738	42327
12845	738	42328
12846	738	42329
12847	738	42330
12848	738	42331
12849	739	42332
12850	739	42333
12851	739	42334
12852	739	42335
12853	739	42336
12854	739	42337
12855	739	42338
12856	727	42339
12857	727	42340
12858	727	42341
12859	727	42342
12860	727	42343
12861	727	42344
12862	727	42345
12863	737	42346
12864	737	42347
12865	737	42348
12866	737	42349
12867	737	42350
12868	737	42351
12869	737	42352
12870	729	42353
12871	729	42354
12872	729	42355
12873	729	42356
12874	729	42357
12875	729	42358
12876	729	42359
12877	753	42360
12878	753	42361
12879	753	42362
12880	753	42363
12881	753	42364
12882	753	42365
12883	753	42366
12884	749	42367
12885	749	42368
12886	749	42369
12887	749	42370
12888	749	42371
12889	749	42372
12890	749	42373
12891	750	42374
12892	750	42375
12893	750	42376
12894	750	42377
12895	750	42378
12896	750	42379
12897	750	42380
12898	752	42381
12899	752	42382
12900	752	42383
12901	752	42384
12902	752	42385
12903	752	42386
12904	752	42387
12905	751	42388
12906	751	42389
12907	751	42390
12908	751	42391
12909	751	42392
12910	751	42393
12911	751	42394
12912	754	42395
12913	754	42396
12914	754	42397
12915	754	42398
12916	754	42399
12917	754	42400
12918	754	42401
12919	741	42402
12920	741	42403
12921	741	42404
12922	741	42405
12923	741	42406
12924	741	42407
12925	741	42408
12926	744	42409
12927	744	42410
12928	744	42411
12929	744	42412
12930	744	42413
12931	744	42414
12932	744	42415
12933	742	42416
12934	742	42417
12935	742	42418
12936	742	42419
12937	742	42420
12938	742	42421
12939	742	42422
12940	745	42423
12941	745	42424
12942	745	42425
12943	745	42426
12944	745	42427
12945	745	42428
12946	745	42429
12947	746	42430
12948	746	42431
12949	746	42432
12950	746	42433
12951	746	42434
12952	746	42435
12953	746	42436
12954	747	42437
12955	747	42438
12956	747	42439
12957	747	42440
12958	747	42441
12959	747	42442
12960	747	42443
12961	748	42444
12962	748	42445
12963	748	42446
12964	748	42447
12965	748	42448
12966	748	42449
12967	748	42450
12968	712	42451
12969	712	42452
12970	712	42453
12971	712	42454
12972	712	42455
12973	712	42456
12974	712	42457
12975	726	42458
12976	726	42459
12977	726	42460
12978	726	42461
12979	726	42462
12980	726	42463
12981	726	42464
12982	756	42465
12983	756	42466
12984	756	42467
12985	756	42468
12986	756	42469
12987	756	42470
12988	756	42471
12989	757	42472
12990	757	42473
12991	757	42474
12992	757	42475
12993	757	42476
12994	757	42477
12995	757	42478
12996	758	42479
12997	758	42480
12998	758	42481
12999	758	42482
13000	758	42483
13001	758	42484
13002	758	42485
13003	759	42486
13004	759	42487
13005	759	42488
13006	759	42489
13007	759	42490
13008	759	42491
13009	759	42492
13010	760	42493
13011	760	42494
13012	760	42495
13013	760	42496
13014	760	42497
13015	760	42498
13016	760	42499
13017	761	42500
13018	761	42501
13019	761	42502
13020	761	42503
13021	761	42504
13022	761	42505
13023	761	42506
13024	762	42507
13025	762	42508
13026	762	42509
13027	762	42510
13028	762	42511
13029	762	42512
13030	762	42513
13051	116	42534
13052	116	42535
13053	116	42536
13054	116	42537
13055	116	42538
13056	116	42539
13057	116	42540
13058	116	42541
13059	116	42542
13060	116	42543
13061	116	42544
13062	116	42545
13063	116	42546
13064	116	42547
13065	116	42548
13066	116	42549
13067	116	42550
13068	116	42551
13069	116	42552
13070	116	42553
13071	769	42554
13072	769	42555
13073	773	42556
13074	773	42557
13075	774	42558
13076	774	42559
13077	771	42560
13078	771	42561
13079	259	42562
13080	259	42563
13081	259	42564
13082	259	42565
13083	259	42566
13084	259	42567
13085	259	42568
13086	98	42569
13087	98	42570
13088	98	42571
13089	98	42572
13090	98	42573
13091	98	42574
13092	98	42575
13093	770	42576
13094	770	42577
13095	775	42578
13096	775	42579
13097	772	42580
13098	772	42581
13099	767	42582
13100	767	42583
13101	776	42584
13102	776	42585
13103	777	42586
13104	777	42587
13105	139	42588
13106	778	42589
13107	778	42590
13108	768	42591
13109	768	42592
13110	142	42593
13111	142	42594
13112	142	42595
13113	142	42596
13114	142	42597
13115	142	42598
13116	142	42599
13117	509	42600
13118	497	42601
13119	368	42602
13120	670	42603
13121	670	42604
13122	670	42605
13123	670	42606
13124	670	42607
13125	670	42608
13126	670	42609
13127	249	42610
13128	249	42611
13129	249	42612
13130	249	42613
13131	249	42614
8933	555	38416
13132	249	42615
13133	249	42616
13134	542	42617
13135	558	42618
13136	588	42619
13137	657	42620
13138	684	42621
13139	684	42622
13140	684	42623
13141	684	42624
13142	684	42625
13143	684	42626
13144	684	42627
13145	258	42628
13146	258	42629
13147	258	42630
13148	258	42631
13149	258	42632
13150	258	42633
13151	258	42634
13152	370	42635
13153	409	42636
13154	487	42637
13155	119	42638
13156	119	42639
13157	119	42640
13158	119	42641
13159	119	42642
13160	119	42643
13161	119	42644
13162	119	42645
13163	119	42646
13164	119	42647
13165	119	42648
13166	119	42649
13167	119	42650
13168	119	42651
13169	119	42652
13170	119	42653
13171	119	42654
13172	119	42655
13173	119	42656
13174	119	42657
13175	755	42658
13176	755	42659
13177	755	42660
13178	755	42661
13179	755	42662
13180	755	42663
13181	755	42664
13182	117	42665
13183	117	42666
13184	117	42667
13185	117	42668
13186	117	42669
13187	117	42670
13188	117	42671
13189	117	42672
13190	117	42673
13191	117	42674
13192	117	42675
13193	117	42676
13194	117	42677
13195	117	42678
13196	117	42679
13197	117	42680
13198	117	42681
13199	117	42682
13200	117	42683
13201	117	42684
13202	667	42685
13203	667	42686
13204	667	42687
13205	667	42688
13206	667	42689
13207	667	42690
13208	667	42691
13209	740	42692
13210	740	42693
13211	740	42694
13212	740	42695
13213	740	42696
13214	740	42697
13215	740	42698
13237	484	42720
13238	486	42721
13239	488	42722
13240	374	42723
13241	474	42724
13242	714	42725
13243	714	42726
13244	714	42727
13245	714	42728
13246	714	42729
13247	714	42730
13248	714	42731
13269	478	42752
13270	480	42753
13271	730	42754
13272	730	42755
13273	730	42756
13274	730	42757
13275	730	42758
13276	730	42759
13277	730	42760
13278	468	42761
13279	482	42762
13280	466	42763
13281	470	42764
13282	472	42765
13283	476	42766
13284	621	42767
13285	121	42768
13286	121	42769
13287	121	42770
13288	121	42771
13289	121	42772
13290	121	42773
13291	121	42774
13292	121	42775
13293	121	42776
13294	121	42777
13295	121	42778
13296	121	42779
13297	121	42780
13298	121	42781
13299	121	42782
13300	121	42783
13301	121	42784
13302	121	42785
13303	121	42786
13304	121	42787
13305	123	42788
13306	123	42789
13307	123	42790
13308	123	42791
13309	123	42792
13310	123	42793
13311	123	42794
13312	123	42795
13313	123	42796
13314	123	42797
13315	123	42798
13316	123	42799
13317	123	42800
13318	123	42801
13319	123	42802
13320	123	42803
13321	123	42804
13322	123	42805
13323	123	42806
13324	123	42807
13325	143	42808
13326	143	42809
13327	143	42810
13328	143	42811
13329	143	42812
13330	143	42813
13331	143	42814
13332	431	42815
13333	250	42816
13334	250	42817
13335	250	42818
13336	250	42819
13337	250	42820
13338	250	42821
13339	250	42822
13340	40	42823
13341	40	42824
13342	40	42825
13343	40	42826
\.


--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('"game_gameinstance_seedParams_id_seq"', 13366, true);


--
-- Data for Name: game_gameinstancesnapshot; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_gameinstancesnapshot (id, image, "time", instance_id, created, updated) FROM stdin;
17	./fbd09b58694a58022e0938fa5ed7b19b18462f79f8a17922750b8940.png	8.27299999999999969	12	2016-02-02 01:53:27.823736+00	2016-02-18 14:34:28.447981+00
18	./1c25cae8be78cda9a5af09232f30867d66707c2b07408682668a4a88.png	7.87199999999999989	12	2016-02-02 01:53:39.524886+00	2016-02-18 14:34:28.447981+00
19	./5c4878aa13fc26ef0960a8d62de0a1c083d592eb83c647b682aecdd0.png	8.36500000000000021	12	2016-02-02 01:53:51.943088+00	2016-02-18 14:34:28.447981+00
20	./ca4ca066f299db769661abb572ea9fbf40e837041b800b0397b95ae3.png	7.77200000000000024	12	2016-02-02 01:54:20.659956+00	2016-02-18 14:34:28.447981+00
21	./c35d043fe308cd604a1fe48638129102855689e57ec8bad3bdf59353.png	9.23000000000000043	12	2016-02-02 01:54:45.088959+00	2016-02-18 14:34:28.447981+00
162	./f507a788241a570e47836bb3bce9b5c492e8b69bc294a46bdcbd8725.png	3.77099999999999991	111	2016-04-04 19:45:17.621612+00	2016-04-04 19:45:17.754549+00
164	./e27e480bd262d4011fec1ce3a64048425ea703169f21a820bfb46481.png	5	113	2016-04-04 19:46:48.593254+00	2016-04-04 19:46:48.694719+00
166	./ac026cc50d9a9f7465ec97b0d434cd2c1604763eefe1ef212cc07a50.png	5.00600000000000023	116	2016-04-05 06:17:13.446364+00	2016-04-05 06:17:13.53508+00
168	./2777fff73275babaa00703f4798c796d561e6b27a87cab380a708413.png	5.01499999999999968	116	2016-04-05 06:18:50.438731+00	2016-04-05 06:18:50.514071+00
31	./d13a0e43e3514bb08092dd982500b6ad88c116aea23ed57b234966db.png	10.1669999999999998	12	2016-02-03 03:43:46.877535+00	2016-02-18 14:34:28.447981+00
46	./a53d2c1a96a63bca715d9a6c76784ce5b0bf1132d00d597767544ade.png	38.7890000000000015	17	2016-02-04 08:19:41.305824+00	2016-02-18 14:34:28.447981+00
47	./adba4107e6649f0071bc628d9ba16aa9ce27647637559b766a71d52b.png	46.588000000000001	17	2016-02-04 08:19:48.91899+00	2016-02-18 14:34:28.447981+00
170	./69355cacd793509d988cb4c1d6c4c1c5cc8fa6185515a8342585a7dc.png	7.08499999999999996	120	2016-04-05 06:23:57.190894+00	2016-04-05 06:23:57.293617+00
48	./38baa787b89c5e212f4086bcf49b7fda946d028f53875080209aa2be.png	54.8689999999999998	17	2016-02-04 08:19:57.170569+00	2016-02-18 14:34:28.447981+00
49	./a382994e2b7d3fbd75ac28307dace144370cfecb9de6069ff0a3787d.png	64.3190000000000026	17	2016-02-04 08:20:06.344033+00	2016-02-18 14:34:28.447981+00
42	./72e16451f6c5fa040e33b3eca0b7af2dec0a6fd3727910c906282a2f.png	17.3640000000000008	17	2016-02-04 08:19:19.547904+00	2016-02-18 14:34:28.447981+00
43	./800e5190edf2567b777b0519e3b889c26df434bb346d7f2ec003896f.png	21.6260000000000012	17	2016-02-04 08:19:23.73775+00	2016-02-18 14:34:28.447981+00
44	./e2e1504d9d21725c49d35d3abbcb67f9e999d45a197460cc18b5adef.png	26.3859999999999992	17	2016-02-04 08:19:28.424514+00	2016-02-18 14:34:28.447981+00
45	./a622ff97f68234b2c0fa453312a32aea7e39b2ea92e40e00c801edf6.png	30.5249999999999986	17	2016-02-04 08:19:32.645332+00	2016-02-18 14:34:28.447981+00
172	./692c0364b01dbb1ddb0ea95b6d5f86517b782f28fb81811b16d3f8aa.png	6.01999999999999957	122	2016-04-05 06:25:18.005728+00	2016-04-05 06:25:18.091032+00
174	./4662b6859ce777bd9a9f6c5d57604a06da5124d4ee5aa9351c753027.png	5.62600000000000033	125	2016-04-05 06:26:56.163163+00	2016-04-05 06:26:56.254454+00
56	./a11bc7f6b7a3a65948ffd2d59d29fb5e036933fe5d31854c5e27f259.png	12.0020000000000007	12	2016-03-07 03:29:21.366168+00	2016-03-07 03:29:21.580142+00
57	./6eebbbcb172fe83d9c279a002ec60a08a93a22cee8a4c111a6caa9fd.png	11.0009999999999994	12	2016-03-07 03:30:00.850774+00	2016-03-07 03:30:01.023757+00
176	./08890f81fe6738c33818a208df122b18a357a6d62db7c29276b311b4.png	1.00099999999999989	139	2016-04-05 07:19:40.179918+00	2016-04-05 07:19:40.263903+00
64	./733113529144eb60117e5bfc58a69ec8021d281ce30eb4b7fbcd2655.png	9.00099999999999945	12	2016-03-08 10:11:57.185799+00	2016-03-08 10:11:57.400074+00
178	./599eac0818e8898768a4f363668e15c03ac8ce19988d0eaad290714f.png	2.01100000000000012	141	2016-04-05 09:55:36.280014+00	2016-04-05 09:55:36.382568+00
71	./f7d9d89cbd1a6e8c8d46caccc8911113095cfad28b861ab5d81eff35.png	32.0009999999999977	38	2016-03-22 10:31:29.652388+00	2016-03-22 10:31:29.842623+00
179	./9baf3907e2c08b182e4fac48a30e8fbdd24202938f15e3e47f40463d.png	17.0010000000000012	143	2016-04-05 20:16:26.780957+00	2016-04-05 20:16:27.004633+00
73	./5c04ec4dd00f11e59326f5ea5cbecbb7b6a8c7c2b60f99b41a6b634a.png	1.00099999999999989	35	2016-03-22 22:30:07.572615+00	2016-03-22 22:30:07.788304+00
91	./356a89f5f45103baa0be04e20b15ec20c95fc54f9d51f1214c650aa1.png	6.01499999999999968	55	2016-03-23 09:20:13.402091+00	2016-03-23 09:20:13.50539+00
75	./38c9ad20897e974df475c80e6619c91d2ca579ac7acb98f8a2922f56.png	7.13699999999999957	38	2016-03-23 08:38:07.763284+00	2016-03-23 08:38:07.954763+00
76	./5bc44c450e438fcb24ccd6dcb660675e6633377357e2f79ba5460ec0.png	13.1920000000000002	38	2016-03-23 08:41:05.460867+00	2016-03-23 08:41:05.57837+00
77	./a32af9bab87dcdeacf1bb4b57c6eeb7cd58b562d7ff3bf82f3a59e35.png	18.0010000000000012	38	2016-03-23 08:42:37.665025+00	2016-03-23 08:42:37.771009+00
78	./170f63c09e37cb421972fdcccf5caac6cdfb16317ed6655c1159fa2e.png	15.0009999999999994	38	2016-03-23 08:47:51.667393+00	2016-03-23 08:47:51.788005+00
79	./013eec234d2f0a30c8f8a73380329000e8fe8d984466a63479eef98d.png	7.00100000000000033	47	2016-03-23 08:54:57.165765+00	2016-03-23 08:54:57.266713+00
80	./2811742fb740af0e33fd4d0bb2e4710ea42e921a0c6de4f84ead7121.png	4.21499999999999986	47	2016-03-23 08:55:21.931314+00	2016-03-23 08:55:22.027324+00
81	./65bc664e6651447115ad6af274d785a34652c6582645a9a47dda0229.png	11.2149999999999999	47	2016-03-23 08:55:29.391165+00	2016-03-23 08:55:29.489457+00
82	./71d293da1091fc6b66fd9b44768f611e66e00ca0b0580594b1bb7e3a.png	3.00099999999999989	48	2016-03-23 08:56:24.609615+00	2016-03-23 08:56:24.701151+00
397	./8143d5456c99468d55fe3189ed7409fb52cb369778a1724760033a6d.png	8.3490000000000002	388	2016-04-10 03:57:18.555947+00	2016-04-10 03:57:18.626784+00
84	./9a1cd9e126c4072bee2e9369f819c43241a7bc0a02d100da01a1f72d.png	1	49	2016-03-23 09:01:18.492854+00	2016-03-23 09:01:18.575471+00
85	./eb1ba9c8afeef6aa422dc65e009865062f46ac77d8d116842968f608.png	1.00099999999999989	35	2016-03-23 09:03:53.075697+00	2016-03-23 09:03:53.16381+00
86	./39a515ee511cf0757e6ba96297c35885d4cd9d4cc44e8e1c91760fbf.png	4.6639999999999997	51	2016-03-23 09:10:34.474798+00	2016-03-23 09:10:34.552577+00
87	./7050c5d47e3c478c98b17919e3b831190b9c893b38d0b235bcf78f6f.png	1.00099999999999989	52	2016-03-23 09:11:32.345485+00	2016-03-23 09:11:32.430195+00
88	./7e7098dd4d23d6c3a7f34b48e19e2c5cf9d8f606c89315e564993876.png	5.92799999999999994	53	2016-03-23 09:13:05.825769+00	2016-03-23 09:13:05.957249+00
89	./15a7dbad6a2c3b8fac57658bd0deaf7b7cf87686e83eee6b382a589f.png	2	40	2016-03-23 09:13:31.511683+00	2016-03-23 09:13:31.621841+00
90	./e0d7060918c86b39b9c0e358331202d226a92a9126c2dafa1c4967cd.png	6.00199999999999978	54	2016-03-23 09:18:58.231168+00	2016-03-23 09:18:58.334448+00
181	./9bd155a365cb701ade538f53348a6eccc244a0bb9edafe12372902d9.png	2.00999999999999979	142	2016-04-05 20:18:06.773395+00	2016-04-05 20:18:06.880502+00
402	./25d70ffe56511fd16c68ba4c776cf450d98253fd7b6f3f91a7973d35.png	0.517000000000000015	393	2016-04-10 03:57:29.803503+00	2016-04-10 03:57:29.883943+00
98	./a3176019ed2349da8c354e855d3bfdb7b7f2b80ff9a41e9e9153b098.png	5.00100000000000033	59	2016-03-23 10:37:48.150195+00	2016-03-23 10:37:48.263862+00
99	./6cde2650f002ea1e7374f7e6fe8240589b7f87f341dfe7fab26b3380.png	4	59	2016-03-23 10:39:19.437482+00	2016-03-23 10:39:19.537511+00
100	./503e036fb87e29a7b69dc4db59c19135ff250ded96d223bd042e60b7.png	5.08000000000000007	60	2016-03-23 10:39:35.325154+00	2016-03-23 10:39:35.421255+00
101	./03168ea82ae9980edcf66c4b7a115916d561b70a92edbd2d9f447a48.png	5.00100000000000033	62	2016-03-23 10:40:17.597021+00	2016-03-23 10:40:17.697317+00
102	./59af4ae617c0cc0ac85f0dfe58c7a8cad84beb171e6de57069be14a5.png	3.09600000000000009	62	2016-03-23 10:40:27.662341+00	2016-03-23 10:40:27.750144+00
103	./62f7c1d66306b8250b02f842ff3716c34e18ea2306122062c01a768c.png	3.00099999999999989	63	2016-03-23 21:08:04.513598+00	2016-03-23 21:08:04.689856+00
104	./f7695b1f3140ee28f6b0dadc2a65fefc39abd3090d19663113e317da.png	4.18100000000000005	64	2016-03-23 21:08:14.395363+00	2016-03-23 21:08:14.484944+00
105	./22e38b5b014893d1e350e5c2c2033d87c6ccbb96faae3bdce202971a.png	4.78599999999999959	65	2016-03-23 22:39:06.560261+00	2016-03-23 22:39:06.65126+00
106	./184965694869847cfba7b13ef34a9a100173593fe7f5a3ad5e519081.png	4.59100000000000019	66	2016-03-24 00:03:32.477551+00	2016-03-24 00:03:32.596312+00
107	./a4f178fdd843d1651c115fb86a85efe95b15a675b19acae3afbb9eaa.png	5.00100000000000033	59	2016-03-24 01:24:50.633842+00	2016-03-24 01:24:50.743649+00
108	./95a7c907b36587b89f0c33eaa7453ea97cf58452edfcf5c4a0c52e92.png	5.00100000000000033	60	2016-03-24 02:18:30.396202+00	2016-03-24 02:18:30.514024+00
109	./7c581443c7f080bf38f5f41d128bbd6fd70ed6d740b6b37a3e5ec989.png	3.80500000000000016	72	2016-03-24 10:35:01.674611+00	2016-03-24 10:35:01.853109+00
110	./21531c084f00b134552472ee86cd6d53d0971278cda0bf8d7b5a44ee.png	2.30399999999999983	74	2016-03-24 10:36:03.798869+00	2016-03-24 10:36:03.893479+00
111	./a98b57d617270f4c2aebcc41030e4bf9ffff7af7e93305e42ac8da0d.png	5	75	2016-03-24 10:37:05.026527+00	2016-03-24 10:37:05.144262+00
163	./d42011678ce84763d8687da6ecd99f42336ff89376e09cb1aabca595.png	1.53400000000000003	112	2016-04-04 19:45:41.067514+00	2016-04-04 19:45:41.180074+00
119	./09b9320436aae199ffc211dec537748f789660b6d95df69e08bd938e.png	6.00100000000000033	75	2016-03-25 09:28:54.34815+00	2016-03-25 09:28:54.433839+00
120	./90bde5551ba89ecf5189b5a6250468c46b61b066a70d00f53f49f7c5.png	4.00100000000000033	59	2016-03-25 09:29:15.385095+00	2016-03-25 09:29:15.486352+00
121	./616af48946eabbfa139de188202dfff077a200cbb33c52c836496733.png	3.00099999999999989	59	2016-03-25 09:29:21.991803+00	2016-03-25 09:29:22.090704+00
165	./b6021147850d89ed51b20cd7aa4b882057dfc0191824765a80a2d091.png	5.35899999999999999	115	2016-04-04 19:48:33.434862+00	2016-04-04 19:48:33.522845+00
167	./632ed97d6d0e14474d6421e3a61ca47728b34aedab2f5b22eab93c9a.png	5.29199999999999982	117	2016-04-05 06:17:56.115593+00	2016-04-05 06:17:56.214469+00
169	./5f0950dfa434a3cc9d2a645c09184162bb6be6f62680bdd9c59aaf93.png	5.02200000000000024	119	2016-04-05 06:23:23.795209+00	2016-04-05 06:23:23.887745+00
150	./ee244930b0747f2e399e7d78a848d3b93ed22ee996976a780e14da9a.png	2.00099999999999989	98	2016-04-04 07:40:41.914774+00	2016-04-04 07:40:42.030726+00
171	./00318db2c3fabfe74cbbc6f48598ccc2100bcdfb9dd5cd2943e52f28.png	6.14599999999999991	121	2016-04-05 06:25:01.381218+00	2016-04-05 06:25:01.467765+00
173	./df122f38171d8b6d77f23aa23dd1519b8bdfc72ac428f85f876d9dfd.png	6.02799999999999958	123	2016-04-05 06:25:46.615481+00	2016-04-05 06:25:46.705852+00
129	./93b160eecf8d21d3f385f86b8bda536238a1a39ee3ec0ce8529f4b9d.png	17.0010000000000012	93	2016-03-26 21:10:24.790784+00	2016-03-26 21:10:25.012153+00
130	./5c41b3b213a6c71db87b740f0afe3822bce4dc835d96f7884d900d9d.png	25.0180000000000007	93	2016-03-26 21:10:32.717577+00	2016-03-26 21:10:32.828856+00
131	./cea103df9ca600b64bbeef2c4e4d8949e1235cb0e4a6e3d2a9794fce.png	31.0019999999999989	93	2016-03-26 21:10:38.741438+00	2016-03-26 21:10:38.859759+00
132	./c51d276a43157c53d52db5ce548df9f61baa6a7560a2c0d356a8c49e.png	51.0290000000000035	93	2016-03-26 21:10:58.769715+00	2016-03-26 21:10:58.892802+00
133	./0c0f7745b018bcf7afc6f74b168594dd67acd4dc80e54aedc58291cb.png	165.001000000000005	93	2016-03-26 21:12:52.716001+00	2016-03-26 21:12:52.843143+00
134	./5a26a4d1eee39bfce829ff23e292f09472d61064a92e84fe05caef57.png	180.031000000000006	93	2016-03-26 21:13:07.467683+00	2016-03-26 21:13:07.597844+00
135	./c11fbd6299822412211cd598bf60a23d50f99fd905481a825591e900.png	3	72	2016-03-26 22:10:02.399094+00	2016-03-26 22:10:02.518737+00
175	./802fe70459e7cbdf849a5fc9e95df09ee80ca31b01c1b34d7930ad18.png	6.04900000000000038	124	2016-04-05 06:27:11.382171+00	2016-04-05 06:27:11.520686+00
177	./5507004af7f696403842b547e6d2e1774e9cdb220489a9173804b495.png	5.12600000000000033	140	2016-04-05 09:41:25.343095+00	2016-04-05 09:41:25.469292+00
180	./5ab0c080bc124838ffc288f575e321f329d8b5f899f2359e3dffaee7.png	17	144	2016-04-05 20:17:50.770626+00	2016-04-05 20:17:50.900571+00
182	./b15c904a22caafea37d17c828968b4075df397394bf1075d8424491c.png	3	142	2016-04-06 18:11:19.370249+00	2016-04-06 18:11:19.477138+00
183	./10351ffdea1e2f77346304db1de32bb8c210138acb01439afb7c5f45.png	6.00100000000000033	146	2016-04-06 18:11:38.273609+00	2016-04-06 18:11:38.378568+00
398	./7e913b48057bd0a2f8662c26c3750f070687bffe05c0155c2bfb5a56.png	0.562000000000000055	389	2016-04-10 03:57:20.836743+00	2016-04-10 03:57:20.90985+00
185	./7cd2ec476a126d105c2e7d13ec16733fee9b0e0f841975232b8da91e.png	8.3960000000000008	148	2016-04-06 18:13:20.992698+00	2016-04-06 18:13:21.130362+00
186	./23fb6dd916d3df71507cb11622cb7e58551bc771d838a44be3d31ff4.png	7.02700000000000014	151	2016-04-06 18:15:22.419669+00	2016-04-06 18:15:22.521261+00
187	./699107b988567801d243233eca80877f8df76d72af117fdfd093c2e1.png	2.00099999999999989	115	2016-04-06 18:15:40.877278+00	2016-04-06 18:15:40.979742+00
188	./ae84b5f63b7bc46a81f08e2f544f2266af1d71f0cbacf3d737dc9f4e.png	8.0389999999999997	153	2016-04-06 18:16:39.876219+00	2016-04-06 18:16:39.990597+00
204	./5cffaab33236c0b982374b696aabf66637eaafa44b91ae04d71df5df.png	1.05699999999999994	124	2016-04-08 21:14:46.146676+00	2016-04-08 21:14:46.248885+00
403	./5b811e54001b27bc43563f8cfe99b80f28c5477c6a0612d000823c9b.png	0.549000000000000044	394	2016-04-10 03:57:32.065614+00	2016-04-10 03:57:32.148461+00
407	./232823613b84d780c9a73dbbbd872b144be8c7942692ad4fb4065f2f.png	0.592999999999999972	398	2016-04-10 03:57:41.085295+00	2016-04-10 03:57:41.155242+00
152	./5bb665f5533b9453a093e96732db5ff2cbfb9beedef4c12dd318cc2e.png	4.00100000000000033	99	2016-04-04 07:45:38.362764+00	2016-04-04 07:45:38.480904+00
205	./10bdf3d64ffaa6187ceea1ed88205ea84c0fbdb7048410b3df73c8a2.png	1.05800000000000005	124	2016-04-08 21:17:07.153912+00	2016-04-08 21:17:07.28352+00
154	./5d05fd39cd87cf30dba9d1da250baadb52809543cccaac7a238e8d88.png	7.51700000000000035	101	2016-04-04 07:47:22.310199+00	2016-04-04 07:47:22.404544+00
155	./9df008abb41268d8856dba32eb7ee22cd0213445eeb5d3e93ff3f34a.png	5	102	2016-04-04 07:47:40.416899+00	2016-04-04 07:47:40.527688+00
156	./e9bc540d7d4990dc1b526ce201a2aa97b084994c6ce52178cb1b09e3.png	9.73399999999999999	103	2016-04-04 07:48:08.576044+00	2016-04-04 07:48:08.67396+00
157	./b32a6aaf36c9ff60fa805b3d6713cb5b4aac92de5a98e302d92cd2c2.png	6	104	2016-04-04 07:49:46.4444+00	2016-04-04 07:49:46.567532+00
158	./ccfe016d337ded759f3265878261322600b3ff161170a1edee6b3c2b.png	2	105	2016-04-04 07:54:31.989096+00	2016-04-04 07:54:32.113163+00
159	./c07f771eda303e06d3074b4c91ccb2c194e1c90fae3a038614dcb5c9.png	17	106	2016-04-04 07:56:03.827174+00	2016-04-04 07:56:03.942041+00
160	./27e1c8a765dbef0ec7b6916a9d18c7889a463818d0382d977e7df791.png	2.08099999999999996	107	2016-04-04 10:10:55.115801+00	2016-04-04 10:10:55.221075+00
161	./814a5f814d089c816bd06c1b2dd0753b615cce05954d379f0d684af3.png	28.0710000000000015	108	2016-04-04 10:32:41.767851+00	2016-04-04 10:32:41.894084+00
411	./edde9c3638470baf4b5f11092f8e4d172ce8ffd9cb38a6851658a66f.png	0.546000000000000041	402	2016-04-10 03:57:50.023044+00	2016-04-10 03:57:50.092856+00
206	./2d5fdf5f786105cb88dd5b16273e1f0702508642360c5739d699d73b.png	2.03500000000000014	124	2016-04-08 21:17:23.326949+00	2016-04-08 21:17:23.440273+00
415	./8047c0127250edbe5a99fbcfac3eaa08bce97a90190982b1f5b1b05c.png	0.542000000000000037	406	2016-04-10 03:57:58.998758+00	2016-04-10 03:57:59.066192+00
419	./cd351f6e7245ac4c952b4d06929768bc6bf59198dc0ca8bfcaead565.png	0.570999999999999952	410	2016-04-10 03:58:07.933191+00	2016-04-10 03:58:08.026014+00
423	./9642277144e107f77c03918cc66a9d77e62026fc07d6ef273c3b4119.png	0.548000000000000043	414	2016-04-10 03:58:16.739554+00	2016-04-10 03:58:16.807266+00
427	./bdfdaa2feae59f7f4510127d2a55c2b8930c174ca69b43ecae3321c6.png	0.494999999999999996	418	2016-04-10 03:58:25.577048+00	2016-04-10 03:58:25.647393+00
202	./ea379dac4df9d03b3acb824f30626db723897d7180e9e94700b7250f.png	4	124	2016-04-08 21:13:54.332849+00	2016-04-08 21:13:54.559646+00
203	./b4d37ed65eb6d8b0500e92f6e2d701c2ac6a141ac74c605d279c6be0.png	2.07299999999999995	124	2016-04-08 21:14:30.043435+00	2016-04-08 21:14:30.163703+00
207	./c78ec76f942c0668ebdc3751854241cf82eb775da609a87d7e3d411a.png	5.01900000000000013	124	2016-04-08 21:17:26.388574+00	2016-04-08 21:17:26.502203+00
208	./60d779e2acda378a55ad0fa4d68f850d8b15b9b9409dcfc6bef108be.png	7.03599999999999959	124	2016-04-08 21:17:29.123121+00	2016-04-08 21:17:29.212432+00
209	./f7078dc8c96d6b4f72a3550667080f1670235124c986dfb118ce6b3e.png	1.02499999999999991	124	2016-04-08 21:17:43.461166+00	2016-04-08 21:17:43.562534+00
431	./246eb32f90d9083bd58f177b149b83c0e0715cc2d80ec9bd03f64693.png	0.562000000000000055	422	2016-04-10 03:58:34.41663+00	2016-04-10 03:58:34.489652+00
435	./03238f1a8df346bebe7b5801605013d598fc8d96bf83bae35838e5d3.png	0.574999999999999956	426	2016-04-10 03:58:43.263981+00	2016-04-10 03:58:43.369126+00
439	./ef80d25b5228789ee0703bbe06543d1c3700899425d65c1f130befef.png	0.560000000000000053	430	2016-04-10 03:58:52.089358+00	2016-04-10 03:58:52.160317+00
443	./49f06ec8f37c998006e464767a7967d229994c873240e35bc3ba4798.png	0.552000000000000046	434	2016-04-10 03:59:00.934016+00	2016-04-10 03:59:01.001246+00
447	./784984344b7180e5632bfa0b1429d0649f5731d7c8d62b7f496b750e.png	0.543000000000000038	438	2016-04-10 03:59:09.760426+00	2016-04-10 03:59:09.834966+00
451	./26c7b201e2ff9c75c17574bd9e90c3838e768832cde68b18ddb5eda8.png	0.567999999999999949	442	2016-04-10 03:59:18.676318+00	2016-04-10 03:59:18.765107+00
455	./515d167e0cb46d2a19af38c4d8c9f10bb854a5b1f344072ed1608b28.png	0.582999999999999963	446	2016-04-10 03:59:27.637095+00	2016-04-10 03:59:27.709013+00
459	./206cdf39245dd2895addaf84affcd60aeca37580ea8bc66b0717e52f.png	0.515000000000000013	450	2016-04-10 03:59:36.555492+00	2016-04-10 03:59:36.62565+00
463	./64863af9043da4e3bcece45b157ecbf4c20c640370348b4de4e884d4.png	0.607999999999999985	454	2016-04-10 03:59:45.491861+00	2016-04-10 03:59:45.583397+00
467	./3aaabba4c57423a44f59fcd9e617b8bc6663eed28cba7f11a5951879.png	0.598999999999999977	458	2016-04-10 03:59:54.4795+00	2016-04-10 03:59:54.578906+00
471	./38f575fe47f7c874adbad758fcef61dddc717109cadfdf5e7190006a.png	0.55600000000000005	462	2016-04-10 04:00:03.377474+00	2016-04-10 04:00:03.450168+00
399	./adb89cea7cd98073f45b65985f38ec05898cc79161b2e7635854c196.png	0.561000000000000054	390	2016-04-10 03:57:23.023733+00	2016-04-10 03:57:23.095561+00
404	./3179411779cfba2361be9066b130b7a9b963518c039ec20212e1d9c8.png	0.539000000000000035	395	2016-04-10 03:57:34.303453+00	2016-04-10 03:57:34.390566+00
408	./9361b16d2960d0df5ca07b33072f3a8000ad2f2f0a91d9a7fc14fff7.png	0.512000000000000011	399	2016-04-10 03:57:43.306716+00	2016-04-10 03:57:43.377588+00
412	./86341b8bd6e3b4f5acfd0299c45d8f1752ed22d7f88f03b8ea93bb51.png	0.507000000000000006	403	2016-04-10 03:57:52.32689+00	2016-04-10 03:57:52.411803+00
416	./87ccbe0b33ecb7be3fbf6b6e2572e9b149f8d90736c01914473632dc.png	0.583999999999999964	407	2016-04-10 03:58:01.212436+00	2016-04-10 03:58:01.287099+00
420	./d9d8267363fe0cdc7fd30a227b159aa08a7e4eec6d620bbeaa6d278e.png	0.552000000000000046	411	2016-04-10 03:58:10.116409+00	2016-04-10 03:58:10.188257+00
424	./dbb72c5dec783098a75c6a1ee773c9f6fa7ad2ba111a98f8a9bbebee.png	0.54500000000000004	415	2016-04-10 03:58:18.977536+00	2016-04-10 03:58:19.078195+00
428	./0079197c4341c71bf5a211e6d2a30b2b34b5216243dfdef37d82d64d.png	0.566999999999999948	419	2016-04-10 03:58:27.802937+00	2016-04-10 03:58:27.883786+00
432	./c40aa2b8f3e6c375bea820496f7e86a4f5adf25f88dc5cf3d88db9e5.png	0.560000000000000053	423	2016-04-10 03:58:36.742761+00	2016-04-10 03:58:36.813141+00
436	./c4d3cbd2ee4f5446bfadeeb0db4126f297ca31ed3119bdf505d7edfd.png	0.529000000000000026	427	2016-04-10 03:58:45.441029+00	2016-04-10 03:58:45.510091+00
440	./85ff7ff9fcbf010620eeb8f0c3c67f9bbb508f5a158dfbe6d53282d5.png	0.548000000000000043	431	2016-04-10 03:58:54.310705+00	2016-04-10 03:58:54.387244+00
444	./ff9a12ef30f79e3efe24f1fdcd6d754f3cd6d000c5048bb5ba880eb1.png	0.565999999999999948	435	2016-04-10 03:59:03.14502+00	2016-04-10 03:59:03.224693+00
448	./21edcd5e16b448809d13618e9b9296d5bd1791f570a9f643dded167e.png	0.558000000000000052	439	2016-04-10 03:59:11.972625+00	2016-04-10 03:59:12.04408+00
452	./85b8ecdb0f7e1581ea20be16a51526e6d19d980a83d3b2ac90ede3d1.png	0.57999999999999996	443	2016-04-10 03:59:20.904239+00	2016-04-10 03:59:20.979807+00
456	./aa3d492e29383f1913fca56198399c72e30ef4a7061b8cdc80d243db.png	0.547000000000000042	447	2016-04-10 03:59:29.839192+00	2016-04-10 03:59:29.921937+00
460	./7f622ed3562b24ef9ca134eacfe539cd6f9716383cdf8e97f54c415e.png	0.540000000000000036	451	2016-04-10 03:59:38.764091+00	2016-04-10 03:59:38.840619+00
464	./3e25fa5b993f76c83170d52a319b2ddfe87070b49e2e481f2b411865.png	0.572999999999999954	455	2016-04-10 03:59:47.718363+00	2016-04-10 03:59:47.801822+00
468	./95acb96ce8e5866bca849327a4e32dd0b2738b21405f35a4225a1f73.png	0.594999999999999973	459	2016-04-10 03:59:56.720446+00	2016-04-10 03:59:56.792764+00
472	./63b8a571f40e1d2dd5e96efbcf3ae3287e1ea93537d5475ef35950ac.png	0.569999999999999951	463	2016-04-10 04:00:05.637407+00	2016-04-10 04:00:05.711035+00
475	./b8019bd1c784ceaa4faf45139ed54dfe16660dbaaf521495d18158bb.png	0.595999999999999974	466	2016-04-10 04:00:12.363381+00	2016-04-10 04:00:12.440874+00
478	./7fd0466a09de18c22fc7d1198f450665f53c66b866926209c1920bf4.png	0.609999999999999987	469	2016-04-10 04:00:19.052788+00	2016-04-10 04:00:19.129834+00
481	./b071384c425a8629f88ede0fa1cfc350030babfa4e5a4dd54d44c81d.png	0.569999999999999951	472	2016-04-10 04:00:25.785322+00	2016-04-10 04:00:25.859783+00
484	./408307e5ec533cbb5d5d450306b77e38cf617431869176ee370cc392.png	0.566999999999999948	475	2016-04-10 04:00:32.509023+00	2016-04-10 04:00:32.576381+00
487	./18f5bf70affb0f7d2f6014e588eebb5eda132f58d7427ee038e04f14.png	0.575999999999999956	478	2016-04-10 04:00:39.266183+00	2016-04-10 04:00:39.335804+00
490	./0df396f6b36238cfa4e3c00107a54b72a6fab4a7b217b30d7fb77ca1.png	0.573999999999999955	481	2016-04-10 04:00:46.020324+00	2016-04-10 04:00:46.098005+00
493	./9fc0100694c93041d1239b0f2dccbef8bec56611ccff22b5b7967081.png	0.588999999999999968	484	2016-04-10 04:00:52.737918+00	2016-04-10 04:00:52.810714+00
496	./cf8fb89530b88a08f07ce669ef052f06962643d6e84cc77cd73fb61d.png	0.572999999999999954	487	2016-04-10 04:00:59.487271+00	2016-04-10 04:00:59.559688+00
499	./ffcf5ee14ab76ab693034c7fe5df5009f6a5c79a808ed7449a0c3629.png	0.580999999999999961	490	2016-04-10 04:01:06.265263+00	2016-04-10 04:01:06.353341+00
502	./ebac9ec3773f8d257559f180134a8b7a22192956a166bf2ea0cdbd7b.png	0.610999999999999988	493	2016-04-10 04:01:13.100279+00	2016-04-10 04:01:13.178923+00
504	./395834e79595e4cfedf4173918ff89dbea41f92393ea009ed6947840.png	0.577999999999999958	495	2016-04-10 04:01:17.62735+00	2016-04-10 04:01:17.69622+00
506	./3dbaddd5f782472f25f850db707422f2ca8439b5f20d79cd5d174c82.png	0.604999999999999982	497	2016-04-10 04:01:22.214+00	2016-04-10 04:01:22.286296+00
260	./74007753a9f6d99bb69ee43e8e948f6190e11923681ec373ddb7d45f.png	1.45999999999999996	249	2016-04-10 00:46:15.663889+00	2016-04-10 00:46:15.775819+00
261	./5f0ccf3bed99b8bd8834ff5deabaa7f63c0df24319788f1a7db2b028.png	1.52699999999999991	250	2016-04-10 00:46:27.320135+00	2016-04-10 00:46:27.423625+00
262	./ecafecbe2ae2e9b22c59ccfdffa2192704954fbcead0d462b65f5fc5.png	1.69900000000000007	251	2016-04-10 00:46:58.552596+00	2016-04-10 00:46:58.673057+00
263	./618c7e68bf66f0482ca57402aeca3bc8893afbc454c48bb9654e27a1.png	1.55000000000000004	252	2016-04-10 00:47:09.676562+00	2016-04-10 00:47:09.786894+00
264	./228e3efb33764bf66323f98ce2c81ff6c70b8f0b47fdecd0c7e057fa.png	1.46799999999999997	253	2016-04-10 00:48:25.993741+00	2016-04-10 00:48:26.11758+00
265	./3f3fb84660619a52b2d0728931eaf9ba6fb8143d3940a12bb0c4c056.png	1.5069999999999999	254	2016-04-10 00:48:37.740558+00	2016-04-10 00:48:37.889379+00
266	./4f2226e47ada0edb867553d6469841ead630c72fa082fbc9793e2c2a.png	1.53899999999999992	255	2016-04-10 00:48:54.572962+00	2016-04-10 00:48:54.695057+00
267	./982b5f0dd1fa5dafe2da23df6d1fda3dbd0d8dab7900c9150c53f71f.png	1.44799999999999995	256	2016-04-10 00:49:17.195295+00	2016-04-10 00:49:17.304479+00
268	./8d6bf92b26dda5bc246d91e21230926d384c3a43b904487b5ebd7faf.png	1.54800000000000004	257	2016-04-10 00:49:29.27046+00	2016-04-10 00:49:29.375888+00
269	./fcbfbb22d19f2dfcf215a41e0f4f3dca9975d40f7f1430f0e41a7e93.png	1.48999999999999999	258	2016-04-10 00:52:10.132045+00	2016-04-10 00:52:10.244514+00
270	./b2ea7896aa8fc77ebe390a781e0fbb2d1251b9cd10b54646dec590aa.png	1.56699999999999995	259	2016-04-10 00:52:50.827021+00	2016-04-10 00:52:50.931195+00
271	./22b04bfce95c23fa98d4f636edf7ce0693be3960bd69214aa31978c4.png	1.47700000000000009	260	2016-04-10 00:58:53.741988+00	2016-04-10 00:58:53.848532+00
272	./d43abfd4c24dc25297b06368e120e3ab09526336004b57a26a2af2d4.png	1.53499999999999992	261	2016-04-10 00:59:04.217867+00	2016-04-10 00:59:04.318962+00
508	./631ea084768570091b810b003c0b164dc12f7abed99db4e18edc362b.png	0.597999999999999976	499	2016-04-10 04:01:26.702492+00	2016-04-10 04:01:26.772226+00
510	./4dbcde43269eea05bdd570e25262687663488d80b2a028cb99f6ce02.png	0.572999999999999954	501	2016-04-10 04:01:31.192531+00	2016-04-10 04:01:31.271551+00
512	./e224af5427a1cc70aa152bafc28a94f8bef1496292e1f33432e3d309.png	0.567999999999999949	503	2016-04-10 04:01:35.681961+00	2016-04-10 04:01:35.759114+00
514	./cb7e36a6f29e0f12ec4d647d5a1b21b83d8052539142d89fbfe60949.png	0.612999999999999989	505	2016-04-10 04:01:40.348689+00	2016-04-10 04:01:40.445454+00
516	./e659f6393d8453773143b30f8fe3e9da071823d86642c8dc4bc9f730.png	0.622999999999999998	507	2016-04-10 04:01:44.950865+00	2016-04-10 04:01:45.02155+00
518	./7224ff83bef55d247653635de5d007f3b68ab17476d08ef04ab39eb3.png	0.634000000000000008	509	2016-04-10 04:01:49.557874+00	2016-04-10 04:01:49.630733+00
520	./c7379107bc35e8aef76748282e2df1324e29fc60cd64a55fe7774bec.png	0.639000000000000012	511	2016-04-10 04:01:54.185251+00	2016-04-10 04:01:54.259571+00
522	./8dff957ffe02abbaac9cc88d107af1d2ba0fdd0094e1640e7744be41.png	0.571999999999999953	513	2016-04-10 04:01:58.662366+00	2016-04-10 04:01:58.737949+00
524	./9c11c3c96535b9eb7cf0c8d1365f7f28a7edf543387da593df5c8513.png	0.594999999999999973	515	2016-04-10 04:02:03.208587+00	2016-04-10 04:02:03.307505+00
526	./410174548e383efcd4a460ddd4725cf55b9bf9ef5bd109f1a48b7f1e.png	0.611999999999999988	517	2016-04-10 04:02:07.861946+00	2016-04-10 04:02:07.947599+00
528	./76ea09875997969ed822181804f6aac1e9e1eb407eed5b045be8d022.png	0.635000000000000009	519	2016-04-10 04:02:12.58618+00	2016-04-10 04:02:12.656862+00
530	./505ed732dfdf4e366b0704f9559eb689df2e01fc4e132bebcab22c8d.png	0.586999999999999966	521	2016-04-10 04:02:17.150935+00	2016-04-10 04:02:17.228543+00
532	./a881719c87059ae65499bd3b9fcdc51a0f5edde0bb22148131c09b2e.png	0.614999999999999991	523	2016-04-10 04:02:21.762272+00	2016-04-10 04:02:21.856477+00
534	./e1292f4a768bd8466ac52bbe9718d336842eff64cd9318f3fb81f79b.png	0.600999999999999979	525	2016-04-10 04:02:26.406003+00	2016-04-10 04:02:26.480871+00
536	./8468efb55241490b98f2ef9d3b17355dcd0cfab4ab08fbdff4f8fc2d.png	0.628000000000000003	527	2016-04-10 04:02:30.993563+00	2016-04-10 04:02:31.092872+00
538	./99f34751ae4805ac8d72bbd73f7884cc6ecab2ff98884dd41b49d956.png	0.577999999999999958	529	2016-04-10 04:02:35.6187+00	2016-04-10 04:02:35.687961+00
540	./700f7a7ad47398d94fd7e89e3b717918b13fb81142bd91656c9bb282.png	0.630000000000000004	531	2016-04-10 04:02:40.233411+00	2016-04-10 04:02:40.322194+00
542	./7406160f05d0cddc9e335673d00a67d41575c449378d8faaf592f2da.png	0.637000000000000011	533	2016-04-10 04:02:44.949949+00	2016-04-10 04:02:45.03303+00
400	./3ddaac9d0782e6357fdea1902d111b629ecb4a43c0f3340d3fc68081.png	0.54500000000000004	391	2016-04-10 03:57:25.277027+00	2016-04-10 03:57:25.348208+00
405	./359335f4b6ab8a6552da99de444de58e8fda6c3fb4d8dc31a7602b3a.png	0.474999999999999978	396	2016-04-10 03:57:36.590628+00	2016-04-10 03:57:36.672452+00
409	./197781147b4e19de664ac223fedfa91ab4324e90a2b72dd91d53166c.png	0.542000000000000037	400	2016-04-10 03:57:45.546328+00	2016-04-10 03:57:45.655985+00
413	./a7d3a161232e8f0d948a215436a5c83c763c1471e40f2f91da43efbd.png	0.548000000000000043	404	2016-04-10 03:57:54.524972+00	2016-04-10 03:57:54.595761+00
417	./4ddf42b003239588a74de87c0e09c9b2786d91785667a3be86b3e933.png	0.60199999999999998	408	2016-04-10 03:58:03.470869+00	2016-04-10 03:58:03.550692+00
421	./4dda06e49313c392e6bd2be475172e813bcff116dd8f31f499fd982a.png	0.482999999999999985	412	2016-04-10 03:58:12.345827+00	2016-04-10 03:58:12.415891+00
425	./6029b9f8a1b5c0786c70d5cf35128aff50b673475779be81541b482f.png	0.551000000000000045	416	2016-04-10 03:58:21.194365+00	2016-04-10 03:58:21.266209+00
429	./94d84fd1bb5715da54f447e008ac8393aed41ed8f13349badbc27be1.png	0.552000000000000046	420	2016-04-10 03:58:30.013653+00	2016-04-10 03:58:30.107258+00
433	./ae2d93ac442bdaadc0887ec01f9c30530e225b7ab4c6b2ab40187833.png	0.587999999999999967	424	2016-04-10 03:58:38.834872+00	2016-04-10 03:58:38.902092+00
437	./8f23136f5bfdb8a7fa6d2e04f10a9d4957b79b92f4dd1dec38f107e2.png	0.548000000000000043	428	2016-04-10 03:58:47.647957+00	2016-04-10 03:58:47.726219+00
441	./d7c7a753bd28a8adb15fb36a866b95f5cfc4e0f23b3c5c7e883b6704.png	0.559000000000000052	432	2016-04-10 03:58:56.521193+00	2016-04-10 03:58:56.591331+00
445	./932947cf1620224ecb40fc4edf53b352703fa0b82feae557681817c4.png	0.509000000000000008	436	2016-04-10 03:59:05.344851+00	2016-04-10 03:59:05.436706+00
449	./88589a419bd8ab4afa283fbf78023fd5a1ead8b007dabb981d17dbc3.png	0.569999999999999951	440	2016-04-10 03:59:14.183287+00	2016-04-10 03:59:14.280106+00
453	./8a8fe54502041fc634e02ad5dffff5d82a3894f18c0085a0f358e5a4.png	0.592999999999999972	444	2016-04-10 03:59:23.138172+00	2016-04-10 03:59:23.216181+00
457	./b70bcf442d4ed14aa0a62a9b9dadbbed92cd0496e7ae60b9499bca03.png	0.55600000000000005	448	2016-04-10 03:59:32.100787+00	2016-04-10 03:59:32.17184+00
461	./5a3de62cb297d1c7c0edf802857da71aa449f2c76d6ae5c52a4ebbc9.png	0.585999999999999965	452	2016-04-10 03:59:40.959863+00	2016-04-10 03:59:41.05657+00
465	./762cff38cfc5ad44a2ddc094b967b2cd02218e0f574d2e5edd3e48a5.png	0.547000000000000042	456	2016-04-10 03:59:49.975819+00	2016-04-10 03:59:50.04507+00
469	./c6e8b08a616ffcee67680cab9ce1ff81cd87c3f78ce7e3503bdbeaf4.png	0.553000000000000047	460	2016-04-10 03:59:58.93628+00	2016-04-10 03:59:59.018028+00
473	./b8d0c2c42a2139aaf2693a12a3a67e9fc552c4fe5d6d73f50c863407.png	0.565999999999999948	464	2016-04-10 04:00:07.89189+00	2016-04-10 04:00:07.967978+00
476	./c8cd5c89244c01276002b26f1b1c9d3f48006318ed782d98204b103a.png	0.572999999999999954	467	2016-04-10 04:00:14.569945+00	2016-04-10 04:00:14.644105+00
479	./a85e245505a238acb171eca6abb342a42252bac22180186bb64df00e.png	0.606999999999999984	470	2016-04-10 04:00:21.331202+00	2016-04-10 04:00:21.403189+00
482	./8e98d463d585c2b03f87e9a22a65df02db0ee5c428e174c8290d4620.png	0.622999999999999998	473	2016-04-10 04:00:28.047261+00	2016-04-10 04:00:28.142865+00
485	./db48b5627f15500f311618c10b53f0b821ff851ca1a10c1de11b39cc.png	0.630000000000000004	476	2016-04-10 04:00:34.792035+00	2016-04-10 04:00:34.886996+00
488	./c998d9244d731596addbef4b7bdb2c790a1c014f471516bde4544e5b.png	0.57999999999999996	479	2016-04-10 04:00:41.544116+00	2016-04-10 04:00:41.614971+00
491	./7ee5ffba9f13819d805957e6cd31a8d6c33c609570e9a7a93c660cde.png	0.593999999999999972	482	2016-04-10 04:00:48.241721+00	2016-04-10 04:00:48.313267+00
494	./3242398790085e1d28aafbd4e11323af2a9644d7a6989e6aa6b78095.png	0.608999999999999986	485	2016-04-10 04:00:54.972627+00	2016-04-10 04:00:55.077271+00
497	./891eb1c95fcd645b60ea97bcc71e9d88cae54dd977ca050b8cef852d.png	0.586999999999999966	488	2016-04-10 04:01:01.739751+00	2016-04-10 04:01:01.826135+00
500	./ebcc87617080a7bc1f115666952b014f6b8cd0622b67318670514874.png	0.617999999999999994	491	2016-04-10 04:01:08.558241+00	2016-04-10 04:01:08.67578+00
503	./3d533dc0d3a8f8eeef86d2ac69ae6b4e5124798690f0fd79c2664670.png	0.608999999999999986	494	2016-04-10 04:01:15.388258+00	2016-04-10 04:01:15.45724+00
505	./63fffee6c8d3adbd16039642b6fce2ff4c81cbe06fdf99263c54803e.png	0.595999999999999974	496	2016-04-10 04:01:19.923647+00	2016-04-10 04:01:20.000889+00
507	./b5f14e3caeae9e7ed247403f35184a615f99df279b6425ce37266aaf.png	0.569999999999999951	498	2016-04-10 04:01:24.463857+00	2016-04-10 04:01:24.565266+00
509	./374bff8146a6e8e1420c29b59eef6818f35a4acd5f5077ebd97e4faa.png	0.611999999999999988	500	2016-04-10 04:01:28.975001+00	2016-04-10 04:01:29.050654+00
511	./ebd2f26758bdd9e70a89b1dd4615fca75374eaaa58b20481411d74a8.png	0.60299999999999998	502	2016-04-10 04:01:33.460614+00	2016-04-10 04:01:33.538589+00
513	./1ec6383210dacb0cecd84c493d8b5e7cff2d35652ed880ec2c26a25d.png	0.643000000000000016	504	2016-04-10 04:01:38.050536+00	2016-04-10 04:01:38.117416+00
515	./867dca11313022d651f82a69d185f8a0052f6447e5e5c20e6dacd904.png	0.577999999999999958	506	2016-04-10 04:01:42.578866+00	2016-04-10 04:01:42.654986+00
517	./2958dc15bb0d012ed6977701b5bff98987374238fbd5bcc7b2393555.png	0.615999999999999992	508	2016-04-10 04:01:47.224446+00	2016-04-10 04:01:47.317246+00
519	./e7168db39b92aa4bdca8b6f8ef5526582f6c050d66df6332c2e9b95b.png	0.591999999999999971	510	2016-04-10 04:01:51.823625+00	2016-04-10 04:01:51.905795+00
521	./584b5cc00d855fb965664bd57db229982bd18df02ff3181bcbcf251c.png	0.580999999999999961	512	2016-04-10 04:01:56.445515+00	2016-04-10 04:01:56.516469+00
523	./6ec1d3e924d83e2b31889d55876183a9d3009579904aa950f1992f14.png	0.60299999999999998	514	2016-04-10 04:02:00.93861+00	2016-04-10 04:02:01.008837+00
525	./5df5ce3dbd1cb9b0d12242743ab7033d4224980b4986f9facdaeb662.png	0.630000000000000004	516	2016-04-10 04:02:05.547169+00	2016-04-10 04:02:05.64066+00
527	./83b3843fea75f633ba750cf630439f8d18ddd0661c1c2876a150924c.png	0.639000000000000012	518	2016-04-10 04:02:10.246676+00	2016-04-10 04:02:10.349067+00
529	./1e9baddf6ad4876eaeb9122fcda58add04d0ca5685c50b91f4600492.png	0.57999999999999996	520	2016-04-10 04:02:14.887679+00	2016-04-10 04:02:14.961819+00
531	./90bb501a10b743d73d8b98b5745823fa87d542dbe0589c7c68fa9100.png	0.598999999999999977	522	2016-04-10 04:02:19.432754+00	2016-04-10 04:02:19.502738+00
533	./9bf0e7e553bc7e7097d527253b673e5462d1a65660c86d9ab7f11e58.png	0.661000000000000032	524	2016-04-10 04:02:24.110951+00	2016-04-10 04:02:24.183657+00
535	./0f4e624bdd243920a6d9de1541345b2fdfb8588315f6ead37aaddb70.png	0.59099999999999997	526	2016-04-10 04:02:28.672723+00	2016-04-10 04:02:28.765745+00
537	./8514a2cb7ed16a8dffeb201f92bdaa7f29c8c6809e58016ba620936a.png	0.655000000000000027	528	2016-04-10 04:02:33.324195+00	2016-04-10 04:02:33.40302+00
539	./6212bbd1c6e6cdf222638f71e6890b0f67ab078e6fb42615c8f3c455.png	0.620999999999999996	530	2016-04-10 04:02:37.908775+00	2016-04-10 04:02:37.992934+00
541	./ccf6b802d1cc6ee19d28d030b69f2673369ddafd24d6b841a091aecd.png	0.649000000000000021	532	2016-04-10 04:02:42.573569+00	2016-04-10 04:02:42.663911+00
543	./9f188af59f6f4e0495d425b1d333eaeed33696152afbe39175663586.png	0.682000000000000051	534	2016-04-10 04:02:47.347693+00	2016-04-10 04:02:47.419269+00
544	./61783670826e1ab253eebf663a8f46fe22846706b6cf153585f71d06.png	0.645000000000000018	535	2016-04-10 04:02:49.708223+00	2016-04-10 04:02:49.800818+00
545	./2094e47508d81a38cab0603df94ca2f79d6a2142deb48cf0ab8324d4.png	0.587999999999999967	536	2016-04-10 04:02:52.004059+00	2016-04-10 04:02:52.0953+00
546	./5d941a3de7c871c0ef00158f75c62712ba084170804840f7816d3891.png	0.661000000000000032	537	2016-04-10 04:02:54.341783+00	2016-04-10 04:02:54.431059+00
547	./cde68aa0f05b4f88323102a293d37d61b65a25f92abe4055d10cf8f5.png	0.656000000000000028	538	2016-04-10 04:02:56.700676+00	2016-04-10 04:02:56.773671+00
548	./4bf40bb945c213c3822c1fc855e47913550485fc622a9c3ee0dd3116.png	0.652000000000000024	539	2016-04-10 04:02:59.052133+00	2016-04-10 04:02:59.134444+00
549	./301e77e10b4fcfdfbfd05eb5b6ac9bf7238214a3deab59a85e451d9e.png	0.59099999999999997	540	2016-04-10 04:03:01.314924+00	2016-04-10 04:03:01.405143+00
550	./63094ea1f0839e49afae57bc6f96c8532eb1f6450be1a056b43796b9.png	0.649000000000000021	541	2016-04-10 04:03:03.701755+00	2016-04-10 04:03:03.791178+00
551	./b888fe70d022791d2085978b198c45a7ef6b12187f2c0a0daff2a252.png	0.646000000000000019	542	2016-04-10 04:03:06.017762+00	2016-04-10 04:03:06.09187+00
552	./187dd3af48c49d6a35fb9ad9b4c9ed5e9d1712840b614aa1f74d1aa7.png	0.632000000000000006	543	2016-04-10 04:03:08.363868+00	2016-04-10 04:03:08.433068+00
553	./e21ec135276cb968391a2b5793fe2bac21f0f6b304f4747220f25439.png	0.631000000000000005	544	2016-04-10 04:03:10.707285+00	2016-04-10 04:03:10.778031+00
554	./00ba616aedbdd5aa27f4ae1fc0b3f660491c42a39015570fafef7225.png	0.626000000000000001	545	2016-04-10 04:03:13.029615+00	2016-04-10 04:03:13.103404+00
555	./4d259ac80429fe28b3abb227e072cacdbb328b22b9322f5dbce8bf96.png	0.611999999999999988	546	2016-04-10 04:03:15.322051+00	2016-04-10 04:03:15.413593+00
556	./7e627b9d14ae02dec2123d85fc55d0785974b31c58d9e39f4c0aba75.png	0.586999999999999966	547	2016-04-10 04:03:17.594722+00	2016-04-10 04:03:17.661312+00
401	./cddc329a335e1f239f7dad087336254e7d1707ba5aded2ad00c1284b.png	0.503000000000000003	392	2016-04-10 03:57:27.547847+00	2016-04-10 03:57:27.623456+00
388	./5f1e5016aa6f86100dba3b21089a5ce4b813d6b297268621cf2e7d52.png	0.535000000000000031	379	2016-04-10 03:56:50.424009+00	2016-04-10 03:56:50.500272+00
406	./3cd125c4198e104785a339c46a917f63a20271c08d6da0b7241136a0.png	0.580999999999999961	397	2016-04-10 03:57:38.816991+00	2016-04-10 03:57:38.889324+00
389	./43d3364cf9e5395b1c26e784ce7d4c24575c8b89671f07c6fc41c0f7.png	0.53400000000000003	380	2016-04-10 03:56:52.681462+00	2016-04-10 03:56:52.791262+00
363	./e623439ba588bc5a0d577901f139d74edf8089e8e674ce483303e0ba.png	4.04800000000000004	354	2016-04-10 03:55:38.824906+00	2016-04-10 03:55:38.919051+00
364	./7fc5ee0217ea140db6eabbf9aacc222cb3dd1547a057523cedc54884.png	0	355	2016-04-10 03:55:56.841912+00	2016-04-10 03:55:56.927281+00
365	./1aaa5f549a63325060483428eaf8fe3e3eb7c69bbd02051ba7aee995.png	0	356	2016-04-10 03:55:59.030378+00	2016-04-10 03:55:59.130667+00
366	./a3eafc3d3dfae60a72de464ebdd179929a91865b11cde90d12790750.png	0.565999999999999948	357	2016-04-10 03:56:01.242757+00	2016-04-10 03:56:01.310701+00
367	./aeb7cd81da3dbad5344c0477a74f37d7b4c5bc1970bd86110b613eca.png	0.370999999999999996	358	2016-04-10 03:56:03.461798+00	2016-04-10 03:56:03.543376+00
368	./3aa22827cc30ff6d610aaaee54e7d5f81bcdecb8d52bdb5b14ef3bfc.png	0.359999999999999987	359	2016-04-10 03:56:05.710929+00	2016-04-10 03:56:05.784439+00
369	./000709974c4a3624e626f16282baaa2ae0270fd2abd407c8cab0b170.png	0.496999999999999997	360	2016-04-10 03:56:07.987188+00	2016-04-10 03:56:08.1053+00
370	./1f251d742968c07faad941dfbc5f7f23d6b66277790d8c93a8f71829.png	0.490999999999999992	361	2016-04-10 03:56:10.240403+00	2016-04-10 03:56:10.310333+00
371	./502f703052099da37f23d83145de0cb3f4e2d860aa174878d5667fa2.png	0.503000000000000003	362	2016-04-10 03:56:12.477221+00	2016-04-10 03:56:12.548581+00
372	./e78ba02e158f14404222309d2e459970700d8f209321882017999c2e.png	0.401000000000000023	363	2016-04-10 03:56:14.673342+00	2016-04-10 03:56:14.739405+00
373	./e9372b13b0c1d3dc904912cd4a262bf2f28edf1f323868372a1731d8.png	0.543000000000000038	364	2016-04-10 03:56:16.904491+00	2016-04-10 03:56:16.973299+00
374	./20a8492aeb86da87bc9062e628b11c5aca0faee90a8c4d5234b39d9a.png	0.554000000000000048	365	2016-04-10 03:56:19.181185+00	2016-04-10 03:56:19.276062+00
375	./781f441f2156db0c4ec485076cfbc78c9c715682582233c510fcaf7a.png	0.550000000000000044	366	2016-04-10 03:56:21.347853+00	2016-04-10 03:56:21.414513+00
376	./e9e60b147a798a9e8e639eb8843bc5766d6a4f8e876a532e779ec783.png	0.516000000000000014	367	2016-04-10 03:56:23.581709+00	2016-04-10 03:56:23.659964+00
377	./ab454a3324f2aa1c46e770c04ebcd9370b65691f41f83613837f4608.png	0.463000000000000023	368	2016-04-10 03:56:25.788502+00	2016-04-10 03:56:25.864653+00
378	./8f6df26d06f5e3cdf178aefab8723e1ce3141ebe0495a79fa83537fe.png	0.491999999999999993	369	2016-04-10 03:56:27.980885+00	2016-04-10 03:56:28.070425+00
379	./f06dd3e16db1969d2101efbbeb8f046645e06ead029701caad3d5972.png	0.561000000000000054	370	2016-04-10 03:56:30.146618+00	2016-04-10 03:56:30.240166+00
380	./235aa1d65b7d851b921ec5835dc95ab96ec11c77425c1334ddc5697c.png	0.559000000000000052	371	2016-04-10 03:56:32.381332+00	2016-04-10 03:56:32.458346+00
381	./4a3f163a56c6c8cedd01ac7009de9ab26447cdb56af22a99b4640d1b.png	0.529000000000000026	372	2016-04-10 03:56:34.738563+00	2016-04-10 03:56:34.803877+00
382	./e6217fe964529dd437db67e9181189c35b1ea1d60fab6c23f4b976b9.png	0.469999999999999973	373	2016-04-10 03:56:37.001727+00	2016-04-10 03:56:37.075063+00
383	./68498670e5bffc8bc5918b272507a71ebdfd8b812ec99e04676c09d0.png	0.572999999999999954	374	2016-04-10 03:56:39.27405+00	2016-04-10 03:56:39.349522+00
384	./6a58ac63e50961d657300b908016edbd8184a5d3f987949fb517b371.png	0.587999999999999967	375	2016-04-10 03:56:41.498105+00	2016-04-10 03:56:41.596075+00
385	./a7aa7daa4450c90e0cea420a83691c76b0525392814fad8ff0b1e7a3.png	0.570999999999999952	376	2016-04-10 03:56:43.734741+00	2016-04-10 03:56:43.802737+00
386	./17075cd2d728d4a5b631a8b375ee9d3390cd2b86fad43d6199ddaa88.png	0.559000000000000052	377	2016-04-10 03:56:45.987292+00	2016-04-10 03:56:46.065371+00
387	./4f25eedeb61f8d306e4726456885ff862590d2296cfa8db86094fe67.png	0.563999999999999946	378	2016-04-10 03:56:48.231255+00	2016-04-10 03:56:48.314304+00
390	./dd93d6e66c60278defef10451073213e4b796e9bfb2087578f79434d.png	0.541000000000000036	381	2016-04-10 03:56:54.912612+00	2016-04-10 03:56:54.99559+00
391	./e041141ecef68dda6c758ac901ee08ac873c3025b0cf6857379d0581.png	0.592999999999999972	382	2016-04-10 03:56:57.229967+00	2016-04-10 03:56:57.307394+00
392	./473b810a1e2b6a74ddca7d88600e48896b4e96193d21d98107154920.png	0.573999999999999955	383	2016-04-10 03:56:59.467477+00	2016-04-10 03:56:59.539214+00
393	./3e9a5a96fa635fede8864cfd6aac59d81e090305efc27a717469b2b3.png	0.618999999999999995	384	2016-04-10 03:57:01.753988+00	2016-04-10 03:57:01.849057+00
394	./cd724fe03512fb54405a146c1b3acf44d63b6e665bcbd78330fb27db.png	0.549000000000000044	385	2016-04-10 03:57:04.016752+00	2016-04-10 03:57:04.090301+00
395	./47eb93a5c448ba64e58b9904426256ea9bb13b224fd5f6bbeb96253d.png	0.578999999999999959	386	2016-04-10 03:57:06.257155+00	2016-04-10 03:57:06.354781+00
396	./322396b5ec1467868c3a1c58c12a40cd95204bf6d656777bebc5f83c.png	0.561000000000000054	387	2016-04-10 03:57:08.464683+00	2016-04-10 03:57:08.58206+00
410	./88cf4d480a2c5e2c1221b7444c5a97448304bac55d16e4b524177bbf.png	0.527000000000000024	401	2016-04-10 03:57:47.791806+00	2016-04-10 03:57:47.889197+00
414	./8b6cabb5a7b00cc80826ff1abd0ed1d361750be36b917805cdec5bb5.png	0.540000000000000036	405	2016-04-10 03:57:56.743889+00	2016-04-10 03:57:56.828841+00
418	./23038245399124d379dade2d6959ef46545fd9a7056609dc541f1469.png	0.56899999999999995	409	2016-04-10 03:58:05.734484+00	2016-04-10 03:58:05.81309+00
422	./95dbb473bc3fef99e0f304e334ef05b07f3670de65bfa941a1583de7.png	0.520000000000000018	413	2016-04-10 03:58:14.565299+00	2016-04-10 03:58:14.661526+00
426	./f6aa06a47321fc0482e884b58cde10fadc83d3b5d7cfad77f9101cce.png	0.558000000000000052	417	2016-04-10 03:58:23.384447+00	2016-04-10 03:58:23.456047+00
430	./96fc96e3cdcad94eab8e1645b5af0367c809e502e5ca49a503a7358c.png	0.572999999999999954	421	2016-04-10 03:58:32.246404+00	2016-04-10 03:58:32.313379+00
434	./e3e7817dc8911ff2142d0fa7236e6633d3fbc5812d42e8cb606491b9.png	0.564999999999999947	425	2016-04-10 03:58:41.019088+00	2016-04-10 03:58:41.09509+00
438	./07ae369f7966eef5e145140a5ce5fbfd4bd1bc0ab6368eec7cb376a9.png	0.559000000000000052	429	2016-04-10 03:58:49.865275+00	2016-04-10 03:58:49.936425+00
442	./0c1204868ac604af448587f12f3ad8fcfd113d320cb8ca754b870d5f.png	0.571999999999999953	433	2016-04-10 03:58:58.749603+00	2016-04-10 03:58:58.825172+00
446	./3941258c2660e6858177707830483218346927b718e346a5ff0fe32b.png	0.517000000000000015	437	2016-04-10 03:59:07.55121+00	2016-04-10 03:59:07.677504+00
450	./ce29370af20a9feabe439558036a4ef7785f045ae5f7f400a93368ad.png	0.60299999999999998	441	2016-04-10 03:59:16.442142+00	2016-04-10 03:59:16.516029+00
454	./200c55e40d98565282404966b19090d1ccbf3e08641a724f837ad7b9.png	0.573999999999999955	445	2016-04-10 03:59:25.377618+00	2016-04-10 03:59:25.454433+00
458	./2a50c39a5c85178cb5e60ddec06c0ac508c81a9ed95f33cdaf43e666.png	0.580999999999999961	449	2016-04-10 03:59:34.324513+00	2016-04-10 03:59:34.425236+00
462	./d74478ae594cf02a8e6d050d6480f984c4e4fe28048907705ea3211f.png	0.572999999999999954	453	2016-04-10 03:59:43.21195+00	2016-04-10 03:59:43.292362+00
466	./14c6cd8e522354224392506ecd2cb12f0fb3ddfdc747b24ad7037699.png	0.597999999999999976	457	2016-04-10 03:59:52.233178+00	2016-04-10 03:59:52.334051+00
470	./94b0e5827038e71f2d3e05952ee57988b9d4c85ae5fd8d43efc7b35c.png	0.589999999999999969	461	2016-04-10 04:00:01.191396+00	2016-04-10 04:00:01.264857+00
474	./6033b9c9f12788c921da74081e091f94e2bd319375f490a89269c423.png	0.57999999999999996	465	2016-04-10 04:00:10.12282+00	2016-04-10 04:00:10.199726+00
477	./028f7365c848290c10fd4f9d3346a97175b9243809cab622201f182e.png	0.596999999999999975	468	2016-04-10 04:00:16.829235+00	2016-04-10 04:00:16.900788+00
480	./bef2774a166368e0427c172f7fa5fd1cef6d8a68b6b3065d79441238.png	0.559000000000000052	471	2016-04-10 04:00:23.582121+00	2016-04-10 04:00:23.666942+00
483	./d348b4a2b7b2718c1fe438d939c48fda6499187b5e1745bd9cf262bc.png	0.554000000000000048	474	2016-04-10 04:00:30.286977+00	2016-04-10 04:00:30.359083+00
486	./1af6827eee8750a5d5b38ce12f3b93f7ca2f5be2154b643735db6826.png	0.571999999999999953	477	2016-04-10 04:00:36.998612+00	2016-04-10 04:00:37.072754+00
489	./92f62a0ad5eb5aa41e8e6e2fc790788c27a274fe44d87ca945d9e376.png	0.603999999999999981	480	2016-04-10 04:00:43.78605+00	2016-04-10 04:00:43.891306+00
492	./f8b2ab7fa97f0c05b6ab40b10947d2f685f3b37881e24eedbe32e390.png	0.569999999999999951	483	2016-04-10 04:00:50.504033+00	2016-04-10 04:00:50.587799+00
495	./29dca39f721632ce3665a11229758b05f237f4d53d62fd807c153091.png	0.586999999999999966	486	2016-04-10 04:00:57.200555+00	2016-04-10 04:00:57.290214+00
498	./6b3d57239bdae9e9ef4e76fda51d68d46c7840b4f03cd888dd142dd4.png	0.599999999999999978	489	2016-04-10 04:01:04.029306+00	2016-04-10 04:01:04.103127+00
501	./013428d1fa3f462aa33d4efde2d4e763d7d9308a3f6982bfbff062c9.png	0.561000000000000054	492	2016-04-10 04:01:10.783196+00	2016-04-10 04:01:10.855622+00
557	./55a8596f7ab7e8635d94f2ef7b191c5d4f1e1b469f724e651c2ec644.png	0.666000000000000036	548	2016-04-10 04:03:19.93151+00	2016-04-10 04:03:20.03064+00
558	./f8efbdb95a264fc095f6e3a7b60fef58aa691b9f1e4ce435c6a50a3c.png	0.611999999999999988	549	2016-04-10 04:03:22.199211+00	2016-04-10 04:03:22.276745+00
559	./38b577b273728a3d96d4b0f14331418462b61ca681720d05b58d0d6f.png	0.621999999999999997	550	2016-04-10 04:03:24.51928+00	2016-04-10 04:03:24.585348+00
560	./6fd7a02bd54c71b7be87f557872d0fa7a0e43df3eb1b5c9ed0ea5881.png	0.67000000000000004	551	2016-04-10 04:03:26.892665+00	2016-04-10 04:03:26.973779+00
561	./fa52c24e328ec063a90617a34cd120281a910dcc8dac5467a251110a.png	0.587999999999999967	552	2016-04-10 04:03:29.177381+00	2016-04-10 04:03:29.247734+00
562	./43f439913c5fcaa88909158de38732913c81f20040195fb8cb7928c1.png	0.625	553	2016-04-10 04:03:31.628943+00	2016-04-10 04:03:31.706366+00
563	./4c12166555d09d8acd9e0573ab82e7fc2be7e0d6bfff00b2e2cfac3e.png	0.84099999999999997	554	2016-04-10 04:05:02.199108+00	2016-04-10 04:05:02.278198+00
564	./e249f86bafcd37c842e21eefc7242f16d17ec18ff799636b89476da3.png	0.713999999999999968	555	2016-04-10 04:05:04.697318+00	2016-04-10 04:05:04.784781+00
565	./26fa1e4c67f0abf754d85358d85584872a8394092d410a9667b52196.png	0.686000000000000054	556	2016-04-10 04:05:07.113557+00	2016-04-10 04:05:07.190496+00
566	./b62721640ae14b7ea6afeded3b41c0fef16e6b495dd17ec6a2c9849c.png	0.657000000000000028	557	2016-04-10 04:05:09.539902+00	2016-04-10 04:05:09.631162+00
567	./62c1e8754356cdee8b61c009316f32fb71ec60ced394689b059ac2ec.png	0.63600000000000001	558	2016-04-10 04:05:11.878298+00	2016-04-10 04:05:11.946213+00
568	./5aa36e32846eac8c385e4c0023e4ebf0bce0d8f537211e386928ba13.png	0.632000000000000006	559	2016-04-10 04:05:14.231+00	2016-04-10 04:05:14.308808+00
569	./032bf173151eaf38e384007f43d63955c7197212a702c1dcdd4b4b59.png	0.672000000000000042	560	2016-04-10 04:05:16.593402+00	2016-04-10 04:05:16.664962+00
570	./f8ad1c6cc98e84aa6c25cf8e036b87a09d24c64c906f086132b982c8.png	0.675000000000000044	561	2016-04-10 04:05:19.006547+00	2016-04-10 04:05:19.088485+00
571	./b8345279d9cd308d87b97a734d35467d1fe25951c20097f96ab0f29d.png	0.68100000000000005	562	2016-04-10 04:05:21.410045+00	2016-04-10 04:05:21.476327+00
572	./54c9ada35c0e20d1c3312cc81e01f85de787918d2163ff4d996c6cd0.png	0.688999999999999946	563	2016-04-10 04:05:23.842289+00	2016-04-10 04:05:23.932121+00
573	./255b68c670210ce88bbbaaa149563fed8bd64afb1618021c47bed14b.png	0.633000000000000007	564	2016-04-10 04:05:26.242267+00	2016-04-10 04:05:26.30866+00
574	./bdc630a192ce828bc00c7f87cf325ba4df840f91fbe9a9132c0f74ca.png	0.678000000000000047	565	2016-04-10 04:05:28.710253+00	2016-04-10 04:05:28.785449+00
575	./86cd794653020420b481e4806ca5aae7f68a7c1ed4e8d54678b1e9a7.png	0.756000000000000005	566	2016-04-10 04:05:31.247199+00	2016-04-10 04:05:31.325475+00
576	./7fabd322211fcecd1c1a219dfd1a732b98cffc4b0f3d1463b932e87a.png	0.63600000000000001	567	2016-04-10 04:05:33.642413+00	2016-04-10 04:05:33.713506+00
577	./4e6bdb473ed9c0cc88ee6b943bbcd51d0cfec268d7b523b07091d854.png	0.742999999999999994	568	2016-04-10 04:05:36.193747+00	2016-04-10 04:05:36.275669+00
578	./1634533c6e29cea98b2ac95279eb5dfb1ad0eb53202d6c5a906a841e.png	0.714999999999999969	569	2016-04-10 04:05:38.686723+00	2016-04-10 04:05:38.762881+00
579	./c35bedbecbcbf64573a55f61b645b15a66be02fa6fab58ffb8e1b31b.png	0.743999999999999995	570	2016-04-10 04:05:41.219983+00	2016-04-10 04:05:41.294886+00
580	./9e232abd72db84fd5896f295589dcffc00b2bc4d94b2edb78a392ba9.png	0.702999999999999958	571	2016-04-10 04:05:43.675926+00	2016-04-10 04:05:43.753603+00
581	./6647a3689cb39303e5d929d1c54b71836790ff091736965595bf013b.png	0.819999999999999951	572	2016-04-10 04:05:46.285319+00	2016-04-10 04:05:46.384839+00
582	./9809f03acd0ced567f50b26a617896a1461323a35c8193d827812879.png	0.743999999999999995	573	2016-04-10 04:05:48.808927+00	2016-04-10 04:05:48.892959+00
583	./a24f740414f96f17ceb738fdef981b485e03a0e1f7a8fb84e4df93c6.png	0.736999999999999988	574	2016-04-10 04:05:51.333987+00	2016-04-10 04:05:51.432481+00
584	./996c34ad060c5d3240fe6ee2d8d2957e43c49aa932e3a02c0d95195d.png	0.745999999999999996	575	2016-04-10 04:05:53.906442+00	2016-04-10 04:05:53.992799+00
585	./f7dfed3c58dad601a2232b9d8f0daf2ac9044a1c049a5e7a9aedb65d.png	0.800000000000000044	576	2016-04-10 04:05:56.669228+00	2016-04-10 04:05:56.761122+00
586	./8b63724d7c67ccc4ae1b23416137148f7ac7d8f870757a87bebeaf0e.png	0.745999999999999996	577	2016-04-10 04:05:59.171634+00	2016-04-10 04:05:59.250365+00
587	./a567bb1b84328834fa0c01bd7973993b75de0f13683c88fabd97c07c.png	0.72699999999999998	578	2016-04-10 04:06:01.690684+00	2016-04-10 04:06:01.789078+00
588	./df22f313bb29e40360d2327a80bb9bea6943b50d2a999b0292bf3159.png	0.860999999999999988	579	2016-04-10 04:06:04.424147+00	2016-04-10 04:06:04.500456+00
589	./c32bda79a34f19345da1598a793f485a32a01572143a3b4be2f72390.png	0.825999999999999956	580	2016-04-10 04:06:07.134304+00	2016-04-10 04:06:07.22612+00
590	./9a001a46864dbb59017e0386d22dec5730665f7b844ed3a8fffaccb7.png	0.822999999999999954	581	2016-04-10 04:06:09.839348+00	2016-04-10 04:06:09.916702+00
591	./f802c0cfa2bca940b220c527f0bf22e99c5ed0208c21f272ad50e8b9.png	0.876000000000000001	582	2016-04-10 04:06:12.591226+00	2016-04-10 04:06:12.69017+00
592	./b55f9b9a8e8ee69e94a91ac71ac9868172db2bae199fccc1f6506a27.png	0.867999999999999994	583	2016-04-10 04:06:15.522777+00	2016-04-10 04:06:15.606373+00
593	./8e7b5aca7fd685bd0ff5da976af9d53a1f4b2b61a0c2f60d8a457ea5.png	0.790000000000000036	584	2016-04-10 04:06:18.249099+00	2016-04-10 04:06:18.327784+00
594	./e6d26fcb0814ad503273ab126924eeb5b787c57bf163ebe8371d1a23.png	0.820999999999999952	585	2016-04-10 04:06:20.989607+00	2016-04-10 04:06:21.068452+00
595	./2834c37c668d732426002cc504260653dfa44facc236aa4eb5601cba.png	0.88600000000000001	586	2016-04-10 04:06:23.953481+00	2016-04-10 04:06:24.032396+00
596	./9b9688ef5cb40830a045c753a17b4b382e103f5a62ebe15bce244058.png	0.844999999999999973	587	2016-04-10 04:06:26.85662+00	2016-04-10 04:06:26.936818+00
597	./3b4ca87f622c0d00065e845267fe11c291c99224f773b648f99842a3.png	0.923000000000000043	588	2016-04-10 04:06:29.79626+00	2016-04-10 04:06:29.873979+00
598	./3261acb676b4c2b8c83060bacf45b259af80c1531b9676c0ef65a433.png	1.07099999999999995	589	2016-04-10 04:06:33.069707+00	2016-04-10 04:06:33.149288+00
599	./b07b8763742433132aaa793f11f56eb234317a546d846be3f34d9b4d.png	1.06800000000000006	590	2016-04-10 04:06:36.223182+00	2016-04-10 04:06:36.297991+00
600	./3482592c300935ac998df1705533027c2dde0ddec6b430c48e4b467a.png	1.02000000000000002	591	2016-04-10 04:06:39.353093+00	2016-04-10 04:06:39.433349+00
601	./4acebb24ee52b7c433bab63adbc019d04b2573f006987ae0d5a8a379.png	1.10200000000000009	592	2016-04-10 04:06:42.834726+00	2016-04-10 04:06:42.912231+00
602	./cd1d15334eebc0ab0d8dfe1c1489c196e2ed8b10b185ddbfa19bc760.png	1.06600000000000006	593	2016-04-10 04:06:46.237703+00	2016-04-10 04:06:46.374252+00
603	./dce88c6186c0dcd0fbcde8acb2559c13594799973f045a6d40d62226.png	1.377	594	2016-04-10 04:06:50.319162+00	2016-04-10 04:06:50.394265+00
604	./6fbb8c853efc39d04f0e092e0f5ea039a3d13c86fb060b5fa3306ae5.png	1.21500000000000008	595	2016-04-10 04:06:53.952217+00	2016-04-10 04:06:54.039156+00
605	./db635731194fdd0ac1ab094d4c85b863c571c168f52227c3019ea274.png	1.50800000000000001	596	2016-04-10 04:06:58.298506+00	2016-04-10 04:06:58.37765+00
606	./48ac4e1842bbdeb9596603bb679d227d0837ed865550b05667372a1d.png	1.43599999999999994	597	2016-04-10 04:07:02.520972+00	2016-04-10 04:07:02.5946+00
607	./87c8b1ab74cedbda350225be3dedff29f850e5968104d2a12b9cc482.png	1.58000000000000007	598	2016-04-10 04:07:06.906934+00	2016-04-10 04:07:06.985388+00
608	./478db205dbbf08a87f65ca4795a3a7cc86887e68b2e45615347e9610.png	1.81699999999999995	599	2016-04-10 04:07:12.004394+00	2016-04-10 04:07:12.086892+00
609	./f4cb44f630d469208ec43958b1d590aa490377eff4af4f4961554001.png	1.623	600	2016-04-10 04:07:17.087057+00	2016-04-10 04:07:17.183328+00
610	./6064117e3a43a3539b5909ef9d86937255eebe0e6f5cc2fcb50b2a6e.png	1.32699999999999996	601	2016-04-10 04:07:20.87989+00	2016-04-10 04:07:20.959946+00
611	./910d9d4d0baf4d83ea8e3ee91c2714003643f3a06eaed63ed2959d07.png	1.64999999999999991	602	2016-04-10 04:07:25.417845+00	2016-04-10 04:07:25.491981+00
612	./b343bbe160ad2aa97e15afa90294fa77da9001228f9fa78e1da34464.png	2.1469999999999998	603	2016-04-10 04:07:30.904645+00	2016-04-10 04:07:30.983462+00
613	./00363e449baafd09b9bfdceb9f42c9e679aaf4d21450895c50cda32f.png	1.4930000000000001	604	2016-04-10 04:07:35.8377+00	2016-04-10 04:07:35.917609+00
614	./c18aab1641c60bf4158b9829e5b39ec3d2461f5ddf80f292d350299a.png	1.42799999999999994	605	2016-04-10 04:07:39.731046+00	2016-04-10 04:07:39.821261+00
615	./76aa1f51e0382e5e13640e6f3489c7a67832c2b3faac2918a85db50f.png	1.48199999999999998	606	2016-04-10 04:07:44.338184+00	2016-04-10 04:07:44.421702+00
616	./b66b3016e3d8c656d54b7493d5bca0d676982c5ee9bd5e0e38d8b996.png	1.35200000000000009	607	2016-04-10 04:07:48.071278+00	2016-04-10 04:07:48.143122+00
617	./651e35f3f980360ae8b5bf692ceb5d973916e45c086981ba53ee2742.png	1.56800000000000006	608	2016-04-10 04:07:52.57016+00	2016-04-10 04:07:52.646583+00
618	./c424958106be8699fa1562886906c8dd1628d323186af6202258af9f.png	1.28000000000000003	609	2016-04-10 04:07:56.084863+00	2016-04-10 04:07:56.162878+00
619	./281257fc5f93086fb6816b69ee9a925a4f9492fdf2be7ddd7a85cbdb.png	1.47500000000000009	610	2016-04-10 04:08:00.531503+00	2016-04-10 04:08:00.631281+00
620	./0a554b8a0d3bcb475bd35ce2ad0310270efe276c9656480bc0fd25a5.png	1.21999999999999997	611	2016-04-10 04:08:04.726507+00	2016-04-10 04:08:04.815282+00
621	./9d33dcf18fbce37291add50b4451d5880894385febf938b91a8295fe.png	1.89700000000000002	612	2016-04-10 04:08:09.680616+00	2016-04-10 04:08:09.759217+00
622	./e665b67340d1b344460e9cacebf341098d10bb6aaefbce875aa99685.png	1.52200000000000002	613	2016-04-10 04:08:14.588668+00	2016-04-10 04:08:14.670725+00
623	./81d57a295fcb4b30f0347e4b2bbdc6b46517ccf48420b66aaef0dc18.png	1.64399999999999991	614	2016-04-10 04:08:18.941917+00	2016-04-10 04:08:19.016695+00
624	./60b41bbbc3037f6e2d07101e3291515a3cd877a0144a231dc002ab2f.png	1.252	615	2016-04-10 04:08:22.810514+00	2016-04-10 04:08:22.887773+00
625	./5e4366ff479b00656704c87711bccafe104252a527af94dfee4192fd.png	1.43500000000000005	616	2016-04-10 04:08:27.571622+00	2016-04-10 04:08:27.646995+00
626	./d59f5b4f6af85e1c5dd87868c5ae87eca7bbb5ec67ec3be34285a5ef.png	1.96500000000000008	617	2016-04-10 04:08:32.488892+00	2016-04-10 04:08:32.582436+00
627	./4fb97a5524d3703022781b94c182f42fa656ce2d276d892005c9265f.png	1.96199999999999997	618	2016-04-10 04:08:37.316789+00	2016-04-10 04:08:37.396747+00
628	./9e1c9f3725a6ca6faaaf32a330d0404161af13bcc1c245dd339e7a1d.png	2.08099999999999996	619	2016-04-10 04:08:41.902039+00	2016-04-10 04:08:41.981422+00
629	./786c1eb7bb9eb502751099c80cef0877d40411dac541e68ed023a829.png	1.55099999999999993	620	2016-04-10 04:08:45.866341+00	2016-04-10 04:08:45.945576+00
630	./6675b4c65571699491f2afafdfb5880a833c0c7f52c4a8898d9d18e6.png	1.53499999999999992	621	2016-04-10 04:08:50.393146+00	2016-04-10 04:08:50.470635+00
631	./6666500e1a7a0cd05ee14baa0641ed4dd33fea6a3e7e4c06b8626eeb.png	1.59299999999999997	622	2016-04-10 04:08:54.866007+00	2016-04-10 04:08:54.942011+00
632	./3d606be5fd1e0fcbf7b81f1b910fd8aa0100bf28716691623ca3b7c5.png	1.28499999999999992	623	2016-04-10 04:08:59.133984+00	2016-04-10 04:08:59.216542+00
633	./a3362d67ab1feae7ed497e68585587a845b7a6ba9547c4caa004fb00.png	1.77499999999999991	624	2016-04-10 04:09:03.61204+00	2016-04-10 04:09:03.691194+00
634	./3b32dab2df0142a01af0ad206341598696b11cf21c1d84959f441392.png	1.56000000000000005	625	2016-04-10 04:09:07.604185+00	2016-04-10 04:09:07.686488+00
635	./e9addfd3c6ffcd7daa1d6d6283ed822c262442b17e5e1436c62a0151.png	2.06700000000000017	626	2016-04-10 04:09:12.142789+00	2016-04-10 04:09:12.242171+00
636	./c4d3b0102ce0ee417ab4a61c5ea4bcb4ed55f2facadf5633c561bf56.png	1.70599999999999996	627	2016-04-10 04:09:16.71744+00	2016-04-10 04:09:16.787881+00
637	./3f86693624946cf6578e15a697358ba699d9518181946f5809b95a09.png	1.53000000000000003	628	2016-04-10 04:09:21.40683+00	2016-04-10 04:09:21.482507+00
638	./82fd77fdee798ccab2bfdab6eca3bcd2ef6a0c14ec3a000ad46aa3a6.png	1.30299999999999994	629	2016-04-10 04:09:26.531404+00	2016-04-10 04:09:26.609818+00
639	./a165f317d5bad91f4ea24b0c9a91eda862a58b2061990437c4aea729.png	2.26100000000000012	630	2016-04-10 04:09:32.047005+00	2016-04-10 04:09:32.119406+00
640	./02295596d42ec1ca3d10e343301ee27e51f01218f75a4e612ce5c540.png	1.6180000000000001	631	2016-04-10 04:09:37.270389+00	2016-04-10 04:09:37.352157+00
641	./033e99ad65b66e2ef9d8a726b513979ef6c02012708ae23fd8170a1a.png	2.04800000000000004	632	2016-04-10 04:09:42.678667+00	2016-04-10 04:09:42.754076+00
642	./0af940837ae9d76d076827baec10014c790b2b133d9af10f86be7403.png	1.96599999999999997	633	2016-04-10 04:09:47.599492+00	2016-04-10 04:09:47.68393+00
643	./803bec1421a523ead2838c3d4240298d49a4cdf9190b4a31752ebea3.png	1.52899999999999991	634	2016-04-10 04:09:53.123935+00	2016-04-10 04:09:53.199621+00
644	./306731825b7e2daf04f15dea4ee3a2ac0aec935f32b70685a287e952.png	2.03299999999999992	635	2016-04-10 04:09:58.133778+00	2016-04-10 04:09:58.210688+00
645	./427802fa94743b3e0d568011b2c39a992cce65a356ea646311994904.png	1.54699999999999993	636	2016-04-10 04:10:03.592363+00	2016-04-10 04:10:03.664733+00
646	./575a9d1992603efc2455b059d520bc9444b5d11ef3425d556e138433.png	1.8680000000000001	637	2016-04-10 04:10:08.507606+00	2016-04-10 04:10:08.592761+00
647	./bf90fb1254183e11b9e3963a43cedcfcae3b8e2917d5185b32ed4b42.png	2.0259999999999998	638	2016-04-10 04:10:14.024226+00	2016-04-10 04:10:14.108235+00
648	./b5f5ba174a68badbed189b349489cdbd228e9a6c3ef63fb71611ee07.png	1.46799999999999997	639	2016-04-10 04:10:19.253087+00	2016-04-10 04:10:19.356771+00
649	./a076f9b11027ddbada58a41c229b06adc0a73304bb54ad3e556c34ba.png	2.0089999999999999	640	2016-04-10 04:10:24.180473+00	2016-04-10 04:10:24.287034+00
650	./7da2b23aaab8f9583acf23af57ae625778459c8778fec6cb1f77b821.png	1.82499999999999996	641	2016-04-10 04:10:29.468545+00	2016-04-10 04:10:29.553535+00
651	./14e66a0f5b19929427618b47623f80c9e3f8ebd6d44811400313cc07.png	1.78699999999999992	642	2016-04-10 04:10:35.225001+00	2016-04-10 04:10:35.323824+00
652	./9a0a934753a8cf68c3fadb2b6f9853dbf1f182e7ac974a431797b498.png	1.72799999999999998	643	2016-04-10 04:10:40.8031+00	2016-04-10 04:10:40.879+00
653	./e50c220845723687df048c76296fd7a5fd08ba7f334b72fd690ed152.png	1.72799999999999998	644	2016-04-10 04:10:45.689411+00	2016-04-10 04:10:45.768206+00
654	./b082bdfc467b4b61da4abf8bf7abdd1a9b1bb628ad43cb4c83115892.png	2.03799999999999981	645	2016-04-10 04:10:51.066109+00	2016-04-10 04:10:51.143287+00
655	./d6689fce97e1cb1d977c623a9fa400baf0b82a6bdd095377d7b1d127.png	2.09600000000000009	646	2016-04-10 04:10:56.858846+00	2016-04-10 04:10:56.931445+00
656	./fab72f56c4ab997ec35f82ab0b23ba5e3690d322d22be2819bd61562.png	2.17600000000000016	647	2016-04-10 04:11:02.489772+00	2016-04-10 04:11:02.569426+00
657	./cd2d7909e7cd521107c0b969ca66da745d7947c1c87a9b00f2dfdb2c.png	1.91199999999999992	648	2016-04-10 04:11:08.018391+00	2016-04-10 04:11:08.098231+00
658	./4882ac2073448368e79916d2d7cb2e7086fac9a3a4d0f8b8aec52b82.png	1.95300000000000007	649	2016-04-10 04:11:13.397087+00	2016-04-10 04:11:13.480329+00
659	./a9ef7aa3b123506bb8e858bbb36c1515bf7584b6e7806231dbe4ea38.png	2.19300000000000006	650	2016-04-10 04:11:19.257838+00	2016-04-10 04:11:19.332254+00
660	./f5a950aabe34171035816a30c23aeddeb658702d5b56ca00138f52a3.png	2.14599999999999991	651	2016-04-10 04:11:24.910333+00	2016-04-10 04:11:24.991942+00
661	./a6b08a9b1d18f5439bbb44c9df4971124110cdbdd99b4f25f2dc19cd.png	1.92700000000000005	652	2016-04-10 04:11:30.164884+00	2016-04-10 04:11:30.23699+00
662	./878d253d112b8d54c58ca2d4948e1f9623c9e8952c58722f30e6e9d0.png	2.86799999999999988	653	2016-04-10 04:11:36.411163+00	2016-04-10 04:11:36.519651+00
663	./4fb43aefbc137d0b8da742db6205101e152b35d51851103f5ccae348.png	2.06400000000000006	654	2016-04-10 04:11:42.561274+00	2016-04-10 04:11:42.634421+00
664	./d695d253bdec793792ba7e0c268be76aceb212dae275fec609e8e3f5.png	1.85099999999999998	655	2016-04-10 04:11:48.176951+00	2016-04-10 04:11:48.249322+00
665	./52c65e13a685c3ef9b6ad784ba52ea1d6cdbbc6023d6c8b6b003e9ee.png	3.07500000000000018	656	2016-04-10 04:11:55.054503+00	2016-04-10 04:11:55.133006+00
666	./136f70552f0a45a573a8ae505ebf76a55ba9cf9348af53489b56e282.png	1.97700000000000009	657	2016-04-10 04:12:00.924149+00	2016-04-10 04:12:01.024882+00
667	./23abaa580ad19ad4a5b84f0b0f5fc4fd6a3df70b7f92cb0c00cf80a2.png	2.36299999999999999	658	2016-04-10 04:12:07.581479+00	2016-04-10 04:12:07.658136+00
668	./5c8617c67f6ca315e29bdfd6b955f93244b3f471be3b47ebbc15e5db.png	1.54899999999999993	659	2016-04-10 04:12:13.537882+00	2016-04-10 04:12:13.641451+00
669	./64e338dca9b1485678042b34a8fd93f865c7fea876b0fe2d4e1c4e69.png	2.0259999999999998	660	2016-04-10 04:12:19.679105+00	2016-04-10 04:12:19.751814+00
670	./2f742d02d0392a8fb2028f1f995a27a655adb5cacf6395991bcd40ed.png	1.68599999999999994	661	2016-04-10 04:12:25.383981+00	2016-04-10 04:12:25.465729+00
671	./b31900502b7835c0ece7352d8882875088255f5d4377c0101a409783.png	2.33400000000000007	662	2016-04-10 04:12:31.81264+00	2016-04-10 04:12:31.908928+00
672	./e5b0e585c4ee7ff26b4d269120609ba54b45ba327a9680becfef4331.png	2.90200000000000014	663	2016-04-10 04:12:38.627383+00	2016-04-10 04:12:38.737398+00
673	./ca12274be1511956a3fb0ef3c90727e55f270f2423980e0f83d56dfc.png	3.05399999999999983	664	2016-04-10 04:12:45.524637+00	2016-04-10 04:12:45.597923+00
675	./f9972651197d6dc08e3bbab7b405cb0d8fc0ad9b90766e67e133f111.png	0.474999999999999978	667	2016-04-10 04:18:07.547421+00	2016-04-10 04:18:07.655052+00
676	./86b728a2ab54c33d8215c8d00a6e343b09cb95e4b226ccfb48dd7ce2.png	0.712999999999999967	668	2016-04-10 04:18:10.155145+00	2016-04-10 04:18:10.265182+00
677	./f1d83184f27cfc446b324372414d0e963ac0fa662b02851a15acead9.png	0.682000000000000051	669	2016-04-10 04:18:12.78291+00	2016-04-10 04:18:12.898543+00
678	./8e36527b1e138556299128ef07b4e43cf42b1e5fb2ea3972015f3e70.png	0.548000000000000043	670	2016-04-10 04:18:15.416296+00	2016-04-10 04:18:15.516997+00
679	./ba60c10d5aac542e452344ff74b0a115874e331da819a7c686cd4ab3.png	0.794000000000000039	671	2016-04-10 04:18:18.03833+00	2016-04-10 04:18:18.168426+00
680	./fdf96a8c27101cfea8f27fd4ee4fd8b8ae231e56f263c6693ad14ce1.png	0.744999999999999996	672	2016-04-10 04:18:20.637463+00	2016-04-10 04:18:20.747105+00
681	./371a4b25eeead3309e670ce661cef58df43f1f5075262bd6f67ffcbd.png	0.699999999999999956	673	2016-04-10 04:18:23.245152+00	2016-04-10 04:18:23.372963+00
682	./6efb140fbcd132d3a189bae0f5514fec1dd5faa927933bd2a04aaedc.png	0.646000000000000019	674	2016-04-10 04:18:25.833178+00	2016-04-10 04:18:25.932369+00
683	./f0c65986533897fcd2a28bbdd3c30197dc0c566e96649bc0f45f6c2b.png	0.78400000000000003	675	2016-04-10 04:18:28.449933+00	2016-04-10 04:18:28.585694+00
684	./e4fd235d4a36d1bc0957541f645a456c65182bde3938fa121a7a1bfb.png	0.759000000000000008	676	2016-04-10 04:18:31.083833+00	2016-04-10 04:18:31.225599+00
685	./2fdf3a9197056cfbb3a27723cd93350442e5172b0c2b78441e9b6bb3.png	0.724999999999999978	677	2016-04-10 04:18:33.678416+00	2016-04-10 04:18:33.821076+00
686	./2253884b0bb00ccdd02d5df72cbf6cec6bdd33e61f25528e3866de4f.png	0.782000000000000028	678	2016-04-10 04:18:36.30096+00	2016-04-10 04:18:36.422326+00
687	./d551b55d52549c1311e3638e53e86a0b173845dedc8c8cec08c5c341.png	0.796000000000000041	679	2016-04-10 04:18:38.91008+00	2016-04-10 04:18:39.014022+00
688	./63041fc008bf7b03fecb84bb14d7100a41c8e02dd953afff1fdcf786.png	0.766000000000000014	680	2016-04-10 04:18:41.51933+00	2016-04-10 04:18:41.622162+00
689	./16577c0d6aa785bc2886832cea59290f78b479221922727f8dd0c881.png	0.739999999999999991	681	2016-04-10 04:18:44.167133+00	2016-04-10 04:18:44.27738+00
690	./08a4da0aebb3c3ab76d05a0f2686d007210cfc98f8eaef6e75826562.png	0.783000000000000029	682	2016-04-10 04:18:46.809304+00	2016-04-10 04:18:46.933903+00
691	./243ccb9fd8fdf1273eb4e3870e9ef796a1490894e748c6e6c0b656a6.png	0.717999999999999972	683	2016-04-10 04:18:49.388887+00	2016-04-10 04:18:49.511639+00
692	./283e9bb0789e8164e7b6483701d1fb4160c87f19b4ed1a67ca68549a.png	0.778000000000000025	684	2016-04-10 04:18:52.019802+00	2016-04-10 04:18:52.151258+00
693	./1ba63863351d07d9c90b0aba4ece5be2a015e7dfcfda0d07c2c0c41a.png	0.774000000000000021	685	2016-04-10 04:18:54.674058+00	2016-04-10 04:18:54.780309+00
694	./98973275d4c1b07b0e875e9836938e56ef6e446a8d30434bbd033197.png	0.782000000000000028	686	2016-04-10 04:18:57.316355+00	2016-04-10 04:18:57.421095+00
695	./ee799b3210c96c2f8217c4ce39aabb7ad50f2e3c7fa484d2b6d8d589.png	0.733999999999999986	687	2016-04-10 04:18:59.994059+00	2016-04-10 04:19:00.105476+00
696	./d0d4b178f623c32261e86d868f88a33a7859c3cce986151749264f0f.png	0.766000000000000014	688	2016-04-10 04:19:02.646908+00	2016-04-10 04:19:02.763484+00
697	./c4da7277fd0d1dc950ed78e58e2a9a7283ef34512d52d3f7eaa6a992.png	0.780000000000000027	689	2016-04-10 04:19:05.281074+00	2016-04-10 04:19:05.387752+00
698	./b4232be471ddc68b5bce3e0033b3cfa219b63043ec0b96c9bb651dd3.png	0.771000000000000019	690	2016-04-10 04:19:07.917609+00	2016-04-10 04:19:08.031345+00
699	./db2df85cd444b7dbb6d80a0e05eeb79321726d1a5da81209cc79611f.png	0.782000000000000028	691	2016-04-10 04:19:10.556962+00	2016-04-10 04:19:10.660628+00
700	./95d091b2c0f0bf004f1aa796d7d480c290ca5b3a2ec3b85f8a536bd6.png	0.760000000000000009	692	2016-04-10 04:19:13.162486+00	2016-04-10 04:19:13.273153+00
701	./0c0fe6f152d33e71fb1842b4aea8cda59ba242c2ac589c5cb19e33c6.png	0.792000000000000037	693	2016-04-10 04:19:15.759316+00	2016-04-10 04:19:15.861431+00
702	./8e895e907fa580f35c40d1a1ccad23a18fd3d29f7ac9c07aea99b7e7.png	0.767000000000000015	694	2016-04-10 04:19:18.413512+00	2016-04-10 04:19:18.522745+00
703	./c78fd6eb74d775458d48bd3a175574aee75af787df4645f17736c3c5.png	0.770000000000000018	695	2016-04-10 04:19:21.021378+00	2016-04-10 04:19:21.137624+00
704	./d3b34d71a40512a59c436bce64984603a46cd709e9f5920d4df020c4.png	0.767000000000000015	696	2016-04-10 04:19:23.658987+00	2016-04-10 04:19:23.919633+00
705	./c9aeb6aae97ec7e7d0c91545933cc254835344f0b00a9cb6269f796e.png	0.777000000000000024	697	2016-04-10 04:19:26.304292+00	2016-04-10 04:19:26.441994+00
706	./4bfdfe42b9d0937db5346b8ba3d768c990bd32658b8b7fd7b4952c1e.png	0.747999999999999998	698	2016-04-10 04:19:28.926967+00	2016-04-10 04:19:29.047035+00
707	./a8e41ca94e123181db31f0b836679888f76c067b532fe4fc82130e12.png	0.758000000000000007	699	2016-04-10 04:19:31.541434+00	2016-04-10 04:19:31.647675+00
708	./8a7f2f7846c049aa115391374a8a714035f7020b351ed0609d23d7a1.png	0.770000000000000018	700	2016-04-10 04:19:34.113255+00	2016-04-10 04:19:34.214562+00
709	./f87735a28598d18821f1f35d5292d6a720a4262f4ed387f938aaed70.png	0.771000000000000019	701	2016-04-10 04:19:36.759935+00	2016-04-10 04:19:36.874793+00
710	./14daa1260a3c79b71346573ab38da3a834d6b8316ba85163c416b041.png	0.728999999999999981	702	2016-04-10 04:19:39.379663+00	2016-04-10 04:19:39.483788+00
711	./a27f53403047dc474b80ccf17bcf3b6502070a605e1564eb2f583c1d.png	0.720999999999999974	703	2016-04-10 04:19:41.994824+00	2016-04-10 04:19:42.102923+00
712	./1c6bae098a40a4a58e9825367f3725f52f318b689397936304b1121a.png	0.755000000000000004	704	2016-04-10 04:19:44.621307+00	2016-04-10 04:19:44.720291+00
713	./08050bcb2da44b561fe7af54331324957d091746bfd0c8785e5b4467.png	0.758000000000000007	705	2016-04-10 04:19:47.223205+00	2016-04-10 04:19:47.328786+00
714	./918aad9090d2d7c215316d09543d883463b388fa5d22ff40cbdc53b2.png	0.719999999999999973	706	2016-04-10 04:19:49.832655+00	2016-04-10 04:19:49.940546+00
715	./aa66a2a06d02d85d75135d7f8dfa0b00c63b10130b5d43ba03719d97.png	0.762000000000000011	707	2016-04-10 04:19:52.447903+00	2016-04-10 04:19:52.559627+00
716	./48c73bf0478b1a83803f820e7c27c50a9c6e844b216f2d41957fc24b.png	0.799000000000000044	708	2016-04-10 04:19:55.14251+00	2016-04-10 04:19:55.243488+00
717	./3a1d971af01215a6ea2a372f549e28a9f2503efd3632ee9683dc7e9c.png	0.492999999999999994	710	2016-04-10 04:20:31.869047+00	2016-04-10 04:20:31.991789+00
718	./986e21541666e35c20a28477a22a05f166c7f6a55325c9b6e68d4ef7.png	0.561000000000000054	711	2016-04-10 04:20:34.496956+00	2016-04-10 04:20:34.604485+00
719	./6f1b5a366b1b8bf915af626752f71962c39c24708e723ea19f9fc6b0.png	0.671000000000000041	712	2016-04-10 04:20:37.110458+00	2016-04-10 04:20:37.212451+00
720	./b0aaeac7aa78086c325c80a318d5256248f989b65a4c02c20db9c640.png	0.403000000000000025	713	2016-04-10 04:20:39.720483+00	2016-04-10 04:20:39.824539+00
721	./35f9189a9ee8c65b909ea7dce6e1018c5d84ad8f9872afb5f426398b.png	0.732999999999999985	714	2016-04-10 04:20:42.391992+00	2016-04-10 04:20:42.502018+00
722	./1141d8cb2e55f280e6d3052f1336779190a33991d041821637cee5cb.png	0.744999999999999996	715	2016-04-10 04:20:45.046002+00	2016-04-10 04:20:45.16817+00
723	./cca0e78772a343e74380782277496ab47ac7a7b4990ee968cc998eee.png	0.744999999999999996	716	2016-04-10 04:20:47.679192+00	2016-04-10 04:20:47.790262+00
724	./62a8b82d9a5c057f25eb7ac796c9d03e8aa10f0a3b95624c3f46b46d.png	0.752000000000000002	717	2016-04-10 04:20:50.331743+00	2016-04-10 04:20:50.440749+00
725	./42d42f8cb9a96a309b6c627f3a568a01ef38ed0cee98dc4d5e77fe6e.png	0.763000000000000012	718	2016-04-10 04:20:52.965205+00	2016-04-10 04:20:53.080619+00
726	./fb8a84a24b9def2c574911d5c1b426d30b067c82237a1c2f49db02e8.png	0.740999999999999992	719	2016-04-10 04:20:55.6059+00	2016-04-10 04:20:55.714516+00
727	./ec018f8297383a39539c11551b1778ea01619a88950a139016e8794d.png	0.785000000000000031	720	2016-04-10 04:20:58.287134+00	2016-04-10 04:20:58.400158+00
728	./450ddd7b2fa4f0d0ddbd7ac805e7634526b0a923e5cde0943b5e84f9.png	0.766000000000000014	721	2016-04-10 04:21:00.963721+00	2016-04-10 04:21:01.08068+00
729	./840d2f73d5da94861c31af674eda481998480651f22351deb1d34020.png	0.746999999999999997	722	2016-04-10 04:21:03.601711+00	2016-04-10 04:21:03.723419+00
730	./ece1c48991b1d3e817694fa4fe2b2f62f5f685906e894c90fe26645a.png	0.737999999999999989	723	2016-04-10 04:21:06.293143+00	2016-04-10 04:21:06.424777+00
731	./5d942a4056ded55589ab921553126ba7391fb4cdf17fe8119acefb76.png	0.742999999999999994	724	2016-04-10 04:21:08.941165+00	2016-04-10 04:21:09.060114+00
732	./01acef58ebb19dc0092dd6223c8bc7be55fb1c6b837515dc840d42bd.png	0.774000000000000021	725	2016-04-10 04:21:11.579532+00	2016-04-10 04:21:12.057981+00
733	./53b1807b617e4464d936bf31194a618f106d19266ae6771e3c57b75c.png	0.760000000000000009	726	2016-04-10 04:21:14.285139+00	2016-04-10 04:21:14.396148+00
734	./b25281711a34953bd3fd78f2593aaed31a2cf86d98104ebe6e4a583d.png	0.794000000000000039	727	2016-04-10 04:21:16.938081+00	2016-04-10 04:21:17.050683+00
735	./de2d8fa414c0c34c3294045ae7dacaa4b11d0f1b5811edfdde84a16d.png	0.728999999999999981	728	2016-04-10 04:21:19.622717+00	2016-04-10 04:21:19.737495+00
736	./c0c8ca96d4b39d7b6f43ddfd7bda13d053588f77f473715c67d237ca.png	0.743999999999999995	729	2016-04-10 04:21:22.283989+00	2016-04-10 04:21:22.420455+00
737	./16a99b9b01eadb2891d84fb7a4f0589221cc5b39bd88a0d3ed4286bf.png	0.822999999999999954	730	2016-04-10 04:21:25.05323+00	2016-04-10 04:21:25.167881+00
738	./fbb1ea7ae468d41152f8bd2c53a98ce585e1406527db8fa0a8724739.png	0.683000000000000052	731	2016-04-10 04:21:27.737603+00	2016-04-10 04:21:27.854205+00
739	./2a960cad8a25254faeb728c117299b5b6d79d84f749a9f4a561f6499.png	0.735999999999999988	732	2016-04-10 04:21:30.406038+00	2016-04-10 04:21:30.51463+00
740	./d11c4916482ca0597c4e16fd054e7fe2531f5a81c3ba4edf23b984a5.png	0.747999999999999998	733	2016-04-10 04:21:33.092861+00	2016-04-10 04:21:33.225866+00
741	./b267c939f2cb30607bd2931f0618c9467197000a0e7b1d5a64ee00bd.png	0.716999999999999971	734	2016-04-10 04:21:35.721607+00	2016-04-10 04:21:35.828322+00
742	./315a87ddd52650bf33fb2c32119f0f29074a6e86b1ddcd476d173521.png	0.740999999999999992	735	2016-04-10 04:21:38.330061+00	2016-04-10 04:21:38.467551+00
743	./5d5db8a67eb16570dda36eb30bf066f3c752874564b3ff734cfcebb2.png	0.76100000000000001	736	2016-04-10 04:21:41.008058+00	2016-04-10 04:21:41.117718+00
744	./489bc6d8908c75588ea241e665fb0b9075a292048427aa73dee078b7.png	0.796000000000000041	737	2016-04-10 04:21:43.645301+00	2016-04-10 04:21:43.809385+00
745	./3c4b1f58fd3491cf87fb63ebca7cc74791b15810b6b65085798ab6a2.png	0.793000000000000038	738	2016-04-10 04:21:46.31224+00	2016-04-10 04:21:46.415945+00
746	./6465b92697e54cd1fd9ff3fe6c21794e539917aa461f517083704987.png	0.779000000000000026	739	2016-04-10 04:21:48.947926+00	2016-04-10 04:21:49.057693+00
747	./4713f993af7712c0dd6547a4406b60a11a7026881a455a2624d39513.png	0.780000000000000027	740	2016-04-10 04:21:51.57907+00	2016-04-10 04:21:51.694839+00
748	./80df44eab221871e6b3b3a14eac8e35bb70cf3b04db156dc703adf7e.png	0.783000000000000029	741	2016-04-10 04:21:54.224832+00	2016-04-10 04:21:54.389394+00
749	./8c44d51bfdb6d9c1ca1cc673cf46d5c1f38973656b358548cdf3a854.png	0.782000000000000028	742	2016-04-10 04:21:56.870789+00	2016-04-10 04:21:57.022138+00
750	./2a4ecc06c4e3da077f7f53a6711fd5a6403852e7f2f6d75f60a75a31.png	0.479999999999999982	744	2016-04-10 04:23:30.983422+00	2016-04-10 04:23:31.101284+00
751	./70193aa1cf301709ac625b8b73e953274b09b6dc565b6fdc25af64bf.png	0.68100000000000005	745	2016-04-10 04:23:33.596436+00	2016-04-10 04:23:33.733036+00
752	./38d5679ec78aac9cdabd080d0a4b0478edc7655d2fe3f235067c4819.png	0.786000000000000032	746	2016-04-10 04:23:36.203725+00	2016-04-10 04:23:36.303092+00
753	./91b130812d37eafffd18f329bfef453a5f31f236a7890d035ec1d02e.png	0.440000000000000002	747	2016-04-10 04:23:38.788722+00	2016-04-10 04:23:38.895665+00
754	./6ec496d020bc019d3a08818a7a3d9f2e49049b489cb0173d9a4d503b.png	0.557000000000000051	748	2016-04-10 04:23:41.425699+00	2016-04-10 04:23:41.565271+00
755	./e714b9ceef0f3c18d886603566955d99e04df5f32185750126c1d182.png	0.741999999999999993	749	2016-04-10 04:23:44.193981+00	2016-04-10 04:23:44.320636+00
756	./bbd65369d7b4f6e82c9ed580f1b5d0cd24d9e399e978102d2a55a26e.png	0.810000000000000053	750	2016-04-10 04:23:46.846059+00	2016-04-10 04:23:46.951795+00
757	./faac5721ba0e2f10b9fb999fc1657f126a139960082f87d577494314.png	0.744999999999999996	751	2016-04-10 04:23:49.459466+00	2016-04-10 04:23:49.583451+00
758	./88c0787b39bbf4e6f884c5486b55962c145efa0a1e0f9686982260b5.png	0.753000000000000003	752	2016-04-10 04:23:52.113949+00	2016-04-10 04:23:52.257403+00
759	./b41fb91086005009f92ef2adef70bf63811d559733c74fbffaf30830.png	0.723999999999999977	753	2016-04-10 04:23:54.753153+00	2016-04-10 04:23:54.876641+00
760	./10ff19a1c196ba29ea8dd67bab12950eef529bc03184beda2fb98eac.png	0.723999999999999977	754	2016-04-10 04:23:57.424078+00	2016-04-10 04:23:57.527121+00
761	./8f8b07f06c7395651985c4d53772efdf9dfc0568cf40e1fbb8704364.png	0.76100000000000001	755	2016-04-10 04:24:00.123342+00	2016-04-10 04:24:00.265068+00
762	./150213c30e4554fc7db4cf0b2b602104cd213dd214bc012bf382256f.png	0.748999999999999999	756	2016-04-10 04:24:02.731267+00	2016-04-10 04:24:02.841504+00
763	./364e03f10c63b1ebffbc05a4d6c692815f19597d30507fac973d91b1.png	0.826999999999999957	757	2016-04-10 04:24:05.36813+00	2016-04-10 04:24:05.492029+00
764	./2595d2599c72440911ab9a0454872021242dab8c430515ba01244626.png	0.740999999999999992	758	2016-04-10 04:24:08.042859+00	2016-04-10 04:24:08.167224+00
765	./c9a899e94210e688565275b8c500f01bbd1f2c95dd3febf0d1ac0a38.png	0.755000000000000004	759	2016-04-10 04:24:10.679059+00	2016-04-10 04:24:10.803267+00
766	./747c43f4051ce184301c60a10565bc9522a2b008d63809ae11608092.png	0.741999999999999993	760	2016-04-10 04:24:13.289849+00	2016-04-10 04:24:13.397057+00
767	./22952029594ec91ea80112076932b56b0877fa648df418591f52e6d0.png	0.744999999999999996	761	2016-04-10 04:24:15.950671+00	2016-04-10 04:24:16.07655+00
768	./140a3ec8d3ac223b94b31877fbf1006d021b7fd3050986e14fcb4056.png	0.780000000000000027	762	2016-04-10 04:24:18.600177+00	2016-04-10 04:24:19.042367+00
773	./07ae0ffec50afb3b69cafd31aac423e9346d551a91f74634e15d277f.png	0	767	2016-04-10 07:57:17.670633+00	2016-04-10 07:57:17.774386+00
774	./45f00659f0952cec18755742b059f9fb3ee5b73b51fc0054b620d8d6.png	0.0950000000000000011	768	2016-04-10 08:39:09.142858+00	2016-04-10 08:39:09.253468+00
775	./d8332c07553936dd0060857e8159b51c10580d9f893c3321b6c1b72d.png	0.235999999999999988	769	2016-04-10 08:56:47.268198+00	2016-04-10 08:56:47.382641+00
776	./0bf2b69aea41d004dbc07213b941e0afd18a3d13ecb40bac73d48059.png	0.096000000000000002	770	2016-04-10 09:00:12.675664+00	2016-04-10 09:00:12.767846+00
777	./af3eacffd8c18467decd0d2ff08aed95c584bf5418eb9e6a7086c39c.png	0.482999999999999985	771	2016-04-10 09:01:07.120204+00	2016-04-10 09:01:07.214276+00
778	./538ec9c92742121bca070b43ccdea5712cef271bbc297b4e8fca4cfb.png	0.149999999999999994	772	2016-04-10 09:22:31.759713+00	2016-04-10 09:22:31.853949+00
779	./6d08bb0112a88326b1c78deec4e37e836884539e22ecd2d928f9569d.png	0	773	2016-04-10 09:22:49.015476+00	2016-04-10 09:22:49.168116+00
780	./b3810b78a01ab8919927621c266c63ef45d695c06457ec15fdc171b8.png	0.431999999999999995	774	2016-04-10 09:25:07.587668+00	2016-04-10 09:25:07.673528+00
781	./f455041934f44ecf74d3b4367b2e66ff7b9f2ab66369532a599bb073.png	0.188	775	2016-04-10 09:25:50.067505+00	2016-04-10 09:25:50.164063+00
782	./5b2a450aa4646918e9b02a83c83f7d5fe98b4e9cb2a56c1c61346360.png	0.208999999999999991	776	2016-04-10 09:43:34.570075+00	2016-04-10 09:43:34.665212+00
783	./4509b03d2cb6d425fec5d63acf363e478d7c1d0f7d1e4462669fafce.png	0	777	2016-04-10 09:50:59.600693+00	2016-04-10 09:50:59.691756+00
784	./984e55b938ee0dbf10e43809b0bc82c84d44dddbed2d1e28355b11f2.png	0	778	2016-04-10 09:54:44.105501+00	2016-04-10 09:54:44.199922+00
803	./9c1bba9d9a4c8154b8d3e8ce4f7a2e12caf8b3afe6a12a2d9581da83.png	0.27300000000000002	663	2016-04-21 05:50:37.65588+00	2016-04-21 05:50:37.909084+00
795	./6cb2c68603f3af0880bc50eefe58d2c13d796441a097226d06909776.png	15.0090000000000003	125	2016-04-12 00:38:43.174647+00	2016-04-12 00:38:43.424091+00
\.


--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_gameinstancesnapshot_id_seq', 803, true);


--
-- Data for Name: game_jslibrary; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_jslibrary (id, name, "scriptPath") FROM stdin;
1	three.js	/static/site/js/lib/three.js
\.


--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_jslibrary_id_seq', 1, true);


--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_plerpingapp_id_seq', 37, true);


--
-- Data for Name: game_savedfunction; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_savedfunction (id, created, updated, source, owner_id, title, language) FROM stdin;
5	2016-03-23 11:04:06.523218+00	2016-03-23 11:04:06.523246+00	function CartesianProduct(A,B) {\r\n    prod = [];\r\n    _.each(A, function(a) {\r\n        _.each(B, function(b) {\r\n            prod.push([a,b]);\r\n        });\r\n    });\r\n    return prod;\r\n}	1	CartesianProduct	javascript
6	2016-03-23 11:06:45.642188+00	2016-03-23 11:06:45.642216+00	function drawAxes() {\r\n\r\nDARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\r\nLIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\r\n\r\nview.viewSize = new Size(Canvas.width, Canvas.height);\r\n\r\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\nx_axis.add(new Point(-view.size.width/2, 0));\r\nx_axis.add(new Point(view.size.width/2, 0));\r\n//x_axis.closed = true;\r\n//project.activeLayer.insertChild(0,x_axis)\r\n\r\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\ny_axis.add(new Point(0, -view.size.height/2));\r\ny_axis.add(new Point(0, view.size.height/2));\r\n\r\nx_lines = [];\r\n_.each(_.range(-10,10), function(n) {\r\n    line = new Path({strokeColor: LIGHT_GREY });\r\n    line.add( new Point(n, view.size.height/2) );\r\n    line.add( new Point(n, -view.size.height/2) );\r\n    //line.closed = true;\r\n    //project.activeLayer.insertChild(0, line);\r\n    x_lines.push( line );\r\n});\r\n\r\ny_lines = [];\r\n_.each(_.range(-10,10), function(n) {\r\n    line = new Path({strokeColor: LIGHT_GREY });\r\n    line.add( new Point(view.size.width/2, n) );\r\n    line.add( new Point(-view.size.width/2, n) );\r\n    //line.closed = true;\r\n    //project.activeLayer.insertChild(0, line);\r\n    y_lines.push( line );\r\n});\r\n\r\nfunction transformToCartesian(lay) {\r\n    lay.transform( new Matrix((view.size.width / 10),0,0,(view.size.height / -10), view.center.x, view.center.y) );\r\n}\r\n\r\ntransformToCartesian(project.activeLayer);\r\n\r\n}	1	drawAxes	javascript
\.


--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_savedfunction_id_seq', 6, true);


--
-- Data for Name: game_seedkeyval; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_seedkeyval (id, key, val, jsonval, ordering, valtype) FROM stdin;
1	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	string
28294	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28295	integer_group	267	{"type": "number", "value": 267, "parsing": false}	1	string
29281	integer_group	840	{"type": "number", "value": 840}	1	string
28296	integer_group	272	{"type": "number", "value": 272, "parsing": false}	1	string
28297	integer_group	269	{"type": "number", "value": 269, "parsing": false}	1	string
29282	integer_group	840	{"type": "number", "value": 840}	1	string
28298	integer_group	273	{"type": "number", "value": 273, "parsing": false}	1	string
28299	integer_group	271	{"type": "number", "value": 271, "parsing": false}	1	string
28300	integer_group	274	{"type": "number", "value": 274, "parsing": false}	1	string
28301	integer_group	266	{"type": "number", "value": 266, "parsing": false}	1	string
28302	integer_group	276	{"type": "number", "value": 276, "parsing": false}	1	string
28303	integer_group	275	{"type": "number", "value": 275, "parsing": false}	1	string
28304	integer_group	278	{"type": "number", "value": 278, "parsing": false}	1	string
28305	integer_group	285	{"type": "number", "value": 285, "parsing": false}	1	string
28306	integer_group	280	{"type": "number", "value": 280, "parsing": false}	1	string
28307	integer_group	277	{"type": "number", "value": 277, "parsing": false}	1	string
28308	integer_group	282	{"type": "number", "value": 282, "parsing": false}	1	string
28309	integer_group	279	{"type": "number", "value": 279, "parsing": false}	1	string
28310	integer_group	281	{"type": "number", "value": 281, "parsing": false}	1	string
28311	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28312	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28313	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28314	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28315	DEGREE2_COEFF	19	{"type": "number", "value": 19, "parsing": false}	5	string
28316	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
22650	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	0	string
28317	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28318	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28319	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28320	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28321	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28322	DEGREE2_COEFF	20	{"type": "number", "value": 20, "parsing": false}	5	string
28323	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28324	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28325	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28326	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28327	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28328	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28329	DEGREE2_COEFF	15	{"type": "number", "value": 15, "parsing": false}	5	string
28330	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28331	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28332	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28333	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28334	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28335	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28336	DEGREE2_COEFF	21	{"type": "number", "value": 21, "parsing": false}	5	string
28337	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28338	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28339	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28340	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28341	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28342	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28343	DEGREE2_COEFF	23	{"type": "number", "value": 23, "parsing": false}	5	string
28344	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28345	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28346	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28347	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28348	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28349	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28350	DEGREE2_COEFF	22	{"type": "number", "value": 22, "parsing": false}	5	string
28351	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28352	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28353	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28354	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28355	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28356	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28357	DEGREE2_COEFF	24	{"type": "number", "value": 24, "parsing": false}	5	string
28358	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28359	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28360	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28361	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28362	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28363	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28364	DEGREE2_COEFF	25	{"type": "number", "value": 25, "parsing": false}	5	string
28365	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28366	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28367	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28368	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28369	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28370	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
29283	integer_group	840	{"type": "number", "value": 840}	1	string
28371	DEGREE2_COEFF	26	{"type": "number", "value": 26, "parsing": false}	5	string
28372	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28373	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28374	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28375	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28376	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28377	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28378	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	5	string
28379	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28380	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28381	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28382	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28383	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28384	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28385	DEGREE2_COEFF	16	{"type": "number", "value": 16, "parsing": false}	5	string
28386	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28387	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28388	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28389	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28390	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28391	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28392	DEGREE2_COEFF	17	{"type": "number", "value": 17, "parsing": false}	5	string
28393	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28394	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28395	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28396	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28397	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28398	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28399	DEGREE2_COEFF	32	{"type": "number", "value": 32, "parsing": false}	5	string
28400	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28401	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28402	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28403	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28404	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28405	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28406	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28407	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28408	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28409	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28410	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28411	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28412	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28413	DEGREE2_COEFF	34	{"type": "number", "value": 34, "parsing": false}	5	string
28414	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28415	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28416	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28417	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28418	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28419	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28420	DEGREE2_COEFF	35	{"type": "number", "value": 35, "parsing": false}	5	string
28421	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28422	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28423	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28424	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28425	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28426	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28427	DEGREE2_COEFF	37	{"type": "number", "value": 37, "parsing": false}	5	string
42827	x	1	{"type": "number", "value": 1}	0	string
28428	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28429	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28430	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28431	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28432	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29284	integer_group	840	{"type": "number", "value": 840}	1	string
22675	height	500	{"type": "number", "value": "500", "parsing": false}	0	string
29285	integer_group	840	{"type": "number", "value": 840}	1	string
29286	integer_group	840	{"type": "number", "value": 840}	1	string
29287	integer_group	840	{"type": "number", "value": 840}	1	string
28433	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28434	DEGREE2_COEFF	36	{"type": "number", "value": 36, "parsing": false}	5	string
28435	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28436	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28437	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28438	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28439	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29288	integer_group	840	{"type": "number", "value": 840}	1	string
28440	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28441	DEGREE2_COEFF	38	{"type": "number", "value": 38, "parsing": false}	5	string
27727	polynomial_degree	5	{"type": "number", "value": 5}	1	string
28442	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28443	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28444	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28445	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28446	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28447	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28448	DEGREE2_COEFF	39	{"type": "number", "value": 39, "parsing": false}	5	string
28449	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28450	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28451	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28452	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28453	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28454	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28455	DEGREE2_COEFF	40	{"type": "number", "value": 40, "parsing": false}	5	string
28456	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28457	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28458	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28459	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28460	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28461	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28462	DEGREE2_COEFF	28	{"type": "number", "value": 28, "parsing": false}	5	string
28463	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28464	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28465	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28466	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28467	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28468	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28469	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	5	string
28470	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28471	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28472	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28473	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28474	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28475	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28476	DEGREE2_COEFF	29	{"type": "number", "value": 29, "parsing": false}	5	string
28477	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28478	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28479	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28480	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28481	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28482	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28483	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	5	string
28484	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28485	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28486	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28487	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28488	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28489	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28490	DEGREE2_COEFF	46	{"type": "number", "value": 46, "parsing": false}	5	string
42828	x^4	1	{"type": "number", "value": 1}	1	string
28491	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28492	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28493	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28494	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28495	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28496	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28497	DEGREE2_COEFF	47	{"type": "number", "value": 47, "parsing": false}	5	string
28498	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28499	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28500	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28501	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28502	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28503	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28504	DEGREE2_COEFF	48	{"type": "number", "value": 48, "parsing": false}	5	string
28505	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28506	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28507	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28508	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28509	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28510	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28511	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	5	string
28512	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28513	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28514	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27728	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
28515	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28516	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28517	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28518	DEGREE2_COEFF	49	{"type": "number", "value": 49, "parsing": false}	5	string
28519	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28520	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28521	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28522	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28523	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28524	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28525	DEGREE2_COEFF	51	{"type": "number", "value": 51, "parsing": false}	5	string
28526	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28527	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28528	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28529	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28530	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28531	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28532	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28533	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28534	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28535	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28536	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28537	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28538	DEGREE1_COEFF	11	{"type": "number", "value": 11, "parsing": false}	4	string
28539	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28540	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28541	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28542	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28543	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28544	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28545	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28546	DEGREE2_COEFF	41	{"type": "number", "value": 41, "parsing": false}	5	string
28547	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28548	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28549	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28550	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28551	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28552	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28553	DEGREE2_COEFF	43	{"type": "number", "value": 43, "parsing": false}	5	string
28554	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28555	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28556	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28557	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28558	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
42829	y	1	{"type": "number", "value": 1}	2	string
28559	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28560	DEGREE2_COEFF	42	{"type": "number", "value": 42, "parsing": false}	5	string
28561	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28562	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28563	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28564	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28565	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28566	DEGREE1_COEFF	15	{"type": "number", "value": 15, "parsing": false}	4	string
28567	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28568	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28569	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28570	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28571	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28572	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28573	DEGREE1_COEFF	18	{"type": "number", "value": 18, "parsing": false}	4	string
28574	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28575	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28576	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28577	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28578	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28579	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28580	DEGREE1_COEFF	17	{"type": "number", "value": 17, "parsing": false}	4	string
28581	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28582	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28583	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28584	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28585	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28586	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28587	DEGREE1_COEFF	20	{"type": "number", "value": 20, "parsing": false}	4	string
28588	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
29289	integer_group	840	{"type": "number", "value": 840}	1	string
28589	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28590	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28591	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28592	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28593	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28594	DEGREE1_COEFF	19	{"type": "number", "value": 19, "parsing": false}	4	string
28595	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28596	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28597	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28598	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28599	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28600	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28601	DEGREE1_COEFF	22	{"type": "number", "value": 22, "parsing": false}	4	string
28602	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28603	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28604	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28605	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28606	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28607	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28608	DEGREE1_COEFF	21	{"type": "number", "value": 21, "parsing": false}	4	string
28609	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28610	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28611	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28612	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28613	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28614	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28615	DEGREE1_COEFF	24	{"type": "number", "value": 24, "parsing": false}	4	string
28616	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28617	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28618	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28619	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28620	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28621	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28622	DEGREE1_COEFF	23	{"type": "number", "value": 23, "parsing": false}	4	string
28623	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28624	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28625	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28626	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28627	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28628	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28629	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	4	string
28630	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28631	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28632	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28633	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28634	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28635	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28636	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	4	string
28637	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28638	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28639	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28640	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28641	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28642	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28643	DEGREE1_COEFF	16	{"type": "number", "value": 16, "parsing": false}	4	string
28644	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28645	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28646	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28647	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28648	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28649	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28650	DEGREE1_COEFF	31	{"type": "number", "value": 31, "parsing": false}	4	string
28651	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28652	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28653	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28654	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28655	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28656	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28657	DEGREE1_COEFF	38	{"type": "number", "value": 38, "parsing": false}	4	string
28658	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28659	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28660	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28661	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28662	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28663	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28664	DEGREE1_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	string
28665	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28666	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28667	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28668	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28669	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28670	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28671	DEGREE1_COEFF	32	{"type": "number", "value": 32, "parsing": false}	4	string
28672	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28673	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28674	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28675	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28676	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28677	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28678	DEGREE1_COEFF	28	{"type": "number", "value": 28, "parsing": false}	4	string
28679	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28680	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28681	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28682	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28683	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28684	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28685	DEGREE1_COEFF	36	{"type": "number", "value": 36, "parsing": false}	4	string
28686	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28687	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28688	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28689	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28690	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28691	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28692	DEGREE1_COEFF	35	{"type": "number", "value": 35, "parsing": false}	4	string
28693	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28694	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28695	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28696	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28697	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28698	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28699	DEGREE1_COEFF	34	{"type": "number", "value": 34, "parsing": false}	4	string
28700	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28701	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28702	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28703	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28704	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28705	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28706	DEGREE1_COEFF	39	{"type": "number", "value": 39, "parsing": false}	4	string
28707	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28708	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28709	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28710	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28711	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28712	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28713	DEGREE1_COEFF	27	{"type": "number", "value": 27, "parsing": false}	4	string
28714	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28715	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28716	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28717	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28718	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28719	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28720	DEGREE1_COEFF	37	{"type": "number", "value": 37, "parsing": false}	4	string
28721	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28722	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28723	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28724	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28725	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28726	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28727	DEGREE1_COEFF	29	{"type": "number", "value": 29, "parsing": false}	4	string
28728	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28729	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28730	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28731	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28732	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28733	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28734	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28735	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	5	string
28736	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28737	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28738	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28739	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28740	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28741	DEGREE1_COEFF	42	{"type": "number", "value": 42, "parsing": false}	4	string
28742	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28743	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28744	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28745	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28746	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28747	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28748	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28749	DEGREE2_COEFF	11	{"type": "number", "value": 11, "parsing": false}	5	string
28750	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28751	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28752	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28753	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28754	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28755	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28756	DEGREE2_COEFF	12	{"type": "number", "value": 12, "parsing": false}	5	string
28757	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28758	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28759	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28760	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28761	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28762	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28763	DEGREE2_COEFF	13	{"type": "number", "value": 13, "parsing": false}	5	string
28764	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28765	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28766	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
42830	y^4	-2	{"type": "number", "value": -2}	3	string
28767	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28768	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28769	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28770	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	5	string
28771	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28772	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28773	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28774	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28775	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28776	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28777	DEGREE2_COEFF	19	{"type": "number", "value": 19, "parsing": false}	5	string
28778	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28779	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28780	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28781	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28782	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28783	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28784	DEGREE2_COEFF	15	{"type": "number", "value": 15, "parsing": false}	5	string
28785	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28786	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28787	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28788	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28789	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28790	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28791	DEGREE2_COEFF	16	{"type": "number", "value": 16, "parsing": false}	5	string
28792	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28793	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28794	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28795	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28796	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28797	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28798	DEGREE2_COEFF	18	{"type": "number", "value": 18, "parsing": false}	5	string
28799	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28800	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28801	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28802	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28803	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28804	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28805	DEGREE2_COEFF	17	{"type": "number", "value": 17, "parsing": false}	5	string
29290	integer_group	840	{"type": "number", "value": 840}	1	string
28806	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28807	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28808	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28809	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28810	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28811	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28812	DEGREE2_COEFF	20	{"type": "number", "value": 20, "parsing": false}	5	string
28813	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28814	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28815	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28816	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28817	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28818	DEGREE1_COEFF	41	{"type": "number", "value": 41, "parsing": false}	4	string
28819	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28820	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28821	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28822	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28823	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28824	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28825	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28826	DEGREE2_COEFF	28	{"type": "number", "value": 28, "parsing": false}	5	string
28827	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28828	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28829	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
28830	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
28831	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
28832	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
28833	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
28834	x^3y	244	{"type": "number", "value": "244", "parsing": false}	6	string
28835	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
28836	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
28837	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
28838	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
28839	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
28840	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
28841	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
28842	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
28843	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
28844	x^5	-19	{"type": "number", "value": -19, "parsing": false}	16	string
28845	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
28846	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
28847	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
28848	y^2	25	{"type": "number", "value": "25", "parsing": false}	20	string
28849	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28850	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28851	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28852	DEGREE1_COEFF	12	{"type": "number", "value": 12, "parsing": false}	4	string
28853	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28854	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28855	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28856	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28857	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28858	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28859	DEGREE1_COEFF	26	{"type": "number", "value": 26, "parsing": false}	4	string
28860	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
28861	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28862	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28863	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28864	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28865	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28866	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28867	DEGREE2_COEFF	22	{"type": "number", "value": 22, "parsing": false}	5	string
28868	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28869	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28870	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28871	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28872	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28873	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28874	DEGREE2_COEFF	23	{"type": "number", "value": 23, "parsing": false}	5	string
28875	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28876	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28877	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28878	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28879	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28880	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28881	DEGREE2_COEFF	24	{"type": "number", "value": 24, "parsing": false}	5	string
28882	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28883	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28884	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28885	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28886	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28887	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
29291	integer_group	840	{"type": "number", "value": 840}	1	string
28888	DEGREE2_COEFF	25	{"type": "number", "value": 25, "parsing": false}	5	string
28889	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
42539	y^2	2	{"type": "number", "value": 2}	5	number
28890	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28891	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28892	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28893	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28894	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28895	DEGREE2_COEFF	26	{"type": "number", "value": 26, "parsing": false}	5	string
28896	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28897	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28898	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28899	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28900	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
28901	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28902	DEGREE2_COEFF	27	{"type": "number", "value": 27, "parsing": false}	5	string
28903	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28904	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
28905	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28906	cellSize	44	{"type": "number", "value": "44", "parsing": false}	2	string
28907	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28908	cellSize	42	{"type": "number", "value": "42", "parsing": false}	2	string
28909	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28910	cellSize	48	{"type": "number", "value": "48", "parsing": false}	2	string
28911	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28912	cellSize	42	{"type": "number", "value": "42", "parsing": false}	2	string
28913	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28914	cellSize	35	{"type": "number", "value": "35", "parsing": false}	2	string
28915	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28916	cellSize	42	{"type": "number", "value": "42", "parsing": false}	2	string
28917	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28918	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28919	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28920	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28921	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
28922	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28923	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28924	x^3y	0	{"type": "number", "value": 0}	1	string
28925	xy	1	{"type": "number", "value": 1}	2	string
28926	y^4	-2	{"type": "number", "value": -2}	3	string
28927	y^5	5	{"type": "number", "value": 5}	4	string
28928	x^2y	1	{"type": "number", "value": 1}	5	string
28929	y^2	2	{"type": "number", "value": 2}	6	string
28930	y^3	3	{"type": "number", "value": 3}	7	string
28931	xy^3	7	{"type": "number", "value": 7}	8	string
28932	xy^2	0	{"type": "number", "value": 0}	9	string
28933	x^3	1	{"type": "number", "value": 1}	10	string
28934	x^2	1	{"type": "number", "value": 1}	11	string
28935	x^3y^2	1	{"type": "number", "value": 1}	12	string
28936	x^4	1	{"type": "number", "value": 1}	13	string
28937	x^5	3	{"type": "number", "value": 3}	14	string
28938	xy^4	1	{"type": "number", "value": 1}	15	string
28939	y	1	{"type": "number", "value": 1}	16	string
28940	x	1	{"type": "number", "value": 1}	17	string
28941	x^2y^3	1	{"type": "number", "value": 1}	18	string
28942	x^2y^2	-13	{"type": "number", "value": -13}	19	string
28943	x^4y	-5	{"type": "number", "value": -5}	20	string
28944	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28945	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28946	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28947	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28948	DEGREE2_COEFF	56	{"type": "number", "value": "56", "parsing": false}	5	string
28949	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28950	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28951	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28952	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28953	COLOR2	#a653d9	{"type": "color", "value": "#a653d9", "parsing": false}	3	string
28954	DEGREE1_COEFF	30	{"type": "number", "value": "30", "parsing": false}	4	string
28955	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	5	string
28956	CHILDREN	[4,6,-5,-7]	{"type": "javascript", "value": "[4,6,-5,-7]", "parsing": false}	6	string
28957	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	7	string
28958	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28959	cellSize	43	{"type": "number", "value": "43", "parsing": false}	2	string
28960	param1	5	{"type": "string", "value": "5", "parsing": false}	1	string
28961	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28962	cellSize	41	{"type": "number", "value": "41", "parsing": false}	2	string
28963	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28964	cellSize	46	{"type": "number", "value": "46", "parsing": false}	2	string
28965	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28966	cellSize	45	{"type": "number", "value": "45", "parsing": false}	2	string
28967	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28968	cellSize	44	{"type": "number", "value": "44", "parsing": false}	2	string
28969	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
28970	cellSize	47	{"type": "number", "value": "47", "parsing": false}	2	string
28971	integer_group	15	{"type": "number", "value": 15, "parsing": false}	1	string
28972	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28973	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28974	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28975	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28976	DEGREE2_COEFF	13	{"type": "number", "value": 13, "parsing": false}	5	string
28977	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28978	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28979	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28980	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28981	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28982	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28983	DEGREE2_COEFF	46	{"type": "number", "value": "46", "parsing": false}	5	string
28984	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28985	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28986	integer_group	189	{"type": "number", "value": 189, "parsing": false}	1	string
28987	integer_group	205	{"type": "number", "value": 205, "parsing": false}	1	string
28988	integer_group	235	{"type": "number", "value": 235, "parsing": false}	1	string
28989	integer_group	304	{"type": "number", "value": 304, "parsing": false}	1	string
28990	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28991	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28992	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28993	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28994	DEGREE2_COEFF	27	{"type": "number", "value": 27, "parsing": false}	5	string
28995	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
28996	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28997	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28998	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28999	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29000	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
29001	DEGREE2_COEFF	55	{"type": "number", "value": "55", "parsing": false}	5	string
29002	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
29003	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
29004	integer_group	17	{"type": "number", "value": 17, "parsing": false}	1	string
29005	integer_group	56	{"type": "number", "value": 56, "parsing": false}	1	string
29006	integer_group	134	{"type": "number", "value": 134, "parsing": false}	1	string
29007	integer_group	156	{"type": "number", "value": 156, "parsing": false}	1	string
29008	integer_group	144	{"type": "number", "value": 144, "parsing": false}	1	string
29009	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29010	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29011	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
29012	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29013	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29014	x^3y	244	{"type": "number", "value": "244", "parsing": false}	6	string
29015	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29016	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29017	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29018	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29019	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29020	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29021	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
29022	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
29023	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
29024	x^5	-17	{"type": "number", "value": -17, "parsing": false}	16	string
29025	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29026	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29027	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29028	y^2	25	{"type": "number", "value": "25", "parsing": false}	20	string
29029	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29030	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29031	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29032	DEGREE1_COEFF	40	{"type": "number", "value": 40, "parsing": false}	4	string
29033	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
29034	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29035	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
29036	x^4	4	{"type": "number", "value": "4", "parsing": false}	1	string
29037	x^2	1	{"type": "number", "value": 1, "parsing": false}	2	string
29038	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
29039	y^5	14	{"type": "number", "value": "14", "parsing": false}	4	string
29040	x^2y	2	{"type": "number", "value": "2", "parsing": false}	5	string
29041	x^3y	2	{"type": "number", "value": "2", "parsing": false}	6	string
29042	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29043	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29044	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29045	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29046	xy	1	{"type": "number", "value": 1, "parsing": false}	11	string
29047	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29048	y^2	2	{"type": "number", "value": 2, "parsing": false}	13	string
29049	x^5	3	{"type": "number", "value": 3, "parsing": false}	14	string
29050	xy^4	1	{"type": "number", "value": 1, "parsing": false}	15	string
29051	y	3	{"type": "number", "value": "3", "parsing": false}	16	string
29052	x	5	{"type": "number", "value": "5", "parsing": false}	17	string
29053	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	18	string
29054	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	19	string
29055	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	20	string
29056	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29057	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29058	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29059	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
29060	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
29061	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29062	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
29063	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29064	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29065	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	3	string
29066	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
29067	DEGREE2_COEFF	21	{"type": "number", "value": 21, "parsing": false}	5	string
29068	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29069	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
29070	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29071	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29072	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
29073	y^5	5	{"type": "number", "value": 5, "parsing": false}	4	string
29074	x^2y	0	{"type": "number", "value": "0", "parsing": false}	5	string
29075	x^3y	0	{"type": "number", "value": 0, "parsing": false}	6	string
29076	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29077	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29078	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29079	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29080	xy	1	{"type": "number", "value": 1, "parsing": false}	11	string
29081	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29082	y^2	2	{"type": "number", "value": 2, "parsing": false}	13	string
29083	xy^4	1	{"type": "number", "value": 1, "parsing": false}	14	string
29084	x^2	1	{"type": "number", "value": 1, "parsing": false}	15	string
29085	x^5	3	{"type": "number", "value": 3, "parsing": false}	16	string
29086	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29087	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29088	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29089	x^4	4	{"type": "number", "value": "4", "parsing": false}	20	string
29090	integer_group	121	{"type": "number", "value": 121, "parsing": false}	1	string
29091	integer_group	117	{"type": "number", "value": 117, "parsing": false}	1	string
29092	integer_group	119	{"type": "number", "value": 119, "parsing": false}	1	string
29093	integer_group	123	{"type": "number", "value": 123, "parsing": false}	1	string
29094	integer_group	131	{"type": "number", "value": 131, "parsing": false}	1	string
29095	integer_group	133	{"type": "number", "value": 133, "parsing": false}	1	string
29096	integer_group	135	{"type": "number", "value": 135, "parsing": false}	1	string
29097	integer_group	21	{"type": "number", "value": 21, "parsing": false}	1	string
29098	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29099	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29100	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29101	DEGREE1_COEFF	14	{"type": "number", "value": 14, "parsing": false}	4	string
29102	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
29103	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29104	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
29105	integer_group	125	{"type": "number", "value": 125, "parsing": false}	1	string
29106	integer_group	127	{"type": "number", "value": 127, "parsing": false}	1	string
29107	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29108	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29109	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29110	DEGREE1_COEFF	30	{"type": "number", "value": 30, "parsing": false}	4	string
29111	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	5	string
29112	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29113	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
29114	integer_group	115	{"type": "number", "value": 115, "parsing": false}	1	string
29115	integer_group	129	{"type": "number", "value": 129, "parsing": false}	1	string
29116	integer_group	113	{"type": "number", "value": 113, "parsing": false}	1	string
29117	xy	1	{"type": "number", "value": 1, "parsing": false}	1	string
29118	y^2	2	{"type": "number", "value": 2, "parsing": false}	2	string
29119	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
29120	y^5	0	{"type": "number", "value": "0", "parsing": false}	4	string
29121	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29122	x^3y	2	{"type": "number", "value": "2", "parsing": false}	6	string
29123	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29124	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29125	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29126	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29127	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29128	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29129	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
29130	x^5	0	{"type": "number", "value": "0", "parsing": false}	14	string
29131	xy^4	0	{"type": "number", "value": "0", "parsing": false}	15	string
29132	y	3	{"type": "number", "value": "3", "parsing": false}	16	string
29133	x	5	{"type": "number", "value": "5", "parsing": false}	17	string
29134	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	18	string
29135	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	19	string
29136	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	20	string
29137	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29138	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29139	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
29140	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29141	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29142	x^3y	244	{"type": "number", "value": "244", "parsing": false}	6	string
29143	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29144	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29145	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29146	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29147	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29148	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29149	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
29150	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
29151	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
29152	x^5	0	{"type": "number", "value": "0", "parsing": false}	16	string
29153	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29154	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29155	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29156	y^2	25	{"type": "number", "value": "25", "parsing": false}	20	string
29157	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
29158	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
29159	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
29160	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
29161	DEGREE2_COEFF	47	{"type": "number", "value": "47", "parsing": false}	5	string
29162	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
29163	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
29164	integer_group	268	{"type": "number", "value": 268, "parsing": false}	1	string
29165	integer_group	78	{"type": "number", "value": 78, "parsing": false}	1	string
29166	xMin	-5	{"type": "number", "value": -5}	1	string
29167	funct	cos(2x) + x^5	{"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}	2	string
29168	xMax	5	{"type": "number", "value": 5}	3	string
29169	breathDelta	17	{"type": "number", "value": 17}	4	string
29170	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
29171	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
29172	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	3	string
29173	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": "15", "parsing": false}	4	string
29174	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
29175	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	6	string
29176	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	7	string
29177	integer_group	202	{"type": "number", "value": 202, "parsing": false}	1	string
29178	x1	5	5	1	string
29179	integer_group	145	{"type": "number", "value": 145, "parsing": false}	1	string
29180	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29181	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29182	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
29183	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29184	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29185	x^3y	45	{"type": "number", "value": "45", "parsing": false}	6	string
29186	y^3	-15	{"type": "number", "value": "-15", "parsing": false}	7	string
29187	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29188	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29189	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29190	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29191	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29192	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
29193	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
29194	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
29195	x^5	0	{"type": "number", "value": "0", "parsing": false}	16	string
29196	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29197	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29198	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29199	y^2	25	{"type": "number", "value": "25", "parsing": false}	20	string
29200	integer_group	146	{"type": "number", "value": 146, "parsing": false}	1	string
29201	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29202	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29203	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
29204	y^5	0	{"type": "number", "value": "0", "parsing": false}	4	string
29205	x^2y	2	{"type": "number", "value": "2", "parsing": false}	5	string
29206	x^3y	2	{"type": "number", "value": "2", "parsing": false}	6	string
29207	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29208	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29209	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29210	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29211	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29212	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29213	x^4	4	{"type": "number", "value": "4", "parsing": false}	13	string
29214	xy^4	1	{"type": "number", "value": 1, "parsing": false}	14	string
29215	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
29216	x^5	0	{"type": "number", "value": "0", "parsing": false}	16	string
29217	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29218	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29219	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29220	y^2	2	{"type": "number", "value": 2, "parsing": false}	20	string
29221	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29222	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29223	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
29224	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29225	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29226	x^3y	244	{"type": "number", "value": "244", "parsing": false}	6	string
29227	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29228	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29229	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29230	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29231	x^2	1	{"type": "number", "value": 1, "parsing": false}	11	string
29232	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29233	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	13	string
29234	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
29235	xy	1	{"type": "number", "value": 1, "parsing": false}	15	string
29236	x^5	-18	{"type": "number", "value": -18, "parsing": false}	16	string
29237	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29238	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29239	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29240	y^2	25	{"type": "number", "value": "25", "parsing": false}	20	string
29241	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	1	string
29242	x^2	1	{"type": "number", "value": 1, "parsing": false}	2	string
29243	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	3	string
29244	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29245	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29246	x^3y	244	{"type": "number", "value": "244", "parsing": false}	6	string
29247	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29248	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29249	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29250	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29251	xy	1	{"type": "number", "value": 1, "parsing": false}	11	string
29252	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29253	y^2	25	{"type": "number", "value": "25", "parsing": false}	13	string
29254	x^5	0	{"type": "number", "value": "0", "parsing": false}	14	string
29255	xy^4	0	{"type": "number", "value": "0", "parsing": false}	15	string
29256	y	3	{"type": "number", "value": "3", "parsing": false}	16	string
29257	x	5	{"type": "number", "value": "5", "parsing": false}	17	string
29258	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	18	string
29259	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	19	string
29260	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	20	string
29261	x	5	{"type": "number", "value": "5", "parsing": false}	1	string
29262	y	3	{"type": "number", "value": "3", "parsing": false}	2	string
29263	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
29264	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	4	string
29265	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
29266	x^3y	2	{"type": "number", "value": "2", "parsing": false}	6	string
29267	y^3	3	{"type": "number", "value": 3, "parsing": false}	7	string
29268	xy^3	7	{"type": "number", "value": 7, "parsing": false}	8	string
29269	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
29270	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
29271	xy	1	{"type": "number", "value": 1, "parsing": false}	11	string
29272	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
29273	y^2	2	{"type": "number", "value": 2, "parsing": false}	13	string
29274	xy^4	0	{"type": "number", "value": "0", "parsing": false}	14	string
29275	x^2	1	{"type": "number", "value": 1, "parsing": false}	15	string
29276	x^5	0	{"type": "number", "value": "0", "parsing": false}	16	string
29277	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	string
29278	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	string
29279	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	string
29280	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	20	string
29292	integer_group	425	{"type": "number", "value": 425, "parsing": false}	1	string
20769	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	0	string
27726	DEGREE1_COEFF	35	{"type": "number", "value": 35, "parsing": false}	4	string
27729	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	2	string
27730	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27731	funct	x^5 +  cos(x) * sin(2x)	{"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}	4	string
27732	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	string
27733	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	string
27734	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	string
27735	width	600	{"type": "number", "value": "600", "parsing": false}	2	string
27736	height	400	{"type": "number", "value": "400", "parsing": false}	3	string
27737	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	string
27738	width	200	{"type": "number", "value": "200", "parsing": false}	2	string
27739	height	500	{"type": "number", "value": "500", "parsing": false}	3	string
27740	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	string
27741	width	600	{"type": "number", "value": "600", "parsing": false}	2	string
27742	height	300	{"type": "number", "value": "300", "parsing": false}	3	string
27743	polynomial_degree	12	{"type": "number", "value": "12", "parsing": false}	1	string
27744	x_min	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27745	func1	x cos(x) + (1/5) cos(10x)	{"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "string": "x cos(x) + (1/5) cos(10x)", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "value": "x cos(x) + (1/5) cos(10x)", "parsing": false, "type": "math"}	2	string
27746	x_max	5	{"type": "number", "value": 5, "parsing": false}	3	string
27747	solutionPathColor	#3673ab	{"type": "color", "value": "#3673ab", "parsing": false}	1	string
27748	cellSize	15	{"type": "number", "value": "15", "parsing": false}	2	string
27749	polynomial_degree	7	{"type": "number", "value": "7", "parsing": false}	1	string
27750	x_min	-10	{"type": "number", "value": "-10", "parsing": false}	1	string
27751	func1	(1/x) cos(x)	{"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "string": "(1/x) cos(x)", "javascript": "Math.cos(x)/x", "value": "(1/x) cos(x)", "parsing": false, "type": "math"}	2	string
27752	x_max	10	{"type": "number", "value": "10", "parsing": false}	3	string
27753	integer_group	23	{"type": "number", "value": 23, "parsing": false}	1	string
27754	color	#cccc00	{"type": "color", "value": "#cccc00"}	1	string
27755	width	400	{"type": "number", "value": 400}	2	string
27756	height	200	{"type": "number", "value": 200}	3	string
27757	polynomial_degree	8	{"type": "number", "value": "8", "parsing": false}	1	string
27758	solutionPathColor	#6727f0	{"type": "color", "value": "#6727f0", "parsing": false}	1	string
27759	cellSize	45	{"type": "number", "value": "45", "parsing": false}	2	string
27760	integer_group	28	{"type": "number", "value": 28, "parsing": false}	1	string
27761	x_min	-10	{"type": "number", "value": "-10", "parsing": false}	1	string
27762	func1	(1/x^3) cos(2x) + (1/2x)	{"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x^3) cos(2x) + (1/2x)", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "value": "(1/x^3) cos(2x) + (1/2x)", "parsing": false, "type": "math"}	2	string
27763	x_max	10	{"type": "number", "value": "10", "parsing": false}	3	string
27764	solutionPathColor	#cc0055	{"type": "color", "value": "#cc0055"}	1	string
27765	cellSize	30	{"type": "number", "value": 30}	2	string
27766	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27767	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	2	string
27768	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27769	funct	(x^7 - 2x^6)*(1/x)	{"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "string": "(x^7 - 2x^6)*(1/x)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "value": "(x^7 - 2x^6)*(1/x)", "parsing": false, "type": "math"}	4	string
27770	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	1	string
27771	width	400	{"type": "number", "value": 400, "parsing": false}	2	string
27772	height	200	{"type": "number", "value": 200, "parsing": false}	3	string
27773	x_min	-10	{"type": "number", "value": "-10", "parsing": false}	1	string
27774	func1	(1/x) cos(2x) + (1/2x) cos(16x)	{"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "value": "(1/x) cos(2x) + (1/2x) cos(16x)", "parsing": false, "type": "math"}	2	string
27775	x_max	10	{"type": "number", "value": "10", "parsing": false}	3	string
27776	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27777	funct	1/(x^2 - 3x^3)	{"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "string": "1/(x^2 - 3x^3)", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "value": "1/(x^2 - 3x^3)", "parsing": false, "type": "math"}	2	string
27778	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27779	breathDelta	25	{"type": "number", "value": "25", "parsing": false}	4	string
27780	x_min	-5	{"type": "number", "value": -5}	1	string
27781	func1	x cos(x)	{"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}	2	string
27782	x_max	5	{"type": "number", "value": 5}	3	string
27783	integer_group	141	{"type": "number", "value": 141, "parsing": false}	1	string
27784	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27785	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27786	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27787	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27788	DEGREE2_COEFF	11	{"type": "number", "value": 11, "parsing": false}	5	string
27789	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
42831	y^5	5	{"type": "number", "value": 5}	4	string
27790	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27791	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27792	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	2	string
27793	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27864	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27794	funct	x cos(x) + x^7	{"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) + x^7", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "value": "x cos(x) + x^7", "parsing": false, "type": "math"}	4	string
27795	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	1	string
27796	cellSize	40	{"type": "number", "value": "40", "parsing": false}	2	string
27797	integer_group	13	{"type": "number", "value": 13, "parsing": false}	1	string
27798	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27799	funct	3 cos(2x) + sin(3x) cos(5x)	{"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "string": "3 cos(2x) + sin(3x) cos(5x)", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "value": "3 cos(2x) + sin(3x) cos(5x)", "parsing": false, "type": "math"}	2	string
27800	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27801	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	4	string
27802	solutionPathColor	#e6228c	{"type": "color", "value": "#e6228c", "parsing": false}	1	string
27803	cellSize	10	{"type": "number", "value": "10", "parsing": false}	2	string
27804	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27805	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27806	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27807	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	4	string
27808	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
27809	CHILDREN	[4,6,7,17,-8,-9]	{"type": "javascript", "value": "[4,6,7,17,-8,-9]", "parsing": false}	6	string
27810	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
27811	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27812	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27813	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27814	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	4	string
27815	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
27816	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	6	string
27817	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	7	string
27818	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27819	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27820	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27821	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	4	string
27822	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
27823	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27824	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27825	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
27826	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27827	COLOR2	#499948	{"type": "color", "value": "#499948", "parsing": false}	3	string
27828	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27829	DEGREE2_COEFF	30	{"type": "number", "value": "30", "parsing": false}	5	string
27830	CHILDREN	[5,7,-9]	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	6	string
27831	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	7	string
27832	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27833	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27834	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27835	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	4	string
27836	DEGREE2_COEFF	17	{"type": "number", "value": "17", "parsing": false}	5	string
27837	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27838	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
27839	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
27840	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27841	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27842	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
27843	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
27844	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27845	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
27846	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
27847	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27848	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	3	string
27849	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	4	string
27850	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
27851	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	6	string
27852	TRAPEZOIDAL_SECTIONS	10	{"type": "number", "value": "10", "parsing": false}	7	string
27853	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
27854	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27855	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27856	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27857	DEGREE2_COEFF	60	{"type": "number", "value": "60", "parsing": false}	5	string
27858	CHILDREN	[5,7,-9]	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	6	string
27859	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	7	string
27860	integer_group	223	{"type": "number", "value": 223, "parsing": false}	1	string
27861	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27862	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27863	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27865	DEGREE2_COEFF	31	{"type": "number", "value": 31, "parsing": false}	5	string
27866	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
27867	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27868	NUM_ITERATIONS	5	{"type": "number", "value": "5", "parsing": false}	1	string
27869	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27870	COLOR2	#499948	{"type": "color", "value": "#499948", "parsing": false}	3	string
27871	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	4	string
27872	DEGREE2_COEFF	30	{"type": "number", "value": "30", "parsing": false}	5	string
27873	CHILDREN	[5,7,8,9]	{"type": "javascript", "value": "[5,7,8,9]", "parsing": false}	6	string
27874	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
27875	NUM_ITERATIONS	5	{"type": "number", "value": "5", "parsing": false}	1	string
27876	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27877	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	3	string
27878	TRAPEZOIDAL_SECTIONS	10	{"type": "number", "value": "10", "parsing": false}	4	string
27879	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
27880	CHILDREN	[4,5,6,-5,-7]	{"type": "javascript", "value": "[4,5,6,-5,-7]", "parsing": false}	6	string
27881	DEGREE1_COEFF	25	{"type": "number", "value": "25", "parsing": false}	7	string
27882	param1		{"type": "string", "value": ""}	1	string
27883	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	1	string
27884	x^2	1	{"type": "number", "value": 1, "parsing": false}	2	string
27885	y^4	-2	{"type": "number", "value": -2, "parsing": false}	3	string
27886	y^5	1	{"type": "number", "value": "1", "parsing": false}	4	string
27887	x^2y	20	{"type": "number", "value": "20", "parsing": false}	5	string
27888	x^3y	2	{"type": "number", "value": "2", "parsing": false}	6	string
27889	y^3	30	{"type": "number", "value": "30", "parsing": false}	7	string
27890	xy^3	-75	{"type": "number", "value": "-75", "parsing": false}	8	string
27891	xy^2	0	{"type": "number", "value": 0, "parsing": false}	9	string
27892	x^3	1	{"type": "number", "value": 1, "parsing": false}	10	string
27893	xy	1	{"type": "number", "value": 1, "parsing": false}	11	string
27894	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	12	string
27895	y^2	2	{"type": "number", "value": 2, "parsing": false}	13	string
27896	x^5	0	{"type": "number", "value": "0", "parsing": false}	14	string
27897	xy^4	0	{"type": "number", "value": "0", "parsing": false}	15	string
27898	y	3	{"type": "number", "value": "3", "parsing": false}	16	string
27899	x	5	{"type": "number", "value": "5", "parsing": false}	17	string
27900	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	18	string
27901	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	19	string
27902	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	20	string
42540	y^3	3	{"type": "number", "value": 3}	6	number
27903	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27904	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27905	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27906	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27907	DEGREE2_COEFF	18	{"type": "number", "value": 18, "parsing": false}	5	string
27908	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
27909	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27910	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	string
27911	funct	1/(x^2+1)	{"latex": "\\\\frac{1}{x^{2} + 1}", "string": "1/(x^2+1)", "javascript": "1/(Math.pow(x, 2) + 1)", "value": "1/(x^2+1)", "parsing": false, "type": "math"}	2	string
27912	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	string
27913	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	4	string
27914	integer_group	57	{"type": "number", "value": 57, "parsing": false}	1	string
27915	integer_group	19	{"type": "number", "value": 19, "parsing": false}	1	string
27916	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27917	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27918	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27919	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
27920	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
27921	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
27922	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	7	string
27923	integer_group	14	{"type": "number", "value": 14, "parsing": false}	1	string
27924	integer_group	41	{"type": "number", "value": 41, "parsing": false}	1	string
27925	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	1	string
27926	width	400	{"type": "number", "value": 400, "parsing": false}	2	string
27927	height	2002	{"type": "number", "value": "2002", "parsing": false}	3	string
27928	NUM_ITERATIONS	6	{"type": "number", "value": "6", "parsing": false}	1	string
27929	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27930	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	3	string
27931	DEGREE1_COEFF	35	{"type": "number", "value": "35", "parsing": false}	4	string
27932	DEGREE2_COEFF	35	{"type": "number", "value": "35", "parsing": false}	5	string
27933	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	6	string
27934	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": "15", "parsing": false}	7	string
27935	integer_group	37	{"type": "number", "value": 37, "parsing": false}	1	string
27936	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27937	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27938	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27939	TRAPEZOIDAL_SECTIONS	25	{"type": "number", "value": "25", "parsing": false}	4	string
27940	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
27941	CHILDREN	[4,6,8,-7,16,18]	{"type": "javascript", "value": "[4,6,8,-7,16,18]", "parsing": false}	6	string
27942	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27943	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27944	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
27945	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27946	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
27947	DEGREE2_COEFF	44	{"type": "number", "value": 44, "parsing": false}	5	string
27948	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
27949	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27950	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27951	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
27952	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27953	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	4	string
27954	DEGREE2_COEFF	45	{"type": "number", "value": "45", "parsing": false}	5	string
27955	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27956	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27957	integer_group	53	{"type": "number", "value": 53, "parsing": false}	1	string
27958	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	1	string
27959	width	400	{"type": "number", "value": 400, "parsing": false}	2	string
27960	height	2002	{"type": "number", "value": "2002", "parsing": false}	3	string
27961	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	1	string
27962	width	400	{"type": "number", "value": 400, "parsing": false}	2	string
27963	height	200	{"type": "number", "value": "200", "parsing": false}	3	string
27964	integer_group	45	{"type": "number", "value": 45, "parsing": false}	1	string
27965	integer_group	24	{"type": "number", "value": 24, "parsing": false}	1	string
27966	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	1	string
27967	width	400	{"type": "number", "value": 400, "parsing": false}	2	string
27968	height	2002	{"type": "number", "value": "2002", "parsing": false}	3	string
27969	x_min	-5	{"type": "number", "value": -5, "parsing": false}	1	string
28036	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
27970	func1	x cos(x) sin(2x)	{"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) sin(2x)", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "value": "x cos(x) sin(2x)", "parsing": true, "type": "math"}	2	string
27971	x_max	5	{"type": "number", "value": 5, "parsing": false}	3	string
27972	integer_group	29	{"type": "number", "value": 29, "parsing": false}	1	string
27973	integer_group	33	{"type": "number", "value": 33, "parsing": false}	1	string
27974	integer_group	49	{"type": "number", "value": 49, "parsing": false}	1	string
27975	integer_group	88	{"type": "number", "value": 88, "parsing": false}	1	string
27976	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27977	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
27978	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27979	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	4	string
27980	DEGREE2_COEFF	48	{"type": "number", "value": "48", "parsing": false}	5	string
27981	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27982	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
27983	integer_group	76	{"type": "number", "value": 76, "parsing": false}	1	string
27984	integer_group	54	{"type": "number", "value": 54, "parsing": false}	1	string
27985	integer_group	82	{"type": "number", "value": 82, "parsing": false}	1	string
27986	integer_group	85	{"type": "number", "value": 85, "parsing": false}	1	string
27987	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
27988	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
27989	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27990	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
27991	DEGREE2_COEFF	52	{"type": "number", "value": "52", "parsing": false}	5	string
27992	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
27993	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
27994	integer_group	38	{"type": "number", "value": 38, "parsing": false}	1	string
27995	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
42832	x^2y	1	{"type": "number", "value": 1}	5	string
27996	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
27997	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
27998	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
27999	DEGREE2_COEFF	53	{"type": "number", "value": "53", "parsing": false}	5	string
28000	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28001	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28002	integer_group	25	{"type": "number", "value": 25, "parsing": false}	1	string
28003	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28004	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28005	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28006	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28007	DEGREE2_COEFF	50	{"type": "number", "value": "50", "parsing": false}	5	string
28008	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28009	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28010	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28011	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28012	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28013	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	4	string
28014	DEGREE2_COEFF	49	{"type": "number", "value": "49", "parsing": false}	5	string
28015	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28016	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	7	string
28017	integer_group	30	{"type": "number", "value": 30, "parsing": false}	1	string
28018	integer_group	50	{"type": "number", "value": 50, "parsing": false}	1	string
28019	integer_group	70	{"type": "number", "value": 70, "parsing": false}	1	string
28020	integer_group	20	{"type": "number", "value": 20, "parsing": false}	1	string
28021	integer_group	61	{"type": "number", "value": 61, "parsing": false}	1	string
28022	integer_group	42	{"type": "number", "value": 42, "parsing": false}	1	string
28023	integer_group	58	{"type": "number", "value": 58, "parsing": false}	1	string
28024	integer_group	64	{"type": "number", "value": 64, "parsing": false}	1	string
28025	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28026	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28027	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28028	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28029	DEGREE2_COEFF	52	{"type": "number", "value": "52", "parsing": false}	5	string
28030	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28031	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28032	integer_group	67	{"type": "number", "value": 67, "parsing": false}	1	string
28033	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28034	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28035	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28037	DEGREE2_COEFF	51	{"type": "number", "value": "51", "parsing": false}	5	string
28038	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28039	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28040	integer_group	79	{"type": "number", "value": 79, "parsing": false}	1	string
28041	integer_group	46	{"type": "number", "value": 46, "parsing": false}	1	string
28042	integer_group	34	{"type": "number", "value": 34, "parsing": false}	1	string
28043	integer_group	73	{"type": "number", "value": 73, "parsing": false}	1	string
28044	integer_group	39	{"type": "number", "value": 39, "parsing": false}	1	string
28045	integer_group	62	{"type": "number", "value": 62, "parsing": false}	1	string
28046	integer_group	26	{"type": "number", "value": 26, "parsing": false}	1	string
28047	integer_group	80	{"type": "number", "value": 80, "parsing": false}	1	string
28048	integer_group	35	{"type": "number", "value": 35, "parsing": false}	1	string
28049	integer_group	89	{"type": "number", "value": 89, "parsing": false}	1	string
28050	integer_group	103	{"type": "number", "value": 103, "parsing": false}	1	string
28051	integer_group	97	{"type": "number", "value": 97, "parsing": false}	1	string
28052	integer_group	93	{"type": "number", "value": 93, "parsing": false}	1	string
28053	integer_group	99	{"type": "number", "value": 99, "parsing": false}	1	string
28054	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28055	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28056	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28057	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28058	DEGREE2_COEFF	60	{"type": "number", "value": "60", "parsing": false}	5	string
28059	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28060	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28061	integer_group	109	{"type": "number", "value": 109, "parsing": false}	1	string
28062	integer_group	31	{"type": "number", "value": 31, "parsing": false}	1	string
28063	integer_group	111	{"type": "number", "value": 111, "parsing": false}	1	string
28064	integer_group	86	{"type": "number", "value": 86, "parsing": false}	1	string
28065	integer_group	105	{"type": "number", "value": 105, "parsing": false}	1	string
28066	integer_group	95	{"type": "number", "value": 95, "parsing": false}	1	string
28067	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28068	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	2	string
28069	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28070	DEGREE1_COEFF	13	{"type": "number", "value": "13", "parsing": false}	4	string
28071	DEGREE2_COEFF	61	{"type": "number", "value": "61", "parsing": false}	5	string
28072	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	6	string
28073	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": "20", "parsing": false}	7	string
28074	integer_group	101	{"type": "number", "value": 101, "parsing": false}	1	string
28075	integer_group	107	{"type": "number", "value": 107, "parsing": false}	1	string
28076	integer_group	55	{"type": "number", "value": 55, "parsing": false}	1	string
28077	integer_group	51	{"type": "number", "value": 51, "parsing": false}	1	string
28078	integer_group	83	{"type": "number", "value": 83, "parsing": false}	1	string
28079	integer_group	68	{"type": "number", "value": 68, "parsing": false}	1	string
28080	integer_group	59	{"type": "number", "value": 59, "parsing": false}	1	string
28081	integer_group	65	{"type": "number", "value": 65, "parsing": false}	1	string
28082	integer_group	71	{"type": "number", "value": 71, "parsing": false}	1	string
28083	integer_group	43	{"type": "number", "value": 43, "parsing": false}	1	string
28084	integer_group	91	{"type": "number", "value": 91, "parsing": false}	1	string
28085	integer_group	47	{"type": "number", "value": 47, "parsing": false}	1	string
28086	integer_group	16	{"type": "number", "value": 16, "parsing": false}	1	string
28087	integer_group	74	{"type": "number", "value": 74, "parsing": false}	1	string
28088	integer_group	77	{"type": "number", "value": 77, "parsing": false}	1	string
28089	integer_group	90	{"type": "number", "value": 90, "parsing": false}	1	string
28090	integer_group	92	{"type": "number", "value": 92, "parsing": false}	1	string
28091	integer_group	94	{"type": "number", "value": 94, "parsing": false}	1	string
28092	integer_group	96	{"type": "number", "value": 96, "parsing": false}	1	string
28093	integer_group	98	{"type": "number", "value": 98, "parsing": false}	1	string
28094	integer_group	100	{"type": "number", "value": 100, "parsing": false}	1	string
28095	integer_group	102	{"type": "number", "value": 102, "parsing": false}	1	string
28096	integer_group	104	{"type": "number", "value": 104, "parsing": false}	1	string
28097	integer_group	106	{"type": "number", "value": 106, "parsing": false}	1	string
28098	integer_group	108	{"type": "number", "value": 108, "parsing": false}	1	string
28099	integer_group	110	{"type": "number", "value": 110, "parsing": false}	1	string
28100	integer_group	112	{"type": "number", "value": 112, "parsing": false}	1	string
28101	integer_group	114	{"type": "number", "value": 114, "parsing": false}	1	string
28102	integer_group	116	{"type": "number", "value": 116, "parsing": false}	1	string
28103	integer_group	118	{"type": "number", "value": 118, "parsing": false}	1	string
28104	integer_group	120	{"type": "number", "value": 120, "parsing": false}	1	string
28105	integer_group	122	{"type": "number", "value": 122, "parsing": false}	1	string
28106	integer_group	124	{"type": "number", "value": 124, "parsing": false}	1	string
28107	integer_group	126	{"type": "number", "value": 126, "parsing": false}	1	string
28108	integer_group	128	{"type": "number", "value": 128, "parsing": false}	1	string
28109	integer_group	130	{"type": "number", "value": 130, "parsing": false}	1	string
28110	integer_group	132	{"type": "number", "value": 132, "parsing": false}	1	string
28111	integer_group	136	{"type": "number", "value": 136, "parsing": false}	1	string
28112	integer_group	137	{"type": "number", "value": 137, "parsing": false}	1	string
28113	integer_group	138	{"type": "number", "value": 138, "parsing": false}	1	string
28114	integer_group	840	{"type": "number", "value": 840}	1	string
28115	integer_group	2	{"type": "number", "value": "2", "parsing": false}	1	string
28116	integer_group	3	{"type": "number", "value": 3, "parsing": false}	1	string
28117	integer_group	4	{"type": "number", "value": 4, "parsing": false}	1	string
28118	integer_group	5	{"type": "number", "value": 5, "parsing": false}	1	string
28119	integer_group	6	{"type": "number", "value": 6, "parsing": false}	1	string
28120	integer_group	7	{"type": "number", "value": 7, "parsing": false}	1	string
28121	integer_group	8	{"type": "number", "value": 8, "parsing": false}	1	string
28122	integer_group	9	{"type": "number", "value": 9, "parsing": false}	1	string
28123	integer_group	10	{"type": "number", "value": 10, "parsing": false}	1	string
28124	integer_group	11	{"type": "number", "value": 11, "parsing": false}	1	string
28125	integer_group	139	{"type": "number", "value": 139, "parsing": false}	1	string
28126	integer_group	140	{"type": "number", "value": 140, "parsing": false}	1	string
28127	integer_group	142	{"type": "number", "value": 142, "parsing": false}	1	string
28128	integer_group	143	{"type": "number", "value": 143, "parsing": false}	1	string
28129	integer_group	22	{"type": "number", "value": 22, "parsing": false}	1	string
28130	integer_group	27	{"type": "number", "value": 27, "parsing": false}	1	string
28131	integer_group	32	{"type": "number", "value": 32, "parsing": false}	1	string
28132	integer_group	36	{"type": "number", "value": 36, "parsing": false}	1	string
28133	integer_group	40	{"type": "number", "value": 40, "parsing": false}	1	string
28134	integer_group	44	{"type": "number", "value": 44, "parsing": false}	1	string
28135	integer_group	48	{"type": "number", "value": 48, "parsing": false}	1	string
28136	integer_group	52	{"type": "number", "value": 52, "parsing": false}	1	string
28137	integer_group	60	{"type": "number", "value": 60, "parsing": false}	1	string
28138	integer_group	63	{"type": "number", "value": 63, "parsing": false}	1	string
28139	integer_group	66	{"type": "number", "value": 66, "parsing": false}	1	string
28140	integer_group	69	{"type": "number", "value": 69, "parsing": false}	1	string
28141	integer_group	72	{"type": "number", "value": 72, "parsing": false}	1	string
28142	integer_group	75	{"type": "number", "value": 75, "parsing": false}	1	string
28143	integer_group	81	{"type": "number", "value": 81, "parsing": false}	1	string
28144	integer_group	84	{"type": "number", "value": 84, "parsing": false}	1	string
28145	integer_group	87	{"type": "number", "value": 87, "parsing": false}	1	string
28146	integer_group	163	{"type": "number", "value": 163, "parsing": false}	1	string
28147	integer_group	164	{"type": "number", "value": 164, "parsing": false}	1	string
28148	integer_group	165	{"type": "number", "value": 165, "parsing": false}	1	string
28149	integer_group	166	{"type": "number", "value": 166, "parsing": false}	1	string
28150	integer_group	167	{"type": "number", "value": 167, "parsing": false}	1	string
28151	integer_group	168	{"type": "number", "value": 168, "parsing": false}	1	string
28152	integer_group	169	{"type": "number", "value": 169, "parsing": false}	1	string
28153	integer_group	170	{"type": "number", "value": 170, "parsing": false}	1	string
28154	integer_group	171	{"type": "number", "value": 171, "parsing": false}	1	string
28155	integer_group	172	{"type": "number", "value": 172, "parsing": false}	1	string
28156	integer_group	173	{"type": "number", "value": 173, "parsing": false}	1	string
28157	integer_group	174	{"type": "number", "value": 174, "parsing": false}	1	string
28158	integer_group	175	{"type": "number", "value": 175, "parsing": false}	1	string
28159	integer_group	176	{"type": "number", "value": 176, "parsing": false}	1	string
28160	integer_group	177	{"type": "number", "value": 177, "parsing": false}	1	string
28161	integer_group	178	{"type": "number", "value": 178, "parsing": false}	1	string
28162	integer_group	179	{"type": "number", "value": 179, "parsing": false}	1	string
28163	integer_group	180	{"type": "number", "value": 180, "parsing": false}	1	string
28164	integer_group	181	{"type": "number", "value": 181, "parsing": false}	1	string
28165	integer_group	182	{"type": "number", "value": 182, "parsing": false}	1	string
28166	integer_group	183	{"type": "number", "value": 183, "parsing": false}	1	string
28167	integer_group	184	{"type": "number", "value": 184, "parsing": false}	1	string
28168	integer_group	185	{"type": "number", "value": 185, "parsing": false}	1	string
28169	integer_group	186	{"type": "number", "value": 186, "parsing": false}	1	string
28170	integer_group	187	{"type": "number", "value": 187, "parsing": false}	1	string
28171	integer_group	188	{"type": "number", "value": 188, "parsing": false}	1	string
28172	integer_group	190	{"type": "number", "value": 190, "parsing": false}	1	string
28173	integer_group	191	{"type": "number", "value": 191, "parsing": false}	1	string
28174	integer_group	192	{"type": "number", "value": 192, "parsing": false}	1	string
28175	integer_group	193	{"type": "number", "value": 193, "parsing": false}	1	string
28176	integer_group	194	{"type": "number", "value": 194, "parsing": false}	1	string
28177	integer_group	195	{"type": "number", "value": 195, "parsing": false}	1	string
28178	integer_group	196	{"type": "number", "value": 196, "parsing": false}	1	string
28179	integer_group	197	{"type": "number", "value": 197, "parsing": false}	1	string
28180	integer_group	198	{"type": "number", "value": 198, "parsing": false}	1	string
28181	integer_group	199	{"type": "number", "value": 199, "parsing": false}	1	string
28182	integer_group	200	{"type": "number", "value": 200, "parsing": false}	1	string
28183	integer_group	201	{"type": "number", "value": "201", "parsing": false}	1	string
28184	integer_group	203	{"type": "number", "value": 203, "parsing": false}	1	string
28185	integer_group	204	{"type": "number", "value": 204, "parsing": false}	1	string
28186	integer_group	147	{"type": "number", "value": 147, "parsing": false}	1	string
28187	integer_group	148	{"type": "number", "value": 148, "parsing": false}	1	string
28188	integer_group	149	{"type": "number", "value": 149, "parsing": false}	1	string
28189	integer_group	150	{"type": "number", "value": 150, "parsing": false}	1	string
28190	integer_group	152	{"type": "number", "value": 152, "parsing": false}	1	string
28191	integer_group	151	{"type": "number", "value": 151, "parsing": false}	1	string
28192	integer_group	154	{"type": "number", "value": 154, "parsing": false}	1	string
28193	integer_group	153	{"type": "number", "value": 153, "parsing": false}	1	string
28194	integer_group	155	{"type": "number", "value": 155, "parsing": false}	1	string
28195	integer_group	157	{"type": "number", "value": 157, "parsing": false}	1	string
28196	integer_group	158	{"type": "number", "value": 158, "parsing": false}	1	string
28197	integer_group	159	{"type": "number", "value": 159, "parsing": false}	1	string
28198	integer_group	160	{"type": "number", "value": 160, "parsing": false}	1	string
28199	integer_group	161	{"type": "number", "value": 161, "parsing": false}	1	string
28200	integer_group	162	{"type": "number", "value": 162, "parsing": false}	1	string
28201	integer_group	224	{"type": "number", "value": 224, "parsing": false}	1	string
28202	integer_group	225	{"type": "number", "value": 225, "parsing": false}	1	string
28203	integer_group	226	{"type": "number", "value": 226, "parsing": false}	1	string
28204	integer_group	227	{"type": "number", "value": 227, "parsing": false}	1	string
28205	integer_group	228	{"type": "number", "value": 228, "parsing": false}	1	string
28206	integer_group	229	{"type": "number", "value": 229, "parsing": false}	1	string
28207	integer_group	230	{"type": "number", "value": 230, "parsing": false}	1	string
28208	integer_group	231	{"type": "number", "value": 231, "parsing": false}	1	string
28209	integer_group	232	{"type": "number", "value": 232, "parsing": false}	1	string
28210	integer_group	233	{"type": "number", "value": 233, "parsing": false}	1	string
28211	integer_group	234	{"type": "number", "value": 234, "parsing": false}	1	string
28212	integer_group	236	{"type": "number", "value": 236, "parsing": false}	1	string
28213	integer_group	237	{"type": "number", "value": 237, "parsing": false}	1	string
28214	integer_group	238	{"type": "number", "value": 238, "parsing": false}	1	string
28215	integer_group	206	{"type": "number", "value": 206, "parsing": false}	1	string
28216	integer_group	240	{"type": "number", "value": 240, "parsing": false}	1	string
28217	integer_group	241	{"type": "number", "value": 241, "parsing": false}	1	string
28218	integer_group	242	{"type": "number", "value": 242, "parsing": false}	1	string
28219	integer_group	243	{"type": "number", "value": 243, "parsing": false}	1	string
28220	integer_group	244	{"type": "number", "value": 244, "parsing": false}	1	string
28221	integer_group	245	{"type": "number", "value": 245, "parsing": false}	1	string
28222	integer_group	246	{"type": "number", "value": 246, "parsing": false}	1	string
28223	integer_group	247	{"type": "number", "value": 247, "parsing": false}	1	string
28224	integer_group	248	{"type": "number", "value": 248, "parsing": false}	1	string
28225	integer_group	249	{"type": "number", "value": 249, "parsing": false}	1	string
28226	integer_group	250	{"type": "number", "value": 250, "parsing": false}	1	string
28227	integer_group	251	{"type": "number", "value": 251, "parsing": false}	1	string
28228	integer_group	252	{"type": "number", "value": 252, "parsing": false}	1	string
28229	integer_group	253	{"type": "number", "value": 253, "parsing": false}	1	string
28230	integer_group	254	{"type": "number", "value": 254, "parsing": false}	1	string
28231	integer_group	255	{"type": "number", "value": 255, "parsing": false}	1	string
28232	integer_group	256	{"type": "number", "value": 256, "parsing": false}	1	string
28233	integer_group	257	{"type": "number", "value": 257, "parsing": false}	1	string
28234	integer_group	258	{"type": "number", "value": 258, "parsing": false}	1	string
28235	integer_group	259	{"type": "number", "value": 259, "parsing": false}	1	string
28236	integer_group	260	{"type": "number", "value": 260, "parsing": false}	1	string
28237	integer_group	261	{"type": "number", "value": 261, "parsing": false}	1	string
28238	integer_group	262	{"type": "number", "value": 262, "parsing": false}	1	string
28239	integer_group	263	{"type": "number", "value": 263, "parsing": false}	1	string
28240	integer_group	264	{"type": "number", "value": 264, "parsing": false}	1	string
28241	integer_group	265	{"type": "number", "value": 265, "parsing": false}	1	string
28242	integer_group	207	{"type": "number", "value": 207, "parsing": false}	1	string
28243	integer_group	208	{"type": "number", "value": 208, "parsing": false}	1	string
28244	integer_group	239	{"type": "number", "value": 239, "parsing": false}	1	string
28245	integer_group	209	{"type": "number", "value": 209, "parsing": false}	1	string
28246	integer_group	210	{"type": "number", "value": 210, "parsing": false}	1	string
28247	integer_group	211	{"type": "number", "value": 211, "parsing": false}	1	string
28248	integer_group	212	{"type": "number", "value": 212, "parsing": false}	1	string
28249	integer_group	213	{"type": "number", "value": 213, "parsing": false}	1	string
28250	integer_group	215	{"type": "number", "value": 215, "parsing": false}	1	string
28251	integer_group	214	{"type": "number", "value": 214, "parsing": false}	1	string
28252	integer_group	216	{"type": "number", "value": 216, "parsing": false}	1	string
28253	integer_group	217	{"type": "number", "value": 217, "parsing": false}	1	string
28254	integer_group	218	{"type": "number", "value": 218, "parsing": false}	1	string
28255	integer_group	219	{"type": "number", "value": 219, "parsing": false}	1	string
28256	integer_group	220	{"type": "number", "value": 220, "parsing": false}	1	string
28257	integer_group	221	{"type": "number", "value": 221, "parsing": false}	1	string
28258	integer_group	222	{"type": "number", "value": 222, "parsing": false}	1	string
28259	integer_group	270	{"type": "number", "value": 270, "parsing": false}	1	string
28260	integer_group	283	{"type": "number", "value": 283, "parsing": false}	1	string
28261	integer_group	284	{"type": "number", "value": 284, "parsing": false}	1	string
28262	integer_group	286	{"type": "number", "value": 286, "parsing": false}	1	string
28263	integer_group	287	{"type": "number", "value": 287, "parsing": false}	1	string
28264	integer_group	288	{"type": "number", "value": 288, "parsing": false}	1	string
28265	integer_group	289	{"type": "number", "value": 289, "parsing": false}	1	string
28266	integer_group	290	{"type": "number", "value": 290, "parsing": false}	1	string
28267	integer_group	291	{"type": "number", "value": 291, "parsing": false}	1	string
28268	integer_group	292	{"type": "number", "value": 292, "parsing": false}	1	string
28269	integer_group	293	{"type": "number", "value": 293, "parsing": false}	1	string
28270	integer_group	294	{"type": "number", "value": 294, "parsing": false}	1	string
28271	integer_group	295	{"type": "number", "value": 295, "parsing": false}	1	string
28272	integer_group	296	{"type": "number", "value": 296, "parsing": false}	1	string
28273	integer_group	297	{"type": "number", "value": 297, "parsing": false}	1	string
28274	integer_group	298	{"type": "number", "value": 298, "parsing": false}	1	string
28275	integer_group	299	{"type": "number", "value": 299, "parsing": false}	1	string
28276	integer_group	300	{"type": "number", "value": 300, "parsing": false}	1	string
28277	integer_group	301	{"type": "number", "value": 301, "parsing": false}	1	string
28278	integer_group	302	{"type": "number", "value": 302, "parsing": false}	1	string
28279	integer_group	303	{"type": "number", "value": 303, "parsing": false}	1	string
28280	integer_group	305	{"type": "number", "value": 305, "parsing": false}	1	string
28281	integer_group	306	{"type": "number", "value": 306, "parsing": false}	1	string
28282	integer_group	307	{"type": "number", "value": 307, "parsing": false}	1	string
28283	integer_group	308	{"type": "number", "value": 308, "parsing": false}	1	string
28284	integer_group	309	{"type": "number", "value": 309, "parsing": false}	1	string
28285	integer_group	310	{"type": "number", "value": 310, "parsing": false}	1	string
28286	integer_group	311	{"type": "number", "value": 311, "parsing": false}	1	string
28287	integer_group	312	{"type": "number", "value": 312, "parsing": false}	1	string
28288	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	1	string
28289	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	2	string
28290	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	3	string
28291	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": "13", "parsing": false}	4	string
28292	DEGREE2_COEFF	12	{"type": "number", "value": 12, "parsing": false}	5	string
28293	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	6	string
29293	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	number
29294	xMin	-5	{"type": "number", "value": -5, "parsing": false}	1	number
29295	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	2	number
29296	xMax	5	{"type": "number", "value": 5, "parsing": false}	3	number
29297	funct	x^5 +  cos(x) * sin(2x)	{"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}	4	math
29298	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29299	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29300	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29301	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29302	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29303	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29304	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29305	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29306	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29307	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29308	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29309	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29310	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29311	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29312	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29313	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29314	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29315	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29316	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29317	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29318	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29319	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29320	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29321	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29322	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29323	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29324	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29325	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29326	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29327	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29328	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29329	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29330	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29331	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29332	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29333	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29334	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29335	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29336	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29337	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29338	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29339	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29340	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29341	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29342	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29343	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29344	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29345	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29346	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29347	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29348	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29349	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29350	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29351	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29352	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29353	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29354	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29355	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29356	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29357	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29358	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29359	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29360	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29361	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29362	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29363	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29364	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29365	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29366	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29367	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29368	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29369	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29370	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29371	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29372	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29373	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29374	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29375	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29376	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29377	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29378	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29379	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29380	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29381	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29382	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29383	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29384	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29385	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29386	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29387	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29388	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29389	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29390	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29391	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29392	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29393	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29394	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29395	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29396	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29397	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29398	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29399	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29400	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
29401	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29402	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29403	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29404	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29405	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29406	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
41357	x_min	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41358	func1	x cos(x) + (1/5) cos(10x)	{"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "string": "x cos(x) + (1/5) cos(10x)", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "value": "x cos(x) + (1/5) cos(10x)", "parsing": false, "type": "math"}	1	math
41359	x_max	5	{"type": "number", "value": 5, "parsing": false}	2	number
41360	solutionPathColor	#3673ab	{"type": "color", "value": "#3673ab", "parsing": false}	0	color
41361	cellSize	15	{"type": "number", "value": 15, "parsing": false}	1	number
41362	integer_group	18	{"type": "number", "value": 18, "parsing": false}	0	number
41363	polynomial_degree	7	{"type": "number", "value": 7, "parsing": false}	0	number
41364	x_min	-10	{"type": "number", "value": -10, "parsing": false}	0	number
42833	y^2	2	{"type": "number", "value": 2}	6	string
42834	y^3	3	{"type": "number", "value": 3}	7	string
42835	xy^3	7	{"type": "number", "value": 7}	8	string
42836	xy^2	0	{"type": "number", "value": 0}	9	string
42837	x^3	1	{"type": "number", "value": 1}	10	string
42838	x^2	1	{"type": "number", "value": 1}	11	string
42839	x^3y^2	1	{"type": "number", "value": 1}	12	string
42840	x^3y	0	{"type": "number", "value": 0}	13	string
42841	xy^4	1	{"type": "number", "value": 1}	14	string
42842	xy	1	{"type": "number", "value": 1}	15	string
29473	integer_group	12	{"type": "number", "value": 12, "parsing": false}	1	number
29474	integer_group	18	{"type": "number", "value": 18, "parsing": false}	1	number
29475	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	1	color
29476	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29477	height	400	{"type": "number", "value": "400", "parsing": false}	3	number
29478	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	1	color
29479	width	200	{"type": "number", "value": "200", "parsing": false}	2	number
29480	height	500	{"type": "number", "value": "500", "parsing": false}	3	number
29481	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	1	color
29482	width	600	{"type": "number", "value": "600", "parsing": false}	2	number
29483	height	300	{"type": "number", "value": "300", "parsing": false}	3	number
42843	x^5	3	{"type": "number", "value": 3}	16	string
42844	x^2y^3	1	{"type": "number", "value": 1}	17	string
42845	x^2y^2	-13	{"type": "number", "value": -13}	18	string
42846	x^4y	-5	{"type": "number", "value": -5}	19	string
41365	func1	(1/x) cos(x)	{"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "string": "(1/x) cos(x)", "javascript": "Math.cos(x)/x", "value": "(1/x) cos(x)", "parsing": false, "type": "math"}	1	math
41366	x_max	10	{"type": "number", "value": 10, "parsing": false}	2	number
41367	x_min	-10	{"type": "number", "value": -10, "parsing": false}	0	number
41368	func1	(1/x^3) cos(2x) + (1/2x)	{"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x^3) cos(2x) + (1/2x)", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "value": "(1/x^3) cos(2x) + (1/2x)", "parsing": false, "type": "math"}	1	math
41369	x_max	10	{"type": "number", "value": 10, "parsing": false}	2	number
41370	solutionPathColor	#cc0055	{"type": "color", "value": "#cc0055"}	0	color
41371	cellSize	30	{"type": "number", "value": 30}	1	number
41372	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41373	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	1	number
41374	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41375	funct	(x^7 - 2x^6)*(1/x)	{"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "string": "(x^7 - 2x^6)*(1/x)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "value": "(x^7 - 2x^6)*(1/x)", "parsing": false, "type": "math"}	3	math
41376	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	0	color
41377	width	400	{"type": "number", "value": 400, "parsing": false}	1	number
41378	height	200	{"type": "number", "value": 200, "parsing": false}	2	number
41379	x_min	-10	{"type": "number", "value": -10, "parsing": false}	0	number
41444	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42541	xy^3	7	{"type": "number", "value": 7}	7	number
41380	func1	(1/x) cos(2x) + (1/2x) cos(16x)	{"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "value": "(1/x) cos(2x) + (1/2x) cos(16x)", "parsing": false, "type": "math"}	1	math
41381	x_max	10	{"type": "number", "value": 10, "parsing": false}	2	number
41382	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41383	funct	1/(x^2 - 3x^3)	{"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "string": "1/(x^2 - 3x^3)", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "value": "1/(x^2 - 3x^3)", "parsing": false, "type": "math"}	1	math
41384	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41385	breathDelta	25	{"type": "number", "value": 25, "parsing": false}	3	number
41386	polynomial_degree	5	{"type": "number", "value": 5}	0	number
41387	x_min	-5	{"type": "number", "value": -5}	0	number
41388	func1	x cos(x)	{"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}	1	math
41389	x_max	5	{"type": "number", "value": 5}	2	number
41390	integer_group	141	{"type": "number", "value": 141, "parsing": false}	0	number
41391	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41392	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41393	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41394	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41395	DEGREE2_COEFF	11	{"type": "number", "value": 11, "parsing": false}	4	number
41396	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41397	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41398	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41399	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	1	number
41400	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41401	funct	x^5 +  cos(x) * sin(2x)	{"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}	3	math
41402	integer_group	23	{"type": "number", "value": 23, "parsing": false}	0	number
41403	color	#375fc7	{"type": "color", "value": "#375fc7", "parsing": false}	0	color
41404	width	200	{"type": "number", "value": 200, "parsing": false}	1	number
41405	height	500	{"type": "number", "value": 500, "parsing": false}	2	number
41406	color	#3fa38b	{"type": "color", "value": "#3fa38b", "parsing": false}	0	color
41407	width	600	{"type": "number", "value": 600, "parsing": false}	1	number
41408	height	300	{"type": "number", "value": 300, "parsing": false}	2	number
41409	integer_group	12	{"type": "number", "value": 12, "parsing": false}	0	number
41410	color	#cccc00	{"type": "color", "value": "#cccc00"}	0	color
41411	width	400	{"type": "number", "value": 400}	1	number
41412	height	200	{"type": "number", "value": 200}	2	number
41413	polynomial_degree	8	{"type": "number", "value": 8, "parsing": false}	0	number
41414	polynomial_degree	12	{"type": "number", "value": 12, "parsing": false}	0	number
41415	solutionPathColor	#6727f0	{"type": "color", "value": "#6727f0", "parsing": false}	0	color
41416	cellSize	45	{"type": "number", "value": 45, "parsing": false}	1	number
41417	color	#41a33f	{"type": "color", "value": "#41a33f", "parsing": false}	0	color
41418	width	600	{"type": "number", "value": 600, "parsing": false}	1	number
41419	height	400	{"type": "number", "value": 400, "parsing": false}	2	number
41420	integer_group	28	{"type": "number", "value": 28, "parsing": false}	0	number
41421	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41422	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	1	number
41423	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41424	funct	x cos(x) + x^7	{"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) + x^7", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "value": "x cos(x) + x^7", "parsing": false, "type": "math"}	3	math
41425	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41426	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41427	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41428	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	3	number
41429	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
41430	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41431	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41432	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
41433	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41434	COLOR2	#499948	{"type": "color", "value": "#499948", "parsing": false}	2	color
41435	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41436	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	4	number
41437	CHILDREN	[5,7,-9]	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	5	javascript
41438	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	6	number
41439	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41440	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41441	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41442	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	3	number
41443	DEGREE2_COEFF	17	{"type": "number", "value": 17, "parsing": false}	4	number
41445	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41446	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
41447	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41448	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41449	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41450	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
41451	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41452	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41453	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
41454	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41455	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	2	color
41456	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	3	number
41457	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
41458	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	javascript
41459	TRAPEZOIDAL_SECTIONS	10	{"type": "number", "value": 10, "parsing": false}	6	number
41460	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
41461	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41462	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41463	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41464	DEGREE2_COEFF	60	{"type": "number", "value": 60, "parsing": false}	4	number
41465	CHILDREN	[5,7,-9]	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	5	javascript
41466	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	6	number
41467	integer_group	223	{"type": "number", "value": 223, "parsing": false}	0	number
41468	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41469	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41470	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41471	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41472	DEGREE2_COEFF	31	{"type": "number", "value": 31, "parsing": false}	4	number
41473	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41474	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41475	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
41476	cellSize	40	{"type": "number", "value": 40, "parsing": false}	1	number
41477	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41478	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41479	COLOR2	#499948	{"type": "color", "value": "#499948", "parsing": false}	2	color
41480	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	3	number
41481	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	4	number
41482	CHILDREN	[5,7,8,9]	{"type": "javascript", "value": "[5,7,8,9]", "parsing": false}	5	javascript
41483	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
41484	integer_group	13	{"type": "number", "value": 13, "parsing": false}	0	number
41485	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41486	funct	3 cos(2x) + sin(3x) cos(5x)	{"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "string": "3 cos(2x) + sin(3x) cos(5x)", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "value": "3 cos(2x) + sin(3x) cos(5x)", "parsing": false, "type": "math"}	1	math
41487	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41488	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	3	number
41489	solutionPathColor	#e6228c	{"type": "color", "value": "#e6228c", "parsing": false}	0	color
41490	cellSize	10	{"type": "number", "value": 10, "parsing": false}	1	number
41491	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41492	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41493	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41494	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	3	number
41495	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
41496	CHILDREN	[4,6,7,17,-8,-9]	{"type": "javascript", "value": "[4,6,7,17,-8,-9]", "parsing": false}	5	javascript
41497	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41498	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41499	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41500	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41501	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	3	number
41502	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
41503	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	javascript
41504	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	6	number
41525	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41526	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41527	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41528	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41529	DEGREE2_COEFF	18	{"type": "number", "value": 18, "parsing": false}	4	number
41530	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41531	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41532	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41533	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41534	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	2	color
41535	TRAPEZOIDAL_SECTIONS	10	{"type": "number", "value": 10, "parsing": false}	3	number
41536	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
41537	CHILDREN	[4,5,6,-5,-7]	{"type": "javascript", "value": "[4,5,6,-5,-7]", "parsing": false}	5	javascript
41538	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	6	number
41539	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	0	color
41540	width	400	{"type": "number", "value": 400, "parsing": false}	1	number
41541	height	2002	{"type": "number", "value": 2002, "parsing": false}	2	number
41542	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41543	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41544	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41545	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	3	number
41546	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
41547	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41548	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41549	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	0	color
41550	width	400	{"type": "number", "value": 400, "parsing": false}	1	number
41551	height	200	{"type": "number", "value": 200, "parsing": false}	2	number
41552	integer_group	24	{"type": "number", "value": 24, "parsing": false}	0	number
41553	integer_group	37	{"type": "number", "value": 37, "parsing": false}	0	number
41554	integer_group	29	{"type": "number", "value": 29, "parsing": false}	0	number
41555	integer_group	53	{"type": "number", "value": 53, "parsing": false}	0	number
41556	xMin	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41557	funct	1/(x^2+1)	{"latex": "\\\\frac{1}{x^{2} + 1}", "string": "1/(x^2+1)", "javascript": "1/(Math.pow(x, 2) + 1)", "value": "1/(x^2+1)", "parsing": false, "type": "math"}	1	math
41558	xMax	5	{"type": "number", "value": 5, "parsing": false}	2	number
41559	breathDelta	17	{"type": "number", "value": 17, "parsing": false}	3	number
41560	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
41561	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41562	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	2	color
41563	DEGREE1_COEFF	35	{"type": "number", "value": 35, "parsing": false}	3	number
41564	DEGREE2_COEFF	35	{"type": "number", "value": 35, "parsing": false}	4	number
41565	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	javascript
41566	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	6	number
41567	integer_group	57	{"type": "number", "value": 57, "parsing": false}	0	number
41568	integer_group	41	{"type": "number", "value": 41, "parsing": false}	0	number
41569	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	0	color
41570	width	400	{"type": "number", "value": 400, "parsing": false}	1	number
41571	height	2002	{"type": "number", "value": 2002, "parsing": false}	2	number
41572	x_min	-5	{"type": "number", "value": -5, "parsing": false}	0	number
41573	func1	x cos(x) sin(2x)	{"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) sin(2x)", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "value": "x cos(x) sin(2x)", "parsing": true, "type": "math"}	1	math
41574	x_max	5	{"type": "number", "value": 5, "parsing": false}	2	number
41575	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41576	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41577	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41578	TRAPEZOIDAL_SECTIONS	25	{"type": "number", "value": 25, "parsing": false}	3	number
41579	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
41580	CHILDREN	[4,6,8,-7,16,18]	{"type": "javascript", "value": "[4,6,8,-7,16,18]", "parsing": false}	5	javascript
41581	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41582	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41583	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41584	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41585	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41586	DEGREE2_COEFF	44	{"type": "number", "value": 44, "parsing": false}	4	number
41587	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41588	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41589	integer_group	19	{"type": "number", "value": 19, "parsing": false}	0	number
41590	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41591	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41592	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41593	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41594	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
41595	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41596	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
41597	integer_group	45	{"type": "number", "value": 45, "parsing": false}	0	number
41598	integer_group	49	{"type": "number", "value": 49, "parsing": false}	0	number
41599	integer_group	14	{"type": "number", "value": 14, "parsing": false}	0	number
41600	integer_group	33	{"type": "number", "value": 33, "parsing": false}	0	number
41601	color	#202c33	{"type": "color", "value": "#202c33", "parsing": false}	0	color
41602	width	400	{"type": "number", "value": 400, "parsing": false}	1	number
41603	height	2002	{"type": "number", "value": 2002, "parsing": false}	2	number
41604	integer_group	20	{"type": "number", "value": 20, "parsing": false}	0	number
41605	integer_group	61	{"type": "number", "value": 61, "parsing": false}	0	number
41606	integer_group	42	{"type": "number", "value": 42, "parsing": false}	0	number
41607	integer_group	70	{"type": "number", "value": 70, "parsing": false}	0	number
41608	integer_group	79	{"type": "number", "value": 79, "parsing": false}	0	number
41609	integer_group	46	{"type": "number", "value": 46, "parsing": false}	0	number
41610	integer_group	34	{"type": "number", "value": 34, "parsing": false}	0	number
41611	integer_group	73	{"type": "number", "value": 73, "parsing": false}	0	number
41612	integer_group	82	{"type": "number", "value": 82, "parsing": false}	0	number
41613	integer_group	38	{"type": "number", "value": 38, "parsing": false}	0	number
41614	integer_group	64	{"type": "number", "value": 64, "parsing": false}	0	number
41615	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41616	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41617	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41618	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41619	DEGREE2_COEFF	52	{"type": "number", "value": 52, "parsing": false}	4	number
41620	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41621	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41622	integer_group	85	{"type": "number", "value": 85, "parsing": false}	0	number
41623	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41624	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41625	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41626	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41627	DEGREE2_COEFF	52	{"type": "number", "value": 52, "parsing": false}	4	number
41628	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41629	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41630	integer_group	76	{"type": "number", "value": 76, "parsing": false}	0	number
41631	integer_group	25	{"type": "number", "value": 25, "parsing": false}	0	number
41632	integer_group	58	{"type": "number", "value": 58, "parsing": false}	0	number
41633	integer_group	54	{"type": "number", "value": 54, "parsing": false}	0	number
41634	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41635	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41636	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41637	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41638	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
41639	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41640	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41641	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41642	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41643	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41644	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	3	number
41645	DEGREE2_COEFF	49	{"type": "number", "value": 49, "parsing": false}	4	number
41646	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41647	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41648	integer_group	67	{"type": "number", "value": 67, "parsing": false}	0	number
41649	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41650	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41651	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41652	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41653	DEGREE2_COEFF	51	{"type": "number", "value": 51, "parsing": false}	4	number
41654	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41655	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41656	integer_group	30	{"type": "number", "value": 30, "parsing": false}	0	number
41657	integer_group	50	{"type": "number", "value": 50, "parsing": false}	0	number
41658	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41659	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41660	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41661	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41662	DEGREE2_COEFF	53	{"type": "number", "value": 53, "parsing": false}	4	number
41663	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41664	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41665	integer_group	109	{"type": "number", "value": 109, "parsing": false}	0	number
41666	integer_group	83	{"type": "number", "value": 83, "parsing": false}	0	number
41667	integer_group	68	{"type": "number", "value": 68, "parsing": false}	0	number
41668	integer_group	59	{"type": "number", "value": 59, "parsing": false}	0	number
41669	integer_group	47	{"type": "number", "value": 47, "parsing": false}	0	number
41670	integer_group	16	{"type": "number", "value": 16, "parsing": false}	0	number
41671	integer_group	35	{"type": "number", "value": 35, "parsing": false}	0	number
41672	integer_group	89	{"type": "number", "value": 89, "parsing": false}	0	number
41673	integer_group	111	{"type": "number", "value": 111, "parsing": false}	0	number
41674	integer_group	86	{"type": "number", "value": 86, "parsing": false}	0	number
41675	integer_group	55	{"type": "number", "value": 55, "parsing": false}	0	number
41676	integer_group	65	{"type": "number", "value": 65, "parsing": false}	0	number
41677	integer_group	71	{"type": "number", "value": 71, "parsing": false}	0	number
41678	integer_group	43	{"type": "number", "value": 43, "parsing": false}	0	number
41679	integer_group	91	{"type": "number", "value": 91, "parsing": false}	0	number
41680	integer_group	93	{"type": "number", "value": 93, "parsing": false}	0	number
41681	integer_group	62	{"type": "number", "value": 62, "parsing": false}	0	number
41682	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41683	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41684	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41685	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41686	DEGREE2_COEFF	60	{"type": "number", "value": 60, "parsing": false}	4	number
41687	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41688	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41689	integer_group	105	{"type": "number", "value": 105, "parsing": false}	0	number
41690	integer_group	95	{"type": "number", "value": 95, "parsing": false}	0	number
41691	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41692	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41693	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41694	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
41695	DEGREE2_COEFF	61	{"type": "number", "value": 61, "parsing": false}	4	number
41696	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41697	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
41698	integer_group	74	{"type": "number", "value": 74, "parsing": false}	0	number
41699	integer_group	39	{"type": "number", "value": 39, "parsing": false}	0	number
41700	integer_group	26	{"type": "number", "value": 26, "parsing": false}	0	number
41701	integer_group	80	{"type": "number", "value": 80, "parsing": false}	0	number
41702	integer_group	31	{"type": "number", "value": 31, "parsing": false}	0	number
41703	integer_group	99	{"type": "number", "value": 99, "parsing": false}	0	number
41704	integer_group	101	{"type": "number", "value": 101, "parsing": false}	0	number
41705	integer_group	107	{"type": "number", "value": 107, "parsing": false}	0	number
41706	integer_group	51	{"type": "number", "value": 51, "parsing": false}	0	number
41707	integer_group	77	{"type": "number", "value": 77, "parsing": false}	0	number
41708	integer_group	88	{"type": "number", "value": 88, "parsing": false}	0	number
41709	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41710	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
41711	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41712	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	3	number
41713	DEGREE2_COEFF	48	{"type": "number", "value": 48, "parsing": false}	4	number
41714	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
41715	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41716	integer_group	103	{"type": "number", "value": 103, "parsing": false}	0	number
41717	integer_group	97	{"type": "number", "value": 97, "parsing": false}	0	number
41718	integer_group	102	{"type": "number", "value": 102, "parsing": false}	0	number
41719	integer_group	104	{"type": "number", "value": 104, "parsing": false}	0	number
41720	integer_group	106	{"type": "number", "value": 106, "parsing": false}	0	number
41721	integer_group	108	{"type": "number", "value": 108, "parsing": false}	0	number
41722	integer_group	110	{"type": "number", "value": 110, "parsing": false}	0	number
41723	integer_group	112	{"type": "number", "value": 112, "parsing": false}	0	number
41724	integer_group	114	{"type": "number", "value": 114, "parsing": false}	0	number
41725	integer_group	116	{"type": "number", "value": 116, "parsing": false}	0	number
41726	integer_group	118	{"type": "number", "value": 118, "parsing": false}	0	number
41727	integer_group	120	{"type": "number", "value": 120, "parsing": false}	0	number
41728	integer_group	122	{"type": "number", "value": 122, "parsing": false}	0	number
41729	integer_group	124	{"type": "number", "value": 124, "parsing": false}	0	number
41730	integer_group	126	{"type": "number", "value": 126, "parsing": false}	0	number
41731	integer_group	128	{"type": "number", "value": 128, "parsing": false}	0	number
41732	integer_group	130	{"type": "number", "value": 130, "parsing": false}	0	number
41733	integer_group	132	{"type": "number", "value": 132, "parsing": false}	0	number
41734	integer_group	136	{"type": "number", "value": 136, "parsing": false}	0	number
41735	integer_group	137	{"type": "number", "value": 137, "parsing": false}	0	number
41736	integer_group	138	{"type": "number", "value": 138, "parsing": false}	0	number
41737	integer_group	2	{"type": "number", "value": 2, "parsing": false}	0	number
41738	integer_group	96	{"type": "number", "value": 96, "parsing": false}	0	number
41739	integer_group	3	{"type": "number", "value": 3, "parsing": false}	0	number
41740	integer_group	4	{"type": "number", "value": 4, "parsing": false}	0	number
41741	integer_group	5	{"type": "number", "value": 5, "parsing": false}	0	number
41742	integer_group	6	{"type": "number", "value": 6, "parsing": false}	0	number
41743	integer_group	7	{"type": "number", "value": 7, "parsing": false}	0	number
41744	integer_group	8	{"type": "number", "value": 8, "parsing": false}	0	number
41745	integer_group	9	{"type": "number", "value": 9, "parsing": false}	0	number
41746	integer_group	10	{"type": "number", "value": 10, "parsing": false}	0	number
41747	integer_group	11	{"type": "number", "value": 11, "parsing": false}	0	number
41748	integer_group	139	{"type": "number", "value": 139, "parsing": false}	0	number
41749	integer_group	140	{"type": "number", "value": 140, "parsing": false}	0	number
41750	integer_group	142	{"type": "number", "value": 142, "parsing": false}	0	number
41751	integer_group	143	{"type": "number", "value": 143, "parsing": false}	0	number
41752	integer_group	22	{"type": "number", "value": 22, "parsing": false}	0	number
41753	integer_group	27	{"type": "number", "value": 27, "parsing": false}	0	number
41754	integer_group	32	{"type": "number", "value": 32, "parsing": false}	0	number
41755	integer_group	36	{"type": "number", "value": 36, "parsing": false}	0	number
41756	integer_group	40	{"type": "number", "value": 40, "parsing": false}	0	number
41757	integer_group	44	{"type": "number", "value": 44, "parsing": false}	0	number
41758	integer_group	48	{"type": "number", "value": 48, "parsing": false}	0	number
41759	integer_group	52	{"type": "number", "value": 52, "parsing": false}	0	number
41760	integer_group	60	{"type": "number", "value": 60, "parsing": false}	0	number
41761	integer_group	63	{"type": "number", "value": 63, "parsing": false}	0	number
41762	integer_group	66	{"type": "number", "value": 66, "parsing": false}	0	number
41763	integer_group	69	{"type": "number", "value": 69, "parsing": false}	0	number
41764	integer_group	72	{"type": "number", "value": 72, "parsing": false}	0	number
41765	integer_group	75	{"type": "number", "value": 75, "parsing": false}	0	number
41766	integer_group	81	{"type": "number", "value": 81, "parsing": false}	0	number
41767	integer_group	84	{"type": "number", "value": 84, "parsing": false}	0	number
41768	integer_group	87	{"type": "number", "value": 87, "parsing": false}	0	number
41769	integer_group	90	{"type": "number", "value": 90, "parsing": false}	0	number
41770	integer_group	92	{"type": "number", "value": 92, "parsing": false}	0	number
41771	integer_group	840	{"type": "number", "value": 840}	0	number
41772	integer_group	94	{"type": "number", "value": 94, "parsing": false}	0	number
41773	integer_group	98	{"type": "number", "value": 98, "parsing": false}	0	number
41774	integer_group	100	{"type": "number", "value": 100, "parsing": false}	0	number
41775	integer_group	169	{"type": "number", "value": 169, "parsing": false}	0	number
41776	integer_group	170	{"type": "number", "value": 170, "parsing": false}	0	number
41777	integer_group	171	{"type": "number", "value": 171, "parsing": false}	0	number
41778	integer_group	172	{"type": "number", "value": 172, "parsing": false}	0	number
41779	integer_group	173	{"type": "number", "value": 173, "parsing": false}	0	number
41780	integer_group	174	{"type": "number", "value": 174, "parsing": false}	0	number
41781	integer_group	175	{"type": "number", "value": 175, "parsing": false}	0	number
41782	integer_group	176	{"type": "number", "value": 176, "parsing": false}	0	number
41783	integer_group	177	{"type": "number", "value": 177, "parsing": false}	0	number
41784	integer_group	178	{"type": "number", "value": 178, "parsing": false}	0	number
41785	integer_group	179	{"type": "number", "value": 179, "parsing": false}	0	number
41786	integer_group	180	{"type": "number", "value": 180, "parsing": false}	0	number
41787	integer_group	181	{"type": "number", "value": 181, "parsing": false}	0	number
41788	integer_group	182	{"type": "number", "value": 182, "parsing": false}	0	number
41789	integer_group	183	{"type": "number", "value": 183, "parsing": false}	0	number
41790	integer_group	184	{"type": "number", "value": 184, "parsing": false}	0	number
41791	integer_group	185	{"type": "number", "value": 185, "parsing": false}	0	number
41792	integer_group	186	{"type": "number", "value": 186, "parsing": false}	0	number
41793	integer_group	187	{"type": "number", "value": 187, "parsing": false}	0	number
41794	integer_group	188	{"type": "number", "value": 188, "parsing": false}	0	number
41795	integer_group	190	{"type": "number", "value": 190, "parsing": false}	0	number
41796	integer_group	191	{"type": "number", "value": 191, "parsing": false}	0	number
41797	integer_group	192	{"type": "number", "value": 192, "parsing": false}	0	number
41798	integer_group	193	{"type": "number", "value": 193, "parsing": false}	0	number
41799	integer_group	194	{"type": "number", "value": 194, "parsing": false}	0	number
41800	integer_group	195	{"type": "number", "value": 195, "parsing": false}	0	number
41801	integer_group	196	{"type": "number", "value": 196, "parsing": false}	0	number
41802	integer_group	197	{"type": "number", "value": 197, "parsing": false}	0	number
41803	integer_group	198	{"type": "number", "value": 198, "parsing": false}	0	number
41804	integer_group	199	{"type": "number", "value": 199, "parsing": false}	0	number
41805	integer_group	200	{"type": "number", "value": 200, "parsing": false}	0	number
41806	integer_group	201	{"type": "number", "value": 201, "parsing": false}	0	number
41807	integer_group	203	{"type": "number", "value": 203, "parsing": false}	0	number
41808	integer_group	204	{"type": "number", "value": 204, "parsing": false}	0	number
41809	integer_group	147	{"type": "number", "value": 147, "parsing": false}	0	number
41810	integer_group	148	{"type": "number", "value": 148, "parsing": false}	0	number
41811	integer_group	149	{"type": "number", "value": 149, "parsing": false}	0	number
41812	integer_group	150	{"type": "number", "value": 150, "parsing": false}	0	number
41813	integer_group	152	{"type": "number", "value": 152, "parsing": false}	0	number
41814	integer_group	151	{"type": "number", "value": 151, "parsing": false}	0	number
41815	integer_group	154	{"type": "number", "value": 154, "parsing": false}	0	number
41816	integer_group	153	{"type": "number", "value": 153, "parsing": false}	0	number
41817	integer_group	155	{"type": "number", "value": 155, "parsing": false}	0	number
41818	integer_group	157	{"type": "number", "value": 157, "parsing": false}	0	number
41819	integer_group	158	{"type": "number", "value": 158, "parsing": false}	0	number
41820	integer_group	159	{"type": "number", "value": 159, "parsing": false}	0	number
41821	integer_group	160	{"type": "number", "value": 160, "parsing": false}	0	number
41822	integer_group	161	{"type": "number", "value": 161, "parsing": false}	0	number
41823	integer_group	162	{"type": "number", "value": 162, "parsing": false}	0	number
41824	integer_group	163	{"type": "number", "value": 163, "parsing": false}	0	number
41825	integer_group	164	{"type": "number", "value": 164, "parsing": false}	0	number
41826	integer_group	165	{"type": "number", "value": 165, "parsing": false}	0	number
41827	integer_group	166	{"type": "number", "value": 166, "parsing": false}	0	number
41828	integer_group	167	{"type": "number", "value": 167, "parsing": false}	0	number
41829	integer_group	168	{"type": "number", "value": 168, "parsing": false}	0	number
41830	integer_group	230	{"type": "number", "value": 230, "parsing": false}	0	number
41831	integer_group	231	{"type": "number", "value": 231, "parsing": false}	0	number
41832	integer_group	232	{"type": "number", "value": 232, "parsing": false}	0	number
41833	integer_group	233	{"type": "number", "value": 233, "parsing": false}	0	number
41834	integer_group	234	{"type": "number", "value": 234, "parsing": false}	0	number
41835	integer_group	236	{"type": "number", "value": 236, "parsing": false}	0	number
41836	integer_group	237	{"type": "number", "value": 237, "parsing": false}	0	number
41837	integer_group	238	{"type": "number", "value": 238, "parsing": false}	0	number
41838	integer_group	206	{"type": "number", "value": 206, "parsing": false}	0	number
41839	integer_group	240	{"type": "number", "value": 240, "parsing": false}	0	number
41840	integer_group	241	{"type": "number", "value": 241, "parsing": false}	0	number
41841	integer_group	242	{"type": "number", "value": 242, "parsing": false}	0	number
41842	integer_group	243	{"type": "number", "value": 243, "parsing": false}	0	number
41843	integer_group	244	{"type": "number", "value": 244, "parsing": false}	0	number
41844	integer_group	245	{"type": "number", "value": 245, "parsing": false}	0	number
41845	integer_group	246	{"type": "number", "value": 246, "parsing": false}	0	number
41846	integer_group	247	{"type": "number", "value": 247, "parsing": false}	0	number
41847	integer_group	248	{"type": "number", "value": 248, "parsing": false}	0	number
41848	integer_group	249	{"type": "number", "value": 249, "parsing": false}	0	number
41849	integer_group	250	{"type": "number", "value": 250, "parsing": false}	0	number
41850	integer_group	251	{"type": "number", "value": 251, "parsing": false}	0	number
41851	integer_group	252	{"type": "number", "value": 252, "parsing": false}	0	number
41852	integer_group	253	{"type": "number", "value": 253, "parsing": false}	0	number
41853	integer_group	254	{"type": "number", "value": 254, "parsing": false}	0	number
41854	integer_group	255	{"type": "number", "value": 255, "parsing": false}	0	number
41855	integer_group	256	{"type": "number", "value": 256, "parsing": false}	0	number
41856	integer_group	257	{"type": "number", "value": 257, "parsing": false}	0	number
41857	integer_group	258	{"type": "number", "value": 258, "parsing": false}	0	number
41858	integer_group	259	{"type": "number", "value": 259, "parsing": false}	0	number
41859	integer_group	260	{"type": "number", "value": 260, "parsing": false}	0	number
41860	integer_group	261	{"type": "number", "value": 261, "parsing": false}	0	number
41861	integer_group	262	{"type": "number", "value": 262, "parsing": false}	0	number
41862	integer_group	263	{"type": "number", "value": 263, "parsing": false}	0	number
41863	integer_group	264	{"type": "number", "value": 264, "parsing": false}	0	number
41864	integer_group	265	{"type": "number", "value": 265, "parsing": false}	0	number
41865	integer_group	207	{"type": "number", "value": 207, "parsing": false}	0	number
41866	integer_group	208	{"type": "number", "value": 208, "parsing": false}	0	number
41867	integer_group	239	{"type": "number", "value": 239, "parsing": false}	0	number
41868	integer_group	209	{"type": "number", "value": 209, "parsing": false}	0	number
41869	integer_group	210	{"type": "number", "value": 210, "parsing": false}	0	number
41870	integer_group	211	{"type": "number", "value": 211, "parsing": false}	0	number
41871	integer_group	212	{"type": "number", "value": 212, "parsing": false}	0	number
41872	integer_group	213	{"type": "number", "value": 213, "parsing": false}	0	number
41873	integer_group	215	{"type": "number", "value": 215, "parsing": false}	0	number
41874	integer_group	214	{"type": "number", "value": 214, "parsing": false}	0	number
41875	integer_group	216	{"type": "number", "value": 216, "parsing": false}	0	number
41876	integer_group	217	{"type": "number", "value": 217, "parsing": false}	0	number
41877	integer_group	218	{"type": "number", "value": 218, "parsing": false}	0	number
41878	integer_group	219	{"type": "number", "value": 219, "parsing": false}	0	number
42848	integer_group	840	{"type": "number", "value": 840}	0	string
42849	integer_group	840	{"type": "number", "value": 840}	0	string
32601	param1		{"type": "string", "value": ""}	1	string
41879	integer_group	220	{"type": "number", "value": 220, "parsing": false}	0	number
41880	integer_group	221	{"type": "number", "value": 221, "parsing": false}	0	number
41881	integer_group	222	{"type": "number", "value": 222, "parsing": false}	0	number
41882	integer_group	224	{"type": "number", "value": 224, "parsing": false}	0	number
41883	integer_group	225	{"type": "number", "value": 225, "parsing": false}	0	number
41884	integer_group	226	{"type": "number", "value": 226, "parsing": false}	0	number
41885	integer_group	227	{"type": "number", "value": 227, "parsing": false}	0	number
41886	integer_group	228	{"type": "number", "value": 228, "parsing": false}	0	number
41887	integer_group	229	{"type": "number", "value": 229, "parsing": false}	0	number
41888	integer_group	271	{"type": "number", "value": 271, "parsing": false}	0	number
41889	integer_group	274	{"type": "number", "value": 274, "parsing": false}	0	number
41890	integer_group	266	{"type": "number", "value": 266, "parsing": false}	0	number
41891	integer_group	276	{"type": "number", "value": 276, "parsing": false}	0	number
41892	integer_group	278	{"type": "number", "value": 278, "parsing": false}	0	number
41893	integer_group	285	{"type": "number", "value": 285, "parsing": false}	0	number
41894	integer_group	280	{"type": "number", "value": 280, "parsing": false}	0	number
41895	integer_group	277	{"type": "number", "value": 277, "parsing": false}	0	number
41896	integer_group	282	{"type": "number", "value": 282, "parsing": false}	0	number
41897	integer_group	279	{"type": "number", "value": 279, "parsing": false}	0	number
41898	integer_group	281	{"type": "number", "value": 281, "parsing": false}	0	number
41899	integer_group	270	{"type": "number", "value": 270, "parsing": false}	0	number
41900	integer_group	289	{"type": "number", "value": 289, "parsing": false}	0	number
41901	integer_group	283	{"type": "number", "value": 283, "parsing": false}	0	number
41902	integer_group	284	{"type": "number", "value": 284, "parsing": false}	0	number
41903	integer_group	290	{"type": "number", "value": 290, "parsing": false}	0	number
41904	integer_group	286	{"type": "number", "value": 286, "parsing": false}	0	number
41905	integer_group	288	{"type": "number", "value": 288, "parsing": false}	0	number
41906	integer_group	291	{"type": "number", "value": 291, "parsing": false}	0	number
41907	integer_group	292	{"type": "number", "value": 292, "parsing": false}	0	number
41908	integer_group	293	{"type": "number", "value": 293, "parsing": false}	0	number
41909	integer_group	287	{"type": "number", "value": 287, "parsing": false}	0	number
41910	integer_group	294	{"type": "number", "value": 294, "parsing": false}	0	number
41911	integer_group	295	{"type": "number", "value": 295, "parsing": false}	0	number
41912	integer_group	296	{"type": "number", "value": 296, "parsing": false}	0	number
41913	integer_group	301	{"type": "number", "value": 301, "parsing": false}	0	number
41914	integer_group	297	{"type": "number", "value": 297, "parsing": false}	0	number
41915	integer_group	298	{"type": "number", "value": 298, "parsing": false}	0	number
41916	integer_group	299	{"type": "number", "value": 299, "parsing": false}	0	number
41917	integer_group	300	{"type": "number", "value": 300, "parsing": false}	0	number
41918	integer_group	302	{"type": "number", "value": 302, "parsing": false}	0	number
41919	integer_group	303	{"type": "number", "value": 303, "parsing": false}	0	number
41920	integer_group	305	{"type": "number", "value": 305, "parsing": false}	0	number
41921	integer_group	306	{"type": "number", "value": 306, "parsing": false}	0	number
41922	integer_group	307	{"type": "number", "value": 307, "parsing": false}	0	number
41923	integer_group	312	{"type": "number", "value": 312, "parsing": false}	0	number
41924	integer_group	308	{"type": "number", "value": 308, "parsing": false}	0	number
41925	integer_group	309	{"type": "number", "value": 309, "parsing": false}	0	number
41926	integer_group	310	{"type": "number", "value": 310, "parsing": false}	0	number
41927	integer_group	311	{"type": "number", "value": 311, "parsing": false}	0	number
41928	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41929	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41930	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41931	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41932	DEGREE2_COEFF	12	{"type": "number", "value": 12, "parsing": false}	4	number
41933	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41934	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41935	integer_group	267	{"type": "number", "value": 267, "parsing": false}	0	number
41936	integer_group	272	{"type": "number", "value": 272, "parsing": false}	0	number
41937	integer_group	269	{"type": "number", "value": 269, "parsing": false}	0	number
41938	integer_group	273	{"type": "number", "value": 273, "parsing": false}	0	number
41939	integer_group	275	{"type": "number", "value": 275, "parsing": false}	0	number
41940	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41941	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41942	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41943	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41944	DEGREE2_COEFF	19	{"type": "number", "value": 19, "parsing": false}	4	number
41945	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41946	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41947	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41948	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41949	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41950	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41951	DEGREE2_COEFF	15	{"type": "number", "value": 15, "parsing": false}	4	number
41952	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41953	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41954	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41955	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41956	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41957	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41958	DEGREE2_COEFF	21	{"type": "number", "value": 21, "parsing": false}	4	number
41959	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41960	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41961	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41962	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41963	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41964	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41965	DEGREE2_COEFF	23	{"type": "number", "value": 23, "parsing": false}	4	number
41966	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41967	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41968	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41969	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41970	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41971	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41972	DEGREE2_COEFF	22	{"type": "number", "value": 22, "parsing": false}	4	number
41973	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41974	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41975	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41976	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41977	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41978	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41979	DEGREE2_COEFF	24	{"type": "number", "value": 24, "parsing": false}	4	number
41980	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41981	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41982	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41983	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41984	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41985	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41986	DEGREE2_COEFF	25	{"type": "number", "value": 25, "parsing": false}	4	number
41987	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41988	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41989	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41990	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41991	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41992	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
41993	DEGREE2_COEFF	26	{"type": "number", "value": 26, "parsing": false}	4	number
41994	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
41995	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
41996	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
41997	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
41998	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
41999	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42000	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	4	number
42001	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42002	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42003	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42004	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42005	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42006	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42007	DEGREE2_COEFF	16	{"type": "number", "value": 16, "parsing": false}	4	number
42008	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42009	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42010	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42011	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42012	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42013	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42014	DEGREE2_COEFF	17	{"type": "number", "value": 17, "parsing": false}	4	number
42015	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42016	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42017	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42018	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42019	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42020	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42021	DEGREE2_COEFF	20	{"type": "number", "value": 20, "parsing": false}	4	number
42022	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42023	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42024	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42025	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42026	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42027	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42028	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42029	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42030	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42031	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42032	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42033	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42034	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42035	DEGREE2_COEFF	34	{"type": "number", "value": 34, "parsing": false}	4	number
42036	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42037	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42038	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42039	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42040	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42041	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42042	DEGREE2_COEFF	35	{"type": "number", "value": 35, "parsing": false}	4	number
42043	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42044	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42045	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42046	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42047	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42048	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42049	DEGREE2_COEFF	37	{"type": "number", "value": 37, "parsing": false}	4	number
42050	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42051	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42052	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42053	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42054	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42055	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42056	DEGREE2_COEFF	36	{"type": "number", "value": 36, "parsing": false}	4	number
42057	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42058	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42059	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42060	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42061	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42062	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42063	DEGREE2_COEFF	39	{"type": "number", "value": 39, "parsing": false}	4	number
42064	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42065	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42066	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42067	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42068	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42069	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42070	DEGREE2_COEFF	38	{"type": "number", "value": 38, "parsing": false}	4	number
42071	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42072	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42073	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42074	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42075	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42076	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42077	DEGREE2_COEFF	28	{"type": "number", "value": 28, "parsing": false}	4	number
42078	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42079	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42080	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42081	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42082	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42083	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42084	DEGREE2_COEFF	40	{"type": "number", "value": 40, "parsing": false}	4	number
42085	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42086	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42087	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42088	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42089	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42090	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42091	DEGREE2_COEFF	29	{"type": "number", "value": 29, "parsing": false}	4	number
42092	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42093	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42094	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42095	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42096	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42097	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42098	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	4	number
42099	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42100	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42101	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42102	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42103	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42104	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42105	DEGREE2_COEFF	32	{"type": "number", "value": 32, "parsing": false}	4	number
42106	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42107	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42108	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42109	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42110	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42111	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42112	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
42113	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42114	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42115	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42116	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42117	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42118	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42119	DEGREE2_COEFF	47	{"type": "number", "value": 47, "parsing": false}	4	number
42120	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42121	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42122	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42123	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42124	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42125	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42126	DEGREE2_COEFF	48	{"type": "number", "value": 48, "parsing": false}	4	number
42127	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42128	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42129	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42130	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42131	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42132	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42133	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
42134	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42135	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42136	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42137	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42138	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42139	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42140	DEGREE2_COEFF	49	{"type": "number", "value": 49, "parsing": false}	4	number
42141	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42142	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42143	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42144	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42145	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42146	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42147	DEGREE2_COEFF	51	{"type": "number", "value": 51, "parsing": false}	4	number
42148	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42149	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42150	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42151	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42152	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42153	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42154	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42155	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42156	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42157	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42158	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42159	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42160	DEGREE1_COEFF	11	{"type": "number", "value": 11, "parsing": false}	3	number
42161	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42162	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42163	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42164	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42165	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42166	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42167	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42168	DEGREE2_COEFF	41	{"type": "number", "value": 41, "parsing": false}	4	number
42169	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42170	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42171	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42172	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42173	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42174	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42175	DEGREE2_COEFF	43	{"type": "number", "value": 43, "parsing": false}	4	number
42176	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42177	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42178	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42179	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42180	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42181	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42182	DEGREE2_COEFF	42	{"type": "number", "value": 42, "parsing": false}	4	number
42183	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42184	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42185	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42186	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42187	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42188	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42189	DEGREE2_COEFF	46	{"type": "number", "value": 46, "parsing": false}	4	number
42190	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42191	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42192	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42193	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42194	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42195	DEGREE1_COEFF	15	{"type": "number", "value": 15, "parsing": false}	3	number
42196	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42197	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42198	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42199	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42200	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42201	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42202	DEGREE1_COEFF	17	{"type": "number", "value": 17, "parsing": false}	3	number
42203	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42204	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42205	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42206	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42207	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42208	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42209	DEGREE1_COEFF	20	{"type": "number", "value": 20, "parsing": false}	3	number
42210	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42211	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42212	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42213	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42214	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42215	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42216	DEGREE1_COEFF	19	{"type": "number", "value": 19, "parsing": false}	3	number
42217	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42218	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42219	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42220	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42221	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42222	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42223	DEGREE1_COEFF	22	{"type": "number", "value": 22, "parsing": false}	3	number
42224	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42225	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42226	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42227	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42228	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42229	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42230	DEGREE1_COEFF	21	{"type": "number", "value": 21, "parsing": false}	3	number
42231	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42232	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42233	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42234	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42235	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42236	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42237	DEGREE1_COEFF	24	{"type": "number", "value": 24, "parsing": false}	3	number
42238	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42239	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42240	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42241	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42242	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42243	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42244	DEGREE1_COEFF	23	{"type": "number", "value": 23, "parsing": false}	3	number
42245	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42246	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42247	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42248	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42249	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42250	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42251	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42252	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42253	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42254	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42255	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42256	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42257	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42258	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	3	number
42259	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42260	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42261	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42262	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42263	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42264	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42265	DEGREE1_COEFF	16	{"type": "number", "value": 16, "parsing": false}	3	number
42266	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42267	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42268	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42269	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42270	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42271	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42272	DEGREE1_COEFF	18	{"type": "number", "value": 18, "parsing": false}	3	number
42273	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42274	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42275	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42276	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42277	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42278	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42279	DEGREE1_COEFF	31	{"type": "number", "value": 31, "parsing": false}	3	number
42280	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42281	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42282	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42283	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42284	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42285	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42286	DEGREE1_COEFF	33	{"type": "number", "value": 33, "parsing": false}	3	number
42287	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42288	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42289	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42290	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42291	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42292	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42293	DEGREE1_COEFF	32	{"type": "number", "value": 32, "parsing": false}	3	number
42294	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42295	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42296	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42297	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42298	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42299	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42300	DEGREE1_COEFF	28	{"type": "number", "value": 28, "parsing": false}	3	number
42301	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42302	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42303	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42304	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42305	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42306	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42307	DEGREE1_COEFF	36	{"type": "number", "value": 36, "parsing": false}	3	number
42308	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42309	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42310	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42311	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42312	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42313	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42314	DEGREE1_COEFF	35	{"type": "number", "value": 35, "parsing": false}	3	number
42315	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42316	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42317	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42318	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42319	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42320	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42321	DEGREE1_COEFF	34	{"type": "number", "value": 34, "parsing": false}	3	number
42322	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42323	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42324	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42325	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42326	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42327	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42328	DEGREE1_COEFF	38	{"type": "number", "value": 38, "parsing": false}	3	number
42329	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42330	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42331	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42332	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42333	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42334	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42335	DEGREE1_COEFF	39	{"type": "number", "value": 39, "parsing": false}	3	number
38396	x	5	{"type": "number", "value": "5", "parsing": false}	0	number
38397	y	3	{"type": "number", "value": "3", "parsing": false}	1	number
38398	y^4	-22	{"type": "number", "value": "-22", "parsing": false}	2	number
38399	y^5	-2	{"type": "number", "value": "-2", "parsing": false}	3	number
38400	x^2y	20	{"type": "number", "value": "20", "parsing": false}	4	number
38401	x^3y	244	{"type": "number", "value": "244", "parsing": false}	5	number
38402	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
38403	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
38404	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
38405	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
38406	x^2	1	{"type": "number", "value": 1, "parsing": false}	10	number
38407	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
38408	x^4	-3	{"type": "number", "value": "-3", "parsing": false}	12	number
38409	xy^4	0	{"type": "number", "value": "0", "parsing": false}	13	number
38410	xy	1	{"type": "number", "value": 1, "parsing": false}	14	number
38411	x^5	0	{"type": "number", "value": "0", "parsing": false}	15	number
38412	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	16	number
38413	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	17	number
38414	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	18	number
38415	y^2	25	{"type": "number", "value": "25", "parsing": false}	19	number
38416	integer_group	202	{"type": "number", "value": 202, "parsing": false}	0	number
42336	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42337	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42338	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42339	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42340	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42341	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42342	DEGREE1_COEFF	27	{"type": "number", "value": 27, "parsing": false}	3	number
42343	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42344	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42345	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42346	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42347	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42348	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42349	DEGREE1_COEFF	37	{"type": "number", "value": 37, "parsing": false}	3	number
42350	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42351	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42352	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42353	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42354	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42355	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42356	DEGREE1_COEFF	29	{"type": "number", "value": 29, "parsing": false}	3	number
42357	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42358	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42359	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42360	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42361	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42362	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42363	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42364	DEGREE2_COEFF	19	{"type": "number", "value": 19, "parsing": false}	4	number
42365	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42366	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42367	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42368	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42369	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42370	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42371	DEGREE2_COEFF	15	{"type": "number", "value": 15, "parsing": false}	4	number
42372	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42373	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42374	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42375	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42376	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42377	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42378	DEGREE2_COEFF	16	{"type": "number", "value": 16, "parsing": false}	4	number
42379	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42380	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42381	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42382	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42383	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42384	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42385	DEGREE2_COEFF	18	{"type": "number", "value": 18, "parsing": false}	4	number
42386	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42387	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42388	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42389	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42390	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42391	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42392	DEGREE2_COEFF	17	{"type": "number", "value": 17, "parsing": false}	4	number
42393	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42394	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42395	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42396	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42397	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42398	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42399	DEGREE2_COEFF	20	{"type": "number", "value": 20, "parsing": false}	4	number
42400	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42401	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42402	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42403	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42404	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42405	DEGREE1_COEFF	41	{"type": "number", "value": 41, "parsing": false}	3	number
42406	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42407	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42408	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42409	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42410	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42411	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42412	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42413	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	4	number
42414	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42415	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42416	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42417	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42418	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42419	DEGREE1_COEFF	42	{"type": "number", "value": 42, "parsing": false}	3	number
42420	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42421	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42422	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42423	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42424	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42425	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42426	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42427	DEGREE2_COEFF	11	{"type": "number", "value": 11, "parsing": false}	4	number
42428	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42429	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42430	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42431	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42432	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42433	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42434	DEGREE2_COEFF	12	{"type": "number", "value": 12, "parsing": false}	4	number
42435	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42436	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42437	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42438	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42439	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42440	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42441	DEGREE2_COEFF	13	{"type": "number", "value": 13, "parsing": false}	4	number
42442	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42443	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42444	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42445	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42446	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42447	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42448	DEGREE2_COEFF	14	{"type": "number", "value": 14, "parsing": false}	4	number
42449	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42450	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42451	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42452	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42453	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42454	DEGREE1_COEFF	12	{"type": "number", "value": 12, "parsing": false}	3	number
42455	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42456	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42457	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42458	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42459	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42460	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42461	DEGREE1_COEFF	26	{"type": "number", "value": 26, "parsing": false}	3	number
42462	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42463	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42464	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42465	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42466	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42467	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42468	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42469	DEGREE2_COEFF	22	{"type": "number", "value": 22, "parsing": false}	4	number
42470	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42471	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42472	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42473	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42474	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42475	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42476	DEGREE2_COEFF	23	{"type": "number", "value": 23, "parsing": false}	4	number
42477	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42478	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42479	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42480	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42481	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42482	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42483	DEGREE2_COEFF	24	{"type": "number", "value": 24, "parsing": false}	4	number
42484	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42485	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42486	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42487	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42488	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42489	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42490	DEGREE2_COEFF	25	{"type": "number", "value": 25, "parsing": false}	4	number
42491	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42492	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42493	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42494	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42495	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42496	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42497	DEGREE2_COEFF	26	{"type": "number", "value": 26, "parsing": false}	4	number
42498	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42499	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42500	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42501	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42502	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42503	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42504	DEGREE2_COEFF	27	{"type": "number", "value": 27, "parsing": false}	4	number
42505	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42506	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42507	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42508	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42509	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42510	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42511	DEGREE2_COEFF	28	{"type": "number", "value": 28, "parsing": false}	4	number
42512	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42513	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42514	x	5	{"type": "number", "value": 5, "parsing": false}	0	number
42515	y	3	{"type": "number", "value": 3, "parsing": false}	1	number
42516	y^4	-22	{"type": "number", "value": -22, "parsing": false}	2	number
42517	y^5	-2	{"type": "number", "value": -2, "parsing": false}	3	number
42518	x^2y	20	{"type": "number", "value": 20, "parsing": false}	4	number
42519	x^3y	244	{"type": "number", "value": 244, "parsing": false}	5	number
42520	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42521	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42522	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42523	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42524	x^2	1	{"type": "number", "value": 1, "parsing": false}	10	number
42525	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42526	x^4	-3	{"type": "number", "value": -3, "parsing": false}	12	number
42527	xy^4	0	{"type": "number", "value": 0, "parsing": false}	13	number
42528	xy	1	{"type": "number", "value": 1, "parsing": false}	14	number
42529	x^5	-19	{"type": "number", "value": -19, "parsing": false}	15	number
42530	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	16	number
42531	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	17	number
42532	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	18	number
42533	y^2	25	{"type": "number", "value": 25, "parsing": false}	19	number
42534	x^3y	0	{"type": "number", "value": 0}	0	number
42535	xy	1	{"type": "number", "value": 1}	1	number
42536	y^4	-2	{"type": "number", "value": -2}	2	number
42537	y^5	5	{"type": "number", "value": 5}	3	number
42538	x^2y	1	{"type": "number", "value": 1}	4	number
42542	xy^2	0	{"type": "number", "value": 0}	8	number
42543	x^3	1	{"type": "number", "value": 1}	9	number
42544	x^2	1	{"type": "number", "value": 1}	10	number
42545	x^3y^2	1	{"type": "number", "value": 1}	11	number
42546	x^4	1	{"type": "number", "value": 1}	12	number
42547	x^5	3	{"type": "number", "value": 3}	13	number
42548	xy^4	1	{"type": "number", "value": 1}	14	number
42549	y	1	{"type": "number", "value": 1}	15	number
42550	x	1	{"type": "number", "value": 1}	16	number
42551	x^2y^3	1	{"type": "number", "value": 1}	17	number
42552	x^2y^2	-13	{"type": "number", "value": -13}	18	number
42553	x^4y	-5	{"type": "number", "value": -5}	19	number
42554	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42555	cellSize	41	{"type": "number", "value": 41, "parsing": false}	1	number
42556	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42557	cellSize	46	{"type": "number", "value": 46, "parsing": false}	1	number
42558	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42559	cellSize	47	{"type": "number", "value": 47, "parsing": false}	1	number
42560	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42561	cellSize	45	{"type": "number", "value": 45, "parsing": false}	1	number
42562	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42563	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
42564	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42565	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42566	DEGREE2_COEFF	56	{"type": "number", "value": 56, "parsing": false}	4	number
42567	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42568	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
42569	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42570	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42571	COLOR2	#a653d9	{"type": "color", "value": "#a653d9", "parsing": false}	2	color
42572	DEGREE1_COEFF	30	{"type": "number", "value": 30, "parsing": false}	3	number
42573	DEGREE2_COEFF	30	{"type": "number", "value": 30, "parsing": false}	4	number
42574	CHILDREN	[4,6,-5,-7]	{"type": "javascript", "value": "[4,6,-5,-7]", "parsing": false}	5	javascript
42575	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	6	number
42576	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42577	cellSize	44	{"type": "number", "value": 44, "parsing": false}	1	number
42578	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42579	cellSize	48	{"type": "number", "value": 48, "parsing": false}	1	number
42580	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42581	cellSize	44	{"type": "number", "value": 44, "parsing": false}	1	number
42582	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42583	cellSize	42	{"type": "number", "value": 42, "parsing": false}	1	number
42584	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42585	cellSize	42	{"type": "number", "value": 42, "parsing": false}	1	number
42586	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42587	cellSize	43	{"type": "number", "value": 43, "parsing": false}	1	number
42588	param1	5	{"type": "string", "value": "5", "parsing": false}	0	string
42589	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42590	cellSize	35	{"type": "number", "value": 35, "parsing": false}	1	number
42591	solutionPathColor	#386356	{"type": "color", "value": "#386356", "parsing": false}	0	color
42592	cellSize	42	{"type": "number", "value": 42, "parsing": false}	1	number
42593	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42594	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
42595	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42596	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42597	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
42598	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42599	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
42600	integer_group	156	{"type": "number", "value": 156, "parsing": false}	0	number
42601	integer_group	144	{"type": "number", "value": 144, "parsing": false}	0	number
42602	integer_group	15	{"type": "number", "value": 15, "parsing": false}	0	number
42603	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42604	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42605	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42606	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42607	DEGREE2_COEFF	13	{"type": "number", "value": 13, "parsing": false}	4	number
42608	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42609	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42610	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42611	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
42612	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42613	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42614	DEGREE2_COEFF	46	{"type": "number", "value": 46, "parsing": false}	4	number
42615	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42616	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
42617	integer_group	189	{"type": "number", "value": 189, "parsing": false}	0	number
42618	integer_group	205	{"type": "number", "value": 205, "parsing": false}	0	number
42619	integer_group	235	{"type": "number", "value": 235, "parsing": false}	0	number
42620	integer_group	304	{"type": "number", "value": 304, "parsing": false}	0	number
42621	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42622	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42623	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42624	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42625	DEGREE2_COEFF	27	{"type": "number", "value": 27, "parsing": false}	4	number
42626	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42627	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42628	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42629	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
42630	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42631	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42632	DEGREE2_COEFF	55	{"type": "number", "value": 55, "parsing": false}	4	number
42633	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42634	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
42635	integer_group	17	{"type": "number", "value": 17, "parsing": false}	0	number
42636	integer_group	56	{"type": "number", "value": 56, "parsing": false}	0	number
42637	integer_group	134	{"type": "number", "value": 134, "parsing": false}	0	number
42638	x^4	4	{"type": "number", "value": 4, "parsing": false}	0	number
42639	x^2	1	{"type": "number", "value": 1, "parsing": false}	1	number
42640	y^4	-2	{"type": "number", "value": -2, "parsing": false}	2	number
42641	y^5	14	{"type": "number", "value": 14, "parsing": false}	3	number
42642	x^2y	2	{"type": "number", "value": 2, "parsing": false}	4	number
42643	x^3y	2	{"type": "number", "value": 2, "parsing": false}	5	number
42644	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42645	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42646	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42647	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42648	xy	1	{"type": "number", "value": 1, "parsing": false}	10	number
42649	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42650	y^2	2	{"type": "number", "value": 2, "parsing": false}	12	number
42651	x^5	3	{"type": "number", "value": 3, "parsing": false}	13	number
42652	xy^4	1	{"type": "number", "value": 1, "parsing": false}	14	number
42653	y	3	{"type": "number", "value": 3, "parsing": false}	15	number
42654	x	5	{"type": "number", "value": 5, "parsing": false}	16	number
42655	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	number
42656	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	number
42657	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	number
42658	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42659	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42660	COLOR2	#9050b8	{"type": "color", "value": "#9050b8", "parsing": false}	2	color
42661	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42662	DEGREE2_COEFF	21	{"type": "number", "value": 21, "parsing": false}	4	number
42663	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42664	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42665	x	5	{"type": "number", "value": 5, "parsing": false}	0	number
42666	y	3	{"type": "number", "value": 3, "parsing": false}	1	number
42667	y^4	-2	{"type": "number", "value": -2, "parsing": false}	2	number
42668	y^5	5	{"type": "number", "value": 5, "parsing": false}	3	number
42669	x^2y	0	{"type": "number", "value": 0, "parsing": false}	4	number
42670	x^3y	0	{"type": "number", "value": 0, "parsing": false}	5	number
42671	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42672	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42673	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42674	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42675	xy	1	{"type": "number", "value": 1, "parsing": false}	10	number
42676	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42677	y^2	2	{"type": "number", "value": 2, "parsing": false}	12	number
42678	xy^4	1	{"type": "number", "value": 1, "parsing": false}	13	number
42679	x^2	1	{"type": "number", "value": 1, "parsing": false}	14	number
42680	x^5	3	{"type": "number", "value": 3, "parsing": false}	15	number
42681	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	16	number
42682	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	17	number
42683	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	18	number
42684	x^4	4	{"type": "number", "value": 4, "parsing": false}	19	number
42685	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42686	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42687	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42688	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	3	number
42689	DEGREE2_COEFF	50	{"type": "number", "value": 50, "parsing": false}	4	number
42690	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42691	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	6	number
42692	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42693	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42694	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42695	DEGREE1_COEFF	40	{"type": "number", "value": 40, "parsing": false}	3	number
42696	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42697	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42698	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42699	x	5	{"type": "number", "value": 5, "parsing": false}	0	number
42700	y	3	{"type": "number", "value": 3, "parsing": false}	1	number
42701	y^4	-22	{"type": "number", "value": -22, "parsing": false}	2	number
42702	y^5	-2	{"type": "number", "value": -2, "parsing": false}	3	number
42703	x^2y	20	{"type": "number", "value": 20, "parsing": false}	4	number
42704	x^3y	244	{"type": "number", "value": 244, "parsing": false}	5	number
42705	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42706	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42707	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42708	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42709	x^2	1	{"type": "number", "value": 1, "parsing": false}	10	number
42710	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42711	x^4	-3	{"type": "number", "value": -3, "parsing": false}	12	number
42712	xy^4	0	{"type": "number", "value": 0, "parsing": false}	13	number
42713	xy	1	{"type": "number", "value": 1, "parsing": false}	14	number
42714	x^5	-18	{"type": "number", "value": -18, "parsing": false}	15	number
42715	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	16	number
42716	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	17	number
42717	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	18	number
42718	y^2	25	{"type": "number", "value": 25, "parsing": false}	19	number
42719	integer_group	425	{"type": "number", "value": 425, "parsing": false}	0	number
42720	integer_group	131	{"type": "number", "value": 131, "parsing": false}	0	number
42721	integer_group	133	{"type": "number", "value": 133, "parsing": false}	0	number
42722	integer_group	135	{"type": "number", "value": 135, "parsing": false}	0	number
42723	integer_group	21	{"type": "number", "value": 21, "parsing": false}	0	number
42724	integer_group	121	{"type": "number", "value": 121, "parsing": false}	0	number
42725	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42726	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42727	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42728	DEGREE1_COEFF	14	{"type": "number", "value": 14, "parsing": false}	3	number
42729	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42730	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42731	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42732	x	5	{"type": "number", "value": 5, "parsing": false}	0	number
42733	y	3	{"type": "number", "value": 3, "parsing": false}	1	number
42734	y^4	-22	{"type": "number", "value": -22, "parsing": false}	2	number
42735	y^5	-2	{"type": "number", "value": -2, "parsing": false}	3	number
42736	x^2y	20	{"type": "number", "value": 20, "parsing": false}	4	number
42737	x^3y	244	{"type": "number", "value": 244, "parsing": false}	5	number
42738	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42739	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42740	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42741	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42742	x^2	1	{"type": "number", "value": 1, "parsing": false}	10	number
42743	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42744	x^4	-3	{"type": "number", "value": -3, "parsing": false}	12	number
42745	xy^4	0	{"type": "number", "value": 0, "parsing": false}	13	number
42746	xy	1	{"type": "number", "value": 1, "parsing": false}	14	number
42747	x^5	-17	{"type": "number", "value": -17, "parsing": false}	15	number
42748	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	16	number
42749	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	17	number
42750	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	18	number
42751	y^2	25	{"type": "number", "value": 25, "parsing": false}	19	number
42752	integer_group	125	{"type": "number", "value": 125, "parsing": false}	0	number
42753	integer_group	127	{"type": "number", "value": 127, "parsing": false}	0	number
42754	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42755	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42756	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42757	DEGREE1_COEFF	30	{"type": "number", "value": 30, "parsing": false}	3	number
42758	DEGREE2_COEFF	33	{"type": "number", "value": 33, "parsing": false}	4	number
42759	CHILDREN	[4,6,8,-7]	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	javascript
42760	TRAPEZOIDAL_SECTIONS	13	{"type": "number", "value": 13, "parsing": false}	6	number
42761	integer_group	115	{"type": "number", "value": 115, "parsing": false}	0	number
42762	integer_group	129	{"type": "number", "value": 129, "parsing": false}	0	number
42763	integer_group	113	{"type": "number", "value": 113, "parsing": false}	0	number
42764	integer_group	117	{"type": "number", "value": 117, "parsing": false}	0	number
42765	integer_group	119	{"type": "number", "value": 119, "parsing": false}	0	number
42766	integer_group	123	{"type": "number", "value": 123, "parsing": false}	0	number
42767	integer_group	268	{"type": "number", "value": 268, "parsing": false}	0	number
42768	xy	1	{"type": "number", "value": 1, "parsing": false}	0	number
42769	y^2	2	{"type": "number", "value": 2, "parsing": false}	1	number
42770	y^4	-2	{"type": "number", "value": -2, "parsing": false}	2	number
42771	y^5	0	{"type": "number", "value": 0, "parsing": false}	3	number
42772	x^2y	20	{"type": "number", "value": 20, "parsing": false}	4	number
42773	x^3y	2	{"type": "number", "value": 2, "parsing": false}	5	number
42774	y^3	3	{"type": "number", "value": 3, "parsing": false}	6	number
42775	xy^3	7	{"type": "number", "value": 7, "parsing": false}	7	number
42776	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42777	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42778	x^2	1	{"type": "number", "value": 1, "parsing": false}	10	number
42779	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42780	x^4	-3	{"type": "number", "value": -3, "parsing": false}	12	number
42781	x^5	0	{"type": "number", "value": 0, "parsing": false}	13	number
42782	xy^4	0	{"type": "number", "value": 0, "parsing": false}	14	number
42783	y	3	{"type": "number", "value": 3, "parsing": false}	15	number
42784	x	5	{"type": "number", "value": 5, "parsing": false}	16	number
42785	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	number
42786	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	number
42787	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	number
42788	x^4	-3	{"type": "number", "value": -3, "parsing": false}	0	number
42789	x^2	1	{"type": "number", "value": 1, "parsing": false}	1	number
42790	y^4	-2	{"type": "number", "value": -2, "parsing": false}	2	number
42791	y^5	1	{"type": "number", "value": 1, "parsing": false}	3	number
42792	x^2y	20	{"type": "number", "value": 20, "parsing": false}	4	number
42793	x^3y	2	{"type": "number", "value": 2, "parsing": false}	5	number
42794	y^3	30	{"type": "number", "value": 30, "parsing": false}	6	number
42795	xy^3	-75	{"type": "number", "value": -75, "parsing": false}	7	number
42796	xy^2	0	{"type": "number", "value": 0, "parsing": false}	8	number
42797	x^3	1	{"type": "number", "value": 1, "parsing": false}	9	number
42798	xy	1	{"type": "number", "value": 1, "parsing": false}	10	number
42799	x^3y^2	1	{"type": "number", "value": 1, "parsing": false}	11	number
42800	y^2	2	{"type": "number", "value": 2, "parsing": false}	12	number
42801	x^5	0	{"type": "number", "value": 0, "parsing": false}	13	number
42802	xy^4	0	{"type": "number", "value": 0, "parsing": false}	14	number
42803	y	3	{"type": "number", "value": 3, "parsing": false}	15	number
42804	x	5	{"type": "number", "value": 5, "parsing": false}	16	number
42805	x^2y^3	1	{"type": "number", "value": 1, "parsing": false}	17	number
42806	x^2y^2	-13	{"type": "number", "value": -13, "parsing": false}	18	number
42807	x^4y	-5	{"type": "number", "value": -5, "parsing": false}	19	number
42808	NUM_ITERATIONS	6	{"type": "number", "value": 6, "parsing": false}	0	number
42809	COLOR1	#785A3C	{"type": "color", "value": "#785A3C", "parsing": false}	1	color
42810	COLOR2	#a024cc	{"type": "color", "value": "#a024cc", "parsing": false}	2	color
42811	TRAPEZOIDAL_SECTIONS	15	{"type": "number", "value": 15, "parsing": false}	3	number
42812	DEGREE2_COEFF	45	{"type": "number", "value": 45, "parsing": false}	4	number
42813	CHILDREN	[4,5,6,7,-8,-9]	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	javascript
42814	DEGREE1_COEFF	25	{"type": "number", "value": 25, "parsing": false}	6	number
42815	integer_group	78	{"type": "number", "value": 78, "parsing": false}	0	number
42816	NUM_ITERATIONS	5	{"type": "number", "value": 5, "parsing": false}	0	number
42817	COLOR1	#7a5229	{"type": "color", "value": "#7a5229", "parsing": false}	1	color
42818	COLOR2	#27cc24	{"type": "color", "value": "#27cc24", "parsing": false}	2	color
42819	DEGREE1_COEFF	13	{"type": "number", "value": 13, "parsing": false}	3	number
42820	DEGREE2_COEFF	47	{"type": "number", "value": 47, "parsing": false}	4	number
42821	CHILDREN	[8,15,17,-9,-16]	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	javascript
42822	TRAPEZOIDAL_SECTIONS	20	{"type": "number", "value": 20, "parsing": false}	6	number
42823	xMin	-5	{"type": "number", "value": -5}	0	number
42824	funct	cos(2x) + x^5	{"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}	1	math
42825	xMax	5	{"type": "number", "value": 5}	2	number
42826	breathDelta	17	{"type": "number", "value": 17}	3	number
\.


--
-- Name: game_seedkeyval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_seedkeyval_id_seq', 42849, true);


--
-- Data for Name: game_seedkeyvalrelationship; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_seedkeyvalrelationship (id, instance_id, keyval_id) FROM stdin;
67	365	29473
68	371	29474
69	51	29475
70	51	29476
71	51	29477
72	49	29478
73	49	29479
74	49	29480
75	52	29481
76	52	29482
77	52	29483
\.


--
-- Name: game_seedkeyvalrelationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_seedkeyvalrelationship_id_seq', 77, true);


--
-- Data for Name: game_zeroplayergame; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_zeroplayergame (id, title, description, created, category_id, owner_id, "scriptType", source, "seedStructure", "mainImage", parent_id, updated, popularity) FROM stdin;
25	Neenbox	Tests seed basics by allowing control over the color and size of the box.	2016-03-12 13:09:56.958477+00	7	1	text/javascript	var ctx = Canvas.getContext('2d')\nctx.fillStyle = color;\nctx.fillRect(10, 20, width, height);	{\n  "color":{"type":"color", "default":"#cccc00"},\n  "width":{"type":"number", "default":400},\n  "height":{"type":"number", "default":200}\n}		\N	2016-04-03 04:01:40.468342+00	1
4	Multivariate Polynomial Landscape	Choose coefficients of high-degree a polynomial function in 2 variables, as well as the 3x3 matrix used to project the graph of the surface onto a 2-dimensional canvas.  Many intricate and beautiful scenes emerge with certain affine transformations.  Defaults to a "standard" parallel projection of the z-axis (the axis "coming out of the screen")	2016-02-03 05:50:13.820034+00	2	1	text/paperscript	DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\nLIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\nconsole.log(paper.Matrix)\nview.viewSize = new Size(Canvas.width, Canvas.height);\n\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\nx_axis.add(new Point(-view.size.width/2, 0));\nx_axis.add(new Point(view.size.width/2, 0));\nx_axis.closed = true;\n//project.activeLayer.insertChild(0,x_axis)\n\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\ny_axis.add(new Point(0, -view.size.height/2));\ny_axis.add(new Point(0, view.size.height/2));\n\nx_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(n, view.size.height/2) );\n    line.add( new Point(n, -view.size.height/2) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    x_lines.push( line );\n});\n\ny_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(view.size.width/2, n) );\n    line.add( new Point(-view.size.width/2, n) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    y_lines.push( line );\n});\n\nfunction transformToCartesian(lay) {\n    lay.transform( new Matrix((view.size.width / 10),0,0,(view.size.height / -10), view.center.x, view.center.y) );\n}\n\ntransformToCartesian(project.activeLayer);\n\n\n// define formal mathematical function\nMFunction = function(func, extrema) {\n    //console.log(func.length);\n    this.func = func;\n    if (!extrema) { extrema = [-5,5]; }\n\n    this.domain = {\n        elements: [],\n        min: (extrema[0] || -5),\n        max: (extrema[1] || 5)\n    };\n\n    this.codomain = {\n        elements: [],\n        min: null,\n        max: null\n    };\n\n    this.mapping = null;\n}\n\nMFunction.prototype = {\n    \n    compute: function(delta) {\n        if (!delta) { delta = 50; }\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\n        this.codomain.elements = _.map(this.domain.elements, this.func);\n        this.codomain.min = _.min(this.codomain.elements);\n        this.codomain.max = _.max(this.codomain.elements);\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\n\n        this._w = Math.abs(this.domain.max - this.domain.min);\n        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\n\n        this.transformation_matrix = new Matrix(\n            (view.size.width / this._w), 0,\n            0, (view.size.height / (-1*this._h)), \n            view.center.x, view.center.y);\n\n        this.computed = true;\n        console.log("computed")\n    },\n\n    // "flattens" mapping\n    // i.e. [[1,2],3] -> [1,2,3]\n    getPoints: function() {\n        if (!this.computed) { this.compute(); }\n        this.points = _.map(this.mapping, function(pair) {\n            return _.flatten(pair);\n        });\n        return this.points;\n    },\n\n\n    draw: function(path, matrix_premult, map3d, tmatrix) {\n\n        if (!this.computed) { this.compute(); }\n\n        if (map3d) {\n            this.points = this.points3d;\n        } else {\n            this.points = this.getPoints();\n        }\n\n        if (matrix_premult) {\n            this.points = _.map(this.points, function(p) {\n                return numeric.dot(matrix_premult, p);\n            })\n        }\n\n        _.each(this.points, function(p) {\n            path.add(new Point(p));\n        })\n\n        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.closed = true;\n\n        //path.transform(this.transformation_matrix);\n\n        //path.smooth();\n        \n        if (tmatrix) {\n            path.transform(tmatrix);\n        } else {\n            path.transform(this.transformation_matrix);\n        } \n    }\n}\n\n\nfunction CartesianProduct(A,B) {\n    prod = [];\n    _.each(A, function(a) {\n        _.each(B, function(b) {\n            prod.push([a,b]);\n        });\n    });\n    return prod;\n}\n\nBivariatePolynomialFunction = function(degree, vars, coeffs, roots) {\n\n\n    if (roots) {\n        // each set of roots must be <= degree in order\n        factorsSym = [];\n        _.each(roots[0], function(root) {\n            factorsSym.push("("+vars[0]+"-"+root.toString()+")")\n        });\n        _.each(roots[1], function(root) {\n            factorsSym.push("("+vars[1]+"-"+root.toString()+")")\n        });\n        latex = _.reduce(factorsSym, function(j,k) { return j.toString() + k.toString(); });\n\n        f = function(x,z) {\n            factors = [];\n            _.each(roots[0], function(root) {\n                factors.push( (x-root) );\n            });\n            _.each(roots[1], function(root) {\n                factors.push( (z-root) );\n            });\n            return _.reduce(factors, function(j,k) { return j*k; });\n        }\n        f.latex = "f("+vars[0]+", "+vars[1]+")=" +latex.split('--').join('+');\n        return f;\n\n    } else {\n\n        // num coeffs should be 1 less than degree-th triangular number\n        term_exps = _.filter(CartesianProduct(_.range(degree+1), _.range(degree+1)),\n            function(x) {\n                return (x[0] + x[1]) <= degree && (x[0] + x[1]) != 0;\n            });\n        \n        if (!coeffs) {\n            coeffs = _.map(_.range(term_exps.length), function(i) {\n                rand = (Math.random() * degree) - (degree/2);\n                if (Math.random() > .4) return 0;\n                return Math.round(rand*3);\n            });\n        }  \n        \n        terms_sym = _.map(term_exps, function(term, i) {\n            if (coeffs[i] == 0) return "";\n            if (coeffs[i] == 1) {\n                coeff = "";\n            } else if (coeffs[i] == -1) {\n                coeff = "-"\n            } else coeff = coeffs[i].toString();\n            return coeff + " "\n                + vars[0]+"^"+term[0].toString() + " "\n                + vars[1]+"^"+term[1].toString();\n        });\n        terms_sym = _.filter(terms_sym, function(x) { return x != ""; })\n        //console.log(terms_sym.join(" + "));\n\n        f = function(x,z) {\n            terms = _.map(term_exps, function(term, i) {\n                return coeffs[i] * Math.pow(x, term[0]) * Math.pow(z, term[1]);\n                });\n            return _.reduce(terms, function(j,k) { return j+k; });\n        }\n        f.latex = terms_sym.join("+").split("+-").join("-").split("+").join(" + ");\n        f.latex = f.latex.split("^1").join("");\n        f.latex = "f("+vars[0]+", "+vars[1]+")=" + f.latex.split(/[a-z]\\\\^0/).join("");\n        return f;\n    }\n\n}\n\n\n\n// choose a polynomial\n//Polynomial = new BivariatePolynomialFunction(3, ['x','y'], [1,-1,0,0,0,0,-2,3,1]);\n\nif (polynomial_degree === undefined) polynomial_degree = 5;\n\nPolynomial = new BivariatePolynomialFunction(polynomial_degree, ['x','y']);//, null, [[2,3,0,-7,0],[1,-2, -4, -13]]);\n\n\nslices = [];\nzrange = [-15,0];\nxrange = [-9, 9];\nzspace = numeric.linspace(zrange[0], zrange[1], 50);\n\nF0 = function(x) { return Polynomial(x,0); }\nslice0 = new MFunction(F0, [xrange[0],xrange[1]]);\nslice0.compute();\nglobal_matrix = slice0.transformation_matrix;\n\nCartesianMatrix = new Matrix(1,0,0,-1, view.center.x, view.center.y);\n\n// begin drawing process\nGraphLayer = new Layer({\n     blendMode: "multiply",\n});\n//GraphLayer.globalMatrix = CartesianMatrix;\n//GraphLayer.transform(CartesianMatrix);\n\nconsole.log("global matrix"); console.log(global_matrix);\n\nfunction_shown = false;\nzindex=0\n\nview.onFrame = function(event) {\n    \n    if (zindex < zspace.length) {\n        \n        //prevLayer = project.activeLayer;\n        l = new Layer({\n            //blendMode: "multiply"\n        });\n\n        z = zspace[zindex];\n        //console.log(z)\n    \n\n        F = function(x) { return Polynomial(x,z); }\n        slice = new MFunction(F, [xrange[0],xrange[1]]);\n\n        points3d = slice.getPoints();\n        _.each(_.range(points3d.length), function(i) { points3d[i].push(z); });\n\n        slice.points3d = points3d\n\n        transformation = [\n            [1, 0, 0], //5*Math.cos(Math.PI/-4)],\n            [0, 1, 0] //5*Math.sin(Math.PI/-4)],\n        ];\n\n        path1 = new Path({\n            strokeColor: new Color(0.3, 0.3, 0.3, 0.5),\n            strokeWidth: 1,\n            closed: true,\n            fillColor: new Color(Math.random(),1,Math.random(),0.2),\n        });\n\n        slice.draw(path1, transformation, true, global_matrix);\n        //path.transform(CartesianMatrix)\n\n        // transformation2 = new Matrix(\n        //     1-(z/50), 0, 0, 1-(z/50), 0, 0 //5*Math.sin(Math.PI/-4)],\n        // );\n\n        transformation2 = new Matrix(\n            1, 0, 0, 1, 0, 0 //5*Math.sin(Math.PI/-4)],\n        );\n\n        //path1.transform(transformation2);\n        path1.scale(1-(z/50), 1-(z/50), view.center)\n        path1.translate(new Point(-10*z, 30*z))\n        \n        project.activeLayer.insertChild(0,path1);\n\n        slices.push({layer: project.activeLayer,\n            func: slice,\n            transformation: transformation,\n            path: path1});\n\n        //console.log(path.position)\n        \n        if (zindex == zspace.length-1) { \n            //console.log(slices);\n            //view.pause();\n        }\n        zindex++;\n\n        if (!function_shown) {\n            if (display = document.getElementById("function-katex")) {\n                //katex.render(Polynomial.latex, display);\n                tokens = Polynomial.latex.split(" ");\n                line_length = Math.ceil(tokens.length/2);\n                line2 = tokens.splice(-1*line_length).join(" ");\n                line1 = tokens.join(" ");\n                $("#function-katex").text(\n                    "$$" + line1 + "$$\\\n$$\\\\\\\\space \\\\\\\\space \\\\\\\\space \\\\\\\\space " + line2 + "$$ \\\n"\n                     + "$$\\\\\\\\left(\\\\\\\\begin{array}{rrr}\\\n1 & 0 & \\\\\\\\frac{1}{2} \\\\\\\\, \\\\\\\\sqrt{2} \\\\\\\\\\\\\\\\\\\n0 & 1 & \\\\\\\\frac{1}{2} \\\\\\\\, \\\\\\\\sqrt{2}\\\\\\\\\\\\\\\\\\\n \\\\\\\\end{array}\\\\\\ight)$$");\n                function_shown = true;\n            }\n        }\n    }\n    \n}\n\n\n\n////////////\n\n\nfunction onResize(event) {\n\n}	{\n  "polynomial_degree": {"type":"number", "min":2, "max":20, "default": 5}\n}		\N	2016-03-23 10:38:51.626019+00	1
30	Audioviz Test	First test for audioviz components	2016-03-25 14:20:09.287348+00	4	1	text/paperscript	var N = 32; // should at least divide 1024\nvar analyser;\nvar viz;\n\n\n// create circle elements\nview.width = Canvas.width;\nview.height = Canvas.height;\n\nvar r = _.min([view.width, view.height]) / 2;\nvar elem = [];\n\n_.each(_.range(N), function(n) {\n\t\n\tvar rfac = ((N-n)/N); \n\t\n\tvar col = new Color();\n\tcol.hue = (360)*(n/N);\n\tcol.saturation = 0.5;\n\tcol.brightness = 1;\n\t\n\tvar el = new Path.Circle({\n\t\tradius: r*rfac,\n\t\tcenter: view.center,\n\t\tfillColor: col,\n\t\tblendMode: 'multiply',\n\t\topacity: 0.5 + ((n/N)/2)\n\t});\n\t\n\telem.push(el)\t\n})\n\n\nview.onFrame = function() {\n\t\n\tanalyser.getByteFrequencyData(fdata);\n\tconsole.log('onFrame');\n  \n\t_.each(elem, function(el, i){\n\t\t\n\t\tvar sum = 0;\n\t\t_.each(_.range( ((bincount/N)*i), ((bincount/N)*(i+1)) ), \n\t\t\tfunction(i) { sum += fdata[i]; });\n\t\t\n\t\tvar fac = ((sum/(bincount/N))/255);\n\n\t\tel.fillColor.saturation = fac;\n\t\tel.fillColor.hue += 3*fac;\n\n\n\t});\n\n}\n\n\nvar audio;\nvar bincount;\nvar fdata;\n\nwindow.start = function() {\n\t\n\taudio = new Audio();\n\taudio.src = '/static/audio/floyd.mp3';\n\taudio.play();\n\n\tvar ctx = new AudioContext();\n\tvar audioSrc = ctx.createMediaElementSource(audio);\n\tanalyser = ctx.createAnalyser();\n\taudioSrc.connect(analyser);\n\tanalyser.connect(ctx.destination);\n\n\tbincount = analyser.frequencyBinCount;\n\tfdata = new Uint8Array(bincount);\n}\n\nwindow.appdestroy = function() {\n\tconsole.log('app destroy');\n\taudio.pause();\n\taudio.src = '';\n    console.log(audio);\n\tdelete audio;\n\twindow.start = null;\n\tview.onFrame = null;\n}	{}	\N	\N	2016-04-03 21:47:37.358722+00	1
32	Transformations of grid about moving point	Transformations of grid about moving point	2016-04-04 08:58:04.510538+00	5	1	text/paperscript	view.viewSize = new Size(Canvas.width, Canvas.height);\n\n\nDARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);\nLIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.7);\n\nvar cartesian_matrix = new Matrix(1,0,0,-1, view.center.x, view.center.y);\ncartesian_matrix.scale(5)\nvar lines = [];\n\n_.each(_.range(-10,11), function(i) {\n\n\tvar path1 = new Path({\n\t\tstrokeWidth: 1,\n\t\tstrokeColor: DARK_GREY\n\t});\n\tvar points1 = _.map(_.range(-10,11), function(p) {\n\t\treturn new Point(p*10,i*10);\n\t});\n\t_.each(points1, function(p) {\n\t\tpath1.add(p);\n\t})\n\tlines.push(path1);\n\n})\n\n_.each(_.range(-10,11), function(i) {\n\n\tvar path2 = new Path({\n\t\tstrokeWidth: 1,\n\t\tstrokeColor: DARK_GREY\n\t});\n\tvar points2 = _.map(_.range(-10,11), function(p) {\n\t\treturn new Point(i*10,p*10);\n\t});\n\t_.each(points2, function(p) {\n\t\tpath2.add(p);\n\t})\n\tlines.push(path2);\n\n})\n\n\nproject.activeLayer.matrix = cartesian_matrix\n\n\n// connect points\n\n\n// rasterize never\n\n\n// var map = {\n// \tstring: '(x^2-i)(x+2)',\n// \ttransformation: function(x,y) {\n// \t\treturn new Point(Math.sin(x), - 2*Math.cos(y));\n// \t}\n// }\n\n\n// transform all points, see if points in both sets move ok\nvar transformation = new Matrix(1, 0, 0, 1, 0.01, -0.1);\ntransformation.rotate(0.1); \ntransformation.scale(0.99);\nconsole.log('trans', transformation)\n\nvar fixedpoint = (new Point(0,0)).transform(cartesian_matrix)\n//var radiusOfInversion = \n\nfunction applyTransform(seg,t) {\n\t//console.log(seg.point)\n\tvar vec = fixedpoint - seg.point\n\t//console.log(vec.length)\n\tif (vec.length != 0) {\n\t\tvec.angle += vec.length;\n\t\tseg.point = seg.point + (vec.normalize()*Math.cos(t/10))\n\t\t\n\t\t//console.log(fixedpoint)\n\t}\n\tvar r = 2; //Math.log(t)\n\tfixedpoint = (new Point(0,0) + new Point(r*Math.cos(t), \n\t\tr*Math.sin(t))).transform(cartesian_matrix);\n\tseg.path.smooth();\n}\n\nview.onFrame = function(e) {\n\t// e {delta, time, count}\n\t_.each(lines, function(line) {\n\t\t_.each(line.segments, function(seg) {\n\t\t\tapplyTransform(seg, e.time)\n\t\t\t//console.log(map.transformation(seg.point.x, seg.point.y))\n\t\t\t//seg.point = map.transformation(seg.point.x, seg.point.y);\n\t\t})\n\t})\n}	{"param1":{"default":""}}	\N	\N	2016-04-05 07:17:56.487936+00	1
24	2-dimensional Maze Generator and Solver	Uses DFS algorithm to create a unique maze each instance of running. Arrow keys let user navigate through and try to solve the maze. Automatic solving -- solution button presents the one and only one correct path.	2016-03-12 05:34:40.222228+00	1	1	text/javascript	/*\r\n\r\nMaze Generator pseudo-code\r\n\r\n1. Make the initial cell the current cell and mark it as visited\r\n2. While there are unvisited cells\r\n    1. If the current cell has any neighbors which have not been visited\r\n        1. Choose randomly one of the unvisited neighbors\r\n        2. Push the chosen cell to the stack\r\n        3. Remove the wall between the current cell and the chosen cell\r\n        4. Make the chosen cell the current cell and mark it as visited\r\n    2. Otherwise\r\n        1. Pop a cell from the stack\r\n        2. Make it the current cell\r\n*/\r\n\r\n// class Maze {\r\n\r\nfunction Maze(dimension, x, y, cellSize) {\r\n    this.x = x;\r\n    this.y = y;\r\n    this.map = [];\r\n    this.visited = [];\r\n    this.stack = [];\r\n    this.cellSize = cellSize;\r\n    this.begin = [];\r\n    this.turnArounds = [];\r\n    this.currentPosition = [0, 0];\r\n    this.ballRadius = this.cellSize * 0.4;\r\n    this.linesDrawn = [];\r\n\r\n    for (var i=0; i<y; i++) {\r\n        this.map.push( [] );\r\n        this.visited.push( [] );\r\n        for (var j=0; j<x; j++) {\r\n            this.map[i].push( [1,1,1,1] );\r\n            this.visited[i].push( false );\r\n        }\r\n    }\r\n\r\n    this.generateMap();\r\n}\r\n\r\nMaze.prototype.unvisitedCellsExist = function() {\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            if (this.visited[i][j]) return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.chooseNeighbor = function(cx,cy) {\r\n    var neighbors = [];\r\n    var directions = [];\r\n    if (cx > 0 && !this.visited[cy][cx-1]) \r\n        { neighbors.push( [cx-1, cy] ); directions.push('W'); }\r\n    if (cx < this.x-1 && !this.visited[cy][cx+1]) \r\n        { neighbors.push( [cx+1, cy] ); directions.push('E'); }\r\n    if (cy < this.y-1 && !this.visited[cy+1][cx]) \r\n        { neighbors.push( [cx, cy+1] ); directions.push('S'); }\r\n    if (cy > 0 && !this.visited[cy-1][cx]) \r\n        { neighbors.push( [cx, cy-1] ); directions.push('N'); }\r\n    if (neighbors.length) {\r\n        r = Math.floor(Math.random()*neighbors.length);\r\n        return [ neighbors[r], directions[r] ];\r\n    } else return false;\r\n};\r\n\r\nMaze.prototype.removeWall = function(x1, y1, direction) { \r\n    switch (direction) {\r\n        case 'N':\r\n            this.map[y1][x1][0] = 0;\r\n            this.map[y1-1][x1][2] = 0;\r\n        break;\r\n        case 'E':\r\n            this.map[y1][x1][1] = 0;\r\n            this.map[y1][x1+1][3] = 0;\r\n        break;\r\n        case 'S':\r\n            this.map[y1][x1][2] = 0;\r\n            this.map[y1+1][x1][0] = 0;\r\n        break;\r\n        case 'W':\r\n            this.map[y1][x1][3] = 0;\r\n            this.map[y1][x1-1][1] = 0;\r\n        break;\r\n    }\r\n};\r\n\r\nMaze.prototype.generateMap = function() {\r\n    \r\n    // choose initial cell\r\n    var rx = Math.floor(Math.random()*this.x);\r\n    var ry = Math.floor(Math.random()*this.y);\r\n\r\n    this.begin = [rx, ry];\r\n\r\n    var cx = rx;\r\n    var cy = ry;\r\n    var nx;\r\n    var ny;\r\n\r\n    this.visited[cy][cx] = true;\r\n\r\n    var next;\r\n    var nextDirection;\r\n\r\n    // while there are still unvisited cells\r\n    while (this.unvisitedCellsExist()) {\r\n        if (this.chooseNeighbor(cx,cy)) {\r\n            \r\n            next = this.chooseNeighbor(cx,cy);\r\n            \r\n            nx = next[0][0];\r\n            ny = next[0][1];\r\n            \r\n            nextDirection = next[1];\r\n            this.stack.push( [nx, ny] );\r\n            this.removeWall(cx, cy, nextDirection);\r\n            this.visited[ny][nx] = true;\r\n\r\n            cx = nx;\r\n            cy = ny;\r\n        \r\n        } else if (this.stack.length) {\r\n\r\n            next = this.stack.pop();\r\n            cx = next[0];\r\n            cy = next[1];\r\n            this.turnArounds.push([cx, cy]);\r\n          \r\n        } else break;\r\n    }\r\n\r\n    this.end = [cx, cy];\r\n    this.map[0][0][3] = 0;\r\n    this.map[this.y-1][this.x-1][1] = 0;\r\n\r\n};\r\n\r\nMaze.prototype.getClearRect = function(cx, cy) {\r\n    var fx = cx * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    var fy = cy * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    return [fx,fy];\r\n};\r\n\r\nMaze.prototype.getBallCoords = function(nx, ny) {\r\n    var bx = nx * this.cellSize + (this.cellSize/2);\r\n    var by = ny * this.cellSize + (this.cellSize/2);\r\n    return [bx,by];\r\n};\r\n\r\nMaze.prototype.clearBall = function() {\r\n    var cl = this.getClearRect(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.clearRect(cl[0], cl[1], this.ballRadius*2+2, this.ballRadius*2+2);\r\n};\r\n\r\nMaze.prototype.drawBall = function() {\r\n    var ballCoords = this.getBallCoords(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.beginPath();\r\n    ctx.arc(ballCoords[0], ballCoords[1], this.ballRadius, 0, 2*Math.PI, false);\r\n    ctx.fillStyle = 'green';\r\n    ctx.fill();\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#003300';\r\n    ctx.stroke();\r\n};\r\n\r\nMaze.prototype.move = function(d) {\r\n    var dx = d[0];\r\n    var dy = d[1];\r\n    this.clearBall();\r\n    this.currentPosition = [this.currentPosition[0]+dx, this.currentPosition[1]+dy];\r\n    this.drawBall();\r\n};\r\n\r\nMaze.prototype.lineIsDrawn = function(mt, lt) {\r\n    for (var i=0; i<this.linesDrawn.length; i++) {\r\n        if (this.linesDrawn[i][0][0] == mt[0] &&\r\n            this.linesDrawn[i][0][1] == mt[1] &&\r\n            this.linesDrawn[i][1][0] == lt[0] &&\r\n            this.linesDrawn[i][1][1] == lt[1]) {\r\n\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.render = function(ctx) {\r\n    \r\n    var cell;\r\n    var cx;\r\n    var cy;\r\n\r\n    ctx.moveTo(0,0);\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#666666';\r\n    \r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            \r\n            ctx.beginPath();\r\n            cell = this.map[i][j];\r\n            cx = this.cellSize * j;\r\n            cy = this.cellSize * i;\r\n            var mt;\r\n            var lt;\r\n\r\n            if (cell[0]) {\r\n                mt = [cx, cy];\r\n                lt = [cx+this.cellSize, cy];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            } \r\n            if (cell[1]) {\r\n                mt = [cx+this.cellSize, cy];\r\n                lt = [cx+this.cellSize, cy+this.cellSize];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            } \r\n            if (cell[2]) {\r\n                mt = [cx+this.cellSize, cy+this.cellSize];\r\n                lt = [cx, cy+this.cellSize];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            }\r\n            if (cell[3]) {\r\n                mt = [cx, cy+this.cellSize];\r\n                lt = [cx, cy];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            }\r\n\r\n        }\r\n    }\r\n\r\n    this.move([0,0]);\r\n\r\n};\r\n\r\n// } end class Maze\r\n\r\n/*\r\n    MazeSolver pseudo-code\r\n\r\n    1. start at the entrance\r\n    2. while not at the exit\r\n        1. push the current cell to visited\r\n        2. if exists one or more directions that have not been visited\r\n            1. push the current cell to pathStack\r\n            2. choose any direction from those not visited\r\n            3. move in that direction\r\n            4. draw path from previous cell to chosen cell\r\n            5. make the chosen cell the current cell\r\n        3. otherwise backtrack\r\n            1. pop the pathStack\r\n            2. remove line from currentCell to popped cell\r\n            3. do not remove popped cell from visited\r\n*/\r\n\r\n// class MazeSolver {\r\n\r\nfunction MazeSolver(maze) {\r\n    this.Maze = maze;\r\n    this.position = [0, 0];\r\n    this.pathStack = [];\r\n    this.visited = [];\r\n    this.Maze.clearBall();\r\n\r\n    var self = this;\r\n    this.solveStep = function() {\r\n        self.moveForward();\r\n    };\r\n}\r\n\r\nMazeSolver.prototype.getValidDirections = function(x,y) {\r\n    \r\n    var directions = [];\r\n    \r\n    if (!this.Maze.map[y][x][0]) \r\n        directions.push([0,-1]);\r\n    if (!this.Maze.map[y][x][1] && (x!=this.Maze.x-1 || y!=this.Maze.y-1)) \r\n        directions.push([1,0]);\r\n    if (!this.Maze.map[y][x][2]) \r\n        directions.push([0,1]);\r\n    if (!this.Maze.map[y][x][3] && (x||y)) \r\n        directions.push([-1,0]);\r\n\r\n    var validDirections = [];\r\n    for (var i=0; i<directions.length; i++) {\r\n        var tx = x+directions[i][0];\r\n        var ty = y+directions[i][1];\r\n        if (!this.isVisited(tx,ty)) {\r\n            validDirections.push(directions[i]);\r\n        }\r\n    }\r\n\r\n    return validDirections;\r\n};\r\n\r\nMazeSolver.prototype.isVisited = function(x,y) {\r\n    for (var i=0; i<this.visited.length; i++) {\r\n        if (this.visited[i][0] == x && this.visited[i][1] == y) \r\n            return true;\r\n    }\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.isDeadEnd = function(x,y) {\r\n    if (!this.getValidDirections(x,y).length)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.movePath = function(cx,cy,nx,ny) {\r\n    ctx.lineWidth = 4;\r\n    ctx.strokeStyle = solutionPathColor;\r\n    ctx.beginPath();\r\n\r\n    ctx.moveTo(cx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        cy*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.lineTo(nx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        ny*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.stroke();\r\n};\r\n\r\nMazeSolver.prototype.clearPath = function(x,y) {\r\n    ctx.clearRect(x*this.Maze.cellSize+2, y*this.Maze.cellSize+2, \r\n        this.Maze.cellSize-4, this.Maze.cellSize-4);\r\n};\r\n\r\nMazeSolver.prototype.isFinished = function() {\r\n    if (this.position[0] == this.Maze.x-1 && this.position[1] == this.Maze.y-1)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.moveForward = function() {\r\n    \r\n    var cx = this.position[0];\r\n    var cy = this.position[1];\r\n    \r\n    this.visited.push([cx,cy]);\r\n    \r\n    if (this.isFinished()) {\r\n        console.log("FINISH");\r\n        clearInterval(this.interval);\r\n        return;\r\n    }\r\n\r\n    if (!this.isDeadEnd(cx,cy)) {\r\n        this.pathStack.push([cx,cy]);\r\n        var directions = this.getValidDirections(cx,cy);\r\n        var randomDirection = Math.floor(Math.random()*directions.length);\r\n        \r\n        var nx = cx + directions[randomDirection][0];\r\n        var ny = cy + directions[randomDirection][1];\r\n\r\n        this.movePath(cx,cy,nx,ny);\r\n        this.position = [nx,ny];\r\n\r\n    } else { \r\n        this.backtrack();\r\n    }\r\n};\r\n\r\nMazeSolver.prototype.backtrack = function() {\r\n    var lastCell = this.pathStack.pop();\r\n    this.clearPath(this.position[0], this.position[1]);\r\n    this.position = [lastCell[0], lastCell[1]];\r\n};\r\n\r\n// } end class MazeSolver\r\n\r\n\r\n\r\n\r\nfunction solveMaze() {\r\n    solver = new MazeSolver(Maze);\r\n    solver.interval = setInterval(solver.solveStep, 5);\r\n}\r\n\r\nvar Maze;\r\nvar ctx = Canvas.getContext("2d");\r\nvar solver;\r\n\r\nctx.fillStyle = '#ffffff'\r\nctx.fillRect(0,0,Canvas.width, Canvas.height)\r\n\r\n\r\n\r\nvar mx = Math.floor((Canvas.width) / cellSize);\r\nvar my = Math.floor((Canvas.height) / cellSize);\r\n\r\nconsole.log([Canvas.height, $(window).height(), mx, my]);\r\n\r\nMaze = new Maze(2, mx, my, cellSize);\r\nMaze.render(ctx);\r\n\r\n$(window).keydown(function(e) {\r\n            \r\n    var tx = Maze.currentPosition[0];\r\n    var ty = Maze.currentPosition[1];\r\n\r\n    switch (e.keyCode) {\r\n\r\n        case 37: // left\r\n            if (!Maze.map[ty][tx][3]) Maze.move([-1,0]);\r\n        break;\r\n        case 38: // up\r\n            if (!Maze.map[ty][tx][0]) Maze.move([0,-1]);\r\n        break;\r\n        case 39: // right\r\n            if (!Maze.map[ty][tx][1]) Maze.move([1,0]);\r\n        break;\r\n        case 40: // down\r\n            if (!Maze.map[ty][tx][2]) Maze.move([0,1]);\r\n        break;\r\n        case 83: // 's' key\r\n            solver = new MazeSolver(Maze);\r\n            solver.interval = setInterval(solver.solveStep, 5);\r\n        break;\r\n\r\n    }\r\n});\r\n\r\nwindow.appdestroy = function() {\r\n\t$(window).unbind('keydown');\r\n  \tclearInterval(solver.interval);\r\n  \tdelete Maze;\r\n  \tdelete solver;\r\n}	{\r\n    "cellSize": {"type": "number", "min": 5, "max": 150, "default": 30},\r\n    "solutionPathColor": {"type": "color", "default": "#cc0055"}\r\n}		\N	2016-04-09 17:56:13.369187+00	70
5	Function in 1 var, time parameter, and contour	Sets of graphs of a function in 1 variable with time as a parameter.  (Technically a function in 2 variables)	2016-02-03 03:11:30.899129+00	5	1	text/paperscript	/*\r\n    *\r\n    *   @author: nino p cocchiarella\r\n    *   (c) 2016\r\n    *\r\n*/\r\n\r\nview.viewSize = new Size(Canvas.width, Canvas.height);\r\n\r\n// define formal mathematical function in 1 var\r\nMFunction = function(func, extrema) {\r\n   \r\n    this.func = func;\r\n    if (!extrema) { extrema = [-5,5]; }\r\n\r\n    this.domain = {\r\n        elements: [],\r\n        min: (extrema[0] || -5),\r\n        max: (extrema[1] || 5)\r\n    };\r\n\r\n    this.codomain = {\r\n        elements: [],\r\n        min: null,\r\n        max: null\r\n    };\r\n\r\n    this.mapping = null;\r\n    this.compute();\r\n}\r\n\r\nMFunction.prototype = {\r\n    \r\n    compute: function(delta) {\r\n        if (!delta) { delta = 100; }\r\n\r\n        eval("_func = function(x) { return "+this.func+"; };");\r\n\r\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\r\n        this.codomain.elements = _.map(this.domain.elements, _func);\r\n        this.codomain.min = _.min(this.codomain.elements);\r\n        this.codomain.max = _.max(this.codomain.elements);\r\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\r\n    },\r\n\r\n    draw: function(path, matrix_premult) {\r\n        if (this.mapping == null) { this.compute(); }\r\n        \r\n        _w = Math.abs(this.domain.max - this.domain.min);\r\n        _h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\r\n    \r\n\r\n        points = this.mapping;\r\n\r\n        if (matrix_premult) {\r\n            points = _.map(points, function(p) {\r\n                return numeric.dot(matrix_premult, p);\r\n            })\r\n        }\r\n\r\n        _.each(points, function(p) {\r\n            path.add(new Point(p));\r\n        });\r\n        \r\n        T = new Matrix(\r\n            (view.size.width / _w), 0,\r\n            0, (view.size.height / (-1*_h)), \r\n            view.center.x, view.center.y);\r\n\r\n        project.activeLayer.transform(T); \r\n    }\r\n}\r\n\r\nvar func = new MFunction(funct.javascript, [xMin,xMax]);\r\n\r\n// draw Cartesian axes\r\ndrawAxes = function(xmax, ymax) {\r\n\r\n    if (xmax == undefined) xmax = 10;\r\n    if (ymax == undefined) ymax = 10;\r\n\r\n    DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\r\n    LIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\r\n\r\n    x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    x_axis.add(new Point(-view.size.width/2, 0));\r\n    x_axis.add(new Point(view.size.width/2, 0));\r\n\r\n    y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    y_axis.add(new Point(0, -view.size.height/2));\r\n    y_axis.add(new Point(0, view.size.height/2));\r\n\r\n    _.each(_.range(-1*xmax,xmax), function(n) {\r\n        var line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(n, view.size.height/2) );\r\n        line.add( new Point(n, -view.size.height/2) );\r\n        line.closed = true;\r\n    });\r\n\r\n\r\n    _.each(_.range(-1*ymax,ymax), function(n) {\r\n        var line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(view.size.width/2, n) );\r\n        line.add( new Point(-view.size.width/2, n) );\r\n        line.closed = true;\r\n    });\r\n\r\n\r\n    project.activeLayer.transform( new Matrix((view.size.width / xmax),0,0,(view.size.height / (-1*ymax)), view.center.x, view.center.y) );\r\n\r\n}\r\n//executeRemotePaperscript("/static/site/js/app/graph-util.js");\r\ndrawAxes();\r\n\r\n////////////////////////\r\n\r\nINITCOLOR = _.map(_.range(3), Math.random)\r\nN = 15;\r\n\r\n\r\ngraphs = [];\r\n\r\n_.map(_.range(N), function(n) {\r\n\r\n    layer = new Layer({\r\n        backgroundColor: new Color(1,1,1,0)\r\n    });\r\n\r\n    thickness = (n == 0 ? 3 : 1)\r\n    alpha = 0.5 - (n/(N*2))\r\n\r\n    var graph = new Path({\r\n        strokeColor: new Color(  INITCOLOR.concat([alpha]) ),\r\n        strokeWidth: thickness\r\n    });\r\n\r\n    matrix = [[1,0],[0,(1-(n/N))]]\r\n    func.draw(graph, matrix);\r\n    graph.smooth();\r\n    graphs.push(graph);\r\n\r\n });\r\n\r\n\r\n\r\n\r\n////////////\r\n\r\n\r\nfunction onResize(event) {\r\n\r\n}\r\n\r\nview.onFrame = function(event) {\r\n    scale = 1 + (Math.sin(event.time)/ breathDelta)\r\n    _.each(graphs, function(g) {\r\n        g.scale(1, scale);\r\n    });\r\n}\r\n\r\nwindow.onDestroy = function() {\r\n\tproject.layers.forEach(function(lay) {\r\n\t\tlay.remove();\r\n\t}); \r\n}	{\r\n    "breathDelta": {"type": "number", "default":17, "min":1.1, "max":1000},\r\n    "funct": {"type": "math", "default": "cos(2x) + x^5"},\r\n    "xMin": {"type": "number", "default": -5},\r\n    "xMax": {"type": "number", "default": 5}\r\n}		\N	2016-04-09 17:56:51.999249+00	50
2	3-dimensional "Wolfenstein" Maze Generator	Generates a unique random 3-dimensional maze each instance. Allows user to navigate through maze with old-fashioned "Wolfenstein"-style interface. Collision detection built in.	2016-02-04 08:16:14.056506+00	1	1	text/javascript	/*\r\n\r\nMaze Generator pseudo-code\r\n\r\n1. Make the initial cell the current cell and mark it as visited\r\n2. While there are unvisited cells\r\n    1. If the current cell has any neighbors which have not been visited\r\n        1. Choose randomly one of the unvisited neighbors\r\n        2. Push the chosen cell to the stack\r\n        3. Remove the wall between the current cell and the chosen cell\r\n        4. Make the chosen cell the current cell and mark it as visited\r\n    2. Otherwise\r\n        1. Pop a cell from the stack\r\n        2. Make it the current cell\r\n*/\r\n\r\n// class Maze {\r\n\r\nfunction Maze(dimension, x, y, cellSize) {\r\n    this.x = x;\r\n    this.y = y;\r\n    this.map = [];\r\n    this.visited = [];\r\n    this.stack = [];\r\n    this.cellSize = cellSize;\r\n    this.begin = [];\r\n    this.turnArounds = [];\r\n    this.currentPosition = [0, 0];\r\n    this.ballRadius = this.cellSize * 0.4;\r\n    this.wallsRendered = [];\r\n    this.grass;\r\n    this.sky;\r\n    this.collisionPadding = 20;\r\n    this.playerCurrentCell = [0, 0];\r\n    this.atWall = false;\r\n    this.directionUnlocked = 0;\r\n    this.approachQuadrant = 0;\r\n\r\n    for (var i=0; i<y; i++) {\r\n        this.map.push( [] );\r\n        this.visited.push( [] );\r\n        for (var j=0; j<x; j++) {\r\n            this.map[i].push( [1,1,1,1] );\r\n            this.visited[i].push( false );\r\n        }\r\n    }\r\n\r\n    this.generateMap();\r\n}\r\n\r\nMaze.prototype.unvisitedCellsExist = function() {\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            if (this.visited[i][j]) return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.chooseNeighbor = function(cx,cy) {\r\n    var neighbors = [];\r\n    var directions = [];\r\n    if (cx > 0 && !this.visited[cy][cx-1]) \r\n        { neighbors.push( [cx-1, cy] ); directions.push('W'); }\r\n    if (cx < this.x-1 && !this.visited[cy][cx+1]) \r\n        { neighbors.push( [cx+1, cy] ); directions.push('E'); }\r\n    if (cy < this.y-1 && !this.visited[cy+1][cx]) \r\n        { neighbors.push( [cx, cy+1] ); directions.push('S'); }\r\n    if (cy > 0 && !this.visited[cy-1][cx]) \r\n        { neighbors.push( [cx, cy-1] ); directions.push('N'); }\r\n    if (neighbors.length) {\r\n        r = Math.floor(Math.random()*neighbors.length);\r\n        return [ neighbors[r], directions[r] ];\r\n    } else return false;\r\n};\r\n\r\nMaze.prototype.removeWall = function(x1, y1, direction) { \r\n    switch (direction) {\r\n        case 'N':\r\n            this.map[y1][x1][0] = 0;\r\n            this.map[y1-1][x1][2] = 0;\r\n        break;\r\n        case 'E':\r\n            this.map[y1][x1][1] = 0;\r\n            this.map[y1][x1+1][3] = 0;\r\n        break;\r\n        case 'S':\r\n            this.map[y1][x1][2] = 0;\r\n            this.map[y1+1][x1][0] = 0;\r\n        break;\r\n        case 'W':\r\n            this.map[y1][x1][3] = 0;\r\n            this.map[y1][x1-1][1] = 0;\r\n        break;\r\n    }\r\n};\r\n\r\nMaze.prototype.generateMap = function() {\r\n    \r\n    // choose initial cell\r\n    var rx = Math.floor(Math.random()*this.x);\r\n    var ry = Math.floor(Math.random()*this.y);\r\n\r\n    this.begin = [rx, ry];\r\n\r\n    var cx = rx;\r\n    var cy = ry;\r\n    var nx;\r\n    var ny;\r\n\r\n    this.visited[cy][cx] = true;\r\n\r\n    var next;\r\n    var nextDirection;\r\n\r\n    // while there are still unvisited cells\r\n    while (this.unvisitedCellsExist()) {\r\n        if (this.chooseNeighbor(cx,cy)) {\r\n            \r\n            next = this.chooseNeighbor(cx,cy);\r\n            \r\n            nx = next[0][0];\r\n            ny = next[0][1];\r\n            \r\n            nextDirection = next[1];\r\n            this.stack.push( [nx, ny] );\r\n            this.removeWall(cx, cy, nextDirection);\r\n            this.visited[ny][nx] = true;\r\n\r\n            cx = nx;\r\n            cy = ny;\r\n        \r\n        } else if (this.stack.length) {\r\n\r\n            next = this.stack.pop();\r\n            cx = next[0];\r\n            cy = next[1];\r\n            this.turnArounds.push([cx, cy]);\r\n          \r\n        } else break;\r\n    }\r\n\r\n    this.end = [cx, cy];\r\n    this.map[0][0][3] = 0;\r\n    this.map[this.y-1][this.x-1][1] = 0;\r\n\r\n};\r\n\r\nMaze.prototype.getClearRect = function(cx, cy) {\r\n    var fx = cx * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    var fy = cy * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    return [fx,fy];\r\n};\r\n\r\nMaze.prototype.getBallCoords = function(nx, ny) {\r\n    var bx = nx * this.cellSize + (this.cellSize/2);\r\n    var by = ny * this.cellSize + (this.cellSize/2);\r\n    return [bx,by];\r\n};\r\n\r\nMaze.prototype.clearBall = function() {\r\n    var cl = this.getClearRect(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.clearRect(cl[0], cl[1], this.ballRadius*2+2, this.ballRadius*2+2);\r\n};\r\n\r\nMaze.prototype.drawBall = function() {\r\n    var ballCoords = this.getBallCoords(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.beginPath();\r\n    ctx.arc(ballCoords[0], ballCoords[1], this.ballRadius, 0, 2*Math.PI, false);\r\n    ctx.fillStyle = 'green';\r\n    ctx.fill();\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#003300';\r\n    ctx.stroke();\r\n};\r\n\r\nMaze.prototype.move = function(d) {\r\n    var dx = d[0];\r\n    var dy = d[1];\r\n    this.clearBall();\r\n    this.currentPosition = [this.currentPosition[0]+dx, this.currentPosition[1]+dy];\r\n    this.drawBall();\r\n};\r\n\r\nMaze.prototype.wallIsRendered = function(mt, lt) {\r\n    for (var i=0; i<this.wallsRendered.length; i++) {\r\n        if (this.wallsRendered[i][0][0] == mt[0] &&\r\n            this.wallsRendered[i][0][1] == mt[1] &&\r\n            this.wallsRendered[i][1][0] == lt[0] &&\r\n            this.wallsRendered[i][1][1] == lt[1]) {\r\n\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.getQuadrant = function(theta) {\r\n    if (theta <= (Math.PI/2)) return 1;\r\n    if (theta <= Math.PI) return 2;\r\n    if (theta <= (Math.PI*3)/2) return 3;\r\n    if (theta <= (Math.PI*2)) return 4;\r\n}\r\n\r\nMaze.prototype.getOppositeQuad = function(quad) {\r\n    if (quad == 1) return 3;\r\n    if (quad == 2) return 4;\r\n    if (quad == 3) return 1;\r\n    if (quad == 4) return 2;\r\n}\r\n\r\nMaze.prototype.isDirectionValid = function(direction) {\r\n    \r\n    var currentAngle = (((Math.PI*3)/2) - camera.rotation.y) % (2*Math.PI);\r\n    if (currentAngle < 0) currentAngle += (2*Math.PI);\r\n    var currentQuad = this.getQuadrant(currentAngle);\r\n\r\n    // if at a wall, handle wall vs. direction, then return false\r\n    if (this.atWall) {\r\n\r\n        switch (this.atWall) {\r\n            case 'N':\r\n                if ((currentQuad == 3 || currentQuad == 4) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 1 || currentQuad == 2) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 1)\r\n                    camera.position.x += 10;\r\n                if (currentQuad == 2)\r\n                    camera.position.x -= 10;\r\n                return false;\r\n            break;\r\n            case 'E':\r\n                if ((currentQuad == 2 || currentQuad == 3) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 1 || currentQuad == 4) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 1)\r\n                    camera.position.z -= 10;\r\n                if (currentQuad == 4)\r\n                    camera.position.z += 10;\r\n                return false;\r\n            break;\r\n            case 'S':\r\n                if ((currentQuad == 1 || currentQuad == 2) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 3 || currentQuad == 4) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 3)\r\n                    camera.position.x -= 10;\r\n                if (currentQuad == 4)\r\n                    camera.position.x += 10;\r\n                return false;\r\n            break;\r\n            case 'W':\r\n                if ((currentQuad == 1 || currentQuad == 4) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 2 || currentQuad == 3) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 2)\r\n                    camera.position.z -= 10;\r\n                if (currentQuad == 3)\r\n                    camera.position.z += 10;\r\n                return false;\r\n            break;\r\n        }\r\n\r\n        return false;\r\n\r\n    }\r\n\r\n    return true;\r\n\r\n};\r\n\r\nMaze.prototype.checkWallCollision = function() {\r\n    \r\n    // figure out which cell player is in\r\n    var playerX = Math.floor(camera.position.x / this.cellSize) + (this.x/2);\r\n    var playerZ = Math.floor(camera.position.z / this.cellSize) + (this.y/2);\r\n\r\n    // mark cell as current cell if not already\r\n    if (playerX != this.playerCurrentCell[0] || playerZ != this.playerCurrentCell[1]) {\r\n        this.playerCurrentCell = [playerX, playerZ];\r\n        console.log('entered cell ' + playerX + ', ' + playerZ);\r\n    }\r\n\r\n    // get walls in current cell\r\n    var walls = this.map[this.playerCurrentCell[1]][this.playerCurrentCell[0]];\r\n\r\n    // get global boundary coords\r\n    var bounds = [];\r\n    bounds.push((this.playerCurrentCell[1] * this.cellSize - \r\n        ((this.y*this.cellSize)/2)) + this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[0] * this.cellSize - \r\n        ((this.x*this.cellSize)/2)) + this.cellSize - this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[1] * this.cellSize - \r\n        ((this.y*this.cellSize)/2)) + this.cellSize - this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[0] * this.cellSize - \r\n        ((this.x*this.cellSize)/2)) + this.collisionPadding);\r\n\r\n    \r\n    // test each wall for collision\r\n    var whichWall = false;\r\n\r\n    if (walls[0] && camera.position.z <= bounds[0]) {\r\n        console.log('hit north wall');\r\n        whichWall = 'N';\r\n    }\r\n    if (walls[1] && camera.position.x >= bounds[1]) {\r\n        console.log('hit east wall');\r\n        whichWall = 'E';\r\n    }\r\n    if (walls[2] && camera.position.z >= bounds[2]) {\r\n        console.log('hit south wall');\r\n        whichWall = 'S';\r\n    }\r\n    if (walls[3] && camera.position.x <= bounds[3]) {\r\n        console.log('hit west wall');\r\n        whichWall = 'W';\r\n    }\r\n\r\n    this.atWall = whichWall;\r\n};\r\n\r\nMaze.prototype.render = function(ctx) {\r\n    \r\n    var cell;\r\n    var cx;\r\n    var cy;\r\n\r\n    var geometry, texture, mesh;\r\n\r\n    // draw grass\r\n    geometry = new THREE.BoxGeometry(this.x*this.cellSize, 10, this.y*this.cellSize);\r\n    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/grass.jpg');\r\n    texture.anisotropy = renderer.getMaxAnisotropy();\r\n    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n    this.grass = new THREE.Mesh( geometry, material );\r\n    this.grass.position.set(0, -100, 0); \r\n    scene.add( this.grass );\r\n\r\n    // draw sky\r\n    var skyRadius;\r\n    if (this.y > this.x) {\r\n        skyRadius = (this.y*this.cellSize);\r\n    } else skyRadius = (this.x*this.cellSize); \r\n    \r\n    geometry = new THREE.SphereGeometry(skyRadius, 16, 16, Math.PI/2,  Math.PI*2, 0, Math.PI);\r\n    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/sky.jpg');\r\n    texture.anisotropy = renderer.getMaxAnisotropy();\r\n    material = new THREE.MeshBasicMaterial( {map: texture} );\r\n    material.side = THREE.BackSide\r\n    this.sky = new THREE.Mesh(geometry, material);\r\n    this.sky.position.set(0,0,0);\r\n    scene.add(this.sky);\r\n\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            \r\n            cell = this.map[i][j];\r\n            cx = this.cellSize * j - ((this.x*this.cellSize)/2);\r\n            cy = this.cellSize * i - ((this.y*this.cellSize)/2);\r\n            var mt;\r\n            var lt;\r\n\r\n            if (cell[0]) {\r\n                mt = [cx, cy];\r\n                lt = [cx+this.cellSize, cy];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  200, 200, 10  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/wood.jpg');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0]+this.cellSize/2, 0, mt[1]); \r\n                    scene.add( mesh );\r\n                }\r\n            } \r\n            if (cell[1]) {\r\n                mt = [cx+this.cellSize, cy];\r\n                lt = [cx+this.cellSize, cy+this.cellSize];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  10, 200, 200  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/wood.jpg');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0], 0, mt[1]+this.cellSize/2); \r\n                    scene.add( mesh );\r\n                }\r\n            } \r\n            if (cell[2]) {\r\n                mt = [cx+this.cellSize, cy+this.cellSize];\r\n                lt = [cx, cy+this.cellSize];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  200, 200, 10  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/crate.gif');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0]-this.cellSize/2, 0, mt[1]); \r\n                    scene.add( mesh );\r\n                }\r\n            }\r\n            if (cell[3]) {\r\n                mt = [cx, cy+this.cellSize];\r\n                lt = [cx, cy];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  10, 200, 200  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/crate.gif');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0], 0, mt[1]-this.cellSize/2); \r\n                    scene.add( mesh );\r\n                }\r\n            }\r\n\r\n        }\r\n    }\r\n};\r\n\r\nMaze.prototype.walkForward = function() {\r\n    this.checkWallCollision();\r\n    if (this.isDirectionValid(1)) {\r\n        camera.position.x -= 10 * Math.sin(camera.rotation.y);\r\n        camera.position.z += 10 * Math.cos(camera.rotation.y);\r\n        console.log('F');\r\n    }\r\n};\r\n\r\nMaze.prototype.walkBackwards = function() {\r\n    this.checkWallCollision();\r\n    if (this.isDirectionValid(-1)) {\r\n        camera.position.x += 10 * Math.sin(camera.rotation.y);\r\n        camera.position.z -= 10 * Math.cos(camera.rotation.y);\r\n        console.log('B');\r\n    }\r\n};\r\n\r\nMaze.prototype.turnLeft = function() {\r\n    camera.rotation.y -= Math.PI / 10;\r\n};\r\n\r\nMaze.prototype.turnRight = function() {\r\n    camera.rotation.y += Math.PI / 10;\r\n};\r\n\r\nMaze.prototype.flyUp = function() {\r\n    camera.position.y += 10;\r\n};\r\n\r\nMaze.prototype.flyDown = function() {\r\n    camera.position.y -= 10;\r\n};\r\n\r\n// } end class Maze\r\n\r\n/*\r\n    MazeSolver pseudo-code\r\n\r\n    1. start at the entrance\r\n    2. while not at the exit\r\n        1. push the current cell to visited\r\n        2. if exists one or more directions that have not been visited\r\n            1. push the current cell to pathStack\r\n            2. choose any direction from those not visited\r\n            3. move in that direction\r\n            4. draw path from previous cell to chosen cell\r\n            5. make the chosen cell the current cell\r\n        3. otherwise backtrack\r\n            1. pop the pathStack\r\n            2. remove line from currentCell to popped cell\r\n            3. do not remove popped cell from visited\r\n*/\r\n\r\n// class MazeSolver {\r\n\r\nfunction MazeSolver(maze) {\r\n    this.Maze = maze;\r\n    this.position = [0, 0];\r\n    this.pathStack = [];\r\n    this.visited = [];\r\n    this.Maze.clearBall();\r\n\r\n    var self = this;\r\n    this.solveStep = function() {\r\n        self.moveForward();\r\n    };\r\n}\r\n\r\nMazeSolver.prototype.getValidDirections = function(x,y) {\r\n    \r\n    var directions = [];\r\n    \r\n    if (!this.Maze.map[y][x][0]) \r\n        directions.push([0,-1]);\r\n    if (!this.Maze.map[y][x][1] && (x!=this.Maze.x-1 || y!=this.Maze.y-1)) \r\n        directions.push([1,0]);\r\n    if (!this.Maze.map[y][x][2]) \r\n        directions.push([0,1]);\r\n    if (!this.Maze.map[y][x][3] && (x||y)) \r\n        directions.push([-1,0]);\r\n\r\n    var validDirections = [];\r\n    for (var i=0; i<directions.length; i++) {\r\n        var tx = x+directions[i][0];\r\n        var ty = y+directions[i][1];\r\n        if (!this.isVisited(tx,ty)) {\r\n            validDirections.push(directions[i]);\r\n        }\r\n    }\r\n\r\n    return validDirections;\r\n};\r\n\r\nMazeSolver.prototype.isVisited = function(x,y) {\r\n    for (var i=0; i<this.visited.length; i++) {\r\n        if (this.visited[i][0] == x && this.visited[i][1] == y) \r\n            return true;\r\n    }\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.isDeadEnd = function(x,y) {\r\n    if (!this.getValidDirections(x,y).length)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.movePath = function(cx,cy,nx,ny) {\r\n    ctx.lineWidth = 4;\r\n    ctx.strokeStyle = '#5555ff';\r\n    ctx.beginPath();\r\n\r\n    ctx.moveTo(cx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        cy*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.lineTo(nx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        ny*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.stroke();\r\n};\r\n\r\nMazeSolver.prototype.clearPath = function(x,y) {\r\n    ctx.clearRect(x*this.Maze.cellSize+2, y*this.Maze.cellSize+2, \r\n        this.Maze.cellSize-4, this.Maze.cellSize-4);\r\n};\r\n\r\nMazeSolver.prototype.isFinished = function() {\r\n    if (this.position[0] == this.Maze.x-1 && this.position[1] == this.Maze.y-1)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.moveForward = function() {\r\n    \r\n    var cx = this.position[0];\r\n    var cy = this.position[1];\r\n    \r\n    this.visited.push([cx,cy]);\r\n    \r\n    if (this.isFinished()) {\r\n        console.log("FINISH");\r\n        clearInterval(this.interval);\r\n        return;\r\n    }\r\n\r\n    if (!this.isDeadEnd(cx,cy)) {\r\n        this.pathStack.push([cx,cy]);\r\n        var directions = this.getValidDirections(cx,cy);\r\n        var randomDirection = Math.floor(Math.random()*directions.length);\r\n        \r\n        var nx = cx + directions[randomDirection][0];\r\n        var ny = cy + directions[randomDirection][1];\r\n\r\n        this.movePath(cx,cy,nx,ny);\r\n        this.position = [nx,ny];\r\n\r\n    } else { \r\n        this.backtrack();\r\n    }\r\n};\r\n\r\nMazeSolver.prototype.backtrack = function() {\r\n    var lastCell = this.pathStack.pop();\r\n    this.clearPath(this.position[0], this.position[1]);\r\n    this.position = [lastCell[0], lastCell[1]];\r\n};\r\n\r\n// } end class MazeSolver\r\n\r\n\r\n$(document).keydown(function(e) {\r\n    \r\n    var tx = Maze.currentPosition[0];\r\n    var ty = Maze.currentPosition[1];\r\n\r\n    switch (e.keyCode) {\r\n\r\n        case 37: // left\r\n            Maze.turnLeft();\r\n        break;\r\n        case 38: // up (forward)\r\n            Maze.walkForward();\r\n        break;\r\n        case 39: // right\r\n            Maze.turnRight();\r\n        break;\r\n        case 40: // down (backwards)\r\n            Maze.walkBackwards();\r\n        break;\r\n        case 65: // 'a' key\r\n            Maze.flyUp();\r\n        break;\r\n        case 90: // 'z' key\r\n            Maze.flyDown();\r\n        break;\r\n\r\n    }\r\n});\r\n\r\nfunction solveMaze() {\r\n    solver = new MazeSolver(Maze);\r\n    solver.interval = setInterval(solver.solveStep, 5);\r\n}\r\n\r\nvar Maze;\r\n\r\n\r\nvar ctx;\r\nvar solver;\r\n\r\nvar camera, scene, renderer;\r\nvar mesh;\r\n\r\nfunction onWindowResize() {\r\n\tcamera.aspect = window.innerWidth / window.innerHeight;\r\n\tcamera.updateProjectionMatrix();\r\n\trenderer.setSize( window.innerWidth, window.innerHeight );\r\n}\r\n\r\nfunction animate() {\r\n\trequestAnimationFrame(animate);\r\n\trenderer.render(scene, camera);\r\n}\r\n\r\n    \r\nvar cellSize = 200;\r\n\r\nrenderer = new THREE.WebGLRenderer({\r\n    preserveDrawingBuffer: true,\r\n});\r\nvar __renderer = $(renderer);\r\n\r\nrenderer.setSize( Canvas.width, Canvas.height );\r\nconsole.log(renderer.domElement); console.log('-----');\r\ndocument.body.appendChild( renderer.domElement );\r\n\r\nwindow._renderer = renderer;\r\n\r\ncamera = new THREE.PerspectiveCamera( 90, \r\n\twindow.innerWidth / window.innerHeight, 1, 10000 );\r\nscene = new THREE.Scene();\r\n\r\nMaze = new Maze(2, 16, 10, cellSize);\r\nMaze.render();\r\n\r\ncamera.position.x = Maze.cellSize * Maze.x * -0.5;\r\ncamera.position.y = 15;\r\ncamera.position.z = Maze.cellSize * Maze.y * -0.5 + Maze.cellSize/2;\r\n\r\ncamera.lookAt(scene.position);\r\nwindow.addEventListener( 'resize', onWindowResize, false );\r\nanimate();\r\n\r\nwindow.appdestroy = function() {\r\n\tconsole.log('domel', $(__renderer[0].domElement));\r\n\t$(__renderer[0].domElement).remove();\r\n\tdelete renderer;\r\n \tdelete __renderer;\r\n\twindow.removeEventListener('resize');\r\n}	{}		\N	2016-04-10 22:24:07.039821+00	46
28	Fractal Tree Creatures	Fractal trees and random plants and creatures.	2016-03-24 02:26:54.501906+00	3	1	text/coffeescript	#####################################\r\n#                                   #\r\n#   @author: Nino P. Cocchiarella   #\r\n#   Copyright (C) 2015              #\r\n#   plerp.org                       #\r\n#                                   #\r\n#####################################\r\n\r\npi = Math.PI\r\nabs = Math.abs\r\nsin = Math.sin\r\ncos = Math.cos\r\narcsin = Math.asin\r\narccos = Math.acos\r\narctan = Math.atan\r\nroot = Math.sqrt\r\n\r\n\r\nmoveTo = ([x,y]) -> gl.moveTo(x, y)\r\nlineTo = ([x,y]) -> gl.lineTo(x, y)\r\n\r\n# COLOR1 = "#785A3C"\r\n# COLOR2 = "#00aa00"\r\n# NUM_ITERATIONS = 6\r\n# TRAPEZOIDAL_SECTIONS = 20\r\n# CHILDREN = [3, -7, 6]\r\n# DEGREE1_COEFF = 17\r\n# DEGREE2_COEFF = 30\r\n\r\n\r\ngenerationChildCounts = _.map _.range(NUM_ITERATIONS+1), () -> 0\r\n\r\ncolorHex2rgb = (color) ->\r\n    col = color.split("#").join("")\r\n    _r = col.substr 0,2\r\n    _g = col.substr 2,2\r\n    _b = col.substr 4,2\r\n    return _.map [_r,_g,_b], (c) -> parseInt(c,16)\r\n\r\nclass TreeStick\r\n\r\n    rad2deg: (x) ->\r\n        return x * (180/pi)\r\n\r\n    constructor: (params) ->\r\n        {\r\n            @start,\r\n            @direction,\r\n            @length,\r\n            @start_alpha,\r\n            @begin_thickness,\r\n            @end_thickness,\r\n            @generation,\r\n            @children\r\n        } = params\r\n\r\n        #console.log 'sa', @start_alpha\r\n\r\n        @delta_thickness = (@begin_thickness - @end_thickness) / TRAPEZOIDAL_SECTIONS\r\n        @delta_length = @length / TRAPEZOIDAL_SECTIONS\r\n\r\n        @current_position = @start\r\n        @current_thickness = @begin_thickness\r\n\r\n        perp = @direction + pi/2\r\n\r\n        @current_edges = [\r\n            [@start[0] + (@begin_thickness/2)*(cos perp), @start[1] + (@begin_thickness/2)*(sin perp)],\r\n            [@start[0] - (@begin_thickness/2)*(cos perp), @start[1] - (@begin_thickness/2)*(sin perp)]\r\n        ]\r\n\r\n        @trapezoids = []\r\n        @left_edges = []\r\n        @right_edges = []\r\n        @directions = []\r\n        @left_directions = []\r\n        @right_directions = []\r\n\r\n\r\n        for i in [0...TRAPEZOIDAL_SECTIONS]\r\n\r\n            points = []\r\n            start_midpoint = @current_position\r\n\r\n            end_midpoint = [\\\r\n                (@current_position[0] + @delta_length * cos @direction), \\\r\n                (@current_position[1] + @delta_length * sin @direction)]\r\n\r\n            perp = @direction + pi/2\r\n            start_perp = [\\\r\n                (@current_position[0] + (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] + (@current_thickness/2) * sin perp)]\r\n            end_perp = [\\\r\n                (@current_position[0] - (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] - (@current_thickness/2) * sin perp)]\r\n\r\n\r\n            @current_position = end_midpoint\r\n            @current_thickness -= @delta_thickness\r\n\r\n\r\n            #####  main curve function\r\n            @direction -= (pi/DEGREE1_COEFF - i*(pi/DEGREE2_COEFF))\r\n            #console.log 'direction', @direction\r\n\r\n            #### sucessor\r\n\r\n            start_perp2 = [\\\r\n                (@current_position[0] + (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] + (@current_thickness/2) * sin perp)]\r\n            end_perp2 = [\\\r\n                (@current_position[0] - (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] - (@current_thickness/2) * sin perp)]\r\n\r\n            points.push @current_edges[0]\r\n            points.push @current_edges[1]\r\n            points.push end_perp2\r\n            points.push start_perp2\r\n\r\n            @left_edges.push [start_perp, start_perp2]\r\n            @right_edges.push [end_perp2, end_perp]\r\n\r\n            @directions.push @direction\r\n\r\n            dx = start_perp2[0] - start_perp[0]\r\n            dy = start_perp2[1] - start_perp[1]\r\n\r\n\r\n\r\n\r\n\r\n            left_direction = arctan (dy/dx)\r\n            @left_directions.push left_direction\r\n\r\n            dx = end_perp2[0] - end_perp[0]\r\n            dy = end_perp2[1] - end_perp[1]\r\n            right_direction = arctan (dy/dx)\r\n            @right_directions.push right_direction\r\n\r\n\r\n            @trapezoids.push points\r\n            @current_edges = [start_perp2, end_perp2]\r\n\r\n        #@draw()\r\n        ##console.log @left_directions, @right_directions, @directions\r\n\r\n        if @generation < NUM_ITERATIONS\r\n\r\n            for child_index in @children\r\n\r\n                if child_index < 0\r\n\r\n                    dx = @left_edges[abs(child_index)][1][0] - @left_edges[abs(child_index)][0][0]\r\n                    dy = @left_edges[abs(child_index)][1][1] - @left_edges[abs(child_index)][0][1]\r\n                    midpoint = [\\\r\n                        (@left_edges[abs(child_index)][1][0] + @left_edges[abs(child_index)][0][0]) / 2,\r\n                        (@left_edges[abs(child_index)][1][1] + @left_edges[abs(child_index)][0][1]) / 2\r\n                    ]\r\n\r\n                    #if @generation == 0\r\n                    ##console.log start_perp, start_perp2\r\n                        #console.log dx, dy\r\n\r\n                if child_index > 0\r\n\r\n                    dx = @right_edges[abs(child_index)][1][0] - @right_edges[abs(child_index)][0][0]\r\n                    dy = @right_edges[abs(child_index)][1][1] - @right_edges[abs(child_index)][0][1]\r\n                    midpoint = [\\\r\n                        (@right_edges[abs(child_index)][1][0] + @right_edges[abs(child_index)][0][0]) / 2,\r\n                        (@right_edges[abs(child_index)][1][1] + @right_edges[abs(child_index)][0][1]) / 2\r\n                    ]\r\n\r\n\r\n\r\n                # get length of edge\r\n                edge_length = root (dx**2 + dy**2)\r\n\r\n                # get angle\r\n                theta = @left_directions[abs(child_index)] - (pi/2) if child_index < 0\r\n                theta = @right_directions[abs(child_index)] + (pi/2) if child_index > 0\r\n                ##console.log @rad2deg(theta)\r\n\r\n                #console.log @generation\r\n                start_alpha = (1 - 0.1* @generation)\r\n                #console.log 'sa', start_alpha\r\n\r\n                babyTreeStick =\r\n                    start: midpoint\r\n                    direction: theta\r\n                    length: @length * ((TRAPEZOIDAL_SECTIONS-abs(child_index))/TRAPEZOIDAL_SECTIONS)\r\n                    start_alpha: 1 - 0.1* @generation\r\n                    begin_thickness: edge_length\r\n                    end_thickness: edge_length * (@end_thickness/@begin_thickness)\r\n                    generation: @generation + 1\r\n                    children: @children\r\n\r\n                baby = new TreeStick babyTreeStick\r\n                \r\n                \r\n\r\n        #else\r\n        #    for child_index in @children\r\n        #        gl.fillStyle = '#0000cc'\r\n        #        gl.beginPath()\r\n        #        gl.arc(@left_edges[abs(child_index)][1][0], @left_edges[abs(child_index)][1][1], 2, 0, 2*pi, false)\r\n        #        gl.fill()\r\n\r\n        @draw()\r\n\r\n\r\n\r\n    draw: ->\r\n\r\n        generationChildCounts[@generation]++\r\n\r\n        for trap in @trapezoids\r\n            gl.strokeStyle = '#111111'\r\n            gl.lineWidth = 1\r\n            [r,g,b] = colorHex2rgb COLOR1\r\n            gl.fillStyle = "rgba(#{r},#{g},#{b},#{@start_alpha})"\r\n            if @generation == NUM_ITERATIONS\r\n                gl.strokeStyle = COLOR2\r\n            gl.beginPath()\r\n            moveTo trap[0]\r\n            lineTo trap[1]\r\n            lineTo trap[2]\r\n            lineTo trap[3]\r\n            gl.closePath()\r\n            gl.stroke()\r\n            gl.fill()\r\n        \r\n        if @generation == NUM_ITERATIONS and generationChildCounts[NUM_ITERATIONS] == Math.pow @children.length, NUM_ITERATIONS\r\n            try\r\n                window.renderingDone()\r\n            catch e\r\n                console.log e\r\n\r\n\r\n\r\n\r\ngl = null\r\n\r\n$(document).ready ->\r\n\r\n    #Canvas = document.getElementById('big-canvas')\r\n\r\n    gl = Canvas.getContext('2d')\r\n\r\n    Canvas.width = $(window).width()\r\n    Canvas.height = $(window).height()\r\n\r\n    \r\n    gl.scale(1, -1)\r\n    gl.translate(0, -Canvas.height)\r\n    U_width = Canvas.width\r\n    U_height = Canvas.height\r\n\r\n    originalTreeStick =\r\n        start: [U_width/2, 0]\r\n        direction: pi/2\r\n        length: U_height\r\n        start_alpha: 1\r\n        begin_thickness: 130\r\n        end_thickness: 20\r\n        generation: 0\r\n        children: CHILDREN\r\n\r\n    #console.log originalTreeStick\r\n\r\n    @hank = new TreeStick originalTreeStick\r\n    #@hank.draw()\r\n    #@frameInterval = setInterval (=> @hank.grow()), 100	{\r\n\t"COLOR1": {"type": "color", "default": "#785A3C"},\r\n\t"COLOR2": {"type": "color", "default": "#00AA00"},\r\n  \t"NUM_ITERATIONS":{"type": "number", "default":5, "min": 2, "max": 13},\r\n\t"CHILDREN": {"type": "javascript", "default": "[6,-7,8,12]"},\r\n\t"TRAPEZOIDAL_SECTIONS": {"type": "number", "default":15, "min": 5, "max": 50},\r\n\t"DEGREE1_COEFF": {"type": "number", "default":17, "min": 1, "max": 1000},\r\n\t"DEGREE2_COEFF": {"type": "number", "default":30, "min": 1, "max": 1000}\r\n}		\N	2016-04-09 17:55:58.086863+00	90
27	Plain Function in 1 variable	Creates the graphs of functions in 1 variable.  Allows you to enter your own function and range.	2016-03-23 11:27:56.498377+00	5	1	text/paperscript	// require cartesian axes\r\n// require MFunction\r\n\r\ndrawAxes(project.activeLayer);\r\n\r\nl = new Layer({\r\n\tblendMode: 'multiply'\r\n});\r\n\r\n// add function wrapper around js expression from math object\r\nvar mkfunc = "var _func1 = function(x) { return " + func1.javascript + "; }";\r\nconsole.log(mkfunc);\r\neval(mkfunc);\r\nvar F0 = new MFunction(_func1, [x_min, x_max]);\r\n\r\npath1 = new Path({\r\n    strokeColor: new Color(0.7, 0.3, 0.3, 0.8),\r\n    strokeWidth: 3,\r\n    closed: false,\r\n    //fillColor: new Color(Math.random(),1,Math.random(),0.2),\r\n});\r\nF0.compute();\r\n\r\ntransformation = [\r\n  [1, 0, 0], //5*Math.cos(Math.PI/-4)],\r\n  [0, 1, 0] //5*Math.sin(Math.PI/-4)],\r\n];\r\n\r\nF0.draw(path1);\r\npath1.smooth();	{\r\n  "func1":{"type": "math", \r\n\t"default":{\r\n\t  \t"latex":"x \\\\cos{\\\\left (x \\\\right )}",\r\n\t\t"javascript":"x*Math.cos(x)",\r\n\t\t"type":"math",\r\n\t\t"string":"x cos(x)",\r\n\t\t  "value":"x cos(x)"}},\r\n  "x_min":{"type": "number", "default":-5},\r\n  "x_max":{"type": "number", "default":5}\r\n}		\N	2016-04-09 17:57:04.461132+00	20
33	Bivariate Polynomial Landscape	Choose coefficients of high-degree a polynomial function in 2 variables, as well as the 3x3 matrix used to project the graph of the surface onto a 2-dimensional canvas.  Many intricate and beautiful scenes emerge with certain affine transformations.  Defaults to a "standard" parallel projection of the z-axis (the axis "coming out of the screen")	2016-04-05 01:19:50.444524+00	2	1	text/paperscript	view.viewSize = new Size(Canvas.width, Canvas.height);\n\nvar coeffs = _.mapObject(seed, function(val,key) {\n    return val.value;\n});\n\nvar polynomial_string = _.reduce(\n    _.filter(_.map(_.pairs(coeffs), function(coeff) {\n        var s = coeff[1] == 1 ? coeff[0].toString() : \t\n\t\t\tcoeff[1].toString()+coeff[0];\n        if (coeff[1] == 0) s = '';\n        return s;\n    }), function(x) {\n        return x != '';\n    }), function(a,b) {\n        var r = a;\n        var bnum = parseInt(b.replace(/[^0-9\\-]*/, '')) || 1;\n        r += (bnum > 0 ? '+'+b : b);\n        return r;\n    }, '');\n\nif (polynomial_string.substr(0,1) == '+') {\n    polynomial_string = polynomial_string.substr(1, polynomial_string.length);\n}\n\n\n\nDARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\nLIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\n\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\nx_axis.add(new Point(-view.size.width/2, 0));\nx_axis.add(new Point(view.size.width/2, 0));\nx_axis.closed = true;\n//project.activeLayer.insertChild(0,x_axis)\n\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\ny_axis.add(new Point(0, -view.size.height/2));\ny_axis.add(new Point(0, view.size.height/2));\n\nx_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(n, view.size.height/2) );\n    line.add( new Point(n, -view.size.height/2) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    x_lines.push( line );\n});\n\ny_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(view.size.width/2, n) );\n    line.add( new Point(-view.size.width/2, n) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    y_lines.push( line );\n});\n\nfunction transformToCartesian(lay) {\n    lay.transform( new Matrix((view.size.width / 10),0,0,(view.size.height / -10), view.center.x, view.center.y) );\n}\n\ntransformToCartesian(project.activeLayer);\n\n\n// define formal mathematical function\nMFunction = function(func, extrema) {\n    //console.log(func.length);\n    this.func = func;\n    if (!extrema) { extrema = [-5,5]; }\n\n    this.domain = {\n        elements: [],\n        min: (extrema[0] || -5),\n        max: (extrema[1] || 5)\n    };\n\n    this.codomain = {\n        elements: [],\n        min: null,\n        max: null\n    };\n\n    this.mapping = null;\n}\n\nMFunction.prototype = {\n    \n    compute: function(delta) {\n        if (!delta) { delta = 50; }\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\n        this.codomain.elements = _.map(this.domain.elements, this.func);\n        this.codomain.min = _.min(this.codomain.elements);\n        this.codomain.max = _.max(this.codomain.elements);\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\n\n        this._w = Math.abs(this.domain.max - this.domain.min);\n        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\n\n        this.transformation_matrix = new Matrix(\n            (view.size.width / this._w), 0,\n            0, (view.size.height / (-1*this._h)), \n            view.center.x, view.center.y);\n\n        this.computed = true;\n        console.log("computed")\n    },\n\n    // "flattens" mapping\n    // i.e. [[1,2],3] -> [1,2,3]\n    getPoints: function() {\n        if (!this.computed) { this.compute(); }\n        this.points = _.map(this.mapping, function(pair) {\n            return _.flatten(pair);\n        });\n        return this.points;\n    },\n\n\n    draw: function(path, matrix_premult, map3d, tmatrix) {\n\n        if (!this.computed) { this.compute(); }\n\n        if (map3d) {\n            this.points = this.points3d;\n        } else {\n            this.points = this.getPoints();\n        }\n\n        if (matrix_premult) {\n            this.points = _.map(this.points, function(p) {\n                return numeric.dot(matrix_premult, p);\n            })\n        }\n\n        _.each(this.points, function(p) {\n            path.add(new Point(p));\n        })\n\n        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.closed = true;\n\n        if (tmatrix) {\n            path.transform(tmatrix);\n        } else {\n            path.transform(this.transformation_matrix);\n        } \n    }\n}\n\nvar PolynomialObj = {};\n$.post("/symbolic_math/latex/", {\n    expressionString: polynomial_string\n}, function(data) {\n  \n    PolynomialObj = data;\n    console.log(PolynomialObj)\n    startRendering();\n  \n  \ttokens = PolynomialObj.latex.split(" ");\n\tline_length = Math.ceil(tokens.length/2);\n\tline2 = tokens.splice(-1*line_length).join(" ");\n\tline1 = tokens.join(" ");\n\n\ttry {\n      var text = [\n\t\t'Polynomial:<br />', \n\t\t"$" + line1 + "\\\\\\\\\\n\\\\space \\\\space \\\\space \\\\space " \n            + line2 + "$",\n\t\t'<div style="margin-top: 15px;">Projection Matrix:</div>',\n        "$\\\\left(\\\\begin{array}{rrr}1 & 0 & \\\\frac{1}{2}\\\\sqrt{2}\\\\\\\\\\n 0 & 1 & \\\\frac{1}{2}\\\\sqrt{2}\\\\end{array}\\\\right)$"];\n      var css = {"font-size":"11px", "color:":"#888888", "background-color": "rgba(230,230,230,0.7)"};\n      window.featureDisplay(text, css);\n    } catch (e) { console.log(e); }\n  \n});\n\nvar Polynomial = function(x,y) {\n    eval("var r = " + PolynomialObj.javascript + ";");\n    return r;\n}\n\nvar polynomial_degree = 5;\nvar zindex = undefined;\n\nfunction startRendering() {\n\n    slices = [];\n    zrange = [-15,0];\n    xrange = [-9, 9];\n    zspace = numeric.linspace(zrange[0], zrange[1], 50);\n\n    F0 = function(x) { return Polynomial(x,0); }\n    slice0 = new MFunction(F0, [xrange[0],xrange[1]]);\n    slice0.compute();\n    global_matrix = slice0.transformation_matrix;\n\n    CartesianMatrix = new Matrix(1,0,0,-1, view.center.x, view.center.y);\n\n    // begin drawing process\n    GraphLayer = new Layer({\n         blendMode: "multiply",\n    });\n\n    console.log("global matrix"); console.log(global_matrix);\n\n    function_shown = false;\n    zindex = 0;\n\n}\n\nview.onFrame = function(event) {\n    \n    if (zindex != undefined && zindex < zspace.length) {\n        \n        l = new Layer({\n            //blendMode: "multiply"\n        });\n\n        z = zspace[zindex];\n    \n        F = function(x) { return Polynomial(x,z); }\n        slice = new MFunction(F, [xrange[0],xrange[1]]);\n\n        points3d = slice.getPoints();\n        _.each(_.range(points3d.length), function(i) { points3d[i].push(z); });\n\n        slice.points3d = points3d\n\n        transformation = [\n            [1, 0, 0], //5*Math.cos(Math.PI/-4)],\n            [0, 1, 0] //5*Math.sin(Math.PI/-4)],\n        ];\n\n        path1 = new Path({\n            strokeColor: new Color(0.3, 0.3, 0.3, 0.5),\n            strokeWidth: 1,\n            closed: true,\n            fillColor: new Color(Math.random(),1,Math.random(),0.2),\n        });\n\n        slice.draw(path1, transformation, true, global_matrix);\n        //path.transform(CartesianMatrix)\n\n        // transformation2 = new Matrix(\n        //     1-(z/50), 0, 0, 1-(z/50), 0, 0 //5*Math.sin(Math.PI/-4)],\n        // );\n\n        transformation2 = new Matrix(\n            1, 0, 0, 1, 0, 0 //5*Math.sin(Math.PI/-4)],\n        );\n\n        //path1.transform(transformation2);\n        path1.scale(1-(z/50), 1-(z/50), view.center)\n        path1.translate(new Point(-10*z, 30*z))\n        \n        project.activeLayer.insertChild(0,path1);\n\n        slices.push({layer: project.activeLayer,\n            func: slice,\n            transformation: transformation,\n            path: path1});\n\n        if (zindex == zspace.length-1) { \n            //console.log(slices);\n            //view.pause();\n        }\n        zindex++;\n\n    }\n    \n}	{\n    "y":{"type":"number","default":1,"varname":"y"},\n    "y^2":{"type":"number","default":2,"varname":"y2"},\n    "y^3":{"type":"number","default":3,"varname":"y3"},\n    "y^4":{"type":"number","default":-2,"varname":"y4"},\n    "y^5":{"type":"number","default":5,"varname":"y5"},\n    "x":{"type":"number","default":1,"varname":"x"},\n    "xy":{"type":"number","default":1,"varname":"xy"},\n    "xy^2":{"type":"number","default":0,"varname":"xy2"},\n    "xy^3":{"type":"number","default":7,"varname":"xy3"},\n    "xy^4":{"type":"number","default":1,"varname":"xy4"},\n    "x^2":{"type":"number","default":1,"varname":"x2"},\n    "x^2y":{"type":"number","default":1,"varname":"x2y"},\n    "x^2y^2":{"type":"number","default":-13,"varname":"x2y2"},\n    "x^2y^3":{"type":"number","default":1,"varname":"x2y3"},\n    "x^3":{"type":"number","default":1,"varname":"x3"},\n    "x^3y":{"type":"number","default":0,"varname":"x3y"},\n    "x^3y^2":{"type":"number","default":1,"varname":"x3y2"},\n    "x^4":{"type":"number","default":1,"varname":"x4"},\n    "x^4y":{"type":"number","default":-5,"varname":"x4y"},\n    "x^5":{"type":"number","default":3,"varname":"x5"}\n}		\N	2016-04-12 00:38:22.710166+00	250
36	Subgroups of additive groups of integers mod(n)	Subgroups of additive groups of integers mod(n)	2016-04-10 03:25:56.53024+00	6	1	text/paperscript	view.viewSize = new Size(Canvas.width, Canvas.height);\n\nfunction get_divisors(n) {\n\treturn _.filter(_.range(1,n+1), function(i) {\n\t\treturn n%i==0;\n\t})\n}\n\nfunction isPrime(n) {\n\tif (n==1) \n\t\treturn false;\n\tfor (var i=2; i<n; i++) {\n\t\tif (n%i == 0) \n\t\t\treturn false;\n\t}\n\treturn true;\n}\n\nfunction is_member(x, rows) {\n\treturn _.includes(_.flatten(rows), x);\n}\n\nfunction subgroups(n) {\n\n\tvar rows = [[1]].concat([\n\t\t_.filter( _.range(1, Math.floor(n/2)), function(i) {\n\t\t\treturn n%i == 0 && isPrime(i);\n\t\t})\n\t]);\n\n\twhile (1) {\n\n\t\tvar newrow = [];\n\t\t_.each(rows[rows.length-1], function(element) {\n\t\t\t_.each(_.range(1, rows.length), function(prev_index) {\n\n\t\t\t\tvar prevrow = rows[prev_index];\n\t\t\t\t_.each(prevrow, function(e2) {\n\t\t\t\t\tvar m = element * e2;\n\t\t\t\t\tif (newrow.length > 0 && m == n) \n\t\t\t\t\t\treturn;\n\t\t\t\t\tif (n%m==0 && !is_member(m,rows) && !_.includes(newrow, m)) {\n\t\t\t\t\t\t_.each(newrow, function(ne) {\n\t\t\t\t\t\t\tif (ne > m && ne % m == 0) \n\t\t\t\t\t\t\t\treturn;\n\t\t\t\t\t\t})\n\t\t\t\t\t\tnewrow.push(m);\n\t\t\t\t\t}\n\t\t\t\t});\n\t\t\t});\n\t\t});\n\t\t\n\t\tif (newrow.length == 0)\n\t\t\tbreak;\n\n\t\tvar newrow_relprime = newrow.sort(function(a,b) { return a - b; });\n\t\trows.push(newrow_relprime);\n\n\t}\n\n\treturn rows.reverse();\n}\n\n\nvar color1 = new Color({\n\thue: 350,\n\tsaturation: 0.1,\n\tbrightness: 0.9\n});\n\n\nif (isPrime(integer_group)) {\n\n\tvar circ = new Path.Circle({\n\t\tcenter: view.center,\n\t\tradius: 100,\n\t\tfillColor: color1\n\t});\n\n\tvar text = new PointText({\n\t    point: view.center,\n\t    justification: 'center',\n\t    content: integer_group.toString(),\n\t    fillColor: 'black',\n\t    fontFamily: 'Courier New',\n\t    fontWeight: 'bold',\n\t    fontSize: 32\n\t});\n\n\tvar text = new PointText({\n\t    point: new Point(view.center.x, view.center.y + 25),\n\t    justification: 'center',\n\t    content: 'prime',\n\t    fillColor: 'black',\n\t    fontFamily: 'Courier New',\n\t    fontSize: 14\n\t});\n\n} else {\n\n\tS = subgroups(integer_group);\n\tvar positions = {};\n\n\tvar rowheight = view.viewSize._height / S.length;\n\t_.each(S, function(row, i) {\n\n\t\tvar centerY = (rowheight*i) + (rowheight/2);\n\t\tvar colwidth = view.viewSize._width / row.length;\n\n\t\t_.each(row, function(num, j) {\n\n\t\t\tvar centerX = (colwidth*j) + (colwidth/2);\n\t\t\tvar center1 = new Point(centerX, centerY);\n\t\t\tvar center2 = new Point(centerX, (centerY+4));\n\n\t\t\tpositions[num.toString()] = [centerX, centerY];\n\n\t\t\tvar circ = new Path.Circle({\n\t\t\t\tcenter: center1,\n\t\t\t\tradius: 20,\n\t\t\t\tfillColor: color1\n\t\t\t});\n\n\t\t\tvar text = new PointText({\n\t\t\t    point: center2,\n\t\t\t    justification: 'center',\n\t\t\t    content: num.toString(),\n\t\t\t    fillColor: 'black',\n\t\t\t    fontFamily: 'Courier New',\n\t\t\t    fontWeight: 'bold',\n\t\t\t    fontSize: 16\n\t\t\t});\n\t\t})\n\t\t\n\t});\n\n\tvar divisors = get_divisors(integer_group);\n\tvar _S = S.reverse();\n\n\t_.each(divisors, function(div) {\n\t\t_.each(_S, function(row, i) {\n\t\t\t_.each(row, function(num) {\n\t\t\t\tif (div == num) {\n\t\t\t\t\tif (_S.length > i+1) {\n\t\t\t\t\t\tvar nextrow = _S[i+1];\n\t\t\t\t\t\tvar factors = [];\n\t\t\t\t\t\t_.each(nextrow, function(j) {\n\t\t\t\t\t\t\tif (j%div==0) {\n\t\t\t\t\t\t\t\tfactors.push(j);\n\t\t\t\t\t\t\t\tvar line = new Path.Line({\n\t\t\t\t\t\t            strokeColor: new Color(0.4,0.4,0.4,0.75),\n\t\t\t\t\t\t            strokeWidth: 1,\n\t\t\t\t\t\t            from: positions[num.toString()],\n\t\t\t\t\t\t            to: positions[j.toString()]\n\t\t\t\t\t\t        });\n\t\t\t\t\t\t        project.activeLayer.insertChild(0,line);\n\t\t\t\t\t\t\t}\n\t\t\t\t\t\t});\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t});\n\t\t});\n\t});\n\n}\n\nvar renderDone = false;\nview.onFrame = function(e) {\n\tif (!renderDone && view.isVisible() && view.isInserted()) {\n\t  \trenderDone = true;\n\t \twindow.renderingDone(); \n\t}\n}\n\ntry {\n    window.featureDisplay("$\\\\{H\\: H \\\\leqslant (\\\\mathbb{Z}/" + \n    \tinteger_group + "\\\\space \\\\mathbb{Z})\\\\}$", {"font-size":"18px"});\n} catch (e) {}	{\n  "integer_group": {"type":"number", "default":840, "min":2, "max":99999999999}\n}		\N	2016-04-10 04:17:03.393174+00	300
\.


--
-- Data for Name: game_zeroplayergame_extraIncludes; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY "game_zeroplayergame_extraIncludes" (id, zeroplayergame_id, jslibrary_id) FROM stdin;
1	2	1
\.


--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('"game_zeroplayergame_extraIncludes_id_seq"', 1, true);


--
-- Data for Name: game_zeroplayergame_required_modules; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_zeroplayergame_required_modules (id, zeroplayergame_id, codemodule_id) FROM stdin;
1	5	1
2	5	2
3	27	1
4	27	2
\.


--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_zeroplayergame_required_modules_id_seq', 4, true);


--
-- Data for Name: portfolio_imagegallery; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_imagegallery (id, name) FROM stdin;
\.


--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_imagegallery_id_seq', 1, false);


--
-- Data for Name: portfolio_imagemodel; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_imagemodel (id, image, "timestamp", gallery_id) FROM stdin;
\.


--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_imagemodel_id_seq', 1, false);


--
-- Data for Name: portfolio_portfoliocategory; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_portfoliocategory (id, name, description, image) FROM stdin;
\.


--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_portfoliocategory_id_seq', 1, false);


--
-- Data for Name: portfolio_portfolioitem; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_portfolioitem (id, title, subtitle, description, sourcecode, image, creationdate, category_id, url) FROM stdin;
\.


--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_portfolioitem_id_seq', 1, false);


--
-- Data for Name: portfolio_proprietaryportfolioitem; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_proprietaryportfolioitem (portfolioitem_ptr_id, company, gallery_id) FROM stdin;
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY profiles_profile (user_id, slug, picture, bio, email_verified) FROM stdin;
1	5f4a81e2-0c14-435e-a4a4-b84f793fbc75	profile_pics/2016-02-02/97.jpg		f
2	8455a1e0-9dca-4738-b8e3-b6811e246439	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png	Dood who code-switched up-on the word 'code-switching' itself	f
\.


--
-- Data for Name: profiles_profile_followers; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY profiles_profile_followers (id, from_profile_id, to_profile_id) FROM stdin;
\.


--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('profiles_profile_followers_id_seq', 1, false);


--
-- Data for Name: static_precompiler_dependency; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY static_precompiler_dependency (id, source, depends_on) FROM stdin;
\.


--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('static_precompiler_dependency_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_email_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_email_key UNIQUE (email);


--
-- Name: authtools_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_groups_user_id_a8658824_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_a8658824_uniq UNIQUE (user_id, group_id);


--
-- Name: authtools_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_user_permissions_user_id_3e9e8ba9_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permissions_user_id_3e9e8ba9_uniq UNIQUE (user_id, permission_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: game_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_category
    ADD CONSTRAINT game_category_pkey PRIMARY KEY (id);


--
-- Name: game_codemodule_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_codemodule
    ADD CONSTRAINT game_codemodule_pkey PRIMARY KEY (id);


--
-- Name: game_gameinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_pkey PRIMARY KEY (id);


--
-- Name: game_gameinstance_seedParams_gameinstance_id_61e339cf_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT "game_gameinstance_seedParams_gameinstance_id_61e339cf_uniq" UNIQUE (gameinstance_id, seedkeyval_id);


--
-- Name: game_gameinstance_seedParams_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT "game_gameinstance_seedParams_pkey" PRIMARY KEY (id);


--
-- Name: game_gameinstance_vector_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_vector_key UNIQUE (vector);


--
-- Name: game_gameinstancesnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstancesnapshot
    ADD CONSTRAINT game_gameinstancesnapshot_pkey PRIMARY KEY (id);


--
-- Name: game_jslibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_jslibrary
    ADD CONSTRAINT game_jslibrary_pkey PRIMARY KEY (id);


--
-- Name: game_plerpingapp_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_plerpingapp_pkey PRIMARY KEY (id);


--
-- Name: game_savedfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_savedfunction
    ADD CONSTRAINT game_savedfunction_pkey PRIMARY KEY (id);


--
-- Name: game_seedkeyval_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_seedkeyval
    ADD CONSTRAINT game_seedkeyval_pkey PRIMARY KEY (id);


--
-- Name: game_seedkeyvalrelationship_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_seedkeyvalrelationship
    ADD CONSTRAINT game_seedkeyvalrelationship_pkey PRIMARY KEY (id);


--
-- Name: game_zeroplayergame_extraInclud_zeroplayergame_id_2d035b3a_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT "game_zeroplayergame_extraInclud_zeroplayergame_id_2d035b3a_uniq" UNIQUE (zeroplayergame_id, jslibrary_id);


--
-- Name: game_zeroplayergame_extraIncludes_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT "game_zeroplayergame_extraIncludes_pkey" PRIMARY KEY (id);


--
-- Name: game_zeroplayergame_required_mo_zeroplayergame_id_f81c04ef_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergame_required_mo_zeroplayergame_id_f81c04ef_uniq UNIQUE (zeroplayergame_id, codemodule_id);


--
-- Name: game_zeroplayergame_required_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergame_required_modules_pkey PRIMARY KEY (id);


--
-- Name: portfolio_imagegallery_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_imagegallery
    ADD CONSTRAINT portfolio_imagegallery_pkey PRIMARY KEY (id);


--
-- Name: portfolio_imagemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_imagemodel
    ADD CONSTRAINT portfolio_imagemodel_pkey PRIMARY KEY (id);


--
-- Name: portfolio_portfoliocategory_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_portfoliocategory
    ADD CONSTRAINT portfolio_portfoliocategory_pkey PRIMARY KEY (id);


--
-- Name: portfolio_portfolioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_portfolioitem
    ADD CONSTRAINT portfolio_portfolioitem_pkey PRIMARY KEY (id);


--
-- Name: portfolio_proprietaryportfolioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT portfolio_proprietaryportfolioitem_pkey PRIMARY KEY (portfolioitem_ptr_id);


--
-- Name: profiles_profile_followers_from_profile_id_8a9bcb07_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_profile_followers_from_profile_id_8a9bcb07_uniq UNIQUE (from_profile_id, to_profile_id);


--
-- Name: profiles_profile_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_profile_followers_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (user_id);


--
-- Name: static_precompiler_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY static_precompiler_dependency
    ADD CONSTRAINT static_precompiler_dependency_pkey PRIMARY KEY (id);


--
-- Name: static_precompiler_dependency_source_d8e91940_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY static_precompiler_dependency
    ADD CONSTRAINT static_precompiler_dependency_source_d8e91940_uniq UNIQUE (source, depends_on);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: authtools_user_email_f133274f_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_email_f133274f_like ON authtools_user USING btree (email varchar_pattern_ops);


--
-- Name: authtools_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_groups_0e939a4f ON authtools_user_groups USING btree (group_id);


--
-- Name: authtools_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_groups_e8701ad4 ON authtools_user_groups USING btree (user_id);


--
-- Name: authtools_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_8373b171 ON authtools_user_user_permissions USING btree (permission_id);


--
-- Name: authtools_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_e8701ad4 ON authtools_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: game_category_6be37982; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_category_6be37982 ON game_category USING btree (parent_id);


--
-- Name: game_gameinstance_6072f8b3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstance_6072f8b3 ON game_gameinstance USING btree (game_id);


--
-- Name: game_gameinstance_6ccdb143; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstance_6ccdb143 ON game_gameinstance USING btree (instantiator_id);


--
-- Name: game_gameinstance_seedParams_801ae61f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_gameinstance_seedParams_801ae61f" ON "game_gameinstance_seedParams" USING btree (gameinstance_id);


--
-- Name: game_gameinstance_seedParams_aa9ffff3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_gameinstance_seedParams_aa9ffff3" ON "game_gameinstance_seedParams" USING btree (seedkeyval_id);


--
-- Name: game_gameinstancesnapshot_51afcc4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstancesnapshot_51afcc4f ON game_gameinstancesnapshot USING btree (instance_id);


--
-- Name: game_plerpingapp_5e7b1936; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_plerpingapp_5e7b1936 ON game_zeroplayergame USING btree (owner_id);


--
-- Name: game_plerpingapp_b583a629; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_plerpingapp_b583a629 ON game_zeroplayergame USING btree (category_id);


--
-- Name: game_savedfunction_5e7b1936; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_savedfunction_5e7b1936 ON game_savedfunction USING btree (owner_id);


--
-- Name: game_seedkeyvalrelationship_51afcc4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_seedkeyvalrelationship_51afcc4f ON game_seedkeyvalrelationship USING btree (instance_id);


--
-- Name: game_seedkeyvalrelationship_7d42b204; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_seedkeyvalrelationship_7d42b204 ON game_seedkeyvalrelationship USING btree (keyval_id);


--
-- Name: game_zeroplayergame_6be37982; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_6be37982 ON game_zeroplayergame USING btree (parent_id);


--
-- Name: game_zeroplayergame_extraIncludes_030a3785; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_zeroplayergame_extraIncludes_030a3785" ON "game_zeroplayergame_extraIncludes" USING btree (zeroplayergame_id);


--
-- Name: game_zeroplayergame_extraIncludes_32432e4e; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_zeroplayergame_extraIncludes_32432e4e" ON "game_zeroplayergame_extraIncludes" USING btree (jslibrary_id);


--
-- Name: game_zeroplayergame_required_modules_030a3785; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_required_modules_030a3785 ON game_zeroplayergame_required_modules USING btree (zeroplayergame_id);


--
-- Name: game_zeroplayergame_required_modules_6cab8ff3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_required_modules_6cab8ff3 ON game_zeroplayergame_required_modules USING btree (codemodule_id);


--
-- Name: portfolio_imagemodel_6d994cdb; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_imagemodel_6d994cdb ON portfolio_imagemodel USING btree (gallery_id);


--
-- Name: portfolio_portfolioitem_b583a629; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_portfolioitem_b583a629 ON portfolio_portfolioitem USING btree (category_id);


--
-- Name: portfolio_proprietaryportfolioitem_6d994cdb; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_proprietaryportfolioitem_6d994cdb ON portfolio_proprietaryportfolioitem USING btree (gallery_id);


--
-- Name: profiles_profile_followers_658493f6; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX profiles_profile_followers_658493f6 ON profiles_profile_followers USING btree (to_profile_id);


--
-- Name: profiles_profile_followers_9c2b64df; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX profiles_profile_followers_9c2b64df ON profiles_profile_followers USING btree (from_profile_id);


--
-- Name: static_precompiler_dependency_1f903a40; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_1f903a40 ON static_precompiler_dependency USING btree (depends_on);


--
-- Name: static_precompiler_dependency_36cd38f4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_36cd38f4 ON static_precompiler_dependency USING btree (source);


--
-- Name: static_precompiler_dependency_depends_on_a14c2c8b_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_depends_on_a14c2c8b_like ON static_precompiler_dependency USING btree (depends_on varchar_pattern_ops);


--
-- Name: static_precompiler_dependency_source_6c770ab0_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_source_6c770ab0_like ON static_precompiler_dependency USING btree (source varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_group_id_fdf65e59_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_group_id_fdf65e59_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_use_permission_id_039bf6fe_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_use_permission_id_039bf6fe_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_user_permi_user_id_d172ce6b_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permi_user_id_d172ce6b_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_category_parent_id_4a4e38a7_fk_game_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_category
    ADD CONSTRAINT game_category_parent_id_4a4e38a7_fk_game_category_id FOREIGN KEY (parent_id) REFERENCES game_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinsta_gameinstance_id_17b880a7_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT game_gameinsta_gameinstance_id_17b880a7_fk_game_gameinstance_id FOREIGN KEY (gameinstance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstance__seedkeyval_id_ae852f24_fk_game_seedkeyval_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT game_gameinstance__seedkeyval_id_ae852f24_fk_game_seedkeyval_id FOREIGN KEY (seedkeyval_id) REFERENCES game_seedkeyval(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstance_game_id_a878f786_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_game_id_a878f786_fk_game_zeroplayergame_id FOREIGN KEY (game_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstance_instantiator_id_3f0b0fcb_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_instantiator_id_3f0b0fcb_fk_authtools_user_id FOREIGN KEY (instantiator_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstances_instance_id_d6d83406_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstancesnapshot
    ADD CONSTRAINT game_gameinstances_instance_id_d6d83406_fk_game_gameinstance_id FOREIGN KEY (instance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_plerpingapp_owner_id_db15314c_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_plerpingapp_owner_id_db15314c_fk_authtools_user_id FOREIGN KEY (owner_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_savedfunction_owner_id_226d4578_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_savedfunction
    ADD CONSTRAINT game_savedfunction_owner_id_226d4578_fk_authtools_user_id FOREIGN KEY (owner_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_seedkeyvalrel_instance_id_e96f7138_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedkeyvalrelationship
    ADD CONSTRAINT game_seedkeyvalrel_instance_id_e96f7138_fk_game_gameinstance_id FOREIGN KEY (instance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_seedkeyvalrelatio_keyval_id_2316fc5e_fk_game_seedkeyval_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedkeyvalrelationship
    ADD CONSTRAINT game_seedkeyvalrelatio_keyval_id_2316fc5e_fk_game_seedkeyval_id FOREIGN KEY (keyval_id) REFERENCES game_seedkeyval(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zerop_zeroplayergame_id_10eceedf_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zerop_zeroplayergame_id_10eceedf_fk_game_zeroplayergame_id FOREIGN KEY (zeroplayergame_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zerop_zeroplayergame_id_a5dd43ed_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT game_zerop_zeroplayergame_id_a5dd43ed_fk_game_zeroplayergame_id FOREIGN KEY (zeroplayergame_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergam_codemodule_id_a4a68a60_fk_game_codemodule_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergam_codemodule_id_a4a68a60_fk_game_codemodule_id FOREIGN KEY (codemodule_id) REFERENCES game_codemodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergam_parent_id_00669d04_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergam_parent_id_00669d04_fk_game_zeroplayergame_id FOREIGN KEY (parent_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergame__jslibrary_id_30752fb8_fk_game_jslibrary_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT game_zeroplayergame__jslibrary_id_30752fb8_fk_game_jslibrary_id FOREIGN KEY (jslibrary_id) REFERENCES game_jslibrary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergame_category_id_421feca0_fk_game_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergame_category_id_421feca0_fk_game_category_id FOREIGN KEY (category_id) REFERENCES game_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: por_portfolioitem_ptr_id_da61254d_fk_portfolio_portfolioitem_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT por_portfolioitem_ptr_id_da61254d_fk_portfolio_portfolioitem_id FOREIGN KEY (portfolioitem_ptr_id) REFERENCES portfolio_portfolioitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfoli_category_id_db01a81d_fk_portfolio_portfoliocategory_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfolioitem
    ADD CONSTRAINT portfoli_category_id_db01a81d_fk_portfolio_portfoliocategory_id FOREIGN KEY (category_id) REFERENCES portfolio_portfoliocategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfolio_imag_gallery_id_ae9b842e_fk_portfolio_imagegallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagemodel
    ADD CONSTRAINT portfolio_imag_gallery_id_ae9b842e_fk_portfolio_imagegallery_id FOREIGN KEY (gallery_id) REFERENCES portfolio_imagegallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfolio_prop_gallery_id_e7ba0f54_fk_portfolio_imagegallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT portfolio_prop_gallery_id_e7ba0f54_fk_portfolio_imagegallery_id FOREIGN KEY (gallery_id) REFERENCES portfolio_imagegallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_p_from_profile_id_e7888571_fk_profiles_profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_p_from_profile_id_e7888571_fk_profiles_profile_user_id FOREIGN KEY (from_profile_id) REFERENCES profiles_profile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_pro_to_profile_id_562358dd_fk_profiles_profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_pro_to_profile_id_562358dd_fk_profiles_profile_user_id FOREIGN KEY (to_profile_id) REFERENCES profiles_profile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile_user_id_a3e81f91_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

