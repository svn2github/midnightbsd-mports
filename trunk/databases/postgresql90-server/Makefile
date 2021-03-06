# $MidnightBSD$

PORTNAME?=	postgresql
DISTVERSION?=	9.0.18
PORTREVISION?=	0
CATEGORIES?=	databases
MASTER_SITES=	${MASTER_SITE_PGSQL}
MASTER_SITE_SUBDIR=	source/v${DISTVERSION}
PKGNAMESUFFIX?=	-server

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	The most advanced open-source database available anywhere

LICENSE=	mit

CONFLICTS?=	${PORTNAME}-client-[78]* \
		${PORTNAME}${PKGNAMESUFFIX}-[78]* \
		${PORTNAME}-client-9.[1-9]* \
		${PORTNAME}${PKGNAMESUFFIX}-9.[1-9]*

WRKSRC=		${WRKDIR}/postgresql-${DISTVERSION}
DIST_SUBDIR=	postgresql

UNIQUENAME?=	${PORTNAME}90
LATEST_LINK?=	${PKGNAMEPREFIX}${UNIQUENAME}${PKGNAMESUFFIX}

PKGINSTALL?=	${PKGDIR}/pkg-install${PKGNAMESUFFIX}
USES=		gmake tar:bzip2
GNU_CONFIGURE=	YES
.if defined(NO_BUILD)
.undef USE_GMAKE
.undef GNU_CONFIGURE
.endif

PG_USER?=	pgsql
PG_GROUP?=	${PG_USER}
PG_UID?=	70

LDFLAGS+=	-L${LOCALBASE}/lib
INCLUDES+=	-I${LOCALBASE}/include
CONFIGURE_ARGS+=--with-libraries=${PREFIX}/lib \
		--with-includes=${PREFIX}/include \
		--enable-thread-safety
CONFIGURE_ENV+=	INCLUDES="${INCLUDES}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

PLIST=		${PKGDIR}/pkg-plist${PKGNAMESUFFIX}

BUILD_DIRS?=	src/timezone src/backend src/backend/utils/mb/conversion_procs \
		src/backend/snowball src/backend/replication/libpqwalreceiver \
		src/bin/initdb src/bin/pg_ctl \
		src/bin/pg_controldata src/bin/pg_resetxlog src/pl

INSTALL_DIRS?=	${BUILD_DIRS}

.if !defined(CLIENT_ONLY) && !defined(SLAVE_ONLY)
SERVER_ONLY=	yes
USE_RC_SUBR=	postgresql
USE_PGSQL=	yes
WANT_PGSQL_VER=	${DISTVERSION:C/([0-9][0-9]*)\.([0-9][0-9]*).*/\1\2/g}
USERS?=		${PG_USER}
.if (${USERS} != "pgsql")
UID_FILES+=	${WRKDIR}/pguid
GID_FILES+=	${WRKDIR}/pggid
.endif
GROUPS?=	${PG_GROUP}
SUB_FILES+=	502.pgsql
.endif

.if !defined(SLAVE_ONLY)
OPTIONS=	NLS "Use internationalized messages" on
.endif

.if !defined(CLIENT_ONLY)
MAKE_ENV=	PATH=${PREFIX}/bin:${PATH}
CONFIGURE_ENV+=	PATH=${PREFIX}/bin:${PATH}
.endif

.if !defined(SLAVE_ONLY)
OPTIONS+=	PAM "Build with PAM support (server only)" off
OPTIONS+=	LDAP "Build with LDAP authentication support" off
OPTIONS+=	MIT_KRB5 "Build with MIT's kerberos support" off
OPTIONS+=	HEIMDAL_KRB5 "Builds with Heimdal kerberos support" off
OPTIONS+=	OPTIMIZED_CFLAGS "Builds with compiler optimizations (-O3)" off
OPTIONS+=	XML "Build with XML data type (server)" on
OPTIONS+=	TZDATA "Use internal timezone database (server)" on
OPTIONS+=	DEBUG "Builds with debugging symbols" off
OPTIONS+=	GSSAPI "Build with GSSAPI support" off

# See http://people.freebsd.org/~girgen/postgresql-icu/README.html for more info
OPTIONS+=	ICU	"Use ICU for unicode collation (server)" off

# See http://www.freebsd.org/cgi/query-pr.cgi?pr=ports/76999 for more info
# (requires dump/restore if modified.)
OPTIONS+=	INTDATE "Builds with 64-bit date/time type (server)" on
OPTIONS+=	SSL "Build with OpenSSL support" on
.endif # !SLAVE_ONLY

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_SSL)
USE_OPENSSL=  yes
CONFIGURE_ARGS+=--with-openssl
.endif

.if !defined(SLAVE_ONLY)
.  if (defined(SERVER_ONLY) && defined(WITH_ICU)) || make(makesum)
USES=	autoconf
CONFIGURE_ARGS+=--with-icu
PATCH_SITES+=	http://people.freebsd.org/~girgen/postgresql-icu/:icu
PATCHFILES+=	pg-900-icu-2010-09-19.diff.gz:icu
LIB_DEPENDS+=	icudata.46:${PORTSDIR}/devel/icu
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-icu4
.  endif
.endif # !SLAVE_ONLY

.include <bsd.port.pre.mk>

.if !defined(SLAVE_ONLY)

PATCH_DIST_STRIP=-p1

.  if defined(WITH_PAM)
CONFIGURE_ARGS+=--with-pam
.  endif

.  if defined(WITH_LDAP)
CONFIGURE_ARGS+=--with-ldap
.    if defined (SERVER_ONLY)
USE_OPENLDAP=	YES
.    endif
.  endif

.  if defined(WITH_XML)
CONFIGURE_ARGS+=--with-libxml
LIB_DEPENDS+=	libxml2.so:${PORTSDIR}/textproc/libxml2
.  endif

.  if defined(WITH_TZDATA)
PLIST_SUB+=	TZDATA=""
.  else
CONFIGURE_ARGS+=--with-system-tzdata=/usr/share/zoneinfo
PLIST_SUB+=	TZDATA="@comment "
.  endif

.  if defined(WITHOUT_INTDATE)
CONFIGURE_ARGS+=--disable-integer-datetimes
.  endif

.  if !(defined(WITHOUT_GETTEXT) || defined(WITHOUT_NLS))
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	GETTEXT=""
USE_GETTEXT=	YES
.  else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	GETTEXT="@comment "
.  endif

.  if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS+=	-O3 -funroll-loops
.  endif

.  if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
INSTALL_TARGET=	install
.  else
INSTALL_TARGET=	install-strip
.  endif

.if !defined(WITHOUT_GSSAPI)
CONFIGURE_ARGS+=--with-gssapi
.if !defined(WITH_MIT_KRB5) && !defined(WITH_HEIMDAL_KRB5)
# Kerberos libraries will pull the proper GSSAPI library
# via linker dependencies, but otherwise we must specify
# it explicitely: ld --as-needed is used for compilation,
# so configure's -lgssapi_krb5 won't go.
LDFLAGS+=	-lgssapi
.endif
.else
CONFIGURE_ARGS+=--without-gssapi
.endif

.  if defined(WITH_MIT_KRB5)
.    if exists(/usr/lib/libkrb5.so) || exists(/usr/bin/krb5-config)
BROKEN=		You must remove heimdal's /usr/bin/krb5-config and /usr/lib/libkrb5.so*, and set NO_KERBEROS=true in /etc/make.conf to build successfully with MIT-KRB
.    endif
# Allow defining a home built MIT Kerberos by setting KRB5_HOME
.    if defined(KRB5_HOME) && exists(${KRB5_HOME}/lib/libgssapi_krb5.a) && exists(${KRB5_HOME}/bin/krb5-config)
CONFIGURE_ARGS+=--with-krb5
.    else
LIB_DEPENDS+=	krb5.3:${PORTSDIR}/security/krb5
CONFIGURE_ARGS+=--with-krb5
.    endif
.  endif

.  if defined(WITH_HEIMDAL_KRB5)
# Allow defining a home built Heimdal Kerberos by setting HEIMDAL_HOME
.    if defined(HEIMDAL_HOME) && exists(${HEIMDAL_HOME}/lib/libgssapi.a) && exists(${HEIMDAL_HOME}/bin/krb5-config)
CONFIGURE_ARGS+=--with-krb5
.    else
# Postgresql apps will not link properly when libpq is linked with base heimdal in /usr,
# so we always use the heimdal port. See
# http://lists.freebsd.org/pipermail/freebsd-stable/2005-October/018809.html
LIB_DEPENDS+=	krb5.26:${PORTSDIR}/security/heimdal
CONFIGURE_ARGS+=--with-krb5
.    endif
.  endif

.endif # !SLAVE_ONLY

PLIST_SUB+=	PG_USER=$(PG_USER)
SUB_LIST+=	PG_GROUP=$(PG_GROUP) \
		PG_USER=$(PG_USER) \
		PG_UID=$(PG_UID)

.if defined(SERVER_ONLY)
pre-everything::
	@${SH} ${PKGINSTALL} ${PORTNAME} PRE-INSTALL
.endif

.if !defined(NO_BUILD)

pre-configure:
.  if defined(WITH_MIT_KRB5) && defined(WITH_HEIMDAL_KRB5)
	@${ECHO} "MIT's and Heimdal Kerberos are mutually exclusive."
	@${ECHO} "Please choose one or the other."
	@exit 1
.  endif

do-build:
	@ cd ${WRKSRC}/src/backend && ${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS} symlinks
	@ for dir in ${BUILD_DIRS}; do \
		cd ${WRKSRC}/$${dir} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS}; \
	done

.  if exists(${FILESDIR}/pkg-message${PKGNAMESUFFIX}.in)
SUB_FILES+=	pkg-message${PKGNAMESUFFIX}
PKGMESSAGE=	${WRKSRC}/pkg-message${PKGNAMESUFFIX}
.  endif
.  if exists(${FILESDIR}/pkg-install${PKGNAMESUFFIX}.in)
SUB_FILES+=	pkg-install${PKGNAMESUFFIX}
PLIST_SUB+=	PG_USER=$(PG_USER) LOCALBASE=${LOCALBASE}
PKGINSTALL=	${WRKDIR}/pkg-install${PKGNAMESUFFIX}
.  endif
.endif

.if !defined(NO_BUILD)
post-patch:
	@${REINPLACE_CMD} s/@PTHREAD_LIBS@// ${WRKSRC}/src/Makefile.global.in
.  if defined(WITH_ICU)
	@${REINPLACE_CMD} -E -e \
		"s|^(m4_if.*)2.6[0-9](.*Autoconf version )2.6[0-9]|\1${AUTOCONF_VERSION}\2${AUTOCONF_VERSION}|g" \
		${WRKSRC}/configure.in
.  endif

.  if defined(SERVER_ONLY) && (${PG_USER} != "pgsql")
pre-install:
	@${SED} -n s,pgsql,${PG_USER},gp ${PORTSDIR}/UIDs > ${WRKDIR}/pguid
	@${SED} -n s,pgsql,${PG_GROUP},gp ${PORTSDIR}/GIDs > ${WRKDIR}/pggid
.  endif

do-install:
	@for dir in ${INSTALL_DIRS}; do \
	    cd ${WRKSRC}/$${dir} && \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS} ${INSTALL_TARGET}; \
	done
.  if defined(SERVER_ONLY)
	@ ${MKDIR} ${PREFIX}/share/postgresql ;\
	${MKDIR} ${PREFIX}/etc/periodic/daily ;\
	${INSTALL_SCRIPT} ${WRKDIR}/502.pgsql \
			${PREFIX}/etc/periodic/daily
.  endif # SERVER_ONLY
.  if defined(CLIENT_ONLY)
	@ cd ${WRKSRC}/src && ${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS} install-local
.  endif
	@ if [ -r ${PKGMESSAGE} ]; then \
		${MKDIR} ${DOCSDIR} ;\
		${INSTALL_DATA} ${PKGMESSAGE} ${DOCSDIR}/README${PKGNAMESUFFIX} ;\
	fi
.endif # !NO_BUILD

.if defined(SERVER_ONLY)
check:
	@if [ `id -u` != 0 ] ; then \
	  ${ECHO} "Running postgresql regressions tests" ;\
	  cd ${WRKSRC}; ${GMAKE} check ;\
	 else \
	  ${ECHO} "You cannot run regression tests when postgresql is built as user root." ; \
	  ${ECHO} "Clean and rebuild the port as a regular user to run the tests." ;\
	 fi
.endif

.include <bsd.port.post.mk>
