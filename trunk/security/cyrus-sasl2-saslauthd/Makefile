# $MidnightBSD$

PORTNAME=	saslauthd
PORTVERSION=	2.1.26
CATEGORIES=	security ipv6
MASTER_SITES=	ftp://ftp.andrew.cmu.edu/pub/cyrus-mail/%SUBDIR%/ \
		ftp://ftp.westbend.net/pub/cyrus-mail/%SUBDIR%/ \
		http://www.transit.hanse.de/mirror/ftp.andrew.cmu.edu/pub/cyrus-mail/%SUBDIR%/
MASTER_SITE_SUBDIR=	. OLD-VERSIONS/sasl
PKGNAMEPREFIX=	cyrus-sasl-
DISTNAME=	${PKGNAMEPREFIX}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SASL authentication server for cyrus-sasl2

LICENSE=	bsd4

LIB_DEPENDS=	libsasl2.so:${PORTSDIR}/security/cyrus-sasl2

CYRUS_SASL2_DIR=${MASTERDIR}/../cyrus-sasl2
HASH_FILE=	${CYRUS_SASL2_DIR}/distinfo
PATCHDIR=	${CYRUS_SASL2_DIR}/files
INSTALL_WRKSRC=	${WRKDIR}/${DISTNAME}/saslauthd
DOCSDIR=	${PREFIX}/share/doc/cyrus-sasl2

USE_RC_SUBR=	saslauthd.sh

USE_OPENSSL=	yes
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc \
		--with-plugindir=${PREFIX}/lib/sasl2 \
		--with-dbpath=${PREFIX}/etc/sasldb2 \
		--includedir=${PREFIX}/include \
		--mandir=${MANPREFIX}/man \
		--enable-static \
		--enable-login \
		--enable-auth-sasldb \
		--with-rc4=openssl \
		--with-saslauthd=${SASLAUTHD_RUNPATH} \
		--disable-krb4

OPTIONS=	BDB		"Use Berkeley DB"			off \
		OPENLDAP	"Use OpenLDAP"				off \
		HTTPFORM	"Enable HTTP form authentication"	off

.include <bsd.mport.options.mk>

.if defined(WITH_BDB)
USE_BDB=	yes
INVALID_BDB_VER=2
CONFIGURE_ARGS+=--with-dblib=berkeley \
		--with-bdb-libdir=${BDB_LIB_DIR} \
		--with-bdb-incdir=${BDB_INCLUDE_DIR} \
		--with-bdb=${BDB_LIB_NAME}
.else
CONFIGURE_ARGS+=--with-dblib=ndbm
.endif

.if defined(WITH_OPENLDAP)
.if defined(WITH_OPENLDAP_VER)
WANT_OPENLDAP_VER=	${WITH_OPENLDAP_VER}
.endif
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--with-ldap=${LOCALBASE}
.endif

.if defined(WITH_HTTPFORM)
CONFIGURE_ARGS+=--enable-httpform
.endif

.if !defined(WITHOUT_GSSAPI) && defined(KRB5_HOME) && exists(${KRB5_HOME}/lib/libgssapi_krb5.so)
CONFIGURE_ARGS+=--enable-gssapi=${KRB5_HOME} --with-gss_impl=mit
.elif !defined(WITHOUT_GSSAPI) && defined(HEIMDAL_HOME) && exists(${HEIMDAL_HOME}/lib/libgssapi.a)
CONFIGURE_ARGS+=--enable-gssapi=${HEIMDAL_HOME} --with-gss_impl=heimdal
.elif !defined(WITHOUT_GSSAPI) && exists(/usr/lib/libkrb5.a)
CONFIGURE_ARGS+=--enable-gssapi
.else
CONFIGURE_ARGS+=--disable-gssapi
.endif

.include <bsd.port.pre.mk>

.if ${OPENSSLBASE} == /usr
CONFIGURE_ARGS+=--with-openssl=yes
.else
CONFIGURE_ARGS+=--with-openssl=${OPENSSLBASE}
.endif

SASLAUTHD_RUNPATH?=	/var/run/saslauthd
.if ${SASLAUTHD_RUNPATH} != /var/run/saslauthd
RUNPATH=	"@comment "
.endif

CYRUS_USER?=	cyrus

DOCS=		AUTHORS COPYING ChangeLog INSTALL LDAP_SASLAUTHD NEWS README

PLIST_SUB=	PREFIX=${PREFIX} \
		DOCSDIR=${DOCSDIR:S/^${PREFIX}\///} \
		RUNPATH=${RUNPATH}

SUB_LIST+=	SASLAUTHD_RUNPATH=${SASLAUTHD_RUNPATH}

do-build:
	cd ${WRKSRC}/include && ${MAKE}
	cd ${WRKSRC}/sasldb && ${MAKE}
	cd ${WRKSRC}/saslauthd && ${MAKE}
	cd ${WRKSRC}/saslauthd && ${MAKE} saslcache
	cd ${WRKSRC}/saslauthd && ${MAKE} testsaslauthd

post-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/saslauthd/saslcache \
		${PREFIX}/sbin/saslcache
	@${INSTALL_PROGRAM} ${WRKSRC}/saslauthd/testsaslauthd \
		${PREFIX}/sbin/testsaslauthd
.if ${SASLAUTHD_RUNPATH} != /var/run/saslauthd
	@${ECHO_MSG} ""
	@${ECHO_MSG} "SASLAUTHD_RUNPATH was specified."
	@${ECHO_MSG} "Make sure you create ${SASLAUTHD_RUNPATH}."
	@${ECHO_MSG} ""
.else
	${MKDIR} -m 770 ${SASLAUTHD_RUNPATH}
	${CHOWN} ${CYRUS_USER}:mail ${SASLAUTHD_RUNPATH}
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/saslauthd
.for file in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/saslauthd/${file} ${DOCSDIR}/saslauthd
.endfor
.endif

.include <bsd.port.post.mk>
