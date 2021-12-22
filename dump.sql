--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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

SET default_with_oids = false;

--
-- Name: ofextcomponentconf; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofextcomponentconf (
    subdomain character varying(255) NOT NULL,
    wildcard integer NOT NULL,
    secret character varying(255),
    permission character varying(10) NOT NULL
);


ALTER TABLE public.ofextcomponentconf OWNER TO "user";

--
-- Name: ofgroup; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofgroup (
    groupname character varying(50) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.ofgroup OWNER TO "user";

--
-- Name: ofgroupprop; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofgroupprop (
    groupname character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofgroupprop OWNER TO "user";

--
-- Name: ofgroupuser; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofgroupuser (
    groupname character varying(50) NOT NULL,
    username character varying(100) NOT NULL,
    administrator integer NOT NULL
);


ALTER TABLE public.ofgroupuser OWNER TO "user";

--
-- Name: ofid; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofid (
    idtype integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.ofid OWNER TO "user";

--
-- Name: ofmucaffiliation; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucaffiliation (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation integer NOT NULL
);


ALTER TABLE public.ofmucaffiliation OWNER TO "user";

--
-- Name: ofmucconversationlog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucconversationlog (
    roomid integer NOT NULL,
    messageid integer NOT NULL,
    sender character varying(1024) NOT NULL,
    nickname character varying(255),
    logtime character(15) NOT NULL,
    subject character varying(255),
    body text,
    stanza text
);


ALTER TABLE public.ofmucconversationlog OWNER TO "user";

--
-- Name: ofmucmember; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucmember (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    nickname character varying(255),
    firstname character varying(100),
    lastname character varying(100),
    url character varying(100),
    email character varying(100),
    faqentry character varying(100)
);


ALTER TABLE public.ofmucmember OWNER TO "user";

--
-- Name: ofmucroom; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucroom (
    serviceid integer NOT NULL,
    roomid integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    name character varying(50) NOT NULL,
    naturalname character varying(255) NOT NULL,
    description character varying(255),
    lockeddate character(15) NOT NULL,
    emptydate character(15),
    canchangesubject integer NOT NULL,
    maxusers integer NOT NULL,
    publicroom integer NOT NULL,
    moderated integer NOT NULL,
    membersonly integer NOT NULL,
    caninvite integer NOT NULL,
    roompassword character varying(50),
    candiscoverjid integer NOT NULL,
    logenabled integer NOT NULL,
    subject character varying(100),
    rolestobroadcast integer NOT NULL,
    usereservednick integer NOT NULL,
    canchangenick integer NOT NULL,
    canregister integer NOT NULL,
    allowpm integer,
    fmucenabled integer,
    fmucoutboundnode text,
    fmucoutboundmode integer,
    fmucinboundnodes text
);


ALTER TABLE public.ofmucroom OWNER TO "user";

--
-- Name: ofmucroomprop; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucroomprop (
    roomid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofmucroomprop OWNER TO "user";

--
-- Name: ofmucservice; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucservice (
    serviceid integer NOT NULL,
    subdomain character varying(255) NOT NULL,
    description character varying(255),
    ishidden integer NOT NULL
);


ALTER TABLE public.ofmucservice OWNER TO "user";

--
-- Name: ofmucserviceprop; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofmucserviceprop (
    serviceid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofmucserviceprop OWNER TO "user";

--
-- Name: ofoffline; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofoffline (
    username character varying(64) NOT NULL,
    messageid integer NOT NULL,
    creationdate character(15) NOT NULL,
    messagesize integer NOT NULL,
    stanza text NOT NULL
);


ALTER TABLE public.ofoffline OWNER TO "user";

--
-- Name: ofpresence; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpresence (
    username character varying(64) NOT NULL,
    offlinepresence text,
    offlinedate character varying(15) NOT NULL
);


ALTER TABLE public.ofpresence OWNER TO "user";

--
-- Name: ofprivacylist; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofprivacylist (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    isdefault integer NOT NULL,
    list text NOT NULL
);


ALTER TABLE public.ofprivacylist OWNER TO "user";

--
-- Name: ofproperty; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofproperty (
    name character varying(100) NOT NULL,
    propvalue character varying(4000) NOT NULL,
    encrypted integer,
    iv character(24)
);


ALTER TABLE public.ofproperty OWNER TO "user";

--
-- Name: ofpubsubaffiliation; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubaffiliation (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation character varying(10) NOT NULL
);


ALTER TABLE public.ofpubsubaffiliation OWNER TO "user";

--
-- Name: ofpubsubdefaultconf; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubdefaultconf (
    serviceid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer NOT NULL,
    persistitems integer NOT NULL,
    maxitems integer NOT NULL,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    language character varying(255),
    replypolicy character varying(15),
    associationpolicy character varying(15) NOT NULL,
    maxleafnodes integer NOT NULL
);


ALTER TABLE public.ofpubsubdefaultconf OWNER TO "user";

--
-- Name: ofpubsubitem; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubitem (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    creationdate character(15) NOT NULL,
    payload text
);


ALTER TABLE public.ofpubsubitem OWNER TO "user";

--
-- Name: ofpubsubnode; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubnode (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    parent character varying(100),
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer,
    persistitems integer,
    maxitems integer,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    configsubscription integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    payloadtype character varying(100),
    bodyxslt character varying(100),
    dataformxslt character varying(100),
    creator character varying(1024) NOT NULL,
    description character varying(255),
    language character varying(255),
    name character varying(50),
    replypolicy character varying(15),
    associationpolicy character varying(15),
    maxleafnodes integer
);


ALTER TABLE public.ofpubsubnode OWNER TO "user";

--
-- Name: ofpubsubnodegroups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubnodegroups (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    rostergroup character varying(100) NOT NULL
);


ALTER TABLE public.ofpubsubnodegroups OWNER TO "user";

--
-- Name: ofpubsubnodejids; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubnodejids (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    associationtype character varying(20) NOT NULL
);


ALTER TABLE public.ofpubsubnodejids OWNER TO "user";

--
-- Name: ofpubsubsubscription; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofpubsubsubscription (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    owner character varying(1024) NOT NULL,
    state character varying(15) NOT NULL,
    deliver integer NOT NULL,
    digest integer NOT NULL,
    digest_frequency integer NOT NULL,
    expire character(15),
    includebody integer NOT NULL,
    showvalues character varying(30) NOT NULL,
    subscriptiontype character varying(10) NOT NULL,
    subscriptiondepth integer NOT NULL,
    keyword character varying(200)
);


ALTER TABLE public.ofpubsubsubscription OWNER TO "user";

--
-- Name: ofremoteserverconf; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofremoteserverconf (
    xmppdomain character varying(255) NOT NULL,
    remoteport integer,
    permission character varying(10) NOT NULL
);


ALTER TABLE public.ofremoteserverconf OWNER TO "user";

--
-- Name: ofroster; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofroster (
    rosterid integer NOT NULL,
    username character varying(64) NOT NULL,
    jid character varying(1024) NOT NULL,
    sub integer NOT NULL,
    ask integer NOT NULL,
    recv integer NOT NULL,
    nick character varying(255)
);


ALTER TABLE public.ofroster OWNER TO "user";

--
-- Name: ofrostergroups; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofrostergroups (
    rosterid integer NOT NULL,
    rank integer NOT NULL,
    groupname character varying(255) NOT NULL
);


ALTER TABLE public.ofrostergroups OWNER TO "user";

--
-- Name: ofsaslauthorized; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofsaslauthorized (
    username character varying(64) NOT NULL,
    principal character varying(4000) NOT NULL
);


ALTER TABLE public.ofsaslauthorized OWNER TO "user";

--
-- Name: ofsecurityauditlog; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofsecurityauditlog (
    msgid integer NOT NULL,
    username character varying(64) NOT NULL,
    entrystamp bigint NOT NULL,
    summary character varying(255) NOT NULL,
    node character varying(255) NOT NULL,
    details text
);


ALTER TABLE public.ofsecurityauditlog OWNER TO "user";

--
-- Name: ofuser; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofuser (
    username character varying(64) NOT NULL,
    storedkey character varying(32),
    serverkey character varying(32),
    salt character varying(32),
    iterations integer,
    plainpassword character varying(32),
    encryptedpassword character varying(255),
    name character varying(100),
    email character varying(100),
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL
);


ALTER TABLE public.ofuser OWNER TO "user";

--
-- Name: ofuserflag; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofuserflag (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    starttime character(15),
    endtime character(15)
);


ALTER TABLE public.ofuserflag OWNER TO "user";

--
-- Name: ofuserprop; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofuserprop (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE public.ofuserprop OWNER TO "user";

--
-- Name: ofvcard; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofvcard (
    username character varying(64) NOT NULL,
    vcard text NOT NULL
);


ALTER TABLE public.ofvcard OWNER TO "user";

--
-- Name: ofversion; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ofversion (
    name character varying(50) NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.ofversion OWNER TO "user";

--
-- Data for Name: ofextcomponentconf; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofextcomponentconf (subdomain, wildcard, secret, permission) FROM stdin;
\.


--
-- Data for Name: ofgroup; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofgroup (groupname, description) FROM stdin;
\.


--
-- Data for Name: ofgroupprop; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofgroupprop (groupname, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofgroupuser; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofgroupuser (groupname, username, administrator) FROM stdin;
\.


--
-- Data for Name: ofid; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofid (idtype, id) FROM stdin;
18	1
19	1
23	1
26	2
27	1
25	3
\.


--
-- Data for Name: ofmucaffiliation; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucaffiliation (roomid, jid, affiliation) FROM stdin;
\.


--
-- Data for Name: ofmucconversationlog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucconversationlog (roomid, messageid, sender, nickname, logtime, subject, body, stanza) FROM stdin;
\.


--
-- Data for Name: ofmucmember; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucmember (roomid, jid, nickname, firstname, lastname, url, email, faqentry) FROM stdin;
\.


--
-- Data for Name: ofmucroom; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucroom (serviceid, roomid, creationdate, modificationdate, name, naturalname, description, lockeddate, emptydate, canchangesubject, maxusers, publicroom, moderated, membersonly, caninvite, roompassword, candiscoverjid, logenabled, subject, rolestobroadcast, usereservednick, canchangenick, canregister, allowpm, fmucenabled, fmucoutboundnode, fmucoutboundmode, fmucinboundnodes) FROM stdin;
\.


--
-- Data for Name: ofmucroomprop; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucroomprop (roomid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofmucservice; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucservice (serviceid, subdomain, description, ishidden) FROM stdin;
1	conference	\N	0
\.


--
-- Data for Name: ofmucserviceprop; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofmucserviceprop (serviceid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofoffline; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofoffline (username, messageid, creationdate, messagesize, stanza) FROM stdin;
\.


--
-- Data for Name: ofpresence; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpresence (username, offlinepresence, offlinedate) FROM stdin;
\.


--
-- Data for Name: ofprivacylist; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofprivacylist (username, name, isdefault, list) FROM stdin;
\.


--
-- Data for Name: ofproperty; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofproperty (name, propvalue, encrypted, iv) FROM stdin;
passwordKey	IAGvI0XkW3PePHV	0	\N
xmpp.socket.ssl.active	true	0	\N
provider.admin.className	org.jivesoftware.openfire.admin.DefaultAdminProvider	0	\N
xmpp.domain	e619838dc3b1	0	\N
xmpp.auth.anonymous	false	0	\N
provider.auth.className	org.jivesoftware.openfire.auth.DefaultAuthProvider	0	\N
provider.lockout.className	org.jivesoftware.openfire.lockout.DefaultLockOutProvider	0	\N
provider.group.className	org.jivesoftware.openfire.group.DefaultGroupProvider	0	\N
provider.vcard.className	org.jivesoftware.openfire.vcard.DefaultVCardProvider	0	\N
provider.securityAudit.className	org.jivesoftware.openfire.security.DefaultSecurityAuditProvider	0	\N
provider.user.className	org.jivesoftware.openfire.user.DefaultUserProvider	0	\N
update.lastCheck	1640109258618	0	\N
\.


--
-- Data for Name: ofpubsubaffiliation; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubaffiliation (serviceid, nodeid, jid, affiliation) FROM stdin;
pubsub		e619838dc3b1	owner
\.


--
-- Data for Name: ofpubsubdefaultconf; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubdefaultconf (serviceid, leaf, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, accessmodel, language, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub	1	1	10485760	0	1	1	1	1	0	1	publishers	1	open	English	\N	all	-1
pubsub	0	0	0	0	0	1	1	1	0	0	publishers	1	open	English	\N	all	-1
\.


--
-- Data for Name: ofpubsubitem; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubitem (serviceid, nodeid, id, jid, creationdate, payload) FROM stdin;
\.


--
-- Data for Name: ofpubsubnode; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubnode (serviceid, nodeid, leaf, creationdate, modificationdate, parent, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, configsubscription, accessmodel, payloadtype, bodyxslt, dataformxslt, creator, description, language, name, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub		0	001640109222716	001640109222716	\N	0	0	0	0	1	1	1	0	0	publishers	1	0	open				e619838dc3b1		English		\N	all	-1
\.


--
-- Data for Name: ofpubsubnodegroups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubnodegroups (serviceid, nodeid, rostergroup) FROM stdin;
\.


--
-- Data for Name: ofpubsubnodejids; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubnodejids (serviceid, nodeid, jid, associationtype) FROM stdin;
\.


--
-- Data for Name: ofpubsubsubscription; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofpubsubsubscription (serviceid, nodeid, id, jid, owner, state, deliver, digest, digest_frequency, expire, includebody, showvalues, subscriptiontype, subscriptiondepth, keyword) FROM stdin;
\.


--
-- Data for Name: ofremoteserverconf; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofremoteserverconf (xmppdomain, remoteport, permission) FROM stdin;
\.


--
-- Data for Name: ofroster; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofroster (rosterid, username, jid, sub, ask, recv, nick) FROM stdin;
\.


--
-- Data for Name: ofrostergroups; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofrostergroups (rosterid, rank, groupname) FROM stdin;
\.


--
-- Data for Name: ofsaslauthorized; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofsaslauthorized (username, principal) FROM stdin;
\.


--
-- Data for Name: ofsecurityauditlog; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofsecurityauditlog (msgid, username, entrystamp, summary, node, details) FROM stdin;
1	admin	1640109227281	Successful admin console login attempt	e619838dc3b1	The user logged in successfully to the admin console from address 192.168.96.1. 
2	admin	1640109230934	Successful admin console login attempt	e619838dc3b1	The user logged in successfully to the admin console from address 192.168.96.1. 
\.


--
-- Data for Name: ofuser; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofuser (username, storedkey, serverkey, salt, iterations, plainpassword, encryptedpassword, name, email, creationdate, modificationdate) FROM stdin;
admin	8JWGlLC68B+smjxQd9fGl7qxi7U=	k6QJsMeTj7ps2iJKI4QJTiepXAY=	C2k5rPnt3qogerdxPSdKuzKzLylSRe3i	4096	\N	c0c6e677a8b7546449e33d7df0f5fdfe29f7d01680e4c6bb	Administrator	admin@example.com	001640109219224	0              
\.


--
-- Data for Name: ofuserflag; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofuserflag (username, name, starttime, endtime) FROM stdin;
\.


--
-- Data for Name: ofuserprop; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofuserprop (username, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofvcard; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofvcard (username, vcard) FROM stdin;
\.


--
-- Data for Name: ofversion; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ofversion (name, version) FROM stdin;
openfire	32
\.


--
-- Name: ofextcomponentconf ofextcomponentconf_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofextcomponentconf
    ADD CONSTRAINT ofextcomponentconf_pk PRIMARY KEY (subdomain);


--
-- Name: ofgroup ofgroup_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofgroup
    ADD CONSTRAINT ofgroup_pk PRIMARY KEY (groupname);


--
-- Name: ofgroupprop ofgroupprop_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofgroupprop
    ADD CONSTRAINT ofgroupprop_pk PRIMARY KEY (groupname, name);


--
-- Name: ofgroupuser ofgroupuser_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofgroupuser
    ADD CONSTRAINT ofgroupuser_pk PRIMARY KEY (groupname, username, administrator);


--
-- Name: ofid ofid_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofid
    ADD CONSTRAINT ofid_pk PRIMARY KEY (idtype);


--
-- Name: ofmucaffiliation ofmucaffiliation_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucaffiliation
    ADD CONSTRAINT ofmucaffiliation_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucmember ofmucmember_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucmember
    ADD CONSTRAINT ofmucmember_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucroom ofmucroom_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucroom
    ADD CONSTRAINT ofmucroom_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofmucroomprop ofmucroomprop_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucroomprop
    ADD CONSTRAINT ofmucroomprop_pk PRIMARY KEY (roomid, name);


--
-- Name: ofmucservice ofmucservice_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucservice
    ADD CONSTRAINT ofmucservice_pk PRIMARY KEY (subdomain);


--
-- Name: ofmucserviceprop ofmucserviceprop_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofmucserviceprop
    ADD CONSTRAINT ofmucserviceprop_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofoffline ofoffline_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofoffline
    ADD CONSTRAINT ofoffline_pk PRIMARY KEY (username, messageid);


--
-- Name: ofpresence ofpresence_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpresence
    ADD CONSTRAINT ofpresence_pk PRIMARY KEY (username);


--
-- Name: ofprivacylist ofprivacylist_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofprivacylist
    ADD CONSTRAINT ofprivacylist_pk PRIMARY KEY (username, name);


--
-- Name: ofproperty ofproperty_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofproperty
    ADD CONSTRAINT ofproperty_pk PRIMARY KEY (name);


--
-- Name: ofpubsubaffiliation ofpubsubaffiliation_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubaffiliation
    ADD CONSTRAINT ofpubsubaffiliation_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubdefaultconf ofpubsubdefaultconf_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubdefaultconf
    ADD CONSTRAINT ofpubsubdefaultconf_pk PRIMARY KEY (serviceid, leaf);


--
-- Name: ofpubsubitem ofpubsubitem_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubitem
    ADD CONSTRAINT ofpubsubitem_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofpubsubnode ofpubsubnode_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubnode
    ADD CONSTRAINT ofpubsubnode_pk PRIMARY KEY (serviceid, nodeid);


--
-- Name: ofpubsubnodejids ofpubsubnodejids_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubnodejids
    ADD CONSTRAINT ofpubsubnodejids_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubsubscription ofpubsubsubscription_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofpubsubsubscription
    ADD CONSTRAINT ofpubsubsubscription_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofremoteserverconf ofremoteserverconf_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofremoteserverconf
    ADD CONSTRAINT ofremoteserverconf_pk PRIMARY KEY (xmppdomain);


--
-- Name: ofroster ofroster_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofroster
    ADD CONSTRAINT ofroster_pk PRIMARY KEY (rosterid);


--
-- Name: ofrostergroups ofrostergroups_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofrostergroups
    ADD CONSTRAINT ofrostergroups_pk PRIMARY KEY (rosterid, rank);


--
-- Name: ofsaslauthorized ofsaslauthorized_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofsaslauthorized
    ADD CONSTRAINT ofsaslauthorized_pk PRIMARY KEY (username, principal);


--
-- Name: ofsecurityauditlog ofsecurityauditlog_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofsecurityauditlog
    ADD CONSTRAINT ofsecurityauditlog_pk PRIMARY KEY (msgid);


--
-- Name: ofuser ofuser_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofuser
    ADD CONSTRAINT ofuser_pk PRIMARY KEY (username);


--
-- Name: ofuserflag ofuserflag_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofuserflag
    ADD CONSTRAINT ofuserflag_pk PRIMARY KEY (username, name);


--
-- Name: ofuserprop ofuserprop_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofuserprop
    ADD CONSTRAINT ofuserprop_pk PRIMARY KEY (username, name);


--
-- Name: ofvcard ofvcard_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofvcard
    ADD CONSTRAINT ofvcard_pk PRIMARY KEY (username);


--
-- Name: ofversion ofversion_pk; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofversion
    ADD CONSTRAINT ofversion_pk PRIMARY KEY (name);


--
-- Name: ofmucconversationlog_msg_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofmucconversationlog_msg_id ON public.ofmucconversationlog USING btree (messageid);


--
-- Name: ofmucconversationlog_time_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofmucconversationlog_time_idx ON public.ofmucconversationlog USING btree (logtime);


--
-- Name: ofmucroom_roomid_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofmucroom_roomid_idx ON public.ofmucroom USING btree (roomid);


--
-- Name: ofmucroom_serviceid_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofmucroom_serviceid_idx ON public.ofmucroom USING btree (serviceid);


--
-- Name: ofmucservice_serviceid_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofmucservice_serviceid_idx ON public.ofmucservice USING btree (serviceid);


--
-- Name: ofprivacylist_default_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofprivacylist_default_idx ON public.ofprivacylist USING btree (username, isdefault);


--
-- Name: ofpubsubnodegroups_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofpubsubnodegroups_idx ON public.ofpubsubnodegroups USING btree (serviceid, nodeid);


--
-- Name: ofroster_jid_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofroster_jid_idx ON public.ofroster USING btree (jid);


--
-- Name: ofroster_username_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofroster_username_idx ON public.ofroster USING btree (username);


--
-- Name: ofrostergroups_rosterid_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofrostergroups_rosterid_idx ON public.ofrostergroups USING btree (rosterid);


--
-- Name: ofsecurityauditlog_tstamp_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofsecurityauditlog_tstamp_idx ON public.ofsecurityauditlog USING btree (entrystamp);


--
-- Name: ofsecurityauditlog_uname_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofsecurityauditlog_uname_idx ON public.ofsecurityauditlog USING btree (username);


--
-- Name: ofuser_cdate_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofuser_cdate_idx ON public.ofuser USING btree (creationdate);


--
-- Name: ofuserflag_etime_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofuserflag_etime_idx ON public.ofuserflag USING btree (endtime);


--
-- Name: ofuserflag_stime_idx; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ofuserflag_stime_idx ON public.ofuserflag USING btree (starttime);


--
-- Name: ofrostergroups ofrostergroups_rosterid_fk; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ofrostergroups
    ADD CONSTRAINT ofrostergroups_rosterid_fk FOREIGN KEY (rosterid) REFERENCES public.ofroster(rosterid) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

