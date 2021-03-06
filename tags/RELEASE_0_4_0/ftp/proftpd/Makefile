# $MidnightBSD: mports/ftp/proftpd/Makefile,v 1.6 2011/02/02 21:00:01 laffer1 Exp $

PORTNAME=	proftpd
PORTVERSION=	1.3.4b
CATEGORIES?=	ftp
MASTER_SITES=	ftp://ftp.proftpd.org/distrib/source/ \
		ftp://ftp.fastorama.com/mirrors/ftp.proftpd.org/distrib/source/ \
		ftp://ftp.dataguard.no/ftp/pub/proftpd/distrib/source/ \
		ftp://spirit.bentel.sk/mirrors/Proftpd/distrib/source/ \
		ftp://proftpd.networkedsystems.co.uk/distrib/source/ \
		http://mirrors.ibiblio.org/pub/mirrors/proftpd/distrib/source/ \
		http://www.mirrorservice.org/sites/ftp.proftpd.org/distrib/source/ \
		http://labratsoftware.com/mod_sql_tds/:sql_tds \
		https://secure.thrallingpenguin.com/redmine/attachments/download/1/:clam \
		http://www.smartftp.com/oss/proftpd/:digest \
		LOCAL/beech:digest \
		LOCAL/beech:sql_tds
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Highly configurable ftp daemon
LICENSE=	gpl2

MAN1=	ftpcount.1 ftpwho.1 ftptop.1
MAN5=	xferlog.5
MAN8=	proftpd.8 ftpshut.8 ftpdctl.8

MAKE_JOBS_UNSAFE=	yes
PORTDOCSdoc=	Configuration.html faq.html
PORTDOCScontrib=mod_ifsession.html mod_radius.html mod_rewrite.html \
		mod_tls.html mod_wrap2.html mod_wrap2_file.html mod_wrap2_sql.html \
		mod_ban.html mod_quotatab_radius.html ftpasswd.html
PORTDOCSreadme=	README README.DSO README.FreeBSD README.IPv6 README.LDAP README.PAM \
		README.capabilities README.classes README.facl README.modules \
		README.ports RELEASE_NOTES
PORTDOCS=	${PORTDOCSdoc} ${PORTDOCScontrib} ${PORTDOCSreadme}

PORTEXAMPLES=	ASCII.html CreateHome.html Filters.html SQL.html Umask.html \
		AuthFiles.html DNS.html Globbing.html SSH.html Upgrade.html \
		Authentication.html DSO.html Limit.html Scoreboard.html Vhost.html \
		BCP.html Debugging.html ListOptions.html ServerType.html \
		VirtualUsers.html Chroot.html Directory.html Logging.html Stopping.html \
		index.html Classes.html DisplayFiles.html NAT.html TLS.html ConfigFile.html \
		FTP.html Quotas.html Timestamps.html Controls.html \
		FXP.html Regex.html Tracing.html

USE_GMAKE=	yes
USE_AUTOTOOLS=	autoconf
GNU_CONFIGURE=	yes

USE_RC_SUBR=	proftpd.sh

CONFIGURE_ARGS=	--localstatedir=/var/run \
		--with-pkgconfig=libdata/pkgconfig \
		--sysconfdir=${PREFIX}/etc \
		--disable-sendfile

OPTIONS=	BAN "Include mod_ban (Requires CTRLS)" off \
		CLAMAV "Include mod_clamav" off \
		CTRLS "Include controls" off \
		DIGEST "Include mod_digest" off \
		IFSESSION "Include mod_ifsession" on \
		IPV6 "Use IPv6" on \
		LDAP "Use LDAP" off \
		LDAP_TLS "Use LDAP TLS (Requires LDAP, OPENSSL)" off \
		NLS "Use nls (builds mod_lang)" on \
		OPENSSL "Include mod_tls" on \
		PGSQL "Postgres auth (Can be combined with MYSQL)" off \
		QUOTA "Include mod_quota" off \
		QUOTATAB_RADIUS "include mod_quotatab_radius" off \
		RADIUS "Include mod_radius" on \
		RATIO "Include mod_ratio" on \
		README "Include mod_readme" on \
		REWRITE "Include mod_rewrite" on \
		TDS "FreeTDS - Sybase & MS-SQL auth (Exclusive)" off \
		WRAP "Include mod_wrap2" on \
		WRAP_FILE "Include mod_wrap2_file" off \
		WRAP_SQL "Include mod_wrap2_sql" off
# Set the MYSQL option based upon the setting from the
# slave port (ftp/proftpd-mysql).
.if defined(WITH_MYSQL)
OPTIONS+=	MYSQL "MySQL auth (Can be combined with PGSQL)" on
.else
OPTIONS+=	MYSQL "MySQL auth (Can be combined with PGSQL)" off
.endif

MODULES?=
LIBDIRS?=
INCLUDEDIRS?=

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_RATIO)
MODULES:=${MODULES}:mod_ratio
.endif

.if !defined(WITHOUT_README)
MODULES:=${MODULES}:mod_readme
.endif

.if !defined(WITHOUT_REWRITE)
MODULES:=${MODULES}:mod_rewrite
.endif

.if !defined(WITHOUT_WRAP)
MODULES:=${MODULES}:mod_wrap2
INCLUDEDIRS:=${INCLUDEDIRS}:${WORKDIR}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
PLIST_SUB+=	WRAP=""
.else
PLIST_SUB+=	WRAP="@comment "
.endif

.if defined(WITH_WRAP_FILE)
.if defined(WITHOUT_WRAP)
IGNORE=	WRAP_FILE and WRAP_FILE_SQL require WRAP.
.endif
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
MODULES:=${MODULES}:mod_wrap2_file
.endif

.if defined(WITH_WRAP_SQL)
.if defined(WITHOUT_WRAP)
IGNORE=	WRAP_FILE and WRAP_FILE_SQL require WRAP.
.endif
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
MODULES:=${MODULES}:mod_wrap2_sql
.endif

.if defined(WITH_RADIUS)
MODULES:=${MODULES}:mod_radius
.endif

.if defined(WITH_QUOTATAB_RADIUS)
MODULES:=${MODULES}:mod_quotatab_radius
.endif

.if defined(WITH_BAN)
MODULES:=${MODULES}:mod_ban
.endif

.if defined(WITH_SETPASSENT)
CONFIGURE_ARGS+=	--enable-force-setpassent
.endif

.if defined(WITHOUT_PAM)
CONFIGURE_ARGS+=	--disable-auth-pam
.endif

.if defined(WITH_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if defined(WITH_NLS)
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
CONFIGURE_ARGS+=	--enable-nls
USE_GETTEXT=yes
PROFTPD_LIBS+=	-lintl -L${LOCALBASE}/lib
PLIST_SUB+=	NLS=""
.else
PLIST_SUB+=	NLS="@comment "
.endif

#allow user to override
MODULES?=	mod_ratio:mod_readme:mod_rewrite:mod_wrap2:mod_ifsession:mod_lang

INCLUDEDIRS?=
LIBDIRS?=

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
MODULES:=${MODULES}:mod_ldap
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
.endif

# MYSQL, PGSQL and TDS require mod_sql to be built but specifying it
# more than once causes configure script to complain.
.if defined(WITH_MYSQL) || defined(WITH_PGSQL) || defined(WITH_TDS)
MODULES:=${MODULES}:mod_sql
.endif

.if defined(WITH_MYSQL)
USE_MYSQL=	yes
MODULES:=${MODULES}:mod_sql_mysql
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include:${LOCALBASE}/include/mysql:${WRKSRC}/contrib
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib/mysql
.endif

.if defined(WITH_PGSQL)
USE_PGSQL=	yes
MODULES:=${MODULES}:mod_sql_postgres
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
.endif

.if ${MODULES:M*mod_sql_*}
PLIST_SUB+=	SQL=""
.else
PLIST_SUB+=	SQL="@comment "
.endif

.if defined(WITH_OPENSSL)
EXTENSIONS+=openssl
CFLAGS+=	-DHAVE_OPENSSL -I${OPENSSLINC}
PROFTPD_LIBS+=	-lssl -lcrypto -L${OPENSSLLIB}
MODULES:=${MODULES}:mod_tls
.endif

.if defined(WITH_CTRLS)
CONFIGURE_ARGS+=	--enable-ctrls
.if !defined(WITHOUT_CTRLS_ADMIN)
MODULES:=${MODULES}:mod_ctrls_admin
.endif
PLIST_SUB+=	CTRLS_ADMIN=""
.else
PLIST_SUB+=	CTRLS_ADMIN="@comment "
.endif

# LDAP, PGSQL and MYSQL options due nothing (in this case)
# without QUOTA support.
.if defined(WITH_QUOTA)
MODULES:=${MODULES}:mod_quotatab:mod_quotatab_file
PLIST_SUB+=	QUOTA=""
.if defined(WITH_LDAP)
MODULES:=${MODULES}:mod_quotatab_ldap
.endif
.if defined(WITH_PGSQL) || defined(WITH_MYSQL)
MODULES:=${MODULES}:mod_quotatab_sql
.endif
.else
PLIST_SUB+=	QUOTA="@comment "
.endif

.if defined(WITH_CLAMAV)
DISTFILES+=	mod_clamav-0.11rc.tar.gz:clam
EXTRACT_ONLY+=	mod_clamav-0.11rc.tar.gz
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-modules_mod_xfer.c
USE_CLAMAV=	yes
MODULES:=${MODULES}:mod_clamav
LIB_DEPENDS+=	clamav.6:${PORTSDIR}/security/clamav
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
PLIST_SUB+=	CLAMAV=""
.else
PLIST_SUB+=	CLAMAV="@comment "
.endif

.if defined(WITH_DIGEST)
DISTFILES+=	mod_digest.c:digest
MODULES:=${MODULES}:mod_digest
.endif

.if defined(WITH_TDS)
DISTFILES+=	mod_sql_tds-4.11.tar.bz2:sql_tds
EXTRACT_ONLY+=	mod_sql_tds-4.11.tar.bz2
MODULES:=${MODULES}:mod_sql_tds
PLIST_SUB+=	TDS=""
INCLUDEDIRS:=${INCLUDEDIRS}:${LOCALBASE}/include
LIBDIRS:=${LIBDIRS}:${LOCALBASE}/lib
LIB_DEPENDS+=	sybdb.5:${PORTSDIR}/databases/freetds
.else
PLIST_SUB+=	TDS="@comment "
.endif

# mod_ifsession should be the last item in the modules list
.if !defined(WITHOUT_IFSESSION)
MODULES:=${MODULES}:mod_ifsession
.endif

# Keep this here below, in case similar constructs need to be made
CONFIGURE_ENV+=	"LIBS=${PROFTPD_LIBS}"

.if !empty(MODULES)
CONFIGURE_ARGS+=	--with-modules=${MODULES}
.endif

.if !empty(INCLUDEDIRS)
CONFIGURE_ARGS+=	--with-includes=${INCLUDEDIRS}
.endif

.if !empty(LIBDIRS)
CONFIGURE_ARGS+=	--with-libraries=${LIBDIRS}
.endif

#Todo: Fix this to not use != if possible.
#      Will leave as is for now.
MODULES!=${ECHO} ${MODULES} | ${SED} -e 's,^:,,' -e 's,:$$,,'

.include <bsd.port.pre.mk>

post-extract:
.if defined(WITH_CLAMAV)
	(cd ${WRKDIR} && ${GZIP_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/mod_clamav-0.11rc.tar.gz ${EXTRACT_AFTER_ARGS})
	@${CP} ${WRKDIR}/mod_clamav-0.11rc/mod_clamav.* ${WRKSRC}/contrib
.endif
.if defined(WITH_DIGEST)
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/mod_digest.c ${WRKSRC}/modules/
.endif
.if defined(WITH_TDS)
	 @${MV} ${WRKDIR}/mod_sql_tds.c ${WRKSRC}/contrib/
.endif

post-patch:
.if defined(WITH_NLS)
	@${REINPLACE_CMD} -e 's|-lsupp|-lsupp -lintl|g' ${WRKSRC}/Makefile.in
.endif
.if defined(WITH_LDAP_TLS)
	@${REINPLACE_CMD} -e 's:/\* #define USE_LDAP_TLS \*/:#define USE_LDAP_TLS:' \
		${WRKSRC}/contrib/mod_ldap.c
.endif
	@${REINPLACE_CMD} -e 's|proftpd\.conf|proftpd.conf.sample|g' ${WRKSRC}/Makefile.in

pre-configure:
	@${ECHO_MSG} "==> Configuring with ${MODULES}"

post-configure:
	${REINPLACE_CMD} -e 's: -lnsl::' ${WRKSRC}/Make.rules
	${REINPLACE_CMD} -e 's:/usr/sbin:${PREFIX}/sbin:' \
		-e 's:/usr/bin:${PREFIX}/bin:' \
		${WRKSRC}/src/proftpd.8 ${WRKSRC}/utils/ftpshut.8 \
		${WRKSRC}/utils/ftpcount.1

post-install:
	@cd  ${PREFIX}/etc/ && ${CP} -n proftpd.conf.sample proftpd.conf
.if !defined(NOPORTDOCS)
	@${INSTALL} -d ${DOCSDIR}/
	@cd ${WRKSRC}/doc/ && ${INSTALL_DATA} ${PORTDOCSdoc} ${DOCSDIR}/
	@cd ${WRKSRC}/doc/contrib && ${INSTALL_DATA} ${PORTDOCScontrib} ${DOCSDIR}/
	@cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCSreadme} ${DOCSDIR}/
.endif
.if !defined(NOPORTEXAMPLES)
	@${INSTALL} -d ${EXAMPLESDIR}/
	@cd ${WRKSRC}/doc/howto/ && ${INSTALL_DATA} ${PORTEXAMPLES} ${EXAMPLESDIR}/
.endif
.if defined(WITH_CTRLS)
	@${INSTALL_PROGRAM} ${WRKSRC}/ftpdctl ${PREFIX}/sbin/
	@${INSTALL_MAN} ${WRKSRC}/src/ftpdctl.8 ${MAN8PREFIX}/man/man8/
.endif

.include <bsd.port.post.mk>
