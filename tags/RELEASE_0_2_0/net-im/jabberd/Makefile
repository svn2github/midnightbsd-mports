# New ports collection makefile for:	jabberd
# Date created:				29 December 2003
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/jabberd/Makefile,v 1.2 2007/12/28 20:38:44 laffer1 Exp $
# $FreeBSD: ports/net-im/jabberd/Makefile,v 1.51 2007/10/21 20:56:17 mm Exp $
#

PORTNAME=	jabberd
PORTVERSION=	2.1.20
CATEGORIES=	net-im
MASTER_SITES=	http://ftp.xiaoka.com/jabberd2/releases/
DIST_SUBDIR=	jabber

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Online presence and instant messaging server
LICENSE=	gpl2

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2 \
		idn.16:${PORTSDIR}/dns/libidn

OPTIONS=	MYSQL "Support MySQL (storage/auth/reg)" on \
		POSTGRESQL "Support PostgreSQL (storage/auth/reg)" off \
		LDAP "Support OpenLDAP (storage/auth/reg)" off \
		BDB "Support BerkeleyDB (storage/auth/reg)" off \
		SQLITE "Support SQLite3 (storage/auth/reg)" off \
		PAM "Enable PAM (auth/reg)" off \
		PIPE "Enable pipe (auth/reg)" off \
		ANON "Enable anonymous (auth/reg)" off \
		FS "Filesystem storage (only for testing)" off \
		GSASL "Authenticate via GNU SASL" on \
		CYRUS_SASL "Authenticate via Cyrus SASL" off \
		DEBUG "Compile with debug messages" on

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes
USE_ICONV=	yes
USE_RC_SUBR=	jabberd
USE_LDCONFIG=	${PREFIX}/lib/jabberd
CONFIGURE_ARGS+=	--localstatedir=/var \
		--sysconfdir=${PREFIX}/etc/jabberd \
		--enable-ssl --enable-mio=poll \
		--with-extra-include-path="${LOCALBASE}/include ${EIP}" \
		--with-extra-library-path="${LOCALBASE}/lib ${ELP}"

JABBER_USER=	jabber
JABBER_UID=	93
JABBER_GROUP=	${JABBER_USER}
JABBER_GID=	${JABBER_UID}
JABBER_ETCDIR=	"${PREFIX}/etc/jabberd"
JABBER_RUNDIR=	"/var/jabberd"

SUB_LIST+=	JABBER_USER=${JABBER_USER} JABBER_UID=${JABBER_UID} \
		JABBER_GROUP=${JABBER_GROUP} JABBER_GID=${JABBER_GID} \
		JABBER_ETCDIR="${JABBER_ETCDIR}" \
		JABBER_RUNDIR="${JABBER_RUNDIR}"

SUB_FILES+=	pkg-install pkg-deinstall

PORTDOCS=	*

DOCFILES=	AUTHORS COPYING ChangeLog INSTALL NEWS PROTOCOL README \
		TODO UPGRADE

.include <bsd.port.pre.mk>

ELP+=	${OPENSSLLIB}
EIP+=	${OPENSSLINC}

.if !defined(WITHOUT_DEBUG)
CONFIGURE_ARGS+=--enable-debug
.endif

.if defined(WITH_POSTGRESQL)
USE_PGSQL=	yes
CONFIGURE_ARGS+=--enable-pgsql
PLIST_SUB+=	SUB_PGSQL=""
.else
CONFIGURE_ARGS+=--disable-pgsql
PLIST_SUB+=	SUB_PGSQL="@comment "
.endif

.if defined(WITH_SQLITE)
CONFIGURE_ARGS+=--enable-sqlite
LIB_DEPENDS+=	sqlite3.8:${PORTSDIR}/databases/sqlite3-threads
CFLAGS+=	${PTHREAD_CFLAGS}
PLIST_SUB+=	SUB_SQLITE=""
.else
CONFIGURE_ARGS+=--disable-sqlite
PLIST_SUB+=	SUB_SQLITE="@comment "
.endif

.if !defined(WITHOUT_MYSQL)
USE_MYSQL=	yes
CONFIGURE_ARGS+=--enable-mysql
EIP+=:${LOCALBASE}/include/mysql
ELP+=:${LOCALBASE}/lib/mysql
PLIST_SUB+=	SUB_MYSQL=""
.else
CONFIGURE_ARGS+=--disable-mysql
PLIST_SUB+=	SUB_MYSQL="@comment "
.endif

.if defined(WITH_BDB)
USE_BDB=	41+
CONFIGURE_ARGS+=--enable-db
CONFIGURE_ARGS+=--oldincludedir=/nonexistant
EIP+=:${BDB_INCLUDE_DIR}
ELP+=:${BDB_LIB_DIR}
PLIST_SUB+=	SUB_BDB=""
.else
CONFIGURE_ARGS+=--disable-db
PLIST_SUB+=	SUB_BDB="@comment "
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--enable-ldap
PLIST_SUB+=	SUB_LDAP=""
.else
CONFIGURE_ARGS+=--disable-ldap
PLIST_SUB+=	SUB_LDAP="@comment "
.endif

.if defined(WITH_FS)
CONFIGURE_ARGS+=--enable-fs
PLIST_SUB+=	SUB_FS=""
.else
CONFIGURE_ARGS+=--disable-fs
PLIST_SUB+=	SUB_FS="@comment "
.endif

.if defined(WITH_PAM)
CONFIGURE_ARGS+=--enable-pam
PLIST_SUB+=	SUB_PAM=""
.else
CONFIGURE_ARGS+=--disable-pam
PLIST_SUB+=	SUB_PAM="@comment "
.endif

.if defined(WITH_PIPE)
CONFIGURE_ARGS+=--enable-pipe
PLIST_SUB+=	SUB_PIPE=""
.else
PLIST_SUB+=	SUB_PIPE="@comment "
.endif

.if defined(WITH_ANON)
CONFIGURE_ARGS+=--enable-anon
PLIST_SUB+=	SUB_ANON=""
.else
PLIST_SUB+=	SUB_ANON="@comment "
.endif

.if defined(WITH_GSASL) && defined(WITH_CYRUS_SASL)
IGNORE=	cannot be compiled with both, gsasl and cyrus-sasl. Please (re)run 'make config' and deselect either GSASL or CYRUS_SASL
.elif defined(WITHOUT_GSASL) && !defined(WITH_CYRUS_SASL)
IGNORE=	is useless without a sasl library. Please (re)run 'make config' and choose either GSASL or CYRUS_SASL
.elif defined(WITH_GSASL)
CONFIGURE_ARGS+=	--enable-sasl=gsasl
LIB_DEPENDS+=		gsasl.11:${PORTSDIR}/security/gsasl
.elif defined(WITH_CYRUS_SASL)
CONFIGURE_ARGS+=	--enable-sasl=cyrus
LIB_DEPENDS+=		sasl2.2:${PORTSDIR}/security/cyrus-sasl2
.endif

MAN8=		c2s.8 jabberd.8 resolver.8 router.8 s2s.8 sm.8

post-patch:
	@${REINPLACE_CMD} -e 's|"-lsqlite3|"-lsqlite3 ${PTHREAD_LIBS}|g' \
		${WRKSRC}/configure

post-install:
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${CHOWN} -R ${JABBER_USER}:${JABBER_GROUP} ${PREFIX}/etc/jabberd
	@${FIND} ${PREFIX}/etc/jabberd -type d | ${XARGS} ${CHMOD} 750
	@${FIND} ${PREFIX}/etc/jabberd -type f | ${XARGS} ${CHMOD} 660
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${DOCFILES}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.for FILE in db-setup.mysql db-setup.pgsql db-setup.sqlite
	@${INSTALL_DATA} ${WRKSRC}/tools/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
