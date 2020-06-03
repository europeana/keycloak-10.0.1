--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

-- Started on 2020-06-03 16:44:06 CEST

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
-- TOC entry 5 (class 2615 OID 29852)
-- Name: keycloakprod-v10; Type: SCHEMA; Schema: -; Owner: europeana
--

CREATE SCHEMA "keycloakprod-v10";


ALTER SCHEMA "keycloakprod-v10" OWNER TO europeana;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 787 (class 1259 OID 31106)
-- Name: admin_event_entity; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE "keycloakprod-v10".admin_event_entity OWNER TO europeana;

--
-- TOC entry 788 (class 1259 OID 31114)
-- Name: associated_policy; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".associated_policy OWNER TO europeana;

--
-- TOC entry 789 (class 1259 OID 31119)
-- Name: authentication_execution; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE "keycloakprod-v10".authentication_execution OWNER TO europeana;

--
-- TOC entry 790 (class 1259 OID 31124)
-- Name: authentication_flow; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) NOT NULL,
    top_level boolean NOT NULL,
    built_in boolean NOT NULL
);


ALTER TABLE "keycloakprod-v10".authentication_flow OWNER TO europeana;

--
-- TOC entry 791 (class 1259 OID 31132)
-- Name: authenticator_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".authenticator_config OWNER TO europeana;

--
-- TOC entry 792 (class 1259 OID 31137)
-- Name: authenticator_config_entry; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".authenticator_config_entry OWNER TO europeana;

--
-- TOC entry 793 (class 1259 OID 31145)
-- Name: broker_link; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".broker_link OWNER TO europeana;

--
-- TOC entry 794 (class 1259 OID 31153)
-- Name: client; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client (
    id character varying(36) NOT NULL,
    enabled boolean NOT NULL,
    full_scope_allowed boolean NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer,
    frontchannel_logout boolean NOT NULL,
    consent_required boolean NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean NOT NULL,
    implicit_flow_enabled boolean NOT NULL,
    direct_access_grants_enabled boolean NOT NULL,
    always_display_in_console boolean NOT NULL
);


ALTER TABLE "keycloakprod-v10".client OWNER TO europeana;

--
-- TOC entry 795 (class 1259 OID 31161)
-- Name: client_attributes; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_attributes OWNER TO europeana;

--
-- TOC entry 796 (class 1259 OID 31169)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_auth_flow_bindings OWNER TO europeana;

--
-- TOC entry 797 (class 1259 OID 31174)
-- Name: client_default_roles; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_default_roles OWNER TO europeana;

--
-- TOC entry 798 (class 1259 OID 31179)
-- Name: client_initial_access; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE "keycloakprod-v10".client_initial_access OWNER TO europeana;

--
-- TOC entry 799 (class 1259 OID 31184)
-- Name: client_node_registrations; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_node_registrations OWNER TO europeana;

--
-- TOC entry 800 (class 1259 OID 31189)
-- Name: client_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE "keycloakprod-v10".client_scope OWNER TO europeana;

--
-- TOC entry 801 (class 1259 OID 31197)
-- Name: client_scope_attributes; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_scope_attributes OWNER TO europeana;

--
-- TOC entry 802 (class 1259 OID 31205)
-- Name: client_scope_client; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_scope_client OWNER TO europeana;

--
-- TOC entry 803 (class 1259 OID 31210)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_scope_role_mapping OWNER TO europeana;

--
-- TOC entry 804 (class 1259 OID 31215)
-- Name: client_session; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE "keycloakprod-v10".client_session OWNER TO europeana;

--
-- TOC entry 805 (class 1259 OID 31223)
-- Name: client_session_auth_status; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_session_auth_status OWNER TO europeana;

--
-- TOC entry 806 (class 1259 OID 31228)
-- Name: client_session_note; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_session_note OWNER TO europeana;

--
-- TOC entry 807 (class 1259 OID 31236)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_session_prot_mapper OWNER TO europeana;

--
-- TOC entry 808 (class 1259 OID 31241)
-- Name: client_session_role; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_session_role OWNER TO europeana;

--
-- TOC entry 809 (class 1259 OID 31246)
-- Name: client_user_session_note; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".client_user_session_note OWNER TO europeana;

--
-- TOC entry 810 (class 1259 OID 31254)
-- Name: component; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE "keycloakprod-v10".component OWNER TO europeana;

--
-- TOC entry 811 (class 1259 OID 31262)
-- Name: component_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE "keycloakprod-v10".component_config OWNER TO europeana;

--
-- TOC entry 812 (class 1259 OID 31270)
-- Name: composite_role; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".composite_role OWNER TO europeana;

--
-- TOC entry 813 (class 1259 OID 31275)
-- Name: credential; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE "keycloakprod-v10".credential OWNER TO europeana;

--
-- TOC entry 814 (class 1259 OID 31283)
-- Name: credential_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE "keycloakprod-v10".credential_attribute OWNER TO europeana;

--
-- TOC entry 815 (class 1259 OID 31291)
-- Name: databasechangelog; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp(6) without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE "keycloakprod-v10".databasechangelog OWNER TO europeana;

--
-- TOC entry 816 (class 1259 OID 31297)
-- Name: databasechangeloglock; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp(6) without time zone,
    lockedby character varying(255)
);


ALTER TABLE "keycloakprod-v10".databasechangeloglock OWNER TO europeana;

--
-- TOC entry 817 (class 1259 OID 31302)
-- Name: default_client_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean NOT NULL
);


ALTER TABLE "keycloakprod-v10".default_client_scope OWNER TO europeana;

--
-- TOC entry 818 (class 1259 OID 31307)
-- Name: event_entity; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE "keycloakprod-v10".event_entity OWNER TO europeana;

--
-- TOC entry 819 (class 1259 OID 31315)
-- Name: fed_user_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE "keycloakprod-v10".fed_user_attribute OWNER TO europeana;

--
-- TOC entry 820 (class 1259 OID 31323)
-- Name: fed_user_consent; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE "keycloakprod-v10".fed_user_consent OWNER TO europeana;

--
-- TOC entry 821 (class 1259 OID 31331)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".fed_user_consent_cl_scope OWNER TO europeana;

--
-- TOC entry 822 (class 1259 OID 31336)
-- Name: fed_user_credential; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE "keycloakprod-v10".fed_user_credential OWNER TO europeana;

--
-- TOC entry 823 (class 1259 OID 31344)
-- Name: fed_user_group_membership; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".fed_user_group_membership OWNER TO europeana;

--
-- TOC entry 824 (class 1259 OID 31349)
-- Name: fed_user_required_action; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_required_action (
    required_action character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".fed_user_required_action OWNER TO europeana;

--
-- TOC entry 825 (class 1259 OID 31357)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".fed_user_role_mapping OWNER TO europeana;

--
-- TOC entry 826 (class 1259 OID 31362)
-- Name: federated_identity; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".federated_identity OWNER TO europeana;

--
-- TOC entry 827 (class 1259 OID 31370)
-- Name: federated_user; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".federated_user OWNER TO europeana;

--
-- TOC entry 828 (class 1259 OID 31378)
-- Name: group_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".group_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".group_attribute OWNER TO europeana;

--
-- TOC entry 829 (class 1259 OID 31386)
-- Name: group_role_mapping; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".group_role_mapping OWNER TO europeana;

--
-- TOC entry 830 (class 1259 OID 31391)
-- Name: identity_provider; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean NOT NULL,
    authenticate_by_default boolean NOT NULL,
    realm_id character varying(36),
    add_token_role boolean NOT NULL,
    trust_email boolean NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean NOT NULL
);


ALTER TABLE "keycloakprod-v10".identity_provider OWNER TO europeana;

--
-- TOC entry 831 (class 1259 OID 31399)
-- Name: identity_provider_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".identity_provider_config OWNER TO europeana;

--
-- TOC entry 832 (class 1259 OID 31407)
-- Name: identity_provider_mapper; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".identity_provider_mapper OWNER TO europeana;

--
-- TOC entry 833 (class 1259 OID 31415)
-- Name: idp_mapper_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".idp_mapper_config OWNER TO europeana;

--
-- TOC entry 834 (class 1259 OID 31423)
-- Name: keycloak_group; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".keycloak_group OWNER TO europeana;

--
-- TOC entry 835 (class 1259 OID 31428)
-- Name: keycloak_role; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE "keycloakprod-v10".keycloak_role OWNER TO europeana;

--
-- TOC entry 836 (class 1259 OID 31436)
-- Name: migration_model; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint NOT NULL
);


ALTER TABLE "keycloakprod-v10".migration_model OWNER TO europeana;

--
-- TOC entry 837 (class 1259 OID 31441)
-- Name: offline_client_session; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) NOT NULL,
    external_client_id character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".offline_client_session OWNER TO europeana;

--
-- TOC entry 838 (class 1259 OID 31449)
-- Name: offline_user_session; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer NOT NULL
);


ALTER TABLE "keycloakprod-v10".offline_user_session OWNER TO europeana;

--
-- TOC entry 839 (class 1259 OID 31457)
-- Name: policy_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE "keycloakprod-v10".policy_config OWNER TO europeana;

--
-- TOC entry 840 (class 1259 OID 31465)
-- Name: protocol_mapper; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".protocol_mapper OWNER TO europeana;

--
-- TOC entry 841 (class 1259 OID 31473)
-- Name: protocol_mapper_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".protocol_mapper_config OWNER TO europeana;

--
-- TOC entry 842 (class 1259 OID 31481)
-- Name: realm; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean NOT NULL,
    events_enabled boolean NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean NOT NULL,
    remember_me boolean NOT NULL,
    reset_password_allowed boolean NOT NULL,
    social boolean NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean NOT NULL,
    verify_email boolean NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean NOT NULL,
    admin_events_enabled boolean NOT NULL,
    admin_events_details_enabled boolean NOT NULL,
    edit_username_allowed boolean NOT NULL,
    otp_policy_counter integer,
    otp_policy_window integer,
    otp_policy_period integer,
    otp_policy_digits integer,
    otp_policy_alg character varying(36),
    otp_policy_type character varying(36),
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer,
    revoke_refresh_token boolean NOT NULL,
    access_token_life_implicit integer,
    login_with_email_allowed boolean NOT NULL,
    duplicate_emails_allowed boolean NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer,
    allow_user_managed_access boolean NOT NULL,
    sso_max_lifespan_remember_me integer NOT NULL,
    sso_idle_timeout_remember_me integer NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm OWNER TO europeana;

--
-- TOC entry 843 (class 1259 OID 31489)
-- Name: realm_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_attribute OWNER TO europeana;

--
-- TOC entry 844 (class 1259 OID 31497)
-- Name: realm_default_groups; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_default_groups OWNER TO europeana;

--
-- TOC entry 845 (class 1259 OID 31502)
-- Name: realm_default_roles; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_default_roles OWNER TO europeana;

--
-- TOC entry 846 (class 1259 OID 31507)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_enabled_event_types OWNER TO europeana;

--
-- TOC entry 847 (class 1259 OID 31512)
-- Name: realm_events_listeners; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_events_listeners OWNER TO europeana;

--
-- TOC entry 848 (class 1259 OID 31517)
-- Name: realm_required_credential; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean NOT NULL,
    secret boolean NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_required_credential OWNER TO europeana;

--
-- TOC entry 849 (class 1259 OID 31525)
-- Name: realm_smtp_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_smtp_config OWNER TO europeana;

--
-- TOC entry 850 (class 1259 OID 31533)
-- Name: realm_supported_locales; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".realm_supported_locales OWNER TO europeana;

--
-- TOC entry 851 (class 1259 OID 31538)
-- Name: redirect_uris; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".redirect_uris OWNER TO europeana;

--
-- TOC entry 852 (class 1259 OID 31543)
-- Name: required_action_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".required_action_config OWNER TO europeana;

--
-- TOC entry 853 (class 1259 OID 31551)
-- Name: required_action_provider; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean NOT NULL,
    default_action boolean NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE "keycloakprod-v10".required_action_provider OWNER TO europeana;

--
-- TOC entry 854 (class 1259 OID 31559)
-- Name: resource_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".resource_attribute OWNER TO europeana;

--
-- TOC entry 855 (class 1259 OID 31567)
-- Name: resource_policy; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".resource_policy OWNER TO europeana;

--
-- TOC entry 856 (class 1259 OID 31572)
-- Name: resource_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".resource_scope OWNER TO europeana;

--
-- TOC entry 857 (class 1259 OID 31577)
-- Name: resource_server; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint NOT NULL
);


ALTER TABLE "keycloakprod-v10".resource_server OWNER TO europeana;

--
-- TOC entry 858 (class 1259 OID 31582)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".resource_server_perm_ticket OWNER TO europeana;

--
-- TOC entry 859 (class 1259 OID 31590)
-- Name: resource_server_policy; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE "keycloakprod-v10".resource_server_policy OWNER TO europeana;

--
-- TOC entry 860 (class 1259 OID 31598)
-- Name: resource_server_resource; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean NOT NULL,
    display_name character varying(255)
);


ALTER TABLE "keycloakprod-v10".resource_server_resource OWNER TO europeana;

--
-- TOC entry 861 (class 1259 OID 31606)
-- Name: resource_server_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE "keycloakprod-v10".resource_server_scope OWNER TO europeana;

--
-- TOC entry 862 (class 1259 OID 31614)
-- Name: resource_uris; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".resource_uris OWNER TO europeana;

--
-- TOC entry 863 (class 1259 OID 31619)
-- Name: role_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE "keycloakprod-v10".role_attribute OWNER TO europeana;

--
-- TOC entry 864 (class 1259 OID 31627)
-- Name: scope_mapping; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".scope_mapping OWNER TO europeana;

--
-- TOC entry 865 (class 1259 OID 31632)
-- Name: scope_policy; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".scope_policy OWNER TO europeana;

--
-- TOC entry 866 (class 1259 OID 31637)
-- Name: user_attribute; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_attribute OWNER TO europeana;

--
-- TOC entry 867 (class 1259 OID 31645)
-- Name: user_consent; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE "keycloakprod-v10".user_consent OWNER TO europeana;

--
-- TOC entry 868 (class 1259 OID 31653)
-- Name: user_consent_client_scope; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_consent_client_scope OWNER TO europeana;

--
-- TOC entry 869 (class 1259 OID 31658)
-- Name: user_entity; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean NOT NULL,
    enabled boolean NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_entity OWNER TO europeana;

--
-- TOC entry 870 (class 1259 OID 31666)
-- Name: user_federation_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_federation_config OWNER TO europeana;

--
-- TOC entry 871 (class 1259 OID 31674)
-- Name: user_federation_mapper; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_federation_mapper OWNER TO europeana;

--
-- TOC entry 872 (class 1259 OID 31682)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_federation_mapper_config OWNER TO europeana;

--
-- TOC entry 873 (class 1259 OID 31690)
-- Name: user_federation_provider; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE "keycloakprod-v10".user_federation_provider OWNER TO europeana;

--
-- TOC entry 874 (class 1259 OID 31698)
-- Name: user_group_membership; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_group_membership OWNER TO europeana;

--
-- TOC entry 875 (class 1259 OID 31703)
-- Name: user_required_action; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_required_action OWNER TO europeana;

--
-- TOC entry 876 (class 1259 OID 31708)
-- Name: user_role_mapping; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE "keycloakprod-v10".user_role_mapping OWNER TO europeana;

--
-- TOC entry 877 (class 1259 OID 31713)
-- Name: user_session; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE "keycloakprod-v10".user_session OWNER TO europeana;

--
-- TOC entry 878 (class 1259 OID 31721)
-- Name: user_session_note; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE "keycloakprod-v10".user_session_note OWNER TO europeana;

--
-- TOC entry 879 (class 1259 OID 31729)
-- Name: username_login_failure; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE "keycloakprod-v10".username_login_failure OWNER TO europeana;

--
-- TOC entry 880 (class 1259 OID 31737)
-- Name: web_origins; Type: TABLE; Schema: keycloakprod-v10; Owner: europeana
--

CREATE TABLE "keycloakprod-v10".web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE "keycloakprod-v10".web_origins OWNER TO europeana;

--
-- TOC entry 5876 (class 0 OID 31106)
-- Dependencies: 787
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 5877 (class 0 OID 31114)
-- Dependencies: 788
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".associated_policy (policy_id, associated_policy_id) FROM stdin;
89cf5b05-6ee0-4b1f-8efa-7d689e29dd5a	88c1dd99-6b73-40db-98be-7de463a7adb1
1b2e724c-2326-4f6d-9ba7-01b3e0c68454	cb9c9022-a9ea-46d4-9e79-aacf921a1880
\.


--
-- TOC entry 5878 (class 0 OID 31119)
-- Dependencies: 789
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
a7c2ee5d-5cee-4f4c-954c-06cf8eda9c26	\N	auth-cookie	master	7e975b8f-1c39-4ee0-9b77-0adcbb208e84	2	10	f	\N	\N
1572d058-84e6-4c8c-ac7c-c71a87bab40a	\N	auth-spnego	master	7e975b8f-1c39-4ee0-9b77-0adcbb208e84	3	20	f	\N	\N
14c495ef-3d9b-4884-b044-6932e83b3a02	\N	identity-provider-redirector	master	7e975b8f-1c39-4ee0-9b77-0adcbb208e84	2	25	f	\N	\N
6acf8345-9d09-4d9d-9e88-80367966da98	\N	\N	master	7e975b8f-1c39-4ee0-9b77-0adcbb208e84	2	30	t	a6093361-d09a-44ff-bb05-7f0315956eca	\N
2322a2bb-9bbb-4d84-b6b3-1636569e4724	\N	auth-username-password-form	master	a6093361-d09a-44ff-bb05-7f0315956eca	0	10	f	\N	\N
ee3cfdda-eca9-4076-b2b7-356e67a6ec1e	\N	direct-grant-validate-username	master	67337147-77da-4ee8-9f74-ef6a75ee4fff	0	10	f	\N	\N
7a99c70a-8b68-4e78-848c-d2f75892211c	\N	direct-grant-validate-password	master	67337147-77da-4ee8-9f74-ef6a75ee4fff	0	20	f	\N	\N
12682776-8555-4c7a-9486-91e0527d96dd	\N	registration-page-form	master	52f6be4d-d8b6-406d-b09a-b5893aaa9acd	0	10	t	e5e0f933-dbe7-404d-adfd-b41581c7649f	\N
c582b314-ba72-4f4e-a5fc-41d91595394b	\N	registration-user-creation	master	e5e0f933-dbe7-404d-adfd-b41581c7649f	0	20	f	\N	\N
f96ef3dd-08f7-4a5a-86bc-5c8453061fb8	\N	registration-profile-action	master	e5e0f933-dbe7-404d-adfd-b41581c7649f	0	40	f	\N	\N
d97adc42-86c8-443f-95dd-e6e58ab0abee	\N	registration-password-action	master	e5e0f933-dbe7-404d-adfd-b41581c7649f	0	50	f	\N	\N
4eeda559-0d92-4d9a-b67e-06179bc08339	\N	registration-recaptcha-action	master	e5e0f933-dbe7-404d-adfd-b41581c7649f	3	60	f	\N	\N
466119ce-f4e2-4eac-8dd8-6a5d5d5f9e10	\N	reset-credentials-choose-user	master	d4e707a4-bc9c-4420-a401-93c2a8de63b0	0	10	f	\N	\N
5f2fa054-5a54-4a30-a1e1-c85632bc77eb	\N	reset-credential-email	master	d4e707a4-bc9c-4420-a401-93c2a8de63b0	0	20	f	\N	\N
a574ee17-b905-400a-b091-09115f7010d5	\N	reset-password	master	d4e707a4-bc9c-4420-a401-93c2a8de63b0	0	30	f	\N	\N
c8792dfc-77f5-46d1-8471-f9ee2a0ceb4b	\N	client-secret	master	a1f08246-5f85-4ff5-903e-2344f4be5b8e	2	10	f	\N	\N
7fa6cefe-965d-4959-a11f-9a3cf25bd56e	\N	client-jwt	master	a1f08246-5f85-4ff5-903e-2344f4be5b8e	2	20	f	\N	\N
db43682e-0023-45f0-816e-730713db9fcb	\N	client-secret-jwt	master	a1f08246-5f85-4ff5-903e-2344f4be5b8e	2	30	f	\N	\N
fc7a8eb8-916b-4c99-a8ff-c32c85a16e7a	\N	client-x509	master	a1f08246-5f85-4ff5-903e-2344f4be5b8e	2	40	f	\N	\N
71980bb6-5320-4392-a71b-d9dbc155eebf	\N	idp-review-profile	master	7ac2fb05-a3dd-4952-961f-22ce4c9f7389	0	10	f	\N	49c2682b-9019-4c31-8a74-a28cb778d1de
6d47f1d8-fcc4-48ae-bde7-a66d4e42590c	\N	idp-confirm-link	master	1d211155-33bb-465c-89dc-3595f46c4864	0	10	f	\N	\N
5b9a7d2d-1c16-4322-a90f-b465bac077a8	\N	idp-username-password-form	master	83a7e8d3-f10c-4fc5-bff4-bc6f7389beed	0	10	f	\N	\N
84e658ae-b5e6-416e-bc65-f4bab0369fc6	\N	http-basic-authenticator	master	2b86d6e7-80ba-4258-9822-feaf611bcc0a	0	10	f	\N	\N
341f149c-0c14-43fe-afbe-577b12e21622	\N	docker-http-basic-authenticator	master	0e6d85e9-1d3f-49e8-82dd-bacc47323ac6	0	10	f	\N	\N
6a822cc7-c573-401f-92bd-48f069cf6f79	\N	no-cookie-redirect	master	5c9bd64d-85c3-4e62-9ef6-e74656720418	0	10	f	\N	\N
6fd4feb4-97c4-4869-b96f-d6dc0184aee6	\N	basic-auth	master	5c9bd64d-85c3-4e62-9ef6-e74656720418	0	20	f	\N	\N
4fe2718d-c7dc-4387-85b0-e82dc99c0a52	\N	basic-auth-otp	master	5c9bd64d-85c3-4e62-9ef6-e74656720418	3	30	f	\N	\N
93ed3bb3-53c1-4362-a437-ba771d2f91ad	\N	auth-spnego	master	5c9bd64d-85c3-4e62-9ef6-e74656720418	3	40	f	\N	\N
f1c06a11-38eb-4294-9331-20dc50b33aec	\N	auth-cookie	europeana	a03a8a52-970c-47a1-9095-c6d0246476f5	2	10	f	\N	\N
d113e4b8-961d-4f86-9953-c660567b98e3	\N	auth-spnego	europeana	a03a8a52-970c-47a1-9095-c6d0246476f5	3	20	f	\N	\N
d49d8d60-f825-4c87-8c53-61317d76ed5b	\N	identity-provider-redirector	europeana	a03a8a52-970c-47a1-9095-c6d0246476f5	2	25	f	\N	\N
f5974b56-e588-4efb-ae40-978e79308f43	\N	\N	europeana	a03a8a52-970c-47a1-9095-c6d0246476f5	2	30	t	02d6d033-879c-4a18-8c46-a59c04954a2e	\N
4cbf8070-41c3-483c-8648-49239012f63e	\N	auth-username-password-form	europeana	02d6d033-879c-4a18-8c46-a59c04954a2e	0	10	f	\N	\N
724bfe13-3510-4990-9650-e879bdbf9fc9	\N	direct-grant-validate-username	europeana	870de973-d16d-4809-8384-7bc8d68ecc16	0	10	f	\N	\N
4e6a91cc-ef95-44c7-817d-a83f0b500efb	\N	direct-grant-validate-password	europeana	870de973-d16d-4809-8384-7bc8d68ecc16	0	20	f	\N	\N
f0683099-0e1f-413d-97c1-41b1adc0ff14	\N	registration-page-form	europeana	0f41213d-849b-4205-98a3-04922e0fe3b3	0	10	t	282f505f-edb9-4dbe-a592-d9e86c961f17	\N
493363f4-75a9-49a1-aa7a-6bf2fbf843db	\N	registration-user-creation	europeana	282f505f-edb9-4dbe-a592-d9e86c961f17	0	20	f	\N	\N
4276bc28-a5b8-4e93-b81e-3ca4b0f5e51a	\N	registration-profile-action	europeana	282f505f-edb9-4dbe-a592-d9e86c961f17	0	40	f	\N	\N
d5d1bc08-1f35-4fcf-a282-15677fdd2182	\N	registration-password-action	europeana	282f505f-edb9-4dbe-a592-d9e86c961f17	0	50	f	\N	\N
b177420f-4520-4c85-aefb-d3b479e4a327	\N	registration-recaptcha-action	europeana	282f505f-edb9-4dbe-a592-d9e86c961f17	3	60	f	\N	\N
e2e8c0b6-9fb1-4703-8168-5ed232e413ad	\N	reset-credentials-choose-user	europeana	b12388fa-bd6d-4875-943b-51bdab7e9660	0	10	f	\N	\N
fa9d72ff-e482-45fb-a94e-905b436b2b3d	\N	reset-credential-email	europeana	b12388fa-bd6d-4875-943b-51bdab7e9660	0	20	f	\N	\N
e5478a0d-ccdb-4941-8a15-dd5b592e8d03	\N	reset-password	europeana	b12388fa-bd6d-4875-943b-51bdab7e9660	0	30	f	\N	\N
f11ada9a-eb2b-4126-ad53-87a366cb2f15	\N	client-secret	europeana	6788a340-fef8-4a43-8e24-142316e35606	2	10	f	\N	\N
f5a3a5ef-d35c-42fb-916c-2815aa4f1103	\N	client-jwt	europeana	6788a340-fef8-4a43-8e24-142316e35606	2	20	f	\N	\N
c39e9536-e029-41e4-82f7-69be43a48d8a	\N	client-secret-jwt	europeana	6788a340-fef8-4a43-8e24-142316e35606	2	30	f	\N	\N
57d077c4-64b9-4fd7-9a58-c6656f47f9a6	\N	client-x509	europeana	6788a340-fef8-4a43-8e24-142316e35606	2	40	f	\N	\N
c66c3062-c4b3-4fb3-a3a8-0bc5b5533b8b	\N	idp-review-profile	europeana	4285ab9c-fdc4-4c2c-96fb-9afbfe6cd284	0	10	f	\N	123053d6-b102-4e41-a73f-ada47a5ee60a
318db320-a906-4b0c-986a-9b6fcad810cc	\N	idp-confirm-link	europeana	71366bdc-967a-4524-85de-73806d904d8f	0	10	f	\N	\N
adbdf1a5-16c5-4407-9043-d583a89a6a62	\N	idp-username-password-form	europeana	9db842f4-d916-4f38-8363-5e810fc4cb2b	0	10	f	\N	\N
447396d5-db7b-47b2-a381-71354b1c5694	\N	http-basic-authenticator	europeana	dcbc97b8-537b-4ac5-92bf-e4f096816f43	0	10	f	\N	\N
c4a7d5b0-bcd1-454e-82c4-867966cbc10e	\N	docker-http-basic-authenticator	europeana	0a264efb-aefe-4210-80fa-aaea1a19ad59	0	10	f	\N	\N
0246a28d-dc33-46a7-b3bd-40e00c229b05	\N	no-cookie-redirect	europeana	c686a100-d729-46fa-b6bf-d7626eb4b6bc	0	10	f	\N	\N
95429076-cbfd-44e7-906f-9e25f8687322	\N	basic-auth	europeana	c686a100-d729-46fa-b6bf-d7626eb4b6bc	0	20	f	\N	\N
71003736-4a0c-4895-816d-6d4db60786da	\N	basic-auth-otp	europeana	c686a100-d729-46fa-b6bf-d7626eb4b6bc	3	30	f	\N	\N
91ee8cf9-3231-45f8-b44b-4bbc8c060b83	\N	auth-spnego	europeana	c686a100-d729-46fa-b6bf-d7626eb4b6bc	3	40	f	\N	\N
546690b1-9ae6-4fa2-b75e-7f756eb800af	\N	\N	europeana	02d6d033-879c-4a18-8c46-a59c04954a2e	1	20	t	09f43dd0-2a63-4f94-9ce8-9c9ee647a1aa	\N
bd7557a8-eeee-485b-be97-5a1ea845eed5	\N	conditional-user-configured	europeana	09f43dd0-2a63-4f94-9ce8-9c9ee647a1aa	0	10	f	\N	\N
408240ae-7e3f-479c-9afe-a4a97a94b7e1	\N	auth-otp-form	europeana	09f43dd0-2a63-4f94-9ce8-9c9ee647a1aa	0	20	f	\N	\N
9dceb48c-0561-4167-9d62-f1cf92a2eaf9	\N	\N	europeana	870de973-d16d-4809-8384-7bc8d68ecc16	1	30	t	1a9eb300-9500-44e0-a447-2849a9a2c6b7	\N
c5013283-3240-4328-bfaa-fadccc30644d	\N	conditional-user-configured	europeana	1a9eb300-9500-44e0-a447-2849a9a2c6b7	0	10	f	\N	\N
0ceaf666-9a2b-4c5d-8fc6-8042b47cc02c	\N	direct-grant-validate-otp	europeana	1a9eb300-9500-44e0-a447-2849a9a2c6b7	0	20	f	\N	\N
90c4294a-faa6-45dd-af22-ba54eb753ef2	\N	\N	europeana	b12388fa-bd6d-4875-943b-51bdab7e9660	1	40	t	5abd3740-05a6-4540-b92e-131a8c58a262	\N
ea7a7056-4fb4-4318-9ecf-f4185ed38413	\N	conditional-user-configured	europeana	5abd3740-05a6-4540-b92e-131a8c58a262	0	10	f	\N	\N
9a05d563-1181-43e1-9f2c-3d2bcaabab65	\N	reset-otp	europeana	5abd3740-05a6-4540-b92e-131a8c58a262	0	20	f	\N	\N
34efb6e4-bd31-48da-b34f-34a1e342ad7d	\N	\N	europeana	9db842f4-d916-4f38-8363-5e810fc4cb2b	1	20	t	2bd7b33d-392a-46f9-a83e-6e81ca2aac45	\N
d2d5b361-5055-4f7f-acdd-d895e4bac15d	\N	conditional-user-configured	europeana	2bd7b33d-392a-46f9-a83e-6e81ca2aac45	0	10	f	\N	\N
74a01a71-accc-4db9-a347-49fd74dc6969	\N	auth-otp-form	europeana	2bd7b33d-392a-46f9-a83e-6e81ca2aac45	0	20	f	\N	\N
f1e48cb4-7e1c-475a-83fc-2766d1f4704f	\N	\N	master	a6093361-d09a-44ff-bb05-7f0315956eca	1	20	t	4cac7516-53bf-4997-ba88-0b21825789ed	\N
791f7f13-6038-484a-aceb-a2b38809ee1b	\N	conditional-user-configured	master	4cac7516-53bf-4997-ba88-0b21825789ed	0	10	f	\N	\N
c9641576-2cdf-4e9f-828f-7eee5ca22c5b	\N	auth-otp-form	master	4cac7516-53bf-4997-ba88-0b21825789ed	0	20	f	\N	\N
29eab518-114f-4c2e-baf1-c141e94a13d2	\N	\N	master	67337147-77da-4ee8-9f74-ef6a75ee4fff	1	30	t	4afed825-0b21-4972-9bfb-965308738c8e	\N
41b62ed8-b35f-4fbe-9a12-1c2f498a7501	\N	conditional-user-configured	master	4afed825-0b21-4972-9bfb-965308738c8e	0	10	f	\N	\N
4467f1d5-bef9-4464-a2c8-0c0fbd963c20	\N	direct-grant-validate-otp	master	4afed825-0b21-4972-9bfb-965308738c8e	0	20	f	\N	\N
6defb7bd-4906-49f6-ac53-eb44e551a063	\N	\N	master	d4e707a4-bc9c-4420-a401-93c2a8de63b0	1	40	t	a6878a86-3679-4d10-a348-4c4a5d5f59bf	\N
0010cfab-8504-4753-9a2d-9d8cb754451b	\N	conditional-user-configured	master	a6878a86-3679-4d10-a348-4c4a5d5f59bf	0	10	f	\N	\N
ee750480-143e-4a99-b947-186829d05b1f	\N	reset-otp	master	a6878a86-3679-4d10-a348-4c4a5d5f59bf	0	20	f	\N	\N
9a2c5b5d-84f6-4fee-9d43-bb83ad1841fc	\N	\N	master	83a7e8d3-f10c-4fc5-bff4-bc6f7389beed	1	20	t	f57d6630-bfcf-47a8-aeb5-7a35957ea679	\N
0b0aeeda-e755-4b18-973f-d7d3c1c0fe44	\N	conditional-user-configured	master	f57d6630-bfcf-47a8-aeb5-7a35957ea679	0	10	f	\N	\N
aff71b04-0c95-4e3e-ada5-b7a84bf3e76c	\N	auth-otp-form	master	f57d6630-bfcf-47a8-aeb5-7a35957ea679	0	20	f	\N	\N
3614e6a0-5a34-432d-bec1-929ed82eb29a	\N	\N	europeana	4285ab9c-fdc4-4c2c-96fb-9afbfe6cd284	0	20	t	86ed7010-7f0e-4a49-ae34-519589d3d527	\N
b80d00ae-414e-4649-b3a7-99493c4a7539	\N	idp-create-user-if-unique	europeana	86ed7010-7f0e-4a49-ae34-519589d3d527	2	10	f	\N	9e6442ea-c0b8-449e-ae9c-66c2dddf64f0
a6df0e34-fbe1-49e5-b9b4-d2d10db13366	\N	\N	europeana	86ed7010-7f0e-4a49-ae34-519589d3d527	2	20	t	71366bdc-967a-4524-85de-73806d904d8f	\N
ea386517-0188-4166-91d2-90a06a9e8a4e	\N	\N	europeana	71366bdc-967a-4524-85de-73806d904d8f	0	20	t	ba2e70a6-114a-4336-927d-ab5112cd047e	\N
76995672-7bdf-4511-8d42-74572ed85477	\N	idp-email-verification	europeana	ba2e70a6-114a-4336-927d-ab5112cd047e	2	10	f	\N	\N
a415b527-0f6a-49ae-a8e0-58507d2f19d3	\N	\N	europeana	ba2e70a6-114a-4336-927d-ab5112cd047e	2	20	t	9db842f4-d916-4f38-8363-5e810fc4cb2b	\N
17a123af-d0dd-4f1e-9481-ac609bbca7e8	\N	\N	master	7ac2fb05-a3dd-4952-961f-22ce4c9f7389	0	20	t	c16693a3-06f7-4652-8a58-9abf97e11069	\N
5069c224-0b32-4dac-bb9b-91a5e9a5084b	\N	idp-create-user-if-unique	master	c16693a3-06f7-4652-8a58-9abf97e11069	2	10	f	\N	5c2c9ba3-d9b1-4968-9d70-ad8a5e3491e8
ea5357d6-4862-4cd5-ab97-119fb19ee860	\N	\N	master	c16693a3-06f7-4652-8a58-9abf97e11069	2	20	t	1d211155-33bb-465c-89dc-3595f46c4864	\N
d05002dd-d229-4eff-a893-6339cf2492e3	\N	\N	master	1d211155-33bb-465c-89dc-3595f46c4864	0	20	t	3a90b139-8287-48ac-b6d0-1b8d2070ab2a	\N
2d92100f-7770-40c5-9d76-fda43072b73a	\N	idp-email-verification	master	3a90b139-8287-48ac-b6d0-1b8d2070ab2a	2	10	f	\N	\N
0b34c952-2efe-443c-b05f-51a1316fd593	\N	\N	master	3a90b139-8287-48ac-b6d0-1b8d2070ab2a	2	20	t	83a7e8d3-f10c-4fc5-bff4-bc6f7389beed	\N
\.


--
-- TOC entry 5879 (class 0 OID 31124)
-- Dependencies: 790
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
7e975b8f-1c39-4ee0-9b77-0adcbb208e84	browser	browser based authentication	master	basic-flow	t	t
a6093361-d09a-44ff-bb05-7f0315956eca	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
67337147-77da-4ee8-9f74-ef6a75ee4fff	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
52f6be4d-d8b6-406d-b09a-b5893aaa9acd	registration	registration flow	master	basic-flow	t	t
e5e0f933-dbe7-404d-adfd-b41581c7649f	registration form	registration form	master	form-flow	f	t
d4e707a4-bc9c-4420-a401-93c2a8de63b0	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
a1f08246-5f85-4ff5-903e-2344f4be5b8e	clients	Base authentication for clients	master	client-flow	t	t
7ac2fb05-a3dd-4952-961f-22ce4c9f7389	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
1d211155-33bb-465c-89dc-3595f46c4864	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
83a7e8d3-f10c-4fc5-bff4-bc6f7389beed	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
2b86d6e7-80ba-4258-9822-feaf611bcc0a	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
0e6d85e9-1d3f-49e8-82dd-bacc47323ac6	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
5c9bd64d-85c3-4e62-9ef6-e74656720418	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
a03a8a52-970c-47a1-9095-c6d0246476f5	browser	browser based authentication	europeana	basic-flow	t	t
02d6d033-879c-4a18-8c46-a59c04954a2e	forms	Username, password, otp and other auth forms.	europeana	basic-flow	f	t
870de973-d16d-4809-8384-7bc8d68ecc16	direct grant	OpenID Connect Resource Owner Grant	europeana	basic-flow	t	t
0f41213d-849b-4205-98a3-04922e0fe3b3	registration	registration flow	europeana	basic-flow	t	t
282f505f-edb9-4dbe-a592-d9e86c961f17	registration form	registration form	europeana	form-flow	f	t
b12388fa-bd6d-4875-943b-51bdab7e9660	reset credentials	Reset credentials for a user if they forgot their password or something	europeana	basic-flow	t	t
6788a340-fef8-4a43-8e24-142316e35606	clients	Base authentication for clients	europeana	client-flow	t	t
4285ab9c-fdc4-4c2c-96fb-9afbfe6cd284	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	europeana	basic-flow	t	t
71366bdc-967a-4524-85de-73806d904d8f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	europeana	basic-flow	f	t
9db842f4-d916-4f38-8363-5e810fc4cb2b	Verify Existing Account by Re-authentication	Reauthentication of existing account	europeana	basic-flow	f	t
dcbc97b8-537b-4ac5-92bf-e4f096816f43	saml ecp	SAML ECP Profile Authentication Flow	europeana	basic-flow	t	t
0a264efb-aefe-4210-80fa-aaea1a19ad59	docker auth	Used by Docker clients to authenticate against the IDP	europeana	basic-flow	t	t
c686a100-d729-46fa-b6bf-d7626eb4b6bc	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	europeana	basic-flow	t	t
09f43dd0-2a63-4f94-9ce8-9c9ee647a1aa	forms - auth-otp-form - Conditional	Flow to determine if the auth-otp-form authenticator should be used or not.	europeana	basic-flow	f	t
1a9eb300-9500-44e0-a447-2849a9a2c6b7	direct grant - direct-grant-validate-otp - Conditional	Flow to determine if the direct-grant-validate-otp authenticator should be used or not.	europeana	basic-flow	f	t
5abd3740-05a6-4540-b92e-131a8c58a262	reset credentials - reset-otp - Conditional	Flow to determine if the reset-otp authenticator should be used or not.	europeana	basic-flow	f	t
2bd7b33d-392a-46f9-a83e-6e81ca2aac45	Verify Existing Account by Re-authentication - auth-otp-form - Conditional	Flow to determine if the auth-otp-form authenticator should be used or not.	europeana	basic-flow	f	t
4cac7516-53bf-4997-ba88-0b21825789ed	forms - auth-otp-form - Conditional	Flow to determine if the auth-otp-form authenticator should be used or not.	master	basic-flow	f	t
4afed825-0b21-4972-9bfb-965308738c8e	direct grant - direct-grant-validate-otp - Conditional	Flow to determine if the direct-grant-validate-otp authenticator should be used or not.	master	basic-flow	f	t
a6878a86-3679-4d10-a348-4c4a5d5f59bf	reset credentials - reset-otp - Conditional	Flow to determine if the reset-otp authenticator should be used or not.	master	basic-flow	f	t
f57d6630-bfcf-47a8-aeb5-7a35957ea679	Verify Existing Account by Re-authentication - auth-otp-form - Conditional	Flow to determine if the auth-otp-form authenticator should be used or not.	master	basic-flow	f	t
86ed7010-7f0e-4a49-ae34-519589d3d527	first broker login - Alternatives - 0	Subflow of first broker login with alternative executions	europeana	basic-flow	f	t
ba2e70a6-114a-4336-927d-ab5112cd047e	Handle Existing Account - Alternatives - 0	Subflow of Handle Existing Account with alternative executions	europeana	basic-flow	f	t
c16693a3-06f7-4652-8a58-9abf97e11069	first broker login - Alternatives - 0	Subflow of first broker login with alternative executions	master	basic-flow	f	t
3a90b139-8287-48ac-b6d0-1b8d2070ab2a	Handle Existing Account - Alternatives - 0	Subflow of Handle Existing Account with alternative executions	master	basic-flow	f	t
\.


--
-- TOC entry 5880 (class 0 OID 31132)
-- Dependencies: 791
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".authenticator_config (id, alias, realm_id) FROM stdin;
49c2682b-9019-4c31-8a74-a28cb778d1de	review profile config	master
5c2c9ba3-d9b1-4968-9d70-ad8a5e3491e8	create unique user config	master
123053d6-b102-4e41-a73f-ada47a5ee60a	review profile config	europeana
9e6442ea-c0b8-449e-ae9c-66c2dddf64f0	create unique user config	europeana
\.


--
-- TOC entry 5881 (class 0 OID 31137)
-- Dependencies: 792
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".authenticator_config_entry (authenticator_id, value, name) FROM stdin;
49c2682b-9019-4c31-8a74-a28cb778d1de	missing	update.profile.on.first.login
5c2c9ba3-d9b1-4968-9d70-ad8a5e3491e8	false	require.password.update.after.registration
123053d6-b102-4e41-a73f-ada47a5ee60a	missing	update.profile.on.first.login
9e6442ea-c0b8-449e-ae9c-66c2dddf64f0	false	require.password.update.after.registration
\.


--
-- TOC entry 5882 (class 0 OID 31145)
-- Dependencies: 793
-- Data for Name: broker_link; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 5883 (class 0 OID 31153)
-- Dependencies: 794
-- Data for Name: client; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	t	master-realm	0	f	aa095113-906f-4bf7-86d5-34078ec693f5	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
c63a762d-c165-4427-847d-fb6424264358	t	f	broker	0	f	dbc3dea8-b0f0-4961-bbfd-aab182c79ced	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
26d34352-17ed-4218-a55a-d1426709111d	t	f	admin-cli	0	t	296f3ef5-1a62-4e92-8671-3b85961d09d7	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
88675175-4471-4df5-ba92-d12ab7544805	t	t	europeana-realm	0	f	2bc8e211-d94d-4181-bc53-23234350f296	\N	t	\N	f	master	\N	0	f	f	europeana Realm	f	client-secret	\N	\N	\N	t	f	f	f
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	f	realm-management	0	f	429bf9ed-25d5-48ba-b128-e9da82878c64	\N	t	\N	f	europeana	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
8742152f-c061-4d63-849d-1a4817ef3322	t	f	broker	0	f	b593d3e7-6f52-44b8-aea0-6d52b28f3a6c	\N	f	\N	f	europeana	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	t	f	admin-cli	0	t	dbd324bb-e5f2-4a72-a2d2-ce1dfb359bf3	\N	f	\N	f	europeana	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
09ab961e-d779-415b-81c8-0582944caa94	t	t	apidemo	0	f	fea9adec-11c7-40be-b4fb-a4b1fe02d75c	\N	f	\N	f	europeana	openid-connect	-1	f	f	Various Europeana APIs (Europeana Foundation)	t	client-secret	\N	API Test Account (api@europeana.eu)	\N	t	f	f	f
7d552182-500c-4122-9c36-769393ca1459	t	t	pingdom-runscope	0	f	4d973010-a479-4965-9ac4-d4022cbd9c61	\N	f	\N	f	europeana	openid-connect	-1	f	f	\N	t	client-secret	\N	Client used in Pingdom checks and Runscope tests	\N	f	f	t	f
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	t	t	api2demo	0	f	6fbe9ffd-c708-4e69-9e51-afa42f02ec4f	\N	f	\N	f	europeana	openid-connect	-1	f	f	Test (Europeana Foundation)	t	client-secret	\N	API Test Account (api@europeana.eu)	\N	t	f	f	f
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	t	t	RbWPAapQ6	0	f	c79da83d-8eda-45ad-adaa-beddb898dcf9	\N	f	\N	f	europeana	openid-connect	-1	f	f	Europeana Portal (Europeana Foundation)	t	client-secret	\N	Portal Production account (api@europeana.eu)	\N	t	f	f	f
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	t	f	api-key-service	0	f	5d113adf-b332-48b0-b4a8-66993e178bcf	\N	f	\N	f	europeana	openid-connect	-1	f	f	\N	t	client-secret	\N	API key service manager account	\N	f	f	t	f
4d54e474-c726-4c05-97e4-6c0d7207f65d	t	t	pbPjb6xtT	0	f	7cd69854-a000-4a0e-bb1f-74bb71171c6a	\N	f	\N	f	europeana	openid-connect	-1	f	f	Europeana Media Proxy (Europeana Foundation)	t	client-secret	\N	Portal Production account (api@europeana.eu)	\N	t	f	f	f
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	t	f	security-admin-console	0	t	1961297b-d34b-4cd5-87ea-c1c5ec8a17c1	/admin/europeana/console/	f	\N	f	europeana	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
4f554b64-0b22-4194-8660-fac7fb017194	t	f	account	0	f	ac5a5458-2c12-4a5c-8824-653b2de0a708	/realms/europeana/account/	f	\N	f	europeana	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	t	f	security-admin-console	0	t	a176dd1e-d234-4644-87f8-4f2cd522205f	/admin/master/console/	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	f	account	0	f	5cbd91dd-e822-4d6c-8a40-bfb843f0b4db	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
438c39cb-cb57-4543-acca-966e0d9d0eea	t	f	account-console	0	t	5a60ef15-7667-407f-9378-f6a9578e8ede	/realms/europeana/account/	f	\N	f	europeana	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
69dae4f1-2dde-437a-8172-70f60fd37f6f	t	f	account-console	0	t	7b8461ce-5ae4-4f8a-9d8a-d0b94078e553	/realms/master/account/	f	\N	f	master	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
\.


--
-- TOC entry 5884 (class 0 OID 31161)
-- Dependencies: 795
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_attributes (client_id, value, name) FROM stdin;
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.server.signature
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.server.signature.keyinfo.ext
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.assertion.signature
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.client.signature
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.encrypt
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.authnstatement
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.onetimeuse.condition
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml_force_name_id_format
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.multivalued.roles
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	saml.force.post.binding
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	exclude.session.state.from.auth.response
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	tls.client.certificate.bound.access.tokens
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	false	display.on.consent.screen
09ab961e-d779-415b-81c8-0582944caa94	false	saml.server.signature
09ab961e-d779-415b-81c8-0582944caa94	false	saml.server.signature.keyinfo.ext
09ab961e-d779-415b-81c8-0582944caa94	false	saml.assertion.signature
09ab961e-d779-415b-81c8-0582944caa94	false	saml.client.signature
09ab961e-d779-415b-81c8-0582944caa94	false	saml.encrypt
09ab961e-d779-415b-81c8-0582944caa94	false	saml.authnstatement
09ab961e-d779-415b-81c8-0582944caa94	false	saml.onetimeuse.condition
09ab961e-d779-415b-81c8-0582944caa94	false	saml_force_name_id_format
09ab961e-d779-415b-81c8-0582944caa94	false	saml.multivalued.roles
09ab961e-d779-415b-81c8-0582944caa94	false	saml.force.post.binding
09ab961e-d779-415b-81c8-0582944caa94	false	exclude.session.state.from.auth.response
09ab961e-d779-415b-81c8-0582944caa94	false	tls.client.certificate.bound.access.tokens
09ab961e-d779-415b-81c8-0582944caa94	false	display.on.consent.screen
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.server.signature
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.server.signature.keyinfo.ext
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.assertion.signature
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.client.signature
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.encrypt
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.authnstatement
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.onetimeuse.condition
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml_force_name_id_format
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.multivalued.roles
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	saml.force.post.binding
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	exclude.session.state.from.auth.response
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	tls.client.certificate.bound.access.tokens
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	false	display.on.consent.screen
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.server.signature
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.server.signature.keyinfo.ext
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.assertion.signature
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.client.signature
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.encrypt
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.authnstatement
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.onetimeuse.condition
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml_force_name_id_format
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.multivalued.roles
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	saml.force.post.binding
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	exclude.session.state.from.auth.response
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	tls.client.certificate.bound.access.tokens
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	false	display.on.consent.screen
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.server.signature
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.server.signature.keyinfo.ext
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.assertion.signature
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.client.signature
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.encrypt
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.authnstatement
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.onetimeuse.condition
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml_force_name_id_format
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.multivalued.roles
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	saml.force.post.binding
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	exclude.session.state.from.auth.response
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	tls.client.certificate.bound.access.tokens
4d54e474-c726-4c05-97e4-6c0d7207f65d	false	display.on.consent.screen
7d552182-500c-4122-9c36-769393ca1459	false	saml.server.signature
7d552182-500c-4122-9c36-769393ca1459	false	saml.server.signature.keyinfo.ext
7d552182-500c-4122-9c36-769393ca1459	false	saml.assertion.signature
7d552182-500c-4122-9c36-769393ca1459	false	saml.client.signature
7d552182-500c-4122-9c36-769393ca1459	false	saml.encrypt
7d552182-500c-4122-9c36-769393ca1459	false	saml.authnstatement
7d552182-500c-4122-9c36-769393ca1459	false	saml.onetimeuse.condition
7d552182-500c-4122-9c36-769393ca1459	false	saml_force_name_id_format
7d552182-500c-4122-9c36-769393ca1459	false	saml.multivalued.roles
7d552182-500c-4122-9c36-769393ca1459	false	saml.force.post.binding
7d552182-500c-4122-9c36-769393ca1459	false	exclude.session.state.from.auth.response
7d552182-500c-4122-9c36-769393ca1459	false	tls.client.certificate.bound.access.tokens
7d552182-500c-4122-9c36-769393ca1459	false	display.on.consent.screen
7d552182-500c-4122-9c36-769393ca1459	60	access.token.lifespan
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	S256	pkce.code.challenge.method
438c39cb-cb57-4543-acca-966e0d9d0eea	S256	pkce.code.challenge.method
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	S256	pkce.code.challenge.method
69dae4f1-2dde-437a-8172-70f60fd37f6f	S256	pkce.code.challenge.method
\.


--
-- TOC entry 5885 (class 0 OID 31169)
-- Dependencies: 796
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 5886 (class 0 OID 31174)
-- Dependencies: 797
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_default_roles (client_id, role_id) FROM stdin;
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	5589ed98-b3a9-4a48-955a-59efae257c0f
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	47b857f5-4aa2-4863-841c-d447d0369bd9
4f554b64-0b22-4194-8660-fac7fb017194	9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e
4f554b64-0b22-4194-8660-fac7fb017194	e5181123-9fd0-4bfd-86d2-8fb4a751e773
\.


--
-- TOC entry 5887 (class 0 OID 31179)
-- Dependencies: 798
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 5888 (class 0 OID 31184)
-- Dependencies: 799
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 5889 (class 0 OID 31189)
-- Dependencies: 800
-- Data for Name: client_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_scope (id, name, realm_id, description, protocol) FROM stdin;
3b68f597-0ccf-4278-983c-8e4d4f9229a7	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	role_list	master	SAML role list	saml
c667a637-ad1a-40db-ba98-3b9e657b755a	profile	master	OpenID Connect built-in scope: profile	openid-connect
b1aa9a2c-096a-40ce-88dc-19ac51c10462	email	master	OpenID Connect built-in scope: email	openid-connect
51bea84f-305d-49a8-a57e-938fd5fda798	address	master	OpenID Connect built-in scope: address	openid-connect
097258cc-ebf6-415d-811e-283f6c0157a0	phone	master	OpenID Connect built-in scope: phone	openid-connect
ea41b282-e2e5-444c-b5a4-f4c747815d06	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
221d508d-e950-4816-bc5d-49c7c38812a1	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b0ac32f6-4037-498d-9c64-aef1c4607606	offline_access	europeana	OpenID Connect built-in scope: offline_access	openid-connect
9fdab48e-666f-4316-917a-31cfcc582533	role_list	europeana	SAML role list	saml
ad1eb48d-7223-4338-b6dc-2e76343caa71	profile	europeana	OpenID Connect built-in scope: profile	openid-connect
61b36198-9614-48fd-a8c1-eed3dab6dae8	email	europeana	OpenID Connect built-in scope: email	openid-connect
f02967dd-9ffa-4125-b0b2-08498eb48dd9	address	europeana	OpenID Connect built-in scope: address	openid-connect
595ae352-0e3c-4152-a151-f43917b56bdc	phone	europeana	OpenID Connect built-in scope: phone	openid-connect
0e0f4a6d-6c0b-4042-a530-7330c2233ee5	roles	europeana	OpenID Connect scope for add user roles to the access token	openid-connect
300d69eb-57b8-4d87-bf94-d9ab86a12a4c	web-origins	europeana	OpenID Connect scope for add allowed web origins to the access token	openid-connect
a9cea63e-040b-4e2c-b118-2f998bbc918b	client_info	europeana	Add client information to access tokens	openid-connect
9e0a2d0c-7165-4436-a33f-9ca6ffe29964	microprofile-jwt	europeana	Microprofile - JWT built-in scope	openid-connect
62bceb87-7609-4a60-a491-69685dd97790	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
\.


--
-- TOC entry 5890 (class 0 OID 31197)
-- Dependencies: 801
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_scope_attributes (scope_id, value, name) FROM stdin;
3b68f597-0ccf-4278-983c-8e4d4f9229a7	true	display.on.consent.screen
3b68f597-0ccf-4278-983c-8e4d4f9229a7	${offlineAccessScopeConsentText}	consent.screen.text
9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	true	display.on.consent.screen
9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	${samlRoleListScopeConsentText}	consent.screen.text
c667a637-ad1a-40db-ba98-3b9e657b755a	true	display.on.consent.screen
c667a637-ad1a-40db-ba98-3b9e657b755a	${profileScopeConsentText}	consent.screen.text
c667a637-ad1a-40db-ba98-3b9e657b755a	true	include.in.token.scope
b1aa9a2c-096a-40ce-88dc-19ac51c10462	true	display.on.consent.screen
b1aa9a2c-096a-40ce-88dc-19ac51c10462	${emailScopeConsentText}	consent.screen.text
b1aa9a2c-096a-40ce-88dc-19ac51c10462	true	include.in.token.scope
51bea84f-305d-49a8-a57e-938fd5fda798	true	display.on.consent.screen
51bea84f-305d-49a8-a57e-938fd5fda798	${addressScopeConsentText}	consent.screen.text
51bea84f-305d-49a8-a57e-938fd5fda798	true	include.in.token.scope
097258cc-ebf6-415d-811e-283f6c0157a0	true	display.on.consent.screen
097258cc-ebf6-415d-811e-283f6c0157a0	${phoneScopeConsentText}	consent.screen.text
097258cc-ebf6-415d-811e-283f6c0157a0	true	include.in.token.scope
ea41b282-e2e5-444c-b5a4-f4c747815d06	true	display.on.consent.screen
ea41b282-e2e5-444c-b5a4-f4c747815d06	${rolesScopeConsentText}	consent.screen.text
ea41b282-e2e5-444c-b5a4-f4c747815d06	false	include.in.token.scope
221d508d-e950-4816-bc5d-49c7c38812a1	false	display.on.consent.screen
221d508d-e950-4816-bc5d-49c7c38812a1		consent.screen.text
221d508d-e950-4816-bc5d-49c7c38812a1	false	include.in.token.scope
b0ac32f6-4037-498d-9c64-aef1c4607606	true	display.on.consent.screen
b0ac32f6-4037-498d-9c64-aef1c4607606	${offlineAccessScopeConsentText}	consent.screen.text
9fdab48e-666f-4316-917a-31cfcc582533	true	display.on.consent.screen
9fdab48e-666f-4316-917a-31cfcc582533	${samlRoleListScopeConsentText}	consent.screen.text
ad1eb48d-7223-4338-b6dc-2e76343caa71	true	display.on.consent.screen
ad1eb48d-7223-4338-b6dc-2e76343caa71	${profileScopeConsentText}	consent.screen.text
ad1eb48d-7223-4338-b6dc-2e76343caa71	true	include.in.token.scope
61b36198-9614-48fd-a8c1-eed3dab6dae8	true	display.on.consent.screen
61b36198-9614-48fd-a8c1-eed3dab6dae8	${emailScopeConsentText}	consent.screen.text
61b36198-9614-48fd-a8c1-eed3dab6dae8	true	include.in.token.scope
f02967dd-9ffa-4125-b0b2-08498eb48dd9	true	display.on.consent.screen
f02967dd-9ffa-4125-b0b2-08498eb48dd9	${addressScopeConsentText}	consent.screen.text
f02967dd-9ffa-4125-b0b2-08498eb48dd9	true	include.in.token.scope
595ae352-0e3c-4152-a151-f43917b56bdc	true	display.on.consent.screen
595ae352-0e3c-4152-a151-f43917b56bdc	${phoneScopeConsentText}	consent.screen.text
595ae352-0e3c-4152-a151-f43917b56bdc	true	include.in.token.scope
0e0f4a6d-6c0b-4042-a530-7330c2233ee5	true	display.on.consent.screen
0e0f4a6d-6c0b-4042-a530-7330c2233ee5	${rolesScopeConsentText}	consent.screen.text
0e0f4a6d-6c0b-4042-a530-7330c2233ee5	false	include.in.token.scope
300d69eb-57b8-4d87-bf94-d9ab86a12a4c	false	display.on.consent.screen
300d69eb-57b8-4d87-bf94-d9ab86a12a4c		consent.screen.text
300d69eb-57b8-4d87-bf94-d9ab86a12a4c	false	include.in.token.scope
a9cea63e-040b-4e2c-b118-2f998bbc918b	false	display.on.consent.screen
a9cea63e-040b-4e2c-b118-2f998bbc918b	true	include.in.token.scope
9e0a2d0c-7165-4436-a33f-9ca6ffe29964	false	display.on.consent.screen
9e0a2d0c-7165-4436-a33f-9ca6ffe29964	true	include.in.token.scope
62bceb87-7609-4a60-a491-69685dd97790	false	display.on.consent.screen
62bceb87-7609-4a60-a491-69685dd97790	true	include.in.token.scope
\.


--
-- TOC entry 5891 (class 0 OID 31205)
-- Dependencies: 802
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_scope_client (client_id, scope_id, default_scope) FROM stdin;
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
26d34352-17ed-4218-a55a-d1426709111d	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
c63a762d-c165-4427-847d-fb6424264358	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
d68dfd58-f240-4f3c-969b-3ddaba565ad3	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	c667a637-ad1a-40db-ba98-3b9e657b755a	t
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	221d508d-e950-4816-bc5d-49c7c38812a1	t
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	51bea84f-305d-49a8-a57e-938fd5fda798	f
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	097258cc-ebf6-415d-811e-283f6c0157a0	f
26d34352-17ed-4218-a55a-d1426709111d	c667a637-ad1a-40db-ba98-3b9e657b755a	t
26d34352-17ed-4218-a55a-d1426709111d	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
26d34352-17ed-4218-a55a-d1426709111d	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
26d34352-17ed-4218-a55a-d1426709111d	221d508d-e950-4816-bc5d-49c7c38812a1	t
26d34352-17ed-4218-a55a-d1426709111d	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
26d34352-17ed-4218-a55a-d1426709111d	51bea84f-305d-49a8-a57e-938fd5fda798	f
26d34352-17ed-4218-a55a-d1426709111d	097258cc-ebf6-415d-811e-283f6c0157a0	f
c63a762d-c165-4427-847d-fb6424264358	c667a637-ad1a-40db-ba98-3b9e657b755a	t
c63a762d-c165-4427-847d-fb6424264358	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
c63a762d-c165-4427-847d-fb6424264358	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
c63a762d-c165-4427-847d-fb6424264358	221d508d-e950-4816-bc5d-49c7c38812a1	t
c63a762d-c165-4427-847d-fb6424264358	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
c63a762d-c165-4427-847d-fb6424264358	51bea84f-305d-49a8-a57e-938fd5fda798	f
c63a762d-c165-4427-847d-fb6424264358	097258cc-ebf6-415d-811e-283f6c0157a0	f
d68dfd58-f240-4f3c-969b-3ddaba565ad3	c667a637-ad1a-40db-ba98-3b9e657b755a	t
d68dfd58-f240-4f3c-969b-3ddaba565ad3	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
d68dfd58-f240-4f3c-969b-3ddaba565ad3	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
d68dfd58-f240-4f3c-969b-3ddaba565ad3	221d508d-e950-4816-bc5d-49c7c38812a1	t
d68dfd58-f240-4f3c-969b-3ddaba565ad3	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
d68dfd58-f240-4f3c-969b-3ddaba565ad3	51bea84f-305d-49a8-a57e-938fd5fda798	f
d68dfd58-f240-4f3c-969b-3ddaba565ad3	097258cc-ebf6-415d-811e-283f6c0157a0	f
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	c667a637-ad1a-40db-ba98-3b9e657b755a	t
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	221d508d-e950-4816-bc5d-49c7c38812a1	t
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	51bea84f-305d-49a8-a57e-938fd5fda798	f
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	097258cc-ebf6-415d-811e-283f6c0157a0	f
88675175-4471-4df5-ba92-d12ab7544805	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
88675175-4471-4df5-ba92-d12ab7544805	c667a637-ad1a-40db-ba98-3b9e657b755a	t
88675175-4471-4df5-ba92-d12ab7544805	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
88675175-4471-4df5-ba92-d12ab7544805	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
88675175-4471-4df5-ba92-d12ab7544805	221d508d-e950-4816-bc5d-49c7c38812a1	t
88675175-4471-4df5-ba92-d12ab7544805	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
88675175-4471-4df5-ba92-d12ab7544805	51bea84f-305d-49a8-a57e-938fd5fda798	f
88675175-4471-4df5-ba92-d12ab7544805	097258cc-ebf6-415d-811e-283f6c0157a0	f
4f554b64-0b22-4194-8660-fac7fb017194	9fdab48e-666f-4316-917a-31cfcc582533	t
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	9fdab48e-666f-4316-917a-31cfcc582533	t
8742152f-c061-4d63-849d-1a4817ef3322	9fdab48e-666f-4316-917a-31cfcc582533	t
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	9fdab48e-666f-4316-917a-31cfcc582533	t
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	9fdab48e-666f-4316-917a-31cfcc582533	t
4f554b64-0b22-4194-8660-fac7fb017194	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
4f554b64-0b22-4194-8660-fac7fb017194	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
4f554b64-0b22-4194-8660-fac7fb017194	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
4f554b64-0b22-4194-8660-fac7fb017194	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
4f554b64-0b22-4194-8660-fac7fb017194	b0ac32f6-4037-498d-9c64-aef1c4607606	f
4f554b64-0b22-4194-8660-fac7fb017194	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
4f554b64-0b22-4194-8660-fac7fb017194	595ae352-0e3c-4152-a151-f43917b56bdc	f
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	b0ac32f6-4037-498d-9c64-aef1c4607606	f
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	595ae352-0e3c-4152-a151-f43917b56bdc	f
8742152f-c061-4d63-849d-1a4817ef3322	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
8742152f-c061-4d63-849d-1a4817ef3322	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
8742152f-c061-4d63-849d-1a4817ef3322	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
8742152f-c061-4d63-849d-1a4817ef3322	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
8742152f-c061-4d63-849d-1a4817ef3322	b0ac32f6-4037-498d-9c64-aef1c4607606	f
8742152f-c061-4d63-849d-1a4817ef3322	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
8742152f-c061-4d63-849d-1a4817ef3322	595ae352-0e3c-4152-a151-f43917b56bdc	f
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	b0ac32f6-4037-498d-9c64-aef1c4607606	f
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
3c9c1922-1c34-42ea-b7d4-bca618d18b2c	595ae352-0e3c-4152-a151-f43917b56bdc	f
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	b0ac32f6-4037-498d-9c64-aef1c4607606	f
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	595ae352-0e3c-4152-a151-f43917b56bdc	f
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	9fdab48e-666f-4316-917a-31cfcc582533	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	b0ac32f6-4037-498d-9c64-aef1c4607606	f
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	595ae352-0e3c-4152-a151-f43917b56bdc	f
09ab961e-d779-415b-81c8-0582944caa94	9fdab48e-666f-4316-917a-31cfcc582533	t
09ab961e-d779-415b-81c8-0582944caa94	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
09ab961e-d779-415b-81c8-0582944caa94	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
09ab961e-d779-415b-81c8-0582944caa94	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
09ab961e-d779-415b-81c8-0582944caa94	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
09ab961e-d779-415b-81c8-0582944caa94	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
09ab961e-d779-415b-81c8-0582944caa94	b0ac32f6-4037-498d-9c64-aef1c4607606	f
09ab961e-d779-415b-81c8-0582944caa94	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
09ab961e-d779-415b-81c8-0582944caa94	595ae352-0e3c-4152-a151-f43917b56bdc	f
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	9fdab48e-666f-4316-917a-31cfcc582533	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	b0ac32f6-4037-498d-9c64-aef1c4607606	f
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	595ae352-0e3c-4152-a151-f43917b56bdc	f
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	9fdab48e-666f-4316-917a-31cfcc582533	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	b0ac32f6-4037-498d-9c64-aef1c4607606	f
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	595ae352-0e3c-4152-a151-f43917b56bdc	f
4d54e474-c726-4c05-97e4-6c0d7207f65d	9fdab48e-666f-4316-917a-31cfcc582533	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
4d54e474-c726-4c05-97e4-6c0d7207f65d	b0ac32f6-4037-498d-9c64-aef1c4607606	f
4d54e474-c726-4c05-97e4-6c0d7207f65d	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
4d54e474-c726-4c05-97e4-6c0d7207f65d	595ae352-0e3c-4152-a151-f43917b56bdc	f
7d552182-500c-4122-9c36-769393ca1459	9fdab48e-666f-4316-917a-31cfcc582533	t
7d552182-500c-4122-9c36-769393ca1459	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
7d552182-500c-4122-9c36-769393ca1459	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
7d552182-500c-4122-9c36-769393ca1459	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
7d552182-500c-4122-9c36-769393ca1459	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
7d552182-500c-4122-9c36-769393ca1459	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
7d552182-500c-4122-9c36-769393ca1459	b0ac32f6-4037-498d-9c64-aef1c4607606	f
7d552182-500c-4122-9c36-769393ca1459	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
7d552182-500c-4122-9c36-769393ca1459	595ae352-0e3c-4152-a151-f43917b56bdc	f
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
4f554b64-0b22-4194-8660-fac7fb017194	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
f5583b45-7a5c-4b80-8e6f-780ec8cd4669	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
09ab961e-d779-415b-81c8-0582944caa94	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
8742152f-c061-4d63-849d-1a4817ef3322	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
4d54e474-c726-4c05-97e4-6c0d7207f65d	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
7d552182-500c-4122-9c36-769393ca1459	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	62bceb87-7609-4a60-a491-69685dd97790	f
26d34352-17ed-4218-a55a-d1426709111d	62bceb87-7609-4a60-a491-69685dd97790	f
c63a762d-c165-4427-847d-fb6424264358	62bceb87-7609-4a60-a491-69685dd97790	f
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	62bceb87-7609-4a60-a491-69685dd97790	f
438c39cb-cb57-4543-acca-966e0d9d0eea	9fdab48e-666f-4316-917a-31cfcc582533	t
438c39cb-cb57-4543-acca-966e0d9d0eea	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
438c39cb-cb57-4543-acca-966e0d9d0eea	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
438c39cb-cb57-4543-acca-966e0d9d0eea	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
438c39cb-cb57-4543-acca-966e0d9d0eea	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
438c39cb-cb57-4543-acca-966e0d9d0eea	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
438c39cb-cb57-4543-acca-966e0d9d0eea	b0ac32f6-4037-498d-9c64-aef1c4607606	f
438c39cb-cb57-4543-acca-966e0d9d0eea	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
438c39cb-cb57-4543-acca-966e0d9d0eea	595ae352-0e3c-4152-a151-f43917b56bdc	f
438c39cb-cb57-4543-acca-966e0d9d0eea	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
69dae4f1-2dde-437a-8172-70f60fd37f6f	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
69dae4f1-2dde-437a-8172-70f60fd37f6f	c667a637-ad1a-40db-ba98-3b9e657b755a	t
69dae4f1-2dde-437a-8172-70f60fd37f6f	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
69dae4f1-2dde-437a-8172-70f60fd37f6f	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
69dae4f1-2dde-437a-8172-70f60fd37f6f	221d508d-e950-4816-bc5d-49c7c38812a1	t
69dae4f1-2dde-437a-8172-70f60fd37f6f	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
69dae4f1-2dde-437a-8172-70f60fd37f6f	51bea84f-305d-49a8-a57e-938fd5fda798	f
69dae4f1-2dde-437a-8172-70f60fd37f6f	097258cc-ebf6-415d-811e-283f6c0157a0	f
69dae4f1-2dde-437a-8172-70f60fd37f6f	62bceb87-7609-4a60-a491-69685dd97790	f
\.


--
-- TOC entry 5892 (class 0 OID 31210)
-- Dependencies: 803
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_scope_role_mapping (scope_id, role_id) FROM stdin;
3b68f597-0ccf-4278-983c-8e4d4f9229a7	71efe347-ce76-4771-84f4-368e018015b7
b0ac32f6-4037-498d-9c64-aef1c4607606	5751631d-ba5f-47fb-8f3e-f63c4d7cc591
\.


--
-- TOC entry 5893 (class 0 OID 31215)
-- Dependencies: 804
-- Data for Name: client_session; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- TOC entry 5894 (class 0 OID 31223)
-- Dependencies: 805
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- TOC entry 5895 (class 0 OID 31228)
-- Dependencies: 806
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 5896 (class 0 OID 31236)
-- Dependencies: 807
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- TOC entry 5897 (class 0 OID 31241)
-- Dependencies: 808
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_session_role (role_id, client_session) FROM stdin;
\.


--
-- TOC entry 5898 (class 0 OID 31246)
-- Dependencies: 809
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 5899 (class 0 OID 31254)
-- Dependencies: 810
-- Data for Name: component; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
26a46efb-fb33-4a27-895c-0c06ebab067d	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
b27bc5a3-b37a-4766-b97e-d03c6805bb18	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
7c4fcc18-54d5-45a3-8543-760d8c7fdbc4	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5500ff0d-b3ba-4928-9cb8-3e0c6c813b47	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
b3b42a71-73cb-4e94-ac22-4bc27915440f	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
5b425109-f8f6-489f-b241-04070011e453	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
20a18013-eb38-4360-8ecc-be563f6743ce	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
4bd41d44-daf3-4a46-8d92-170e4d1e4765	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
ba767103-509e-45ef-bd19-e4ad8ae71246	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
012ce66a-b8df-40db-887d-99e25a1f73ba	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
640b04eb-34a2-4d74-8018-ac6143c01086	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
684c9f3a-e6aa-4c67-9ebf-bcc4bc2f84ce	rsa-generated	europeana	rsa-generated	org.keycloak.keys.KeyProvider	europeana	\N
04bd5679-a350-4671-89d7-6f123224f110	hmac-generated	europeana	hmac-generated	org.keycloak.keys.KeyProvider	europeana	\N
8bd3592f-a220-40c7-ac73-4c69e3342dea	aes-generated	europeana	aes-generated	org.keycloak.keys.KeyProvider	europeana	\N
a402d59f-79f3-4449-9058-970c5847d8b4	Trusted Hosts	europeana	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
e01eed5f-36a5-43b3-b577-cbe57c6537a7	Consent Required	europeana	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
79f3145e-cf4d-4a0d-8c2a-2d2e10fa90d1	Full Scope Disabled	europeana	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
e003b17b-1663-435b-868d-5d5e1a2ec63f	Max Clients Limit	europeana	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	Allowed Protocol Mapper Types	europeana	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
c4d31bab-b140-47af-8cd1-17d8275a2c78	Allowed Client Scopes	europeana	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	anonymous
1de4560f-b91b-4526-bfc4-8449075e562f	Allowed Protocol Mapper Types	europeana	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	authenticated
993f2bbc-cba6-43f7-a8fe-644755d7de9c	Allowed Client Scopes	europeana	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	europeana	authenticated
\.


--
-- TOC entry 5900 (class 0 OID 31262)
-- Dependencies: 811
-- Data for Name: component_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".component_config (id, component_id, name, value) FROM stdin;
9e625c61-db11-4978-b7cb-6af825f28ccc	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	oidc-full-name-mapper
2dc9d38a-bdc4-4139-a811-7dbdeea34a3c	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	saml-user-attribute-mapper
61b0f97c-2942-4d10-ab4b-50a6ae803e3a	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	oidc-address-mapper
9b859e69-ab36-4720-b72d-b2937c4bc98b	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	saml-user-property-mapper
02cdb0a5-d57a-40ae-b041-b5b4d05aeac3	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
8082898d-7ffe-444e-94db-56ba77cd9041	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f4e10f9c-03fc-48d8-bfcf-1fc5cb7be000	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	saml-role-list-mapper
956e6c06-fe5d-402c-ab14-0a3982d0cbcd	b3b42a71-73cb-4e94-ac22-4bc27915440f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ff7b8de6-69c2-4d59-ae31-2899ac35584a	5500ff0d-b3ba-4928-9cb8-3e0c6c813b47	max-clients	200
52fb947e-8f72-4d13-9192-33aa749acf8b	5b425109-f8f6-489f-b241-04070011e453	allow-default-scopes	true
f6003294-be3e-43a3-918a-1f6261347521	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b6a472c4-7529-449f-9b6d-7330cdbbc167	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	saml-user-attribute-mapper
fdc64c1a-c717-4126-a770-6c926c6ebfb4	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	oidc-full-name-mapper
e03ebf69-6652-4c5f-bd75-9e1bf48bcaf9	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	saml-user-property-mapper
d67531f9-5681-4fbc-bc68-9cb3706d78f6	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	saml-role-list-mapper
bb4d2016-8018-4a14-9f83-60af252a6dfc	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
878495ee-ebf2-496f-8570-432808940df6	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	oidc-address-mapper
0db7488f-1f3d-472c-ae7e-e357820ac5f3	20a18013-eb38-4360-8ecc-be563f6743ce	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
bdda74c2-aa81-4a07-ad28-121b4ca6990c	26a46efb-fb33-4a27-895c-0c06ebab067d	host-sending-registration-request-must-match	true
f1788b69-b050-40d8-95b3-965fef8d29b5	26a46efb-fb33-4a27-895c-0c06ebab067d	client-uris-must-match	true
1266aae4-8a46-4993-abd5-94fdd417db54	4bd41d44-daf3-4a46-8d92-170e4d1e4765	allow-default-scopes	true
78e4ab66-1a93-42a1-9873-34d8c1088b6f	ba767103-509e-45ef-bd19-e4ad8ae71246	privateKey	MIIEowIBAAKCAQEAku88Dj6aaOuvNIPcx4kE0fDtwFoV/wLpgWn2mn+zlZefPWOwhWLoWKGj4zYFsAzRj0KLNFuv+fNshDbNhv49qDszhp+IMxdKa/9eSEuL6XMMyK7bW9TaYdU2lTWxdwq3NG2p9sRjanNpj/jAmWFHQ0+BqQxplDQozcxGFdtkDtvWJg/yS2RYe7MlVlDqrwzYicHTq0Dy6JNmwA3itzHeee0z9sAdRVQXROAZdH6RaYrlQNyN7PD0LdtdcNyG3nSi+Bmqg4WHE/ImlOLOCF93zWoq6Dw1enJMLvnblIuQS3ugC2GNMDHbEPsOresuGkT4tVAGFpHvHb5jl0xvThqLpwIDAQABAoIBAHvKTkB6AcEPf0axKVp6V7NAVi3ON+Xm4C+FxJuZpwUK/r/LszZNhA7X76lHJDeUNSGLIJh1/qaIrQ4e1b07iVqotdpfoXHZ13txZE9oRnHh2g1hM7IEfBAcf6Xp3J+8SWlEUwNxpYhTv8Xp/um6CT3uSADSUkjoQNBRn2JeucfBqpzYC1yDw/5YYGNgDhZqRHBF3PxUUZ6e2Q9r5vkWHXHT/bxbuzmz+NvK7eJ3ycoqgT3xhnDpla4B0i1rDjau8iMIkaicx25VQPhnxDOKDCHWXv++XJlRN7GJZhUdMQMY9TNRmrkdhkIsBTVJKvRCKlK7trj8nHVAewSEGhemWHECgYEA0oyy50BRMCE2RUQz49zU2k3cBop7THimRVgHXD2aEd4i69L7Vlah3zcq0wcpa4diPVTGT2J5WBaH1i36R9pqsYupHgrIfCn+Nb9scDW1SMX1SFrIhs6S0ZcQ85rN0RxzjKnmn2goIcAbdhMnY6ENqPpYmeGV4OodiOKHHEw9TmsCgYEAsqcQ36lZwo3IzJ38RIDIEFw2c7w8wL/pwbBn+TlRElBk2KrQYSnq1l0MiR8R5h9XPK2CUcfFXtXjkw9gMaLTEiOM7iEnICv22w/4vgF7qZwN4sGKlcZbh02eXxgh2S8T+xpOXNAmlZtheg2eWsrB+jOBlXM4Bs/MzqDIQs74zrUCgYA0L9OYJgT5nQHKoWELNY08ntfOdzygc7cisPMCFfK+QwT81sqdV9O/c/kVXU0S7feXpA+TVaEmCE+a8sJ6VNTlNOyyGZIf1HjB8bR7C5TneMmXKYlSgJk7geodt10UW6z4TJRxJmvsEaW82nqE40Jzg7m6SoPPv7eaWiuLBAqeCQKBgQCvlfvDl5Kc4PVmBjCWs2vuiHMMNQoQ944ry9Gk5WyE73bubJP5q1Uf8rwLWPoijtMS1AWtkwatOtM9CnOk1T9WKJKuyO7Hc+5fR8dWF+cOwE31e/tVUWtMBEGPfQxnhRnCRgyWtA34JIsdhp0I5xbXbiACXwfFyh6lRukMoJdxsQKBgHDGuRMPmm+Rtq9qB8yNnKI/5oCCtu6i9aMpg1W3zg3jBroFZoBo2zVo6xtYnxyst1AbIDlKjhGhbY8i5GtVxpeDjAsW5uX0sNaqgJcc3C+Ez4lMqanx/3s3uALkDjx7XfaMXzgIMSphKzpsPbODXwj+Q4HOes2+MeFUzPT0KT5F
bb25c969-765f-4bca-9c39-aae4f5754365	ba767103-509e-45ef-bd19-e4ad8ae71246	priority	100
66d8e525-8531-4a65-a235-aadfa0fbf664	ba767103-509e-45ef-bd19-e4ad8ae71246	certificate	MIICmzCCAYMCBgFwL1U2xzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwMjEwMTMzOTM4WhcNMzAwMjEwMTM0MTE4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCS7zwOPppo6680g9zHiQTR8O3AWhX/AumBafaaf7OVl589Y7CFYuhYoaPjNgWwDNGPQos0W6/582yENs2G/j2oOzOGn4gzF0pr/15IS4vpcwzIrttb1Nph1TaVNbF3Crc0ban2xGNqc2mP+MCZYUdDT4GpDGmUNCjNzEYV22QO29YmD/JLZFh7syVWUOqvDNiJwdOrQPLok2bADeK3Md557TP2wB1FVBdE4Bl0fpFpiuVA3I3s8PQt211w3IbedKL4GaqDhYcT8iaU4s4IX3fNairoPDV6ckwu+duUi5BLe6ALYY0wMdsQ+w6t6y4aRPi1UAYWke8dvmOXTG9OGounAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIIPAzMnfyHvS1pmg12c4+tUyWI2pClbjR3Yce+jmRf1ZcDLyzVgqWCLtHr2Em2P+B/1u8jN7NZ+eFf/LqjmadJO+xjQOM3yj3Yg+FIyUfMig/a0AZ8qYfUDZenkiAylR2SJzZZW2xYoNoZROti1kco1OoKBYdh9joQENbNODlT59EkgmoJbhedvcMMiQ5m5SsgyejRoE+OdxZNKfc/JNE1IK+rSXYujJUrgjtTDGIxOj8JsTI6Z5eUEsFLqqo/3xqo5H+DZ93+0sCuHCR0BKLVNfewlgBATYJeeLH45JMQmEP/UKEI0jIO9rEZQjbqBhgK2LNgDRAH2Pjf6I+HnScE=
ea7f7729-6755-46f5-8544-9c98615d231a	640b04eb-34a2-4d74-8018-ac6143c01086	kid	9c6ccc90-524e-431b-9047-0e9027b6ac77
b4327b4f-a0a5-4ad0-9ff5-beef74799b38	640b04eb-34a2-4d74-8018-ac6143c01086	secret	10THJIGRR2bE_aUhruSx_Q
d67299fe-b798-4cc2-869c-43e943f0e2fb	640b04eb-34a2-4d74-8018-ac6143c01086	priority	100
1e3d7a32-de35-4eae-b71c-dd18ef2dd096	012ce66a-b8df-40db-887d-99e25a1f73ba	secret	H2kcSKDR5ZSMiLtqki2S3WAImd667n_YHFShG3CvOyegn9h6WNbM2hWfJQ93hvAqG-6NTPxYVERxrmxsHRY5DA
c57bc2fa-2c44-42d4-a0c6-794ec177ccc4	012ce66a-b8df-40db-887d-99e25a1f73ba	priority	100
921b4f55-0211-41ae-8b18-d8f41048613f	012ce66a-b8df-40db-887d-99e25a1f73ba	algorithm	HS256
8d1bf5d3-cd12-4a37-b3dd-b62aa1dac882	012ce66a-b8df-40db-887d-99e25a1f73ba	kid	93a77e2a-b8f7-451e-a651-7de8b745f614
f3b2a92e-6a77-4bbf-bf66-c32ba9accdfe	684c9f3a-e6aa-4c67-9ebf-bcc4bc2f84ce	privateKey	MIIEowIBAAKCAQEAgq2lkW7yOWM1mEIyE3zvJxHoRX6S9U8GJp3leNent2E7CXffk45clrpA2ElzH7OAWEoKEth+ORlHAeyAls4eqTyjimXv4HRVTxxL9PCrQDqsd9oVKXnQPbLYxaMRN9xLF2THBYVNJv7Bz1DT3CL+DAq9f5W9N0X+Nsik2+IE8IUDLWyfY2COQrpfS3gTTzHyt7BFDUbzvOuLs6jRuA2rFyYv1i8dN6vdX7WiamrLyTBLOLNGWwCCuV4qLdhbKMUl7S3jOkPg7WHy+lfkWmWAdeSP9wPTDnSJXpCIb+dbYUW6mhlbLNfQLksjxDAqLCE8MgMD6n/CJgVvf26GhlRxWQIDAQABAoIBACFZWViNHMnidKn/srHgf1PUMReTHsP1v9cZEpfNSWL2ME/RRMBuY1if/a50yCl98LIXawy2LTg7KDDof0R9I7wC2qWWMCpy5daDnSrMRJfmoV8Qy7fC+47TVpjRbbJ4yL0Wnefdxfu+pg1XTknusDC4iPXHa/twJFksyU3IF4Sdvs9w3ixKyjLI5MVtIBWPTDszV4LrKHjCfKV0m3LAGUoBYf5P0f90P7tzV3483vFtiiqJcBlFzFyMd5Fx/JxfXnqCsHvwU9ZNIpUC1n2q2HbmpXobLKIOOHu5loz8qRKO8VKvAhd6p1gnTYiKqOWNt2m0HNcH4BepkKcO/JeJrHUCgYEA1oYoGgZqjD1jjB15xsoovu5DhyYCyaO2W78aPgwiqma7EsbJuQs5PwjmhasRl5nO35Nxiwd4aC7P7UUnhuM8BYtEXBw71huagP2V6tZjt/sFQaHZ+aH0JXGdbkFTybEWCN+NKjQ+IaEoJyRX3AkbApPfrO7ICl4E2sxY924yYcsCgYEAm/GN/2oElmCUUVCmEJmOVz6CmpJ5RZMjr5TH3so/N9JAKegrJUZ67VMqO3lQ48KykOpfEH7ldpLO86Nvm45Jk5SawtFs9gIl139QqzctyX57n+9doov5SZ1a5/+otNQUY6/b0ZrGm+Fjfi4tLDL+rfSYlCVDforT5YXzehX4hOsCgYEAiv+iPDqsDvI37jGrFgMnI49+cbNPWxeYsRnCBzIVxBOMYz4qtptvHEjIFRQi8ffW80a16z+L5PVwBG0qj1vtKCp0wLoKi1CXa7zjxqXjNvKPFVepxPYLG7fiKe5qO+ViQZ2X+iCfoWqqebIyu3+q4KCv7X1KYG1K9/owKyJbwsECgYBVoLPJ9dsC/5ExfUlSgB7qxQZN/fPdQkgsF1QQf5lq+2YEHNnkI+lH+4yLD7hc+AG5FRiSJDu3ejFtEucr0VuRT94S75AXHWLOC7it6ySXKX6UeYk+wgFmbKMIFRf8AyAXBO99DrHT0lUhahWf2XiC6HYHktaW24Ay3fStqvbFdQKBgHV/IySkcwTclDMrO/ltHqkT2nA2PPI5UVpyi1lVblojg3SpoE5I+t5nKiaN5A/YrzAY9rCXz9Pchwhib4Re0XWJTSCWU94YYY1DqSlsZoxMhb70knQsPggoJ/eSPaDPK5MWdmlJU7WNFOAxPeoA8WB9CGo9pRT3vVhma9vFUkQZ
d6fbfdf8-23d7-4842-b76d-8f89523fabaa	684c9f3a-e6aa-4c67-9ebf-bcc4bc2f84ce	priority	100
07d95604-b18e-4481-8284-29ec21dabb87	684c9f3a-e6aa-4c67-9ebf-bcc4bc2f84ce	certificate	MIICoTCCAYkCBgFwNGA0gzANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlldXJvcGVhbmEwHhcNMjAwMjExMTMwOTQ1WhcNMzAwMjExMTMxMTI1WjAUMRIwEAYDVQQDDAlldXJvcGVhbmEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCCraWRbvI5YzWYQjITfO8nEehFfpL1TwYmneV416e3YTsJd9+TjlyWukDYSXMfs4BYSgoS2H45GUcB7ICWzh6pPKOKZe/gdFVPHEv08KtAOqx32hUpedA9stjFoxE33EsXZMcFhU0m/sHPUNPcIv4MCr1/lb03Rf42yKTb4gTwhQMtbJ9jYI5Cul9LeBNPMfK3sEUNRvO864uzqNG4DasXJi/WLx03q91ftaJqasvJMEs4s0ZbAIK5Xiot2FsoxSXtLeM6Q+DtYfL6V+RaZYB15I/3A9MOdIlekIhv51thRbqaGVss19AuSyPEMCosITwyAwPqf8ImBW9/boaGVHFZAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHF5H+b1+vpXlQT3c5ccOmzXaE9WISJ5PHLfn/Z79zz9rEdQO8d/l7Rw26w58E3LcgNtrIrCSiPgKBMyPd6L37bkzRFa5qcPC8+DnXk8wN7wNwGhH3hEixXRvZU/7A1ihwTrrIQWr3V2cSqPbqZZxXCpRi4YZaY8rH+4fHT8yPaeg/UJTLkE82M4BNbWgbPfScAyzi4XgUMFt7IEo38vwOM/4chsY2Yagwmc1aHrHEaGecfGNdcQqU6SZLFxncRH9zUtsfL3FxsDNw0YFE0qj+K7GF511DhNSbL/1o//d9qxAZ8r6y7yg/Xm9LQQ5bsgA+i/jQ3XTb0ttsCCE7NnJok=
bf0d0098-8ed0-4ac0-9cca-c7a5662e7c7f	8bd3592f-a220-40c7-ac73-4c69e3342dea	kid	f77f2bc0-d750-4b78-9550-2163947fa243
80f4eb4d-2706-48e1-b3e9-8764f5c9580b	8bd3592f-a220-40c7-ac73-4c69e3342dea	priority	100
2a80d78b-8f53-455a-923d-76edba55d549	8bd3592f-a220-40c7-ac73-4c69e3342dea	secret	p08jLv8uH5AnwdNOVyVekg
29826abe-c405-46e2-b285-f8c365becce0	04bd5679-a350-4671-89d7-6f123224f110	algorithm	HS256
0d87bd42-ae63-4bf8-aeab-3cd9d60cf607	04bd5679-a350-4671-89d7-6f123224f110	priority	100
66595b75-9057-4998-8635-4254b6040307	04bd5679-a350-4671-89d7-6f123224f110	kid	b1414d1e-e744-4b8d-b6c1-defd4aed4ca1
cedda161-dfaf-4c98-8019-bb62fb7b13a8	04bd5679-a350-4671-89d7-6f123224f110	secret	7H6NeJXwv3vb37FroXvPE5T5PoBXSLd3KXxRO-jzpDP5uI4Vw8jgc4Yc5apxmnpaznhFK9BA-nAuDFXxY2wI3w
d4566413-b154-4b64-883f-8d50f9cc9c02	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	oidc-address-mapper
e9b4728b-37af-4416-a7b7-a3f347cb4b96	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	saml-user-attribute-mapper
e94cf910-f262-4331-94a1-d5c5ea6ad47a	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c97f798e-09ee-470c-befc-2e3890eee2cf	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d9bfd604-6c85-4b89-80a6-8d0c403ee7a1	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	oidc-full-name-mapper
72a43a64-9841-4e47-944a-f5c7a3db4561	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	saml-role-list-mapper
105f1fdd-4c87-4c28-a9dc-07400b1d3bfb	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
96d602d0-dc86-4cda-a8d5-2c512e381221	1c9ab61c-8f05-45fb-8a86-bb8f49c917bd	allowed-protocol-mapper-types	saml-user-property-mapper
0d68104a-657a-482f-b94f-ecb6a0a64f8e	a402d59f-79f3-4449-9058-970c5847d8b4	client-uris-must-match	true
e893cbc1-3380-4c79-a6dc-b365b65c86b5	a402d59f-79f3-4449-9058-970c5847d8b4	host-sending-registration-request-must-match	true
e0c7e5df-034d-46d9-8e32-7ce8b50adc47	e003b17b-1663-435b-868d-5d5e1a2ec63f	max-clients	200
3464a3ed-4803-48c0-96fc-0ecb568a8db4	993f2bbc-cba6-43f7-a8fe-644755d7de9c	allow-default-scopes	true
0b14d87d-0c5e-4013-b4de-6bc6b20708bf	c4d31bab-b140-47af-8cd1-17d8275a2c78	allow-default-scopes	true
afeac8ff-a7c9-4078-9681-3a0b0e9f4359	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	saml-user-attribute-mapper
55753207-550e-4fdc-9653-554b3b919c96	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	oidc-address-mapper
daed6d16-516f-46a3-8cbb-7105e6711598	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
327f6d83-39cd-44b0-afc8-3080d2d79230	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	saml-role-list-mapper
690c1293-8d2c-4256-984e-02c8e9b98ea5	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	oidc-full-name-mapper
5fdc602b-a00a-4db3-a931-786315ffd81f	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
aced7523-39d1-4400-8619-bfcb10431437	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	saml-user-property-mapper
fd94da9f-74d6-4342-b7ef-b390d5e537fd	1de4560f-b91b-4526-bfc4-8449075e562f	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
\.


--
-- TOC entry 5901 (class 0 OID 31270)
-- Dependencies: 812
-- Data for Name: composite_role; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".composite_role (composite, child_role) FROM stdin;
878db7e7-4a62-46dd-94fc-ad9a427aebd0	efcfe862-d249-469d-b130-00451e4f7554
878db7e7-4a62-46dd-94fc-ad9a427aebd0	cfcc42df-0b2b-4492-96c5-f4432e8e0189
878db7e7-4a62-46dd-94fc-ad9a427aebd0	c5fcaa95-0045-42c5-a03b-eb1d120400b5
878db7e7-4a62-46dd-94fc-ad9a427aebd0	83fe1c9b-c0be-4616-93c1-5b3353724ef4
878db7e7-4a62-46dd-94fc-ad9a427aebd0	4d2ea5b1-4a6d-4f21-912b-20ccba243c11
878db7e7-4a62-46dd-94fc-ad9a427aebd0	61cefce2-fa84-4c3a-9a3e-5a682d4ef870
878db7e7-4a62-46dd-94fc-ad9a427aebd0	115e6e80-3683-427e-8d62-8de08a49c58c
878db7e7-4a62-46dd-94fc-ad9a427aebd0	181220a0-0d26-45ad-9de9-709ee285d05e
878db7e7-4a62-46dd-94fc-ad9a427aebd0	e81d4c0d-234b-4b6c-bd6f-b5d755aca479
878db7e7-4a62-46dd-94fc-ad9a427aebd0	9f22c9a7-0fc8-4dae-8d1f-b7ac15ab813a
878db7e7-4a62-46dd-94fc-ad9a427aebd0	dd91ea93-bbb3-4f6f-9c6a-073225db8824
878db7e7-4a62-46dd-94fc-ad9a427aebd0	2e6adbe0-e996-4f6f-a2d0-eac123bcf013
878db7e7-4a62-46dd-94fc-ad9a427aebd0	6d1b52df-602f-466f-8361-0318a2f9228d
878db7e7-4a62-46dd-94fc-ad9a427aebd0	2260d29f-2f94-4b40-8a94-24674a474557
878db7e7-4a62-46dd-94fc-ad9a427aebd0	21715a6e-4837-4946-99f3-4e9a86d2b7fe
878db7e7-4a62-46dd-94fc-ad9a427aebd0	6fb739a0-0cb7-4c06-875a-d0bc8cdf5dfe
878db7e7-4a62-46dd-94fc-ad9a427aebd0	4d50615e-d7f8-401f-bb8c-3e43c737ab23
878db7e7-4a62-46dd-94fc-ad9a427aebd0	7e56f7be-a883-4d87-96e0-b4e33870f378
83fe1c9b-c0be-4616-93c1-5b3353724ef4	21715a6e-4837-4946-99f3-4e9a86d2b7fe
83fe1c9b-c0be-4616-93c1-5b3353724ef4	7e56f7be-a883-4d87-96e0-b4e33870f378
4d2ea5b1-4a6d-4f21-912b-20ccba243c11	6fb739a0-0cb7-4c06-875a-d0bc8cdf5dfe
47b857f5-4aa2-4863-841c-d447d0369bd9	cc3185d6-e425-409a-afe4-b5252a71b9cc
878db7e7-4a62-46dd-94fc-ad9a427aebd0	b6028665-f766-40d3-9146-88e5ae058e6a
878db7e7-4a62-46dd-94fc-ad9a427aebd0	cf819d65-8f40-4adf-9692-6a25778fb9af
878db7e7-4a62-46dd-94fc-ad9a427aebd0	4a9cc3b6-c6e7-4f79-a2c3-6d624daf23ab
878db7e7-4a62-46dd-94fc-ad9a427aebd0	139a1b1a-73c0-43d4-824c-0b92fcdd449b
878db7e7-4a62-46dd-94fc-ad9a427aebd0	bada2387-ce61-4961-b131-1d1939775bb4
878db7e7-4a62-46dd-94fc-ad9a427aebd0	94453169-c550-426d-9782-c71748e56c33
878db7e7-4a62-46dd-94fc-ad9a427aebd0	32b5fceb-62d2-40f7-a140-b92e7e1af97e
878db7e7-4a62-46dd-94fc-ad9a427aebd0	673d1b4c-9ff6-460d-8592-73d6c29f81c6
878db7e7-4a62-46dd-94fc-ad9a427aebd0	9000884d-d1e7-4ce5-b5e0-277be51196d1
878db7e7-4a62-46dd-94fc-ad9a427aebd0	45475d5a-5434-40db-beec-3b4dbb425a59
878db7e7-4a62-46dd-94fc-ad9a427aebd0	12dab4de-0012-461b-b379-38c121d0d41e
878db7e7-4a62-46dd-94fc-ad9a427aebd0	54ab2b38-1744-4dd5-841c-b99ef59ab4f1
878db7e7-4a62-46dd-94fc-ad9a427aebd0	a15298f1-adb0-477c-ba3e-780481daf680
878db7e7-4a62-46dd-94fc-ad9a427aebd0	55cb480e-6769-4889-93da-19901ef6bbf9
878db7e7-4a62-46dd-94fc-ad9a427aebd0	c2132831-09b4-4eff-a8cb-395a1fd827c9
878db7e7-4a62-46dd-94fc-ad9a427aebd0	5dc400cc-98a2-4efc-929d-e8883cb241bc
878db7e7-4a62-46dd-94fc-ad9a427aebd0	c4a8b99e-7cef-45de-aa2e-740dba03d7d5
878db7e7-4a62-46dd-94fc-ad9a427aebd0	13421d8c-aeee-4491-837b-97e44bda3b99
139a1b1a-73c0-43d4-824c-0b92fcdd449b	c2132831-09b4-4eff-a8cb-395a1fd827c9
139a1b1a-73c0-43d4-824c-0b92fcdd449b	13421d8c-aeee-4491-837b-97e44bda3b99
bada2387-ce61-4961-b131-1d1939775bb4	5dc400cc-98a2-4efc-929d-e8883cb241bc
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	88087270-5921-47c4-82d7-a0f2f199b475
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	34ff2547-00ef-4ec0-bbd6-7526e84e8378
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	7f5326f9-0ab1-4b98-bc7c-7b52ac80c61a
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	1ef0486d-89f1-4afe-be10-d8fa01ec3596
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	acb40053-88cb-4540-b94f-1a3360c9c867
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	3f075373-cf37-4540-894c-6c73e42f9de9
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	05925353-ed4e-4be6-9665-2d72e928522a
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	aeccb1e2-a629-4a70-a8f8-5953bc867ddf
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	3328a6b4-adeb-44b2-9820-a1f225d2f21a
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	2a905708-fc40-4c3b-9a3b-4d857ea266b6
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	f842c00d-bc55-4307-a381-7cd38fc0653b
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	2e611d45-fe5e-443c-8d13-ce3090e912d7
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	4c5145b6-79dc-4ab2-8be0-7de22ea5a8fb
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	0e724b43-4b5d-494c-9ea2-6fb0702e43d9
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	de3f39cc-e2de-41d4-94eb-ef092249b2d5
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	9deea3ea-4200-4ee9-9338-f059dc64d276
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	d523c22a-19f7-4cae-8157-7e4eaf8cf825
7f5326f9-0ab1-4b98-bc7c-7b52ac80c61a	d523c22a-19f7-4cae-8157-7e4eaf8cf825
7f5326f9-0ab1-4b98-bc7c-7b52ac80c61a	0e724b43-4b5d-494c-9ea2-6fb0702e43d9
1ef0486d-89f1-4afe-be10-d8fa01ec3596	de3f39cc-e2de-41d4-94eb-ef092249b2d5
878db7e7-4a62-46dd-94fc-ad9a427aebd0	517e4aca-b4be-422f-9fe8-f7301fd1993c
e5181123-9fd0-4bfd-86d2-8fb4a751e773	725dab9e-af61-4b04-8a4e-e37d745b3efd
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	98911148-a8c9-4ae1-b72f-da5e86058c21
3ac58cce-26c3-4e4f-8566-aa4671e0af28	9376b9db-d532-4ddf-8a7b-852bb94386c0
bd97efd3-5477-4f96-a8c3-fa964f824222	58a23a7a-0657-4275-a326-a0c460395d98
\.


--
-- TOC entry 5902 (class 0 OID 31275)
-- Dependencies: 813
-- Data for Name: credential; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
a64524dd-3cf5-405c-b632-bd297c1fd0f5	\\x243261243133243130393933546e7238674275632e715754657753392e	password	b9cabf84-a4a3-4d14-9847-da6ff58e40d7	1583752627844	\N	{"value":"$2a$13$10993Tnr8gBuc.qWTewS9.3WVX2XNd8AZMzdW2G61CGQaNH9/C6.m","salt":"__SALT__"}	{"hashIterations":-1,"algorithm":"BCrypt"}	10
2f5dc6f6-47ea-439b-923d-0313dc245863	\\x243261243133243842704259304762537675782e6f693062784f51554f	password	6079dc7c-19ab-4072-816d-e04ea89e7e30	1591093389371	\N	{"value":"$2a$13$8BpBY0GbSvux.oi0bxOQUOvfJdsE1tqp0tHWhkO1IPbBab2EDrci6","salt":"__SALT__"}	{"hashIterations":-1,"algorithm":"BCrypt"}	10
a959053f-dcd3-465b-adaf-f1b73f29813d	\\x2432612431332442665150694f774865444f796e4474345a646d65352e	password	945cf3ff-9e5b-4451-b52e-c989a7c229bf	1591097676506	\N	{"value":"$2a$13$BfQPiOwHeDOynDt4Zdme5.usQF624sCuD46LNV87fFhR0ShOq.r8a","salt":"__SALT__"}	{"hashIterations":-1,"algorithm":"BCrypt"}	10
1d3b95d9-054e-4b05-9836-3fc9ee551bcb	\\x2432612431332438466e31344e3069627a54306a47617156396a447375	password	49c77fb4-5254-4d76-9f1b-b04bb2fa8953	1591109690073	\N	{"value":"$2a$13$8Fn14N0ibzT0jGaqV9jDsuN5gEhB7A214KysRvoi3Ff6pUqsuj0HC","salt":"__SALT__"}	{"hashIterations":-1,"algorithm":"BCrypt"}	10
2b032a70-8de9-4763-bea2-7f5c57a8755f	\N	password	1ee40e06-daa6-4382-9080-531bf7611241	1581344562451	\N	{"value":"Mcx6FOhCJpaSp/5UKPqO4ERkK6KV/8mlKR08iC0MIUpRJba8IBUXFX08lQ0zI1VsACsfH7R0hxsA99DqUTF3gQ==","salt":"HPEMCkyE/YuDhIfggaNHiA=="}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}	10
\.


--
-- TOC entry 5903 (class 0 OID 31283)
-- Dependencies: 814
-- Data for Name: credential_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- TOC entry 5904 (class 0 OID 31291)
-- Dependencies: 815
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2020-02-10 13:40:52.882863	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	1342052303
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2020-02-10 13:40:52.917994	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	1342052303
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2020-02-10 13:40:53.013779	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	1342052303
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2020-02-10 13:40:53.025142	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	1342052303
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2020-02-10 13:40:53.396303	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	1342052303
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2020-02-10 13:40:53.414463	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	1342052303
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2020-02-10 13:40:53.855553	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	1342052303
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2020-02-10 13:40:53.935578	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	1342052303
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2020-02-10 13:40:53.985385	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	1342052303
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2020-02-10 13:40:54.446824	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	1342052303
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2020-02-10 13:40:54.683741	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	1342052303
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2020-02-10 13:40:54.692946	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	1342052303
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2020-02-10 13:40:54.810167	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	1342052303
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-02-10 13:40:54.868944	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	1342052303
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-02-10 13:40:54.876462	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	1342052303
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-02-10 13:40:54.885301	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	1342052303
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2020-02-10 13:40:54.891311	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	1342052303
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2020-02-10 13:40:55.021427	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	1342052303
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2020-02-10 13:40:55.133866	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	1342052303
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2020-02-10 13:40:55.155225	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	1342052303
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-02-10 13:40:56.216749	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	1342052303
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2020-02-10 13:40:55.163719	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	1342052303
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2020-02-10 13:40:55.171752	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	1342052303
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2020-02-10 13:40:55.243513	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	1342052303
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2020-02-10 13:40:55.259697	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	1342052303
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2020-02-10 13:40:55.265004	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	1342052303
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2020-02-10 13:40:55.331762	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	1342052303
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2020-02-10 13:40:55.482682	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	1342052303
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2020-02-10 13:40:55.494271	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	1342052303
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2020-02-10 13:40:55.612945	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	1342052303
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2020-02-10 13:40:55.651795	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	1342052303
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2020-02-10 13:40:55.709529	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	1342052303
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2020-02-10 13:40:55.727581	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	1342052303
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-02-10 13:40:55.748705	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	1342052303
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-02-10 13:40:55.756715	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	1342052303
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-02-10 13:40:55.84625	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	1342052303
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2020-02-10 13:40:55.884074	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	1342052303
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2020-02-10 13:40:55.903397	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	1342052303
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2020-02-10 13:40:55.919884	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	1342052303
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2020-02-10 13:40:55.944096	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	1342052303
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-02-10 13:40:55.954385	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	1342052303
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-02-10 13:40:55.960449	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	1342052303
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2020-02-10 13:40:55.977538	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	1342052303
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2020-02-10 13:40:56.170654	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	1342052303
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2020-02-10 13:40:56.202934	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	1342052303
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-02-10 13:40:56.234333	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	1342052303
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-02-10 13:40:56.239548	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	1342052303
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-02-10 13:40:56.366073	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	1342052303
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2020-02-10 13:40:56.394092	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	1342052303
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2020-02-10 13:40:56.495832	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	1342052303
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2020-02-10 13:40:56.54957	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	1342052303
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2020-02-10 13:40:56.563853	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	1342052303
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2020-02-10 13:40:56.573583	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	1342052303
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2020-02-10 13:40:56.586377	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	1342052303
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-02-10 13:40:56.599897	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	1342052303
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-02-10 13:40:56.613111	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	1342052303
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-02-10 13:40:56.684494	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	1342052303
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2020-02-10 13:40:57.451425	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	1342052303
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2020-02-10 13:40:57.548196	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	1342052303
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2020-02-10 13:40:57.572539	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	1342052303
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-02-10 13:40:57.600687	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	1342052303
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2020-02-10 13:40:57.634451	62	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	1342052303
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2020-02-10 13:40:57.644407	63	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	1342052303
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2020-02-10 13:40:57.65593	64	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	1342052303
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2020-02-10 13:40:57.676256	65	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	1342052303
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2020-02-10 13:40:57.693455	66	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	1342052303
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2020-02-10 13:40:57.722564	67	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	1342052303
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2020-02-10 13:40:57.755241	68	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	1342052303
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2020-02-10 13:40:57.774686	69	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	1342052303
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2020-06-02 18:30:43.333701	70	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	1115443308
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2020-06-02 18:30:43.352759	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	1115443308
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-06-02 18:30:43.363926	72	EXECUTED	7:ec9707ae4d4f0b7452fee20128083879	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	1115443308
8.0.0-updating-credential-data-not-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-06-02 18:30:43.377956	73	EXECUTED	7:03b3f4b264c3c68ba082250a80b74216	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	1115443308
8.0.0-updating-credential-data-oracle	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-06-02 18:30:43.381222	74	MARK_RAN	7:64c5728f5ca1f5aa4392217701c4fe23	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	3.5.4	\N	\N	1115443308
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-06-02 18:30:43.418656	75	EXECUTED	7:b48da8c11a3d83ddd6b7d0c8c2219345	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	3.5.4	\N	\N	1115443308
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2020-06-02 18:30:43.427013	76	EXECUTED	7:a73379915c23bfad3e8f5c6d5c0aa4bd	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	3.5.4	\N	\N	1115443308
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-06-02 18:30:43.432161	77	EXECUTED	7:39e0073779aba192646291aa2332493d	addColumn tableName=CLIENT		\N	3.5.4	\N	\N	1115443308
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-06-02 18:30:43.435311	78	MARK_RAN	7:81f87368f00450799b4bf42ea0b3ec34	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	3.5.4	\N	\N	1115443308
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-06-02 18:30:43.459251	79	EXECUTED	7:20b37422abb9fb6571c618148f013a15	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	3.5.4	\N	\N	1115443308
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2020-06-02 18:30:43.463133	80	MARK_RAN	7:1970bb6cfb5ee800736b95ad3fb3c78a	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	3.5.4	\N	\N	1115443308
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-06-02 18:30:43.469353	81	EXECUTED	7:45d9b25fc3b455d522d8dcc10a0f4c80	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	3.5.4	\N	\N	1115443308
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-06-02 18:30:43.472706	82	MARK_RAN	7:890ae73712bc187a66c2813a724d037f	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	1115443308
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-06-02 18:30:43.47823	83	EXECUTED	7:0a211980d27fafe3ff50d19a3a29b538	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	1115443308
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-06-02 18:30:43.481014	84	MARK_RAN	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	1115443308
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2020-06-02 18:30:43.486727	85	EXECUTED	7:01c49302201bdf815b0a18d1f98a55dc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	1115443308
\.


--
-- TOC entry 5905 (class 0 OID 31297)
-- Dependencies: 816
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- TOC entry 5906 (class 0 OID 31302)
-- Dependencies: 817
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	3b68f597-0ccf-4278-983c-8e4d4f9229a7	f
master	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e	t
master	c667a637-ad1a-40db-ba98-3b9e657b755a	t
master	b1aa9a2c-096a-40ce-88dc-19ac51c10462	t
master	51bea84f-305d-49a8-a57e-938fd5fda798	f
master	097258cc-ebf6-415d-811e-283f6c0157a0	f
master	ea41b282-e2e5-444c-b5a4-f4c747815d06	t
master	221d508d-e950-4816-bc5d-49c7c38812a1	t
europeana	b0ac32f6-4037-498d-9c64-aef1c4607606	f
europeana	9fdab48e-666f-4316-917a-31cfcc582533	t
europeana	ad1eb48d-7223-4338-b6dc-2e76343caa71	t
europeana	61b36198-9614-48fd-a8c1-eed3dab6dae8	t
europeana	f02967dd-9ffa-4125-b0b2-08498eb48dd9	f
europeana	595ae352-0e3c-4152-a151-f43917b56bdc	f
europeana	0e0f4a6d-6c0b-4042-a530-7330c2233ee5	t
europeana	300d69eb-57b8-4d87-bf94-d9ab86a12a4c	t
europeana	a9cea63e-040b-4e2c-b118-2f998bbc918b	t
europeana	9e0a2d0c-7165-4436-a33f-9ca6ffe29964	f
master	62bceb87-7609-4a60-a491-69685dd97790	f
\.


--
-- TOC entry 5907 (class 0 OID 31307)
-- Dependencies: 818
-- Data for Name: event_entity; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- TOC entry 5908 (class 0 OID 31315)
-- Dependencies: 819
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- TOC entry 5909 (class 0 OID 31323)
-- Dependencies: 820
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 5910 (class 0 OID 31331)
-- Dependencies: 821
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 5911 (class 0 OID 31336)
-- Dependencies: 822
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 5912 (class 0 OID 31344)
-- Dependencies: 823
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 5913 (class 0 OID 31349)
-- Dependencies: 824
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 5914 (class 0 OID 31357)
-- Dependencies: 825
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 5915 (class 0 OID 31362)
-- Dependencies: 826
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 5916 (class 0 OID 31370)
-- Dependencies: 827
-- Data for Name: federated_user; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 5917 (class 0 OID 31378)
-- Dependencies: 828
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 5918 (class 0 OID 31386)
-- Dependencies: 829
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 5919 (class 0 OID 31391)
-- Dependencies: 830
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- TOC entry 5920 (class 0 OID 31399)
-- Dependencies: 831
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 5921 (class 0 OID 31407)
-- Dependencies: 832
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 5922 (class 0 OID 31415)
-- Dependencies: 833
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 5923 (class 0 OID 31423)
-- Dependencies: 834
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- TOC entry 5924 (class 0 OID 31428)
-- Dependencies: 835
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
878db7e7-4a62-46dd-94fc-ad9a427aebd0	master	f	${role_admin}	admin	master	\N	master
efcfe862-d249-469d-b130-00451e4f7554	master	f	${role_create-realm}	create-realm	master	\N	master
cfcc42df-0b2b-4492-96c5-f4432e8e0189	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_create-client}	create-client	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
c5fcaa95-0045-42c5-a03b-eb1d120400b5	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-realm}	view-realm	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
83fe1c9b-c0be-4616-93c1-5b3353724ef4	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-users}	view-users	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
4d2ea5b1-4a6d-4f21-912b-20ccba243c11	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-clients}	view-clients	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
61cefce2-fa84-4c3a-9a3e-5a682d4ef870	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-events}	view-events	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
115e6e80-3683-427e-8d62-8de08a49c58c	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-identity-providers}	view-identity-providers	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
181220a0-0d26-45ad-9de9-709ee285d05e	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_view-authorization}	view-authorization	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
e81d4c0d-234b-4b6c-bd6f-b5d755aca479	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-realm}	manage-realm	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
9f22c9a7-0fc8-4dae-8d1f-b7ac15ab813a	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-users}	manage-users	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
dd91ea93-bbb3-4f6f-9c6a-073225db8824	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-clients}	manage-clients	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
2e6adbe0-e996-4f6f-a2d0-eac123bcf013	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-events}	manage-events	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
6d1b52df-602f-466f-8361-0318a2f9228d	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-identity-providers}	manage-identity-providers	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
2260d29f-2f94-4b40-8a94-24674a474557	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_manage-authorization}	manage-authorization	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
21715a6e-4837-4946-99f3-4e9a86d2b7fe	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_query-users}	query-users	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
6fb739a0-0cb7-4c06-875a-d0bc8cdf5dfe	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_query-clients}	query-clients	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
4d50615e-d7f8-401f-bb8c-3e43c737ab23	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_query-realms}	query-realms	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
7e56f7be-a883-4d87-96e0-b4e33870f378	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_query-groups}	query-groups	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
5589ed98-b3a9-4a48-955a-59efae257c0f	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_view-profile}	view-profile	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
47b857f5-4aa2-4863-841c-d447d0369bd9	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_manage-account}	manage-account	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
cc3185d6-e425-409a-afe4-b5252a71b9cc	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_manage-account-links}	manage-account-links	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
18c4847a-4133-47c7-811a-acc8c659e49d	c63a762d-c165-4427-847d-fb6424264358	t	${role_read-token}	read-token	master	c63a762d-c165-4427-847d-fb6424264358	\N
b6028665-f766-40d3-9146-88e5ae058e6a	d68dfd58-f240-4f3c-969b-3ddaba565ad3	t	${role_impersonation}	impersonation	master	d68dfd58-f240-4f3c-969b-3ddaba565ad3	\N
71efe347-ce76-4771-84f4-368e018015b7	master	f	${role_offline-access}	offline_access	master	\N	master
d2a303ba-574c-42a4-a742-a3a34acd893c	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
cf819d65-8f40-4adf-9692-6a25778fb9af	88675175-4471-4df5-ba92-d12ab7544805	t	${role_create-client}	create-client	master	88675175-4471-4df5-ba92-d12ab7544805	\N
4a9cc3b6-c6e7-4f79-a2c3-6d624daf23ab	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-realm}	view-realm	master	88675175-4471-4df5-ba92-d12ab7544805	\N
139a1b1a-73c0-43d4-824c-0b92fcdd449b	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-users}	view-users	master	88675175-4471-4df5-ba92-d12ab7544805	\N
bada2387-ce61-4961-b131-1d1939775bb4	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-clients}	view-clients	master	88675175-4471-4df5-ba92-d12ab7544805	\N
94453169-c550-426d-9782-c71748e56c33	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-events}	view-events	master	88675175-4471-4df5-ba92-d12ab7544805	\N
32b5fceb-62d2-40f7-a140-b92e7e1af97e	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-identity-providers}	view-identity-providers	master	88675175-4471-4df5-ba92-d12ab7544805	\N
673d1b4c-9ff6-460d-8592-73d6c29f81c6	88675175-4471-4df5-ba92-d12ab7544805	t	${role_view-authorization}	view-authorization	master	88675175-4471-4df5-ba92-d12ab7544805	\N
9000884d-d1e7-4ce5-b5e0-277be51196d1	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-realm}	manage-realm	master	88675175-4471-4df5-ba92-d12ab7544805	\N
45475d5a-5434-40db-beec-3b4dbb425a59	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-users}	manage-users	master	88675175-4471-4df5-ba92-d12ab7544805	\N
12dab4de-0012-461b-b379-38c121d0d41e	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-clients}	manage-clients	master	88675175-4471-4df5-ba92-d12ab7544805	\N
54ab2b38-1744-4dd5-841c-b99ef59ab4f1	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-events}	manage-events	master	88675175-4471-4df5-ba92-d12ab7544805	\N
a15298f1-adb0-477c-ba3e-780481daf680	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-identity-providers}	manage-identity-providers	master	88675175-4471-4df5-ba92-d12ab7544805	\N
55cb480e-6769-4889-93da-19901ef6bbf9	88675175-4471-4df5-ba92-d12ab7544805	t	${role_manage-authorization}	manage-authorization	master	88675175-4471-4df5-ba92-d12ab7544805	\N
c2132831-09b4-4eff-a8cb-395a1fd827c9	88675175-4471-4df5-ba92-d12ab7544805	t	${role_query-users}	query-users	master	88675175-4471-4df5-ba92-d12ab7544805	\N
5dc400cc-98a2-4efc-929d-e8883cb241bc	88675175-4471-4df5-ba92-d12ab7544805	t	${role_query-clients}	query-clients	master	88675175-4471-4df5-ba92-d12ab7544805	\N
c4a8b99e-7cef-45de-aa2e-740dba03d7d5	88675175-4471-4df5-ba92-d12ab7544805	t	${role_query-realms}	query-realms	master	88675175-4471-4df5-ba92-d12ab7544805	\N
13421d8c-aeee-4491-837b-97e44bda3b99	88675175-4471-4df5-ba92-d12ab7544805	t	${role_query-groups}	query-groups	master	88675175-4471-4df5-ba92-d12ab7544805	\N
7c4faab3-459a-456f-b90c-f5fc6aa6d88f	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_realm-admin}	realm-admin	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
88087270-5921-47c4-82d7-a0f2f199b475	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_create-client}	create-client	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
34ff2547-00ef-4ec0-bbd6-7526e84e8378	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-realm}	view-realm	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
7f5326f9-0ab1-4b98-bc7c-7b52ac80c61a	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-users}	view-users	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
1ef0486d-89f1-4afe-be10-d8fa01ec3596	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-clients}	view-clients	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
acb40053-88cb-4540-b94f-1a3360c9c867	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-events}	view-events	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
3f075373-cf37-4540-894c-6c73e42f9de9	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-identity-providers}	view-identity-providers	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
05925353-ed4e-4be6-9665-2d72e928522a	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_view-authorization}	view-authorization	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
aeccb1e2-a629-4a70-a8f8-5953bc867ddf	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-realm}	manage-realm	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
3328a6b4-adeb-44b2-9820-a1f225d2f21a	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-users}	manage-users	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
2a905708-fc40-4c3b-9a3b-4d857ea266b6	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-clients}	manage-clients	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
f842c00d-bc55-4307-a381-7cd38fc0653b	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-events}	manage-events	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
2e611d45-fe5e-443c-8d13-ce3090e912d7	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-identity-providers}	manage-identity-providers	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
4c5145b6-79dc-4ab2-8be0-7de22ea5a8fb	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_manage-authorization}	manage-authorization	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
0e724b43-4b5d-494c-9ea2-6fb0702e43d9	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_query-users}	query-users	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
de3f39cc-e2de-41d4-94eb-ef092249b2d5	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_query-clients}	query-clients	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
9deea3ea-4200-4ee9-9338-f059dc64d276	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_query-realms}	query-realms	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
d523c22a-19f7-4cae-8157-7e4eaf8cf825	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_query-groups}	query-groups	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_view-profile}	view-profile	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
e5181123-9fd0-4bfd-86d2-8fb4a751e773	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_manage-account}	manage-account	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
725dab9e-af61-4b04-8a4e-e37d745b3efd	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_manage-account-links}	manage-account-links	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
517e4aca-b4be-422f-9fe8-f7301fd1993c	88675175-4471-4df5-ba92-d12ab7544805	t	${role_impersonation}	impersonation	master	88675175-4471-4df5-ba92-d12ab7544805	\N
98911148-a8c9-4ae1-b72f-da5e86058c21	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	t	${role_impersonation}	impersonation	europeana	3c9c1922-1c34-42ea-b7d4-bca618d18b2c	\N
42214327-6e10-4e36-bb5f-f49bb7b32c3f	8742152f-c061-4d63-849d-1a4817ef3322	t	${role_read-token}	read-token	europeana	8742152f-c061-4d63-849d-1a4817ef3322	\N
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	europeana	f	${role_offline-access}	offline_access	europeana	\N	europeana
187edf4f-9946-47d1-b36b-818c11db3933	europeana	f	${role_uma_authorization}	uma_authorization	europeana	\N	europeana
36b65c8b-3caf-45bb-8d2f-64ca1b0effc1	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	t	\N	uma_protection	europeana	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
67be1a70-f465-4d6a-9b3f-d89fb65d985f	7d552182-500c-4122-9c36-769393ca1459	t	\N	uma_protection	europeana	7d552182-500c-4122-9c36-769393ca1459	\N
1a7c5c3e-7c7f-46f0-8e94-e8210d0d41ea	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_view-applications}	view-applications	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
9376b9db-d532-4ddf-8a7b-852bb94386c0	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_view-consent}	view-consent	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
3ac58cce-26c3-4e4f-8566-aa4671e0af28	4f554b64-0b22-4194-8660-fac7fb017194	t	${role_manage-consent}	manage-consent	europeana	4f554b64-0b22-4194-8660-fac7fb017194	\N
8153b05d-0d0e-42b8-ba41-f976a5b2b510	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_view-applications}	view-applications	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
58a23a7a-0657-4275-a326-a0c460395d98	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_view-consent}	view-consent	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
bd97efd3-5477-4f96-a8c3-fa964f824222	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	t	${role_manage-consent}	manage-consent	master	a959f8ad-8aa3-4c2e-a766-4779b264f9dd	\N
\.


--
-- TOC entry 5925 (class 0 OID 31436)
-- Dependencies: 836
-- Data for Name: migration_model; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".migration_model (id, version, update_time) FROM stdin;
SINGLETON	4.6.0	0
n6jue	9.0.3	1591115450
7625q	10.0.1	1591117460
\.


--
-- TOC entry 5926 (class 0 OID 31441)
-- Dependencies: 837
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 5927 (class 0 OID 31449)
-- Dependencies: 838
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- TOC entry 5928 (class 0 OID 31457)
-- Dependencies: 839
-- Data for Name: policy_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".policy_config (policy_id, name, value) FROM stdin;
88c1dd99-6b73-40db-98be-7de463a7adb1	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
89cf5b05-6ee0-4b1f-8efa-7d689e29dd5a	defaultResourceType	urn:api-key-service:resources:default
cb9c9022-a9ea-46d4-9e79-aacf921a1880	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
1b2e724c-2326-4f6d-9ba7-01b3e0c68454	defaultResourceType	urn:pingdom-runscope:resources:default
\.


--
-- TOC entry 5929 (class 0 OID 31465)
-- Dependencies: 840
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
bc33ba9f-1f0a-499c-be86-abb7071a9895	locale	openid-connect	oidc-usermodel-attribute-mapper	3366d8e3-389c-46a4-99cb-8aa32bacaf3b	\N
231f70b1-d07c-4238-9483-76b51af2a312	role list	saml	saml-role-list-mapper	\N	9d7955e0-1c79-49ce-a90a-5cfd3cd14f1e
88bbb888-f4bd-40b8-b3f4-544936fefc2b	full name	openid-connect	oidc-full-name-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	family name	openid-connect	oidc-usermodel-property-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
500f63fd-6b87-4298-81e9-1dd0674910b5	given name	openid-connect	oidc-usermodel-property-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
b81cf383-83f8-4808-92d9-157412a2366e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
ca0b8725-d89a-4405-aee0-48edc6b29e98	username	openid-connect	oidc-usermodel-property-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
d8941bda-23bb-4413-96a5-f8e2844d2bd7	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
739a6e07-4d3e-434f-a93e-2fc18c488db2	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
b47411c5-0beb-4ee8-990e-03a2501054c7	website	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
b6f44e95-24f5-40b5-baf5-05fdb21787a0	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
658eaa7b-018f-4694-bf61-557b658d4097	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
5f597f14-9374-463a-80c5-29afed63d2a0	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
8d9c73cd-904f-43bc-b3d2-746675e2e46b	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	c667a637-ad1a-40db-ba98-3b9e657b755a
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	email	openid-connect	oidc-usermodel-property-mapper	\N	b1aa9a2c-096a-40ce-88dc-19ac51c10462
987d92eb-e31e-4f69-ad27-f296544b6b9e	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b1aa9a2c-096a-40ce-88dc-19ac51c10462
2259e5a2-374e-488c-9aaf-2020e2047b85	address	openid-connect	oidc-address-mapper	\N	51bea84f-305d-49a8-a57e-938fd5fda798
109861fd-2d73-4b02-aa92-532b0de5cbc1	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	097258cc-ebf6-415d-811e-283f6c0157a0
8c09cb14-3a99-47ea-917b-eb9935e8791f	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	097258cc-ebf6-415d-811e-283f6c0157a0
551fb272-0503-47e3-b391-91429d28b3f1	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ea41b282-e2e5-444c-b5a4-f4c747815d06
2b8b3b16-c840-4f83-aa65-99647e4dae96	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ea41b282-e2e5-444c-b5a4-f4c747815d06
ae453ab7-a631-4219-973d-2087b55dc007	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ea41b282-e2e5-444c-b5a4-f4c747815d06
ee3f45c6-7727-4c55-a91b-9957ccc72ce3	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	221d508d-e950-4816-bc5d-49c7c38812a1
6d479e0d-bb16-4a6c-b96e-6bfafd8cb9b2	role list	saml	saml-role-list-mapper	\N	9fdab48e-666f-4316-917a-31cfcc582533
f5f2c268-9375-40c8-be7f-c723d55be947	full name	openid-connect	oidc-full-name-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	family name	openid-connect	oidc-usermodel-property-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
0d46c911-7bb8-4693-98e9-4f173cf82681	given name	openid-connect	oidc-usermodel-property-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
e603440d-6e5a-4a4e-ad02-153f0d517be1	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
dd3243e8-5f59-4d18-a137-13f7ca7a558b	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
f36cc032-d8c6-4a64-858c-4ce73458815b	username	openid-connect	oidc-usermodel-property-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
b64f7124-5265-4078-9ae8-737a7f64df53	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
28aeaef4-1ae4-4283-8096-72930eb30c98	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	website	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
483497db-73b6-4b5d-9d15-131d5f3afb77	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
004913ca-7579-4e2c-95c2-918d6ef173c0	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
80313a57-d375-4c38-ab5f-7a04a9ca1629	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	ad1eb48d-7223-4338-b6dc-2e76343caa71
f9fe9716-a321-432b-bcff-f7f86c62b324	email	openid-connect	oidc-usermodel-property-mapper	\N	61b36198-9614-48fd-a8c1-eed3dab6dae8
a705f5f2-515b-4b54-8def-0476c62835bf	email verified	openid-connect	oidc-usermodel-property-mapper	\N	61b36198-9614-48fd-a8c1-eed3dab6dae8
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	address	openid-connect	oidc-address-mapper	\N	f02967dd-9ffa-4125-b0b2-08498eb48dd9
5d63bde3-49ba-4164-aea9-8457e8162b0c	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	595ae352-0e3c-4152-a151-f43917b56bdc
54418976-ae87-4dda-9687-a7453d5d6a8d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	595ae352-0e3c-4152-a151-f43917b56bdc
b724d073-5df0-4df2-85b9-7ad30f5778b7	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0e0f4a6d-6c0b-4042-a530-7330c2233ee5
19e023a3-a36e-4aa7-84b5-de7c7347753b	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0e0f4a6d-6c0b-4042-a530-7330c2233ee5
385cc818-57cb-49b0-81e9-7aa8c7a89481	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0e0f4a6d-6c0b-4042-a530-7330c2233ee5
38898ade-f03a-440a-94a0-e0f69e7b621f	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	300d69eb-57b8-4d87-bf94-d9ab86a12a4c
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	locale	openid-connect	oidc-usermodel-attribute-mapper	3c9962a9-89ae-437c-9f95-2c2a059f3ca6	\N
d15f449f-d853-4eef-b545-c13f8018a694	client information mapper	openid-connect	oidc-script-based-protocol-mapper	\N	a9cea63e-040b-4e2c-b118-2f998bbc918b
476f4392-12fd-45ca-885a-46a99a7954c6	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
3c7eaebd-e713-4230-9097-a51824be37ee	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
69155e8a-f1e0-4910-9664-31a2e140e428	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	09ab961e-d779-415b-81c8-0582944caa94	\N
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	09ab961e-d779-415b-81c8-0582944caa94	\N
523a5a6a-d0f4-49df-8546-9d452c658a15	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	09ab961e-d779-415b-81c8-0582944caa94	\N
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	\N
4863b5a9-b76c-49d0-add0-edb3d3217491	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	\N
3c101c56-ec44-4c66-be42-4d2a12b213af	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	\N
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	\N
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	\N
7a914e81-2202-4e64-95fb-b0b2766af674	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	\N
1bf9809c-5745-4b39-bf40-e8a427093423	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	4d54e474-c726-4c05-97e4-6c0d7207f65d	\N
5f6778f9-f527-4a19-a547-fbde97ebedc9	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	4d54e474-c726-4c05-97e4-6c0d7207f65d	\N
73f201f8-8c39-42ed-9062-2dd9604b3072	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	4d54e474-c726-4c05-97e4-6c0d7207f65d	\N
19e08ff3-1e1b-402a-9bc5-fb00b6771449	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	7d552182-500c-4122-9c36-769393ca1459	\N
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	7d552182-500c-4122-9c36-769393ca1459	\N
aa241079-ce41-4855-b0aa-bc0dee136a7d	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	7d552182-500c-4122-9c36-769393ca1459	\N
2983e1bc-4d52-4a50-b70b-d4a00306a729	upn	openid-connect	oidc-usermodel-property-mapper	\N	9e0a2d0c-7165-4436-a33f-9ca6ffe29964
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	9e0a2d0c-7165-4436-a33f-9ca6ffe29964
0b665327-3789-4cc0-9841-53979795f614	upn	openid-connect	oidc-usermodel-property-mapper	\N	62bceb87-7609-4a60-a491-69685dd97790
7143325b-1781-4c71-9d37-231ff7263171	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	62bceb87-7609-4a60-a491-69685dd97790
db20d843-994e-49a7-9639-a6b7ac22f542	audience resolve	openid-connect	oidc-audience-resolve-mapper	438c39cb-cb57-4543-acca-966e0d9d0eea	\N
7a21d52f-21c7-45d4-9c8e-391d8d725aa2	audience resolve	openid-connect	oidc-audience-resolve-mapper	69dae4f1-2dde-437a-8172-70f60fd37f6f	\N
\.


--
-- TOC entry 5930 (class 0 OID 31473)
-- Dependencies: 841
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
bc33ba9f-1f0a-499c-be86-abb7071a9895	true	userinfo.token.claim
bc33ba9f-1f0a-499c-be86-abb7071a9895	locale	user.attribute
bc33ba9f-1f0a-499c-be86-abb7071a9895	true	id.token.claim
bc33ba9f-1f0a-499c-be86-abb7071a9895	true	access.token.claim
bc33ba9f-1f0a-499c-be86-abb7071a9895	locale	claim.name
bc33ba9f-1f0a-499c-be86-abb7071a9895	String	jsonType.label
231f70b1-d07c-4238-9483-76b51af2a312	false	single
231f70b1-d07c-4238-9483-76b51af2a312	Basic	attribute.nameformat
231f70b1-d07c-4238-9483-76b51af2a312	Role	attribute.name
88bbb888-f4bd-40b8-b3f4-544936fefc2b	true	userinfo.token.claim
88bbb888-f4bd-40b8-b3f4-544936fefc2b	true	id.token.claim
88bbb888-f4bd-40b8-b3f4-544936fefc2b	true	access.token.claim
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	true	userinfo.token.claim
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	lastName	user.attribute
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	true	id.token.claim
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	true	access.token.claim
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	family_name	claim.name
e7aee17a-2a0e-4545-a20e-1fdbfbc95c54	String	jsonType.label
500f63fd-6b87-4298-81e9-1dd0674910b5	true	userinfo.token.claim
500f63fd-6b87-4298-81e9-1dd0674910b5	firstName	user.attribute
500f63fd-6b87-4298-81e9-1dd0674910b5	true	id.token.claim
500f63fd-6b87-4298-81e9-1dd0674910b5	true	access.token.claim
500f63fd-6b87-4298-81e9-1dd0674910b5	given_name	claim.name
500f63fd-6b87-4298-81e9-1dd0674910b5	String	jsonType.label
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	true	userinfo.token.claim
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	middleName	user.attribute
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	true	id.token.claim
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	true	access.token.claim
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	middle_name	claim.name
c74e5770-d3b9-4cba-bc7a-104fdef3b02a	String	jsonType.label
b81cf383-83f8-4808-92d9-157412a2366e	true	userinfo.token.claim
b81cf383-83f8-4808-92d9-157412a2366e	nickname	user.attribute
b81cf383-83f8-4808-92d9-157412a2366e	true	id.token.claim
b81cf383-83f8-4808-92d9-157412a2366e	true	access.token.claim
b81cf383-83f8-4808-92d9-157412a2366e	nickname	claim.name
b81cf383-83f8-4808-92d9-157412a2366e	String	jsonType.label
ca0b8725-d89a-4405-aee0-48edc6b29e98	true	userinfo.token.claim
ca0b8725-d89a-4405-aee0-48edc6b29e98	username	user.attribute
ca0b8725-d89a-4405-aee0-48edc6b29e98	true	id.token.claim
ca0b8725-d89a-4405-aee0-48edc6b29e98	true	access.token.claim
ca0b8725-d89a-4405-aee0-48edc6b29e98	preferred_username	claim.name
ca0b8725-d89a-4405-aee0-48edc6b29e98	String	jsonType.label
d8941bda-23bb-4413-96a5-f8e2844d2bd7	true	userinfo.token.claim
d8941bda-23bb-4413-96a5-f8e2844d2bd7	profile	user.attribute
d8941bda-23bb-4413-96a5-f8e2844d2bd7	true	id.token.claim
d8941bda-23bb-4413-96a5-f8e2844d2bd7	true	access.token.claim
d8941bda-23bb-4413-96a5-f8e2844d2bd7	profile	claim.name
d8941bda-23bb-4413-96a5-f8e2844d2bd7	String	jsonType.label
739a6e07-4d3e-434f-a93e-2fc18c488db2	true	userinfo.token.claim
739a6e07-4d3e-434f-a93e-2fc18c488db2	picture	user.attribute
739a6e07-4d3e-434f-a93e-2fc18c488db2	true	id.token.claim
739a6e07-4d3e-434f-a93e-2fc18c488db2	true	access.token.claim
739a6e07-4d3e-434f-a93e-2fc18c488db2	picture	claim.name
739a6e07-4d3e-434f-a93e-2fc18c488db2	String	jsonType.label
b47411c5-0beb-4ee8-990e-03a2501054c7	true	userinfo.token.claim
b47411c5-0beb-4ee8-990e-03a2501054c7	website	user.attribute
b47411c5-0beb-4ee8-990e-03a2501054c7	true	id.token.claim
b47411c5-0beb-4ee8-990e-03a2501054c7	true	access.token.claim
b47411c5-0beb-4ee8-990e-03a2501054c7	website	claim.name
b47411c5-0beb-4ee8-990e-03a2501054c7	String	jsonType.label
b6f44e95-24f5-40b5-baf5-05fdb21787a0	true	userinfo.token.claim
b6f44e95-24f5-40b5-baf5-05fdb21787a0	gender	user.attribute
b6f44e95-24f5-40b5-baf5-05fdb21787a0	true	id.token.claim
b6f44e95-24f5-40b5-baf5-05fdb21787a0	true	access.token.claim
b6f44e95-24f5-40b5-baf5-05fdb21787a0	gender	claim.name
b6f44e95-24f5-40b5-baf5-05fdb21787a0	String	jsonType.label
658eaa7b-018f-4694-bf61-557b658d4097	true	userinfo.token.claim
658eaa7b-018f-4694-bf61-557b658d4097	birthdate	user.attribute
658eaa7b-018f-4694-bf61-557b658d4097	true	id.token.claim
658eaa7b-018f-4694-bf61-557b658d4097	true	access.token.claim
658eaa7b-018f-4694-bf61-557b658d4097	birthdate	claim.name
658eaa7b-018f-4694-bf61-557b658d4097	String	jsonType.label
5f597f14-9374-463a-80c5-29afed63d2a0	true	userinfo.token.claim
5f597f14-9374-463a-80c5-29afed63d2a0	zoneinfo	user.attribute
5f597f14-9374-463a-80c5-29afed63d2a0	true	id.token.claim
5f597f14-9374-463a-80c5-29afed63d2a0	true	access.token.claim
5f597f14-9374-463a-80c5-29afed63d2a0	zoneinfo	claim.name
5f597f14-9374-463a-80c5-29afed63d2a0	String	jsonType.label
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	true	userinfo.token.claim
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	locale	user.attribute
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	true	id.token.claim
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	true	access.token.claim
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	locale	claim.name
25ef922b-4be5-4b1c-9d59-cf38ebb817ea	String	jsonType.label
8d9c73cd-904f-43bc-b3d2-746675e2e46b	true	userinfo.token.claim
8d9c73cd-904f-43bc-b3d2-746675e2e46b	updatedAt	user.attribute
8d9c73cd-904f-43bc-b3d2-746675e2e46b	true	id.token.claim
8d9c73cd-904f-43bc-b3d2-746675e2e46b	true	access.token.claim
8d9c73cd-904f-43bc-b3d2-746675e2e46b	updated_at	claim.name
8d9c73cd-904f-43bc-b3d2-746675e2e46b	String	jsonType.label
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	true	userinfo.token.claim
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	email	user.attribute
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	true	id.token.claim
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	true	access.token.claim
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	email	claim.name
d4eb293a-9af9-4de1-a76c-ee481a7ae9e3	String	jsonType.label
987d92eb-e31e-4f69-ad27-f296544b6b9e	true	userinfo.token.claim
987d92eb-e31e-4f69-ad27-f296544b6b9e	emailVerified	user.attribute
987d92eb-e31e-4f69-ad27-f296544b6b9e	true	id.token.claim
987d92eb-e31e-4f69-ad27-f296544b6b9e	true	access.token.claim
987d92eb-e31e-4f69-ad27-f296544b6b9e	email_verified	claim.name
987d92eb-e31e-4f69-ad27-f296544b6b9e	boolean	jsonType.label
2259e5a2-374e-488c-9aaf-2020e2047b85	formatted	user.attribute.formatted
2259e5a2-374e-488c-9aaf-2020e2047b85	country	user.attribute.country
2259e5a2-374e-488c-9aaf-2020e2047b85	postal_code	user.attribute.postal_code
2259e5a2-374e-488c-9aaf-2020e2047b85	true	userinfo.token.claim
2259e5a2-374e-488c-9aaf-2020e2047b85	street	user.attribute.street
2259e5a2-374e-488c-9aaf-2020e2047b85	true	id.token.claim
2259e5a2-374e-488c-9aaf-2020e2047b85	region	user.attribute.region
2259e5a2-374e-488c-9aaf-2020e2047b85	true	access.token.claim
2259e5a2-374e-488c-9aaf-2020e2047b85	locality	user.attribute.locality
109861fd-2d73-4b02-aa92-532b0de5cbc1	true	userinfo.token.claim
109861fd-2d73-4b02-aa92-532b0de5cbc1	phoneNumber	user.attribute
109861fd-2d73-4b02-aa92-532b0de5cbc1	true	id.token.claim
109861fd-2d73-4b02-aa92-532b0de5cbc1	true	access.token.claim
109861fd-2d73-4b02-aa92-532b0de5cbc1	phone_number	claim.name
109861fd-2d73-4b02-aa92-532b0de5cbc1	String	jsonType.label
8c09cb14-3a99-47ea-917b-eb9935e8791f	true	userinfo.token.claim
8c09cb14-3a99-47ea-917b-eb9935e8791f	phoneNumberVerified	user.attribute
8c09cb14-3a99-47ea-917b-eb9935e8791f	true	id.token.claim
8c09cb14-3a99-47ea-917b-eb9935e8791f	true	access.token.claim
8c09cb14-3a99-47ea-917b-eb9935e8791f	phone_number_verified	claim.name
8c09cb14-3a99-47ea-917b-eb9935e8791f	boolean	jsonType.label
551fb272-0503-47e3-b391-91429d28b3f1	true	multivalued
551fb272-0503-47e3-b391-91429d28b3f1	foo	user.attribute
551fb272-0503-47e3-b391-91429d28b3f1	true	access.token.claim
551fb272-0503-47e3-b391-91429d28b3f1	realm_access.roles	claim.name
551fb272-0503-47e3-b391-91429d28b3f1	String	jsonType.label
2b8b3b16-c840-4f83-aa65-99647e4dae96	true	multivalued
2b8b3b16-c840-4f83-aa65-99647e4dae96	foo	user.attribute
2b8b3b16-c840-4f83-aa65-99647e4dae96	true	access.token.claim
2b8b3b16-c840-4f83-aa65-99647e4dae96	resource_access.${client_id}.roles	claim.name
2b8b3b16-c840-4f83-aa65-99647e4dae96	String	jsonType.label
6d479e0d-bb16-4a6c-b96e-6bfafd8cb9b2	false	single
6d479e0d-bb16-4a6c-b96e-6bfafd8cb9b2	Basic	attribute.nameformat
6d479e0d-bb16-4a6c-b96e-6bfafd8cb9b2	Role	attribute.name
f5f2c268-9375-40c8-be7f-c723d55be947	true	userinfo.token.claim
f5f2c268-9375-40c8-be7f-c723d55be947	true	id.token.claim
f5f2c268-9375-40c8-be7f-c723d55be947	true	access.token.claim
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	true	userinfo.token.claim
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	lastName	user.attribute
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	true	id.token.claim
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	true	access.token.claim
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	family_name	claim.name
9ab157ad-d16a-4c62-a7ba-b5ea2e25890d	String	jsonType.label
0d46c911-7bb8-4693-98e9-4f173cf82681	true	userinfo.token.claim
0d46c911-7bb8-4693-98e9-4f173cf82681	firstName	user.attribute
0d46c911-7bb8-4693-98e9-4f173cf82681	true	id.token.claim
0d46c911-7bb8-4693-98e9-4f173cf82681	true	access.token.claim
0d46c911-7bb8-4693-98e9-4f173cf82681	given_name	claim.name
0d46c911-7bb8-4693-98e9-4f173cf82681	String	jsonType.label
e603440d-6e5a-4a4e-ad02-153f0d517be1	true	userinfo.token.claim
e603440d-6e5a-4a4e-ad02-153f0d517be1	middleName	user.attribute
e603440d-6e5a-4a4e-ad02-153f0d517be1	true	id.token.claim
e603440d-6e5a-4a4e-ad02-153f0d517be1	true	access.token.claim
e603440d-6e5a-4a4e-ad02-153f0d517be1	middle_name	claim.name
e603440d-6e5a-4a4e-ad02-153f0d517be1	String	jsonType.label
dd3243e8-5f59-4d18-a137-13f7ca7a558b	true	userinfo.token.claim
dd3243e8-5f59-4d18-a137-13f7ca7a558b	nickname	user.attribute
dd3243e8-5f59-4d18-a137-13f7ca7a558b	true	id.token.claim
dd3243e8-5f59-4d18-a137-13f7ca7a558b	true	access.token.claim
dd3243e8-5f59-4d18-a137-13f7ca7a558b	nickname	claim.name
dd3243e8-5f59-4d18-a137-13f7ca7a558b	String	jsonType.label
f36cc032-d8c6-4a64-858c-4ce73458815b	true	userinfo.token.claim
f36cc032-d8c6-4a64-858c-4ce73458815b	username	user.attribute
f36cc032-d8c6-4a64-858c-4ce73458815b	true	id.token.claim
f36cc032-d8c6-4a64-858c-4ce73458815b	true	access.token.claim
f36cc032-d8c6-4a64-858c-4ce73458815b	preferred_username	claim.name
f36cc032-d8c6-4a64-858c-4ce73458815b	String	jsonType.label
b64f7124-5265-4078-9ae8-737a7f64df53	true	userinfo.token.claim
b64f7124-5265-4078-9ae8-737a7f64df53	profile	user.attribute
b64f7124-5265-4078-9ae8-737a7f64df53	true	id.token.claim
b64f7124-5265-4078-9ae8-737a7f64df53	true	access.token.claim
b64f7124-5265-4078-9ae8-737a7f64df53	profile	claim.name
b64f7124-5265-4078-9ae8-737a7f64df53	String	jsonType.label
28aeaef4-1ae4-4283-8096-72930eb30c98	true	userinfo.token.claim
28aeaef4-1ae4-4283-8096-72930eb30c98	picture	user.attribute
28aeaef4-1ae4-4283-8096-72930eb30c98	true	id.token.claim
28aeaef4-1ae4-4283-8096-72930eb30c98	true	access.token.claim
28aeaef4-1ae4-4283-8096-72930eb30c98	picture	claim.name
28aeaef4-1ae4-4283-8096-72930eb30c98	String	jsonType.label
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	true	userinfo.token.claim
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	website	user.attribute
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	true	id.token.claim
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	true	access.token.claim
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	website	claim.name
d2c6517d-c6d6-4dc4-b7d8-b71fb2a43282	String	jsonType.label
483497db-73b6-4b5d-9d15-131d5f3afb77	true	userinfo.token.claim
483497db-73b6-4b5d-9d15-131d5f3afb77	gender	user.attribute
483497db-73b6-4b5d-9d15-131d5f3afb77	true	id.token.claim
483497db-73b6-4b5d-9d15-131d5f3afb77	true	access.token.claim
483497db-73b6-4b5d-9d15-131d5f3afb77	gender	claim.name
483497db-73b6-4b5d-9d15-131d5f3afb77	String	jsonType.label
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	true	userinfo.token.claim
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	birthdate	user.attribute
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	true	id.token.claim
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	true	access.token.claim
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	birthdate	claim.name
fbcbf31d-6b3b-4fad-b8f3-620c46a61a16	String	jsonType.label
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	true	userinfo.token.claim
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	zoneinfo	user.attribute
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	true	id.token.claim
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	true	access.token.claim
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	zoneinfo	claim.name
09639ccf-1a3d-43ce-9f40-0d8947cb4ed2	String	jsonType.label
004913ca-7579-4e2c-95c2-918d6ef173c0	true	userinfo.token.claim
004913ca-7579-4e2c-95c2-918d6ef173c0	locale	user.attribute
004913ca-7579-4e2c-95c2-918d6ef173c0	true	id.token.claim
004913ca-7579-4e2c-95c2-918d6ef173c0	true	access.token.claim
004913ca-7579-4e2c-95c2-918d6ef173c0	locale	claim.name
004913ca-7579-4e2c-95c2-918d6ef173c0	String	jsonType.label
80313a57-d375-4c38-ab5f-7a04a9ca1629	true	userinfo.token.claim
80313a57-d375-4c38-ab5f-7a04a9ca1629	updatedAt	user.attribute
80313a57-d375-4c38-ab5f-7a04a9ca1629	true	id.token.claim
80313a57-d375-4c38-ab5f-7a04a9ca1629	true	access.token.claim
80313a57-d375-4c38-ab5f-7a04a9ca1629	updated_at	claim.name
80313a57-d375-4c38-ab5f-7a04a9ca1629	String	jsonType.label
f9fe9716-a321-432b-bcff-f7f86c62b324	true	userinfo.token.claim
f9fe9716-a321-432b-bcff-f7f86c62b324	email	user.attribute
f9fe9716-a321-432b-bcff-f7f86c62b324	true	id.token.claim
f9fe9716-a321-432b-bcff-f7f86c62b324	true	access.token.claim
f9fe9716-a321-432b-bcff-f7f86c62b324	email	claim.name
f9fe9716-a321-432b-bcff-f7f86c62b324	String	jsonType.label
a705f5f2-515b-4b54-8def-0476c62835bf	true	userinfo.token.claim
a705f5f2-515b-4b54-8def-0476c62835bf	emailVerified	user.attribute
a705f5f2-515b-4b54-8def-0476c62835bf	true	id.token.claim
a705f5f2-515b-4b54-8def-0476c62835bf	true	access.token.claim
a705f5f2-515b-4b54-8def-0476c62835bf	email_verified	claim.name
a705f5f2-515b-4b54-8def-0476c62835bf	boolean	jsonType.label
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	formatted	user.attribute.formatted
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	country	user.attribute.country
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	postal_code	user.attribute.postal_code
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	true	userinfo.token.claim
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	street	user.attribute.street
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	true	id.token.claim
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	region	user.attribute.region
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	true	access.token.claim
4ed64dd1-cf3a-4944-8dbb-b85553bfdeb9	locality	user.attribute.locality
5d63bde3-49ba-4164-aea9-8457e8162b0c	true	userinfo.token.claim
5d63bde3-49ba-4164-aea9-8457e8162b0c	phoneNumber	user.attribute
5d63bde3-49ba-4164-aea9-8457e8162b0c	true	id.token.claim
5d63bde3-49ba-4164-aea9-8457e8162b0c	true	access.token.claim
5d63bde3-49ba-4164-aea9-8457e8162b0c	phone_number	claim.name
5d63bde3-49ba-4164-aea9-8457e8162b0c	String	jsonType.label
54418976-ae87-4dda-9687-a7453d5d6a8d	true	userinfo.token.claim
54418976-ae87-4dda-9687-a7453d5d6a8d	phoneNumberVerified	user.attribute
54418976-ae87-4dda-9687-a7453d5d6a8d	true	id.token.claim
54418976-ae87-4dda-9687-a7453d5d6a8d	true	access.token.claim
54418976-ae87-4dda-9687-a7453d5d6a8d	phone_number_verified	claim.name
54418976-ae87-4dda-9687-a7453d5d6a8d	boolean	jsonType.label
b724d073-5df0-4df2-85b9-7ad30f5778b7	true	multivalued
b724d073-5df0-4df2-85b9-7ad30f5778b7	foo	user.attribute
b724d073-5df0-4df2-85b9-7ad30f5778b7	true	access.token.claim
b724d073-5df0-4df2-85b9-7ad30f5778b7	realm_access.roles	claim.name
b724d073-5df0-4df2-85b9-7ad30f5778b7	String	jsonType.label
19e023a3-a36e-4aa7-84b5-de7c7347753b	true	multivalued
19e023a3-a36e-4aa7-84b5-de7c7347753b	foo	user.attribute
19e023a3-a36e-4aa7-84b5-de7c7347753b	true	access.token.claim
19e023a3-a36e-4aa7-84b5-de7c7347753b	resource_access.${client_id}.roles	claim.name
19e023a3-a36e-4aa7-84b5-de7c7347753b	String	jsonType.label
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	true	userinfo.token.claim
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	locale	user.attribute
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	true	id.token.claim
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	true	access.token.claim
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	locale	claim.name
86cbca6b-4d5d-49be-9bc7-a3711c462bbe	String	jsonType.label
d15f449f-d853-4eef-b545-c13f8018a694	true	userinfo.token.claim
d15f449f-d853-4eef-b545-c13f8018a694	true	id.token.claim
d15f449f-d853-4eef-b545-c13f8018a694	true	access.token.claim
476f4392-12fd-45ca-885a-46a99a7954c6	clientId	user.session.note
476f4392-12fd-45ca-885a-46a99a7954c6	true	id.token.claim
476f4392-12fd-45ca-885a-46a99a7954c6	true	access.token.claim
476f4392-12fd-45ca-885a-46a99a7954c6	clientId	claim.name
476f4392-12fd-45ca-885a-46a99a7954c6	String	jsonType.label
3c7eaebd-e713-4230-9097-a51824be37ee	clientHost	user.session.note
3c7eaebd-e713-4230-9097-a51824be37ee	true	id.token.claim
3c7eaebd-e713-4230-9097-a51824be37ee	true	access.token.claim
3c7eaebd-e713-4230-9097-a51824be37ee	clientHost	claim.name
3c7eaebd-e713-4230-9097-a51824be37ee	String	jsonType.label
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	clientAddress	user.session.note
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	true	id.token.claim
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	true	access.token.claim
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	clientAddress	claim.name
c2b5ac9d-ea1c-4d79-9139-87617e31d9df	String	jsonType.label
69155e8a-f1e0-4910-9664-31a2e140e428	clientId	user.session.note
69155e8a-f1e0-4910-9664-31a2e140e428	true	id.token.claim
69155e8a-f1e0-4910-9664-31a2e140e428	true	access.token.claim
69155e8a-f1e0-4910-9664-31a2e140e428	clientId	claim.name
69155e8a-f1e0-4910-9664-31a2e140e428	String	jsonType.label
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	clientHost	user.session.note
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	true	id.token.claim
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	true	access.token.claim
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	clientHost	claim.name
d4fc085c-fe6e-45ac-bc31-29ac1d66ada2	String	jsonType.label
523a5a6a-d0f4-49df-8546-9d452c658a15	clientAddress	user.session.note
523a5a6a-d0f4-49df-8546-9d452c658a15	true	id.token.claim
523a5a6a-d0f4-49df-8546-9d452c658a15	true	access.token.claim
523a5a6a-d0f4-49df-8546-9d452c658a15	clientAddress	claim.name
523a5a6a-d0f4-49df-8546-9d452c658a15	String	jsonType.label
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	clientId	user.session.note
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	true	id.token.claim
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	true	access.token.claim
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	clientId	claim.name
7d331fb0-166b-4f91-b425-a4b1d6dfc8ef	String	jsonType.label
4863b5a9-b76c-49d0-add0-edb3d3217491	clientHost	user.session.note
4863b5a9-b76c-49d0-add0-edb3d3217491	true	id.token.claim
4863b5a9-b76c-49d0-add0-edb3d3217491	true	access.token.claim
4863b5a9-b76c-49d0-add0-edb3d3217491	clientHost	claim.name
4863b5a9-b76c-49d0-add0-edb3d3217491	String	jsonType.label
3c101c56-ec44-4c66-be42-4d2a12b213af	clientAddress	user.session.note
3c101c56-ec44-4c66-be42-4d2a12b213af	true	id.token.claim
3c101c56-ec44-4c66-be42-4d2a12b213af	true	access.token.claim
3c101c56-ec44-4c66-be42-4d2a12b213af	clientAddress	claim.name
3c101c56-ec44-4c66-be42-4d2a12b213af	String	jsonType.label
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	clientId	user.session.note
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	true	id.token.claim
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	true	access.token.claim
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	clientId	claim.name
9f55dc8a-f1ea-41d1-ab42-3a12ba1940db	String	jsonType.label
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	clientHost	user.session.note
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	true	id.token.claim
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	true	access.token.claim
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	clientHost	claim.name
1f738670-4a5d-4d6a-b8d1-6f4042fdd96f	String	jsonType.label
7a914e81-2202-4e64-95fb-b0b2766af674	clientAddress	user.session.note
7a914e81-2202-4e64-95fb-b0b2766af674	true	id.token.claim
7a914e81-2202-4e64-95fb-b0b2766af674	true	access.token.claim
7a914e81-2202-4e64-95fb-b0b2766af674	clientAddress	claim.name
7a914e81-2202-4e64-95fb-b0b2766af674	String	jsonType.label
1bf9809c-5745-4b39-bf40-e8a427093423	clientId	user.session.note
1bf9809c-5745-4b39-bf40-e8a427093423	true	id.token.claim
1bf9809c-5745-4b39-bf40-e8a427093423	true	access.token.claim
1bf9809c-5745-4b39-bf40-e8a427093423	clientId	claim.name
1bf9809c-5745-4b39-bf40-e8a427093423	String	jsonType.label
5f6778f9-f527-4a19-a547-fbde97ebedc9	clientHost	user.session.note
5f6778f9-f527-4a19-a547-fbde97ebedc9	true	id.token.claim
5f6778f9-f527-4a19-a547-fbde97ebedc9	true	access.token.claim
5f6778f9-f527-4a19-a547-fbde97ebedc9	clientHost	claim.name
5f6778f9-f527-4a19-a547-fbde97ebedc9	String	jsonType.label
73f201f8-8c39-42ed-9062-2dd9604b3072	clientAddress	user.session.note
73f201f8-8c39-42ed-9062-2dd9604b3072	true	id.token.claim
73f201f8-8c39-42ed-9062-2dd9604b3072	true	access.token.claim
73f201f8-8c39-42ed-9062-2dd9604b3072	clientAddress	claim.name
73f201f8-8c39-42ed-9062-2dd9604b3072	String	jsonType.label
d15f449f-d853-4eef-b545-c13f8018a694	/**\n * Available variables: \n * user - the current user\n * realm - the current realm\n * token - the current token\n * userSession - the current userSession\n * keycloakSession - the current userSession\n */\n\n\nvar client = keycloakSession.getContext().getClient();\ntoken.getOtherClaims().put("client_public_id", client.getId());\ntoken.getOtherClaims().put("client_name", client.getName());	script
19e08ff3-1e1b-402a-9bc5-fb00b6771449	clientId	user.session.note
19e08ff3-1e1b-402a-9bc5-fb00b6771449	true	id.token.claim
19e08ff3-1e1b-402a-9bc5-fb00b6771449	true	access.token.claim
19e08ff3-1e1b-402a-9bc5-fb00b6771449	clientId	claim.name
19e08ff3-1e1b-402a-9bc5-fb00b6771449	String	jsonType.label
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	clientHost	user.session.note
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	true	id.token.claim
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	true	access.token.claim
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	clientHost	claim.name
7d8bbc71-d3fc-4ccc-878b-c1844252d4d2	String	jsonType.label
aa241079-ce41-4855-b0aa-bc0dee136a7d	clientAddress	user.session.note
aa241079-ce41-4855-b0aa-bc0dee136a7d	true	id.token.claim
aa241079-ce41-4855-b0aa-bc0dee136a7d	true	access.token.claim
aa241079-ce41-4855-b0aa-bc0dee136a7d	clientAddress	claim.name
aa241079-ce41-4855-b0aa-bc0dee136a7d	String	jsonType.label
2983e1bc-4d52-4a50-b70b-d4a00306a729	true	userinfo.token.claim
2983e1bc-4d52-4a50-b70b-d4a00306a729	username	user.attribute
2983e1bc-4d52-4a50-b70b-d4a00306a729	true	id.token.claim
2983e1bc-4d52-4a50-b70b-d4a00306a729	true	access.token.claim
2983e1bc-4d52-4a50-b70b-d4a00306a729	upn	claim.name
2983e1bc-4d52-4a50-b70b-d4a00306a729	String	jsonType.label
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	true	multivalued
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	foo	user.attribute
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	true	id.token.claim
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	true	access.token.claim
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	groups	claim.name
c7b7f925-4e8c-4a75-9bf4-18d41dee2ccc	String	jsonType.label
0b665327-3789-4cc0-9841-53979795f614	true	userinfo.token.claim
0b665327-3789-4cc0-9841-53979795f614	username	user.attribute
0b665327-3789-4cc0-9841-53979795f614	true	id.token.claim
0b665327-3789-4cc0-9841-53979795f614	true	access.token.claim
0b665327-3789-4cc0-9841-53979795f614	upn	claim.name
0b665327-3789-4cc0-9841-53979795f614	String	jsonType.label
7143325b-1781-4c71-9d37-231ff7263171	true	multivalued
7143325b-1781-4c71-9d37-231ff7263171	foo	user.attribute
7143325b-1781-4c71-9d37-231ff7263171	true	id.token.claim
7143325b-1781-4c71-9d37-231ff7263171	true	access.token.claim
7143325b-1781-4c71-9d37-231ff7263171	groups	claim.name
7143325b-1781-4c71-9d37-231ff7263171	String	jsonType.label
\.


--
-- TOC entry 5931 (class 0 OID 31481)
-- Dependencies: 842
-- Data for Name: realm; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
europeana	60	300	300	\N	\N	\N	t	f	0	\N	europeana	0	hashAlgorithm(BCrypt)	t	t	t	f	ALL	1800	36000	f	t	88675175-4471-4df5-ba92-d12ab7544805	1800	f	\N	t	f	f	t	0	1	30	6	HmacSHA1	totp	a03a8a52-970c-47a1-9095-c6d0246476f5	0f41213d-849b-4205-98a3-04922e0fe3b3	870de973-d16d-4809-8384-7bc8d68ecc16	b12388fa-bd6d-4875-943b-51bdab7e9660	6788a340-fef8-4a43-8e24-142316e35606	2592000	f	900	t	f	0a264efb-aefe-4210-80fa-aaea1a19ad59	0	f	0	0
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	d68dfd58-f240-4f3c-969b-3ddaba565ad3	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	7e975b8f-1c39-4ee0-9b77-0adcbb208e84	52f6be4d-d8b6-406d-b09a-b5893aaa9acd	67337147-77da-4ee8-9f74-ef6a75ee4fff	d4e707a4-bc9c-4420-a401-93c2a8de63b0	a1f08246-5f85-4ff5-903e-2344f4be5b8e	2592000	f	900	t	f	0e6d85e9-1d3f-49e8-82dd-bacc47323ac6	0	f	0	0
\.


--
-- TOC entry 5932 (class 0 OID 31489)
-- Dependencies: 843
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		europeana
_browser_header.xContentTypeOptions	nosniff	europeana
_browser_header.xRobotsTag	none	europeana
_browser_header.xFrameOptions	SAMEORIGIN	europeana
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	europeana
_browser_header.xXSSProtection	1; mode=block	europeana
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	europeana
permanentLockout	false	europeana
maxFailureWaitSeconds	900	europeana
minimumQuickLoginWaitSeconds	60	europeana
waitIncrementSeconds	60	europeana
quickLoginCheckMilliSeconds	1000	europeana
maxDeltaTimeSeconds	43200	europeana
failureFactor	30	europeana
offlineSessionMaxLifespanEnabled	false	europeana
offlineSessionMaxLifespan	5184000	europeana
actionTokenGeneratedByAdminLifespan	43200	europeana
actionTokenGeneratedByUserLifespan	300	europeana
bruteForceProtected	true	europeana
\.


--
-- TOC entry 5933 (class 0 OID 31497)
-- Dependencies: 844
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 5934 (class 0 OID 31502)
-- Dependencies: 845
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_default_roles (realm_id, role_id) FROM stdin;
master	71efe347-ce76-4771-84f4-368e018015b7
master	d2a303ba-574c-42a4-a742-a3a34acd893c
europeana	5751631d-ba5f-47fb-8f3e-f63c4d7cc591
europeana	187edf4f-9946-47d1-b36b-818c11db3933
\.


--
-- TOC entry 5935 (class 0 OID 31507)
-- Dependencies: 846
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- TOC entry 5936 (class 0 OID 31512)
-- Dependencies: 847
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
europeana	jboss-logging
\.


--
-- TOC entry 5937 (class 0 OID 31517)
-- Dependencies: 848
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	europeana
\.


--
-- TOC entry 5938 (class 0 OID 31525)
-- Dependencies: 849
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_smtp_config (realm_id, value, name) FROM stdin;
europeana	aP+lmpP:PtOP	password
europeana		starttls
europeana	true	auth
europeana	26	port
europeana	mail.europeana.eu	host
europeana	api@europeana.eu	from
europeana	Europeana	fromDisplayName
europeana		ssl
europeana	api-test-5	user
\.


--
-- TOC entry 5939 (class 0 OID 31533)
-- Dependencies: 850
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 5940 (class 0 OID 31538)
-- Dependencies: 851
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".redirect_uris (client_id, value) FROM stdin;
09ab961e-d779-415b-81c8-0582944caa94	*
ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	*
6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	*
4d54e474-c726-4c05-97e4-6c0d7207f65d	*
7d552182-500c-4122-9c36-769393ca1459	https://www.runscope.com
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	/admin/europeana/console/*
4f554b64-0b22-4194-8660-fac7fb017194	/realms/europeana/account/*
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	/admin/master/console/*
a959f8ad-8aa3-4c2e-a766-4779b264f9dd	/realms/master/account/*
438c39cb-cb57-4543-acca-966e0d9d0eea	/realms/europeana/account/*
69dae4f1-2dde-437a-8172-70f60fd37f6f	/realms/master/account/*
\.


--
-- TOC entry 5941 (class 0 OID 31543)
-- Dependencies: 852
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 5942 (class 0 OID 31551)
-- Dependencies: 853
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
77a21b08-e853-44b8-8520-60923c72a69d	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
4a433d75-2205-4499-98ae-781a0fe53998	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
b4f82c97-94de-4a85-a8d9-71c1109d3cf2	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
7feb74f6-6a25-402a-ada6-7fe82a5841fb	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
382f1c8a-9950-472b-8a1e-ff3c494d708f	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
39a7ce86-d676-4567-ac8d-13b4f8479679	VERIFY_EMAIL	Verify Email	europeana	t	f	VERIFY_EMAIL	50
f35a197c-bd70-4461-8fc4-b0eb7dcd95df	UPDATE_PROFILE	Update Profile	europeana	t	f	UPDATE_PROFILE	40
b69a8cba-8a1a-43b8-98d5-15180036df82	CONFIGURE_TOTP	Configure OTP	europeana	t	f	CONFIGURE_TOTP	10
d6ee5067-af6f-43b6-a93a-d19b84b0d614	UPDATE_PASSWORD	Update Password	europeana	t	f	UPDATE_PASSWORD	30
84c3b715-c0ed-4105-8d58-ac1b4df64185	terms_and_conditions	Terms and Conditions	europeana	f	f	terms_and_conditions	20
c49a4cc5-98f6-4350-9faa-8ab99cd87971	update_user_locale	Update User Locale	europeana	t	f	update_user_locale	1000
ad739174-baa9-4a84-9b78-87c86a3c06be	update_user_locale	Update User Locale	master	t	f	update_user_locale	1000
\.


--
-- TOC entry 5943 (class 0 OID 31559)
-- Dependencies: 854
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 5944 (class 0 OID 31567)
-- Dependencies: 855
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 5945 (class 0 OID 31572)
-- Dependencies: 856
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 5946 (class 0 OID 31577)
-- Dependencies: 857
-- Data for Name: resource_server; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	t	0	1
7d552182-500c-4122-9c36-769393ca1459	t	0	1
\.


--
-- TOC entry 5947 (class 0 OID 31582)
-- Dependencies: 858
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 5948 (class 0 OID 31590)
-- Dependencies: 859
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
88c1dd99-6b73-40db-98be-7de463a7adb1	Default Policy	A policy that grants access only for users within this realm	js	0	0	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
89cf5b05-6ee0-4b1f-8efa-7d689e29dd5a	Default Permission	A permission that applies to the default resource type	resource	1	0	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	\N
cb9c9022-a9ea-46d4-9e79-aacf921a1880	Default Policy	A policy that grants access only for users within this realm	js	0	0	7d552182-500c-4122-9c36-769393ca1459	\N
1b2e724c-2326-4f6d-9ba7-01b3e0c68454	Default Permission	A permission that applies to the default resource type	resource	1	0	7d552182-500c-4122-9c36-769393ca1459	\N
\.


--
-- TOC entry 5949 (class 0 OID 31598)
-- Dependencies: 860
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
1a922843-f38e-40fb-9836-935c189ef653	Default Resource	urn:api-key-service:resources:default	\N	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	f	\N
2fdc7caf-2a4a-4720-9246-02e85bd92fda	Default Resource	urn:pingdom-runscope:resources:default	\N	7d552182-500c-4122-9c36-769393ca1459	7d552182-500c-4122-9c36-769393ca1459	f	\N
\.


--
-- TOC entry 5950 (class 0 OID 31606)
-- Dependencies: 861
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 5951 (class 0 OID 31614)
-- Dependencies: 862
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".resource_uris (resource_id, value) FROM stdin;
1a922843-f38e-40fb-9836-935c189ef653	/*
2fdc7caf-2a4a-4720-9246-02e85bd92fda	/*
\.


--
-- TOC entry 5952 (class 0 OID 31619)
-- Dependencies: 863
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 5953 (class 0 OID 31627)
-- Dependencies: 864
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".scope_mapping (client_id, role_id) FROM stdin;
abc3f077-c602-4a5b-ab3c-3cf5abb64f13	2a905708-fc40-4c3b-9a3b-4d857ea266b6
438c39cb-cb57-4543-acca-966e0d9d0eea	e5181123-9fd0-4bfd-86d2-8fb4a751e773
69dae4f1-2dde-437a-8172-70f60fd37f6f	47b857f5-4aa2-4863-841c-d447d0369bd9
\.


--
-- TOC entry 5954 (class 0 OID 31632)
-- Dependencies: 865
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 5955 (class 0 OID 31637)
-- Dependencies: 866
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- TOC entry 5956 (class 0 OID 31645)
-- Dependencies: 867
-- Data for Name: user_consent; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 5957 (class 0 OID 31653)
-- Dependencies: 868
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 5958 (class 0 OID 31658)
-- Dependencies: 869
-- Data for Name: user_entity; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
1ee40e06-daa6-4382-9080-531bf7611241	\N	bacc9067-1a61-40a6-9ab2-fcc6a5bf8135	f	t	\N	\N	\N	master	admin	1581342095621	\N	0
006b44ca-8357-43f8-86fa-1bb8eb23715e	service-account-api-key-service@placeholder.org	service-account-api-key-service@placeholder.org	f	t	\N	\N	\N	europeana	service-account-api-key-service	1581433608680	abc3f077-c602-4a5b-ab3c-3cf5abb64f13	1581499173
b9d99ae5-0ab9-4404-9d76-574dcfd885e7	service-account-apidemo@placeholder.org	service-account-apidemo@placeholder.org	f	t	\N	\N	\N	europeana	service-account-apidemo	1581501066808	09ab961e-d779-415b-81c8-0582944caa94	0
46d80c55-7263-4c6c-aeea-af3b9d6b19da	service-account-api2demo@placeholder.org	service-account-api2demo@placeholder.org	f	t	\N	\N	\N	europeana	service-account-api2demo	1581509408418	ce970a0a-6023-4b6b-be97-e0b41fa3ffb7	0
b8d9ea60-70f4-4751-89ed-4eaf361eb736	service-account-rbwpaapq6@placeholder.org	service-account-rbwpaapq6@placeholder.org	f	t	\N	\N	\N	europeana	service-account-rbwpaapq6	1581509632488	6adc6cd5-7e9b-4c1a-9759-086ffb4808bf	0
4df1dfce-46af-4a33-821f-eb913a0604a2	service-account-pbpjb6xtt@placeholder.org	service-account-pbpjb6xtt@placeholder.org	f	t	\N	\N	\N	europeana	service-account-pbpjb6xtt	1581509914256	4d54e474-c726-4c05-97e4-6c0d7207f65d	0
b9cabf84-a4a3-4d14-9847-da6ff58e40d7	api@europeana.eu	api@europeana.eu	t	t	\N	\N	\N	europeana	pingdom-runscope	1583752524985	\N	0
ac623c4c-3219-4427-9ccf-bb974b955f35	service-account-pingdom-runscope@placeholder.org	service-account-pingdom-runscope@placeholder.org	f	t	\N	\N	\N	europeana	service-account-pingdom-runscope	1583752858947	7d552182-500c-4122-9c36-769393ca1459	0
6079dc7c-19ab-4072-816d-e04ea89e7e30	hugo.manguinhas@europeana.eu	hugo.manguinhas@europeana.eu	f	t	\N	Hugo	Manguinhas	europeana	hugo.manguinhas@europeana.eu	1591093388650	\N	0
945cf3ff-9e5b-4451-b52e-c989a7c229bf	hugo.manguinhas@gmail.com	hugo.manguinhas@gmail.com	t	t	\N	Hugo	Manguinhas	europeana	hugo.manguinhas@gmail.com	1591097676456	\N	0
49c77fb4-5254-4d76-9f1b-b04bb2fa8953	richard.doe@europeana.eu	richard.doe@europeana.eu	t	t	\N	Richard	Doe	europeana	richard.doe@europeana.eu	1591109690013	\N	0
\.


--
-- TOC entry 5959 (class 0 OID 31666)
-- Dependencies: 870
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 5960 (class 0 OID 31674)
-- Dependencies: 871
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 5961 (class 0 OID 31682)
-- Dependencies: 872
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 5962 (class 0 OID 31690)
-- Dependencies: 873
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 5963 (class 0 OID 31698)
-- Dependencies: 874
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 5964 (class 0 OID 31703)
-- Dependencies: 875
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_required_action (user_id, required_action) FROM stdin;
6079dc7c-19ab-4072-816d-e04ea89e7e30	VERIFY_EMAIL
\.


--
-- TOC entry 5965 (class 0 OID 31708)
-- Dependencies: 876
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_role_mapping (role_id, user_id) FROM stdin;
47b857f5-4aa2-4863-841c-d447d0369bd9	1ee40e06-daa6-4382-9080-531bf7611241
d2a303ba-574c-42a4-a742-a3a34acd893c	1ee40e06-daa6-4382-9080-531bf7611241
71efe347-ce76-4771-84f4-368e018015b7	1ee40e06-daa6-4382-9080-531bf7611241
5589ed98-b3a9-4a48-955a-59efae257c0f	1ee40e06-daa6-4382-9080-531bf7611241
878db7e7-4a62-46dd-94fc-ad9a427aebd0	1ee40e06-daa6-4382-9080-531bf7611241
187edf4f-9946-47d1-b36b-818c11db3933	006b44ca-8357-43f8-86fa-1bb8eb23715e
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	006b44ca-8357-43f8-86fa-1bb8eb23715e
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	006b44ca-8357-43f8-86fa-1bb8eb23715e
e5181123-9fd0-4bfd-86d2-8fb4a751e773	006b44ca-8357-43f8-86fa-1bb8eb23715e
36b65c8b-3caf-45bb-8d2f-64ca1b0effc1	006b44ca-8357-43f8-86fa-1bb8eb23715e
187edf4f-9946-47d1-b36b-818c11db3933	b9d99ae5-0ab9-4404-9d76-574dcfd885e7
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	b9d99ae5-0ab9-4404-9d76-574dcfd885e7
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	b9d99ae5-0ab9-4404-9d76-574dcfd885e7
e5181123-9fd0-4bfd-86d2-8fb4a751e773	b9d99ae5-0ab9-4404-9d76-574dcfd885e7
2a905708-fc40-4c3b-9a3b-4d857ea266b6	006b44ca-8357-43f8-86fa-1bb8eb23715e
187edf4f-9946-47d1-b36b-818c11db3933	46d80c55-7263-4c6c-aeea-af3b9d6b19da
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	46d80c55-7263-4c6c-aeea-af3b9d6b19da
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	46d80c55-7263-4c6c-aeea-af3b9d6b19da
e5181123-9fd0-4bfd-86d2-8fb4a751e773	46d80c55-7263-4c6c-aeea-af3b9d6b19da
187edf4f-9946-47d1-b36b-818c11db3933	b8d9ea60-70f4-4751-89ed-4eaf361eb736
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	b8d9ea60-70f4-4751-89ed-4eaf361eb736
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	b8d9ea60-70f4-4751-89ed-4eaf361eb736
e5181123-9fd0-4bfd-86d2-8fb4a751e773	b8d9ea60-70f4-4751-89ed-4eaf361eb736
187edf4f-9946-47d1-b36b-818c11db3933	4df1dfce-46af-4a33-821f-eb913a0604a2
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	4df1dfce-46af-4a33-821f-eb913a0604a2
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	4df1dfce-46af-4a33-821f-eb913a0604a2
e5181123-9fd0-4bfd-86d2-8fb4a751e773	4df1dfce-46af-4a33-821f-eb913a0604a2
187edf4f-9946-47d1-b36b-818c11db3933	b9cabf84-a4a3-4d14-9847-da6ff58e40d7
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	b9cabf84-a4a3-4d14-9847-da6ff58e40d7
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	b9cabf84-a4a3-4d14-9847-da6ff58e40d7
e5181123-9fd0-4bfd-86d2-8fb4a751e773	b9cabf84-a4a3-4d14-9847-da6ff58e40d7
187edf4f-9946-47d1-b36b-818c11db3933	ac623c4c-3219-4427-9ccf-bb974b955f35
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	ac623c4c-3219-4427-9ccf-bb974b955f35
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	ac623c4c-3219-4427-9ccf-bb974b955f35
e5181123-9fd0-4bfd-86d2-8fb4a751e773	ac623c4c-3219-4427-9ccf-bb974b955f35
67be1a70-f465-4d6a-9b3f-d89fb65d985f	ac623c4c-3219-4427-9ccf-bb974b955f35
187edf4f-9946-47d1-b36b-818c11db3933	6079dc7c-19ab-4072-816d-e04ea89e7e30
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	6079dc7c-19ab-4072-816d-e04ea89e7e30
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	6079dc7c-19ab-4072-816d-e04ea89e7e30
e5181123-9fd0-4bfd-86d2-8fb4a751e773	6079dc7c-19ab-4072-816d-e04ea89e7e30
187edf4f-9946-47d1-b36b-818c11db3933	945cf3ff-9e5b-4451-b52e-c989a7c229bf
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	945cf3ff-9e5b-4451-b52e-c989a7c229bf
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	945cf3ff-9e5b-4451-b52e-c989a7c229bf
e5181123-9fd0-4bfd-86d2-8fb4a751e773	945cf3ff-9e5b-4451-b52e-c989a7c229bf
187edf4f-9946-47d1-b36b-818c11db3933	49c77fb4-5254-4d76-9f1b-b04bb2fa8953
5751631d-ba5f-47fb-8f3e-f63c4d7cc591	49c77fb4-5254-4d76-9f1b-b04bb2fa8953
9b1a416a-eb57-4bd4-a3e0-f1fe61742f3e	49c77fb4-5254-4d76-9f1b-b04bb2fa8953
e5181123-9fd0-4bfd-86d2-8fb4a751e773	49c77fb4-5254-4d76-9f1b-b04bb2fa8953
\.


--
-- TOC entry 5966 (class 0 OID 31713)
-- Dependencies: 877
-- Data for Name: user_session; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- TOC entry 5967 (class 0 OID 31721)
-- Dependencies: 878
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".user_session_note (user_session, name, value) FROM stdin;
\.


--
-- TOC entry 5968 (class 0 OID 31729)
-- Dependencies: 879
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 5969 (class 0 OID 31737)
-- Dependencies: 880
-- Data for Name: web_origins; Type: TABLE DATA; Schema: keycloakprod-v10; Owner: europeana
--

COPY "keycloakprod-v10".web_origins (client_id, value) FROM stdin;
3c9962a9-89ae-437c-9f95-2c2a059f3ca6	+
3366d8e3-389c-46a4-99cb-8aa32bacaf3b	+
\.


--
-- TOC entry 5565 (class 2606 OID 31113)
-- Name: admin_event_entity admin_event_entity_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".admin_event_entity
    ADD CONSTRAINT admin_event_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 5567 (class 2606 OID 31118)
-- Name: associated_policy associated_policy_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".associated_policy
    ADD CONSTRAINT associated_policy_pkey PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 5569 (class 2606 OID 31123)
-- Name: authentication_execution authentication_execution_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".authentication_execution
    ADD CONSTRAINT authentication_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 5571 (class 2606 OID 31131)
-- Name: authentication_flow authentication_flow_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".authentication_flow
    ADD CONSTRAINT authentication_flow_pkey PRIMARY KEY (id);


--
-- TOC entry 5575 (class 2606 OID 31144)
-- Name: authenticator_config_entry authenticator_config_entry_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".authenticator_config_entry
    ADD CONSTRAINT authenticator_config_entry_pkey PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 5573 (class 2606 OID 31136)
-- Name: authenticator_config authenticator_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".authenticator_config
    ADD CONSTRAINT authenticator_config_pkey PRIMARY KEY (id);


--
-- TOC entry 5577 (class 2606 OID 31152)
-- Name: broker_link broker_link_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".broker_link
    ADD CONSTRAINT broker_link_pkey PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 5581 (class 2606 OID 31168)
-- Name: client_attributes client_attributes_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_attributes
    ADD CONSTRAINT client_attributes_pkey PRIMARY KEY (client_id, name);


--
-- TOC entry 5583 (class 2606 OID 31173)
-- Name: client_auth_flow_bindings client_auth_flow_bindings_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_auth_flow_bindings
    ADD CONSTRAINT client_auth_flow_bindings_pkey PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 5585 (class 2606 OID 31178)
-- Name: client_default_roles client_default_roles_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_default_roles
    ADD CONSTRAINT client_default_roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5587 (class 2606 OID 31183)
-- Name: client_initial_access client_initial_access_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_initial_access
    ADD CONSTRAINT client_initial_access_pkey PRIMARY KEY (id);


--
-- TOC entry 5589 (class 2606 OID 31188)
-- Name: client_node_registrations client_node_registrations_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_node_registrations
    ADD CONSTRAINT client_node_registrations_pkey PRIMARY KEY (client_id, name);


--
-- TOC entry 5579 (class 2606 OID 31160)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 5593 (class 2606 OID 31204)
-- Name: client_scope_attributes client_scope_attributes_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_scope_attributes
    ADD CONSTRAINT client_scope_attributes_pkey PRIMARY KEY (scope_id, name);


--
-- TOC entry 5595 (class 2606 OID 31209)
-- Name: client_scope_client client_scope_client_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_scope_client
    ADD CONSTRAINT client_scope_client_pkey PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 5591 (class 2606 OID 31196)
-- Name: client_scope client_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_scope
    ADD CONSTRAINT client_scope_pkey PRIMARY KEY (id);


--
-- TOC entry 5597 (class 2606 OID 31214)
-- Name: client_scope_role_mapping client_scope_role_mapping_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_scope_role_mapping
    ADD CONSTRAINT client_scope_role_mapping_pkey PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 5601 (class 2606 OID 31227)
-- Name: client_session_auth_status client_session_auth_status_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_session_auth_status
    ADD CONSTRAINT client_session_auth_status_pkey PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 5603 (class 2606 OID 31235)
-- Name: client_session_note client_session_note_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_session_note
    ADD CONSTRAINT client_session_note_pkey PRIMARY KEY (client_session, name);


--
-- TOC entry 5599 (class 2606 OID 31222)
-- Name: client_session client_session_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_session
    ADD CONSTRAINT client_session_pkey PRIMARY KEY (id);


--
-- TOC entry 5605 (class 2606 OID 31240)
-- Name: client_session_prot_mapper client_session_prot_mapper_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_session_prot_mapper
    ADD CONSTRAINT client_session_prot_mapper_pkey PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 5607 (class 2606 OID 31245)
-- Name: client_session_role client_session_role_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_session_role
    ADD CONSTRAINT client_session_role_pkey PRIMARY KEY (client_session, role_id);


--
-- TOC entry 5609 (class 2606 OID 31253)
-- Name: client_user_session_note client_user_session_note_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".client_user_session_note
    ADD CONSTRAINT client_user_session_note_pkey PRIMARY KEY (client_session, name);


--
-- TOC entry 5613 (class 2606 OID 31269)
-- Name: component_config component_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".component_config
    ADD CONSTRAINT component_config_pkey PRIMARY KEY (id);


--
-- TOC entry 5611 (class 2606 OID 31261)
-- Name: component component_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".component
    ADD CONSTRAINT component_pkey PRIMARY KEY (id);


--
-- TOC entry 5615 (class 2606 OID 31274)
-- Name: composite_role composite_role_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".composite_role
    ADD CONSTRAINT composite_role_pkey PRIMARY KEY (composite, child_role);


--
-- TOC entry 5619 (class 2606 OID 31290)
-- Name: credential_attribute credential_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".credential_attribute
    ADD CONSTRAINT credential_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5617 (class 2606 OID 31282)
-- Name: credential credential_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".credential
    ADD CONSTRAINT credential_pkey PRIMARY KEY (id);


--
-- TOC entry 5621 (class 2606 OID 31301)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 5623 (class 2606 OID 31306)
-- Name: default_client_scope default_client_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".default_client_scope
    ADD CONSTRAINT default_client_scope_pkey PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 5625 (class 2606 OID 31314)
-- Name: event_entity event_entity_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".event_entity
    ADD CONSTRAINT event_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 5627 (class 2606 OID 31322)
-- Name: fed_user_attribute fed_user_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_attribute
    ADD CONSTRAINT fed_user_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5631 (class 2606 OID 31335)
-- Name: fed_user_consent_cl_scope fed_user_consent_cl_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_consent_cl_scope
    ADD CONSTRAINT fed_user_consent_cl_scope_pkey PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 5629 (class 2606 OID 31330)
-- Name: fed_user_consent fed_user_consent_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_consent
    ADD CONSTRAINT fed_user_consent_pkey PRIMARY KEY (id);


--
-- TOC entry 5633 (class 2606 OID 31343)
-- Name: fed_user_credential fed_user_credential_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_credential
    ADD CONSTRAINT fed_user_credential_pkey PRIMARY KEY (id);


--
-- TOC entry 5635 (class 2606 OID 31348)
-- Name: fed_user_group_membership fed_user_group_membership_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_group_membership
    ADD CONSTRAINT fed_user_group_membership_pkey PRIMARY KEY (group_id, user_id);


--
-- TOC entry 5637 (class 2606 OID 31356)
-- Name: fed_user_required_action fed_user_required_action_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_required_action
    ADD CONSTRAINT fed_user_required_action_pkey PRIMARY KEY (required_action, user_id);


--
-- TOC entry 5639 (class 2606 OID 31361)
-- Name: fed_user_role_mapping fed_user_role_mapping_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".fed_user_role_mapping
    ADD CONSTRAINT fed_user_role_mapping_pkey PRIMARY KEY (role_id, user_id);


--
-- TOC entry 5641 (class 2606 OID 31369)
-- Name: federated_identity federated_identity_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".federated_identity
    ADD CONSTRAINT federated_identity_pkey PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 5643 (class 2606 OID 31377)
-- Name: federated_user federated_user_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".federated_user
    ADD CONSTRAINT federated_user_pkey PRIMARY KEY (id);


--
-- TOC entry 5645 (class 2606 OID 31385)
-- Name: group_attribute group_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".group_attribute
    ADD CONSTRAINT group_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5647 (class 2606 OID 31390)
-- Name: group_role_mapping group_role_mapping_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".group_role_mapping
    ADD CONSTRAINT group_role_mapping_pkey PRIMARY KEY (role_id, group_id);


--
-- TOC entry 5651 (class 2606 OID 31406)
-- Name: identity_provider_config identity_provider_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".identity_provider_config
    ADD CONSTRAINT identity_provider_config_pkey PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 5653 (class 2606 OID 31414)
-- Name: identity_provider_mapper identity_provider_mapper_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".identity_provider_mapper
    ADD CONSTRAINT identity_provider_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5649 (class 2606 OID 31398)
-- Name: identity_provider identity_provider_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".identity_provider
    ADD CONSTRAINT identity_provider_pkey PRIMARY KEY (internal_id);


--
-- TOC entry 5655 (class 2606 OID 31422)
-- Name: idp_mapper_config idp_mapper_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".idp_mapper_config
    ADD CONSTRAINT idp_mapper_config_pkey PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 5657 (class 2606 OID 31427)
-- Name: keycloak_group keycloak_group_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".keycloak_group
    ADD CONSTRAINT keycloak_group_pkey PRIMARY KEY (id);


--
-- TOC entry 5659 (class 2606 OID 31435)
-- Name: keycloak_role keycloak_role_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".keycloak_role
    ADD CONSTRAINT keycloak_role_pkey PRIMARY KEY (id);


--
-- TOC entry 5661 (class 2606 OID 31440)
-- Name: migration_model migration_model_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".migration_model
    ADD CONSTRAINT migration_model_pkey PRIMARY KEY (id);


--
-- TOC entry 5663 (class 2606 OID 31448)
-- Name: offline_client_session offline_client_session_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".offline_client_session
    ADD CONSTRAINT offline_client_session_pkey PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 5665 (class 2606 OID 31456)
-- Name: offline_user_session offline_user_session_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".offline_user_session
    ADD CONSTRAINT offline_user_session_pkey PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 5667 (class 2606 OID 31464)
-- Name: policy_config policy_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".policy_config
    ADD CONSTRAINT policy_config_pkey PRIMARY KEY (policy_id, name);


--
-- TOC entry 5671 (class 2606 OID 31480)
-- Name: protocol_mapper_config protocol_mapper_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".protocol_mapper_config
    ADD CONSTRAINT protocol_mapper_config_pkey PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 5669 (class 2606 OID 31472)
-- Name: protocol_mapper protocol_mapper_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".protocol_mapper
    ADD CONSTRAINT protocol_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5675 (class 2606 OID 31496)
-- Name: realm_attribute realm_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_attribute
    ADD CONSTRAINT realm_attribute_pkey PRIMARY KEY (name, realm_id);


--
-- TOC entry 5677 (class 2606 OID 31501)
-- Name: realm_default_groups realm_default_groups_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_default_groups
    ADD CONSTRAINT realm_default_groups_pkey PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 5679 (class 2606 OID 31506)
-- Name: realm_default_roles realm_default_roles_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_default_roles
    ADD CONSTRAINT realm_default_roles_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5681 (class 2606 OID 31511)
-- Name: realm_enabled_event_types realm_enabled_event_types_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_enabled_event_types
    ADD CONSTRAINT realm_enabled_event_types_pkey PRIMARY KEY (realm_id, value);


--
-- TOC entry 5683 (class 2606 OID 31516)
-- Name: realm_events_listeners realm_events_listeners_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_events_listeners
    ADD CONSTRAINT realm_events_listeners_pkey PRIMARY KEY (realm_id, value);


--
-- TOC entry 5673 (class 2606 OID 31488)
-- Name: realm realm_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm
    ADD CONSTRAINT realm_pkey PRIMARY KEY (id);


--
-- TOC entry 5685 (class 2606 OID 31524)
-- Name: realm_required_credential realm_required_credential_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_required_credential
    ADD CONSTRAINT realm_required_credential_pkey PRIMARY KEY (realm_id, type);


--
-- TOC entry 5687 (class 2606 OID 31532)
-- Name: realm_smtp_config realm_smtp_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_smtp_config
    ADD CONSTRAINT realm_smtp_config_pkey PRIMARY KEY (realm_id, name);


--
-- TOC entry 5689 (class 2606 OID 31537)
-- Name: realm_supported_locales realm_supported_locales_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".realm_supported_locales
    ADD CONSTRAINT realm_supported_locales_pkey PRIMARY KEY (realm_id, value);


--
-- TOC entry 5691 (class 2606 OID 31542)
-- Name: redirect_uris redirect_uris_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".redirect_uris
    ADD CONSTRAINT redirect_uris_pkey PRIMARY KEY (client_id, value);


--
-- TOC entry 5693 (class 2606 OID 31550)
-- Name: required_action_config required_action_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".required_action_config
    ADD CONSTRAINT required_action_config_pkey PRIMARY KEY (required_action_id, name);


--
-- TOC entry 5695 (class 2606 OID 31558)
-- Name: required_action_provider required_action_provider_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".required_action_provider
    ADD CONSTRAINT required_action_provider_pkey PRIMARY KEY (id);


--
-- TOC entry 5697 (class 2606 OID 31566)
-- Name: resource_attribute resource_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_attribute
    ADD CONSTRAINT resource_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5699 (class 2606 OID 31571)
-- Name: resource_policy resource_policy_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_policy
    ADD CONSTRAINT resource_policy_pkey PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 5701 (class 2606 OID 31576)
-- Name: resource_scope resource_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_scope
    ADD CONSTRAINT resource_scope_pkey PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 5705 (class 2606 OID 31589)
-- Name: resource_server_perm_ticket resource_server_perm_ticket_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_server_perm_ticket
    ADD CONSTRAINT resource_server_perm_ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 5703 (class 2606 OID 31581)
-- Name: resource_server resource_server_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_server
    ADD CONSTRAINT resource_server_pkey PRIMARY KEY (id);


--
-- TOC entry 5707 (class 2606 OID 31597)
-- Name: resource_server_policy resource_server_policy_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_server_policy
    ADD CONSTRAINT resource_server_policy_pkey PRIMARY KEY (name, resource_server_id);


--
-- TOC entry 5709 (class 2606 OID 31605)
-- Name: resource_server_resource resource_server_resource_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_server_resource
    ADD CONSTRAINT resource_server_resource_pkey PRIMARY KEY (name, owner, resource_server_id);


--
-- TOC entry 5711 (class 2606 OID 31613)
-- Name: resource_server_scope resource_server_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_server_scope
    ADD CONSTRAINT resource_server_scope_pkey PRIMARY KEY (name, resource_server_id);


--
-- TOC entry 5713 (class 2606 OID 31618)
-- Name: resource_uris resource_uris_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".resource_uris
    ADD CONSTRAINT resource_uris_pkey PRIMARY KEY (resource_id, value);


--
-- TOC entry 5715 (class 2606 OID 31626)
-- Name: role_attribute role_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".role_attribute
    ADD CONSTRAINT role_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5717 (class 2606 OID 31631)
-- Name: scope_mapping scope_mapping_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".scope_mapping
    ADD CONSTRAINT scope_mapping_pkey PRIMARY KEY (client_id, role_id);


--
-- TOC entry 5719 (class 2606 OID 31636)
-- Name: scope_policy scope_policy_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".scope_policy
    ADD CONSTRAINT scope_policy_pkey PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 5721 (class 2606 OID 31644)
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5725 (class 2606 OID 31657)
-- Name: user_consent_client_scope user_consent_client_scope_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_consent_client_scope
    ADD CONSTRAINT user_consent_client_scope_pkey PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 5723 (class 2606 OID 31652)
-- Name: user_consent user_consent_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_consent
    ADD CONSTRAINT user_consent_pkey PRIMARY KEY (id);


--
-- TOC entry 5727 (class 2606 OID 31665)
-- Name: user_entity user_entity_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_entity
    ADD CONSTRAINT user_entity_pkey PRIMARY KEY (id);


--
-- TOC entry 5729 (class 2606 OID 31673)
-- Name: user_federation_config user_federation_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_federation_config
    ADD CONSTRAINT user_federation_config_pkey PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 5733 (class 2606 OID 31689)
-- Name: user_federation_mapper_config user_federation_mapper_config_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_federation_mapper_config
    ADD CONSTRAINT user_federation_mapper_config_pkey PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 5731 (class 2606 OID 31681)
-- Name: user_federation_mapper user_federation_mapper_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_federation_mapper
    ADD CONSTRAINT user_federation_mapper_pkey PRIMARY KEY (id);


--
-- TOC entry 5735 (class 2606 OID 31697)
-- Name: user_federation_provider user_federation_provider_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_federation_provider
    ADD CONSTRAINT user_federation_provider_pkey PRIMARY KEY (id);


--
-- TOC entry 5737 (class 2606 OID 31702)
-- Name: user_group_membership user_group_membership_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_group_membership
    ADD CONSTRAINT user_group_membership_pkey PRIMARY KEY (group_id, user_id);


--
-- TOC entry 5739 (class 2606 OID 31707)
-- Name: user_required_action user_required_action_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_required_action
    ADD CONSTRAINT user_required_action_pkey PRIMARY KEY (required_action, user_id);


--
-- TOC entry 5741 (class 2606 OID 31712)
-- Name: user_role_mapping user_role_mapping_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_role_mapping
    ADD CONSTRAINT user_role_mapping_pkey PRIMARY KEY (role_id, user_id);


--
-- TOC entry 5745 (class 2606 OID 31728)
-- Name: user_session_note user_session_note_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_session_note
    ADD CONSTRAINT user_session_note_pkey PRIMARY KEY (user_session, name);


--
-- TOC entry 5743 (class 2606 OID 31720)
-- Name: user_session user_session_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".user_session
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (id);


--
-- TOC entry 5747 (class 2606 OID 31736)
-- Name: username_login_failure username_login_failure_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".username_login_failure
    ADD CONSTRAINT username_login_failure_pkey PRIMARY KEY (realm_id, username);


--
-- TOC entry 5749 (class 2606 OID 31741)
-- Name: web_origins web_origins_pkey; Type: CONSTRAINT; Schema: keycloakprod-v10; Owner: europeana
--

ALTER TABLE ONLY "keycloakprod-v10".web_origins
    ADD CONSTRAINT web_origins_pkey PRIMARY KEY (client_id, value);


-- Completed on 2020-06-03 16:44:07 CEST

--
-- PostgreSQL database dump complete
--

