# $MidnightBSD$
# $FreeBSD: head/dns/bind99/Makefile 374305 2014-12-08 17:29:44Z mat $

PORTNAME=	bind
PORTVERSION=	${ISCVERSION:S/-P/P/}
PORTREVISION=	1
CATEGORIES=	dns net ipv6
MASTER_SITES=	ISC/bind9/${ISCVERSION}
PKGNAMESUFFIX=	99
DISTNAME=	${PORTNAME}-${ISCVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BIND DNS suite with updated DNSSEC and DNS64

LICENSE=	iscl

# ISC releases things like 9.8.0-P1, which our versioning doesn't like
ISCVERSION=	9.9.6-P1

MAKE_JOBS_UNSAFE=	yes

USES=	cpe

CPE_VENDOR=	isc
CPE_VERSION=	${ISCVERSION:C/-.*//}
.if ${ISCVERSION:M*-*}
CPE_UPDATE=	${ISCVERSION:C/.*-//:tl}
.endif

LIB_DEPENDS=	libxml2.so:${PORTSDIR}/textproc/libxml2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var --disable-linux-caps \
		--disable-symtable \
		--with-randomdev=/dev/random \
		--with-libxml2=${LOCALBASE}
ETCDIR=		${PREFIX}/etc/namedb

CONFLICTS=	bind9*-9.[45678].* bind9*-sdb-9.[45678].* bind-tools-9.*

OPTIONS_DEFAULT=	IPV6 SSL THREADS GSSAPI_NONE RRL
OPTIONS_DEFINE=		SSL IDN REPLACE_BASE LARGE_FILE FIXED_RRSET SIGCHASE \
			IPV6 THREADS FILTER_AAAA GOST PYTHON \
			LINKS RPZ_NSIP RPZ_NSDNAME RRL DOCS RPZ_PATCH NEWSTATS
OPTIONS_GROUP=		DLZ
OPTIONS_GROUP_DLZ=	DLZ_POSTGRESQL DLZ_MYSQL DLZ_BDB \
			DLZ_LDAP DLZ_FILESYSTEM DLZ_STUB
OPTIONS_SINGLE=		GSSAPI
OPTIONS_SINGLE_GSSAPI=	GSSAPI_BASE GSSAPI_HEIMDAL GSSAPI_MIT GSSAPI_NONE

OPTIONS_SUB=	yes

SSL_DESC=		Build with OpenSSL (Required for DNSSEC)
REPLACE_BASE_DESC=	Replace base BIND (FreeBSD 9.x and earlier)
LARGE_FILE_DESC=	64-bit file support
FIXED_RRSET_DESC=	Enable fixed rrset ordering
SIGCHASE_DESC=		dig/host/nslookup will do DNSSEC validation
FILTER_AAAA_DESC=	Enable filtering of AAAA records
GOST_DESC=		Enable GOST ciphers, needs SSL (see help)
PYTHON_DESC=		Build with Python utilities

LINKS_DESC=		Create conf file symlinks in ${PREFIX}
NEWSTATS_DESC=		Enable alternate xml statistics channel format
RPZ_NSIP_DESC=		Enable RPZ NSIP trigger rules
RPZ_NSDNAME_DESC=	Enable RPZ NSDNAME policy records
RPZ_PATCH_DESC=		RPZ improvements
RRL_DESC=		Response Rate Limiting
DLZ_DESC=		Dynamically Loadable Zones
DLZ_POSTGRESQL_DESC=	DLZ Postgres driver
DLZ_MYSQL_DESC=		DLZ MySQL driver (no threading)
DLZ_BDB_DESC=		DLZ BDB driver
DLZ_LDAP_DESC=		DLZ LDAP driver
DLZ_FILESYSTEM_DESC=	DLZ filesystem driver
DLZ_STUB_DESC=		DLZ stub driver
GSSAPI_BASE_DESC=	${GSSAPI_DESC} (Heimdal in base)
GSSAPI_HEIMDAL_DESC=	${GSSAPI_DESC} (security/heimdal)
GSSAPI_MIT_DESC=	${GSSAPI_DESC} (security/krb5)
GSSAPI_NONE_DESC=	No ${GSSAPI_DESC}

SSL_CONFIGURE_ON=	--with-openssl=${OPENSSLBASE}
SSL_USE=		openssl=yes
SSL_CONFIGURE_OFF=	--disable-openssl-version-check --without-openssl

NEWSTATS_CONFIGURE_ENABLE=	newstats

IDN_USES=		iconv
IDN_CONFIGURE_ON=	--with-idn=${LOCALBASE} ${ICONV_CONFIGURE_BASE}
IDN_LIB_DEPENDS=	libidnkit.so:${PORTSDIR}/dns/idnkit
IDN_CONFIGURE_OFF=	--without-idn

LARGE_FILE_CONFIGURE_ENABLE=	largefile

SIGCHASE_CONFIGURE_ON=	STD_CDEFINES="-DDIG_SIGCHASE=1"

IPV6_CONFIGURE_ENABLE=	ipv6

FILTER_AAAA_CONFIGURE_ENABLE=	filter-aaaa

GOST_CONFIGURE_WITH=	gost

PYTHON_CONFIGURE_WITH=	python
PYTHON_USES=	python

DLZ_POSTGRESQL_CONFIGURE_ON=	--with-dlz-postgres=yes
DLZ_POSTGRESQL_USES=		pgsql

FIXED_RRSET_CONFIGURE_ENABLE=	fixed-rrset

RPZ_NSIP_CONFIGURE_ENABLE=	rpz-nsip

RPZ_NSDNAME_CONFIGURE_ENABLE=	rpz-nsdname

RPZ_PATCH_PATCHFILES=	9.9.6-P1-rpz2+rl.14038.05.patch:vix
RPZ_PATCH_PATCH_SITES=	http://ss.vix.su/~vjs/:vix ${MASTER_SITE_LOCAL:S/%SUBDIR%/mat\/bind/:S/$/:vix/}

RRL_CONFIGURE_ENABLE=	rrl

DLZ_MYSQL_CONFIGURE_ON=	--with-dlz-mysql=yes
DLZ_MYSQL_USE=		mysql=yes

DLZ_BDB_CONFIGURE_ON=	--with-dlz-bdb=yes
DLZ_BDB_USE=		bdb=yes

DLZ_LDAP_CONFIGURE_ON=	--with-dlz-ldap=yes
DLZ_LDAP_USE=		openldap=yes

DLZ_FILESYSTEM_CONFIGURE_ON=	--with-dlz-filesystem=yes

DLZ_STUB_CONFIGURE_ON=	--with-dlz-stub=yes

GSSAPI_BASE_USES=	gssapi
GSSAPI_BASE_CONFIGURE_ON= \
	--with-gssapi=${GSSAPIBASEDIR} ${GSSAPI_CONFIGURE_ARGS}
GSSAPI_HEIMDAL_USES=	gssapi:heimdal
GSSAPI_HEIMDAL_CONFIGURE_ON= \
	--with-gssapi=${GSSAPIBASEDIR} ${GSSAPI_CONFIGURE_ARGS}
GSSAPI_MIT_USES=	gssapi:mit
GSSAPI_MIT_CONFIGURE_ON= \
	--with-gssapi=${GSSAPIBASEDIR} ${GSSAPI_CONFIGURE_ARGS}
GSSAPI_NONE_CONFIGURE_ON=	--without-gssapi

.include <bsd.mport.options.mk>

.if !${PORT_OPTIONS:MLINKS} || ${PORT_OPTIONS:MREPLACE_BASE}
PKGINSTALL=${NONEXISTENT}
.endif

.if ${PORT_OPTIONS:MTHREADS} && !${PORT_OPTIONS:MDLZ_MYSQL}
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if ${PORT_OPTIONS:MREPLACE_BASE}
.if ${OPSYS} == FreeBSD && ${OSVERSION} >= 1000100
IGNORE=		REPLACE_BASE option is not supported on this release
.else # >= 10.0
# Move to BROKEN after expiration.
DEPRECATED=		REPLACE_BASE option will be removed.  There is no real need for foot-shooting.
EXPIRATION_DATE=	2015-01-01
.endif # >= 10.0
PKGNAMESUFFIX=	-base
PREFIX=		/usr
PLIST_SUB+=	SHARE_MAN="share/"
NO_MTREE=	yes
BIND_DESTETC=	/etc/namedb
.else # REPLACE_BASE
PLIST_SUB+=	SHARE_MAN=""
.if ${OPSYS} == FreeBSD && ${OSVERSION} >= 1000100
BIND_DESTETC=	${PREFIX}/etc/namedb
PKGINSTALL=	${NONEXISTENT}
.else # >= 10.0
BIND_DESTETC=	${PREFIX}/etc
.endif # >= 10.0
.endif # REPLACE_BASE

PKGDEINSTALL=	${PKGINSTALL}

CONFIGURE_ARGS+=	--prefix=${PREFIX} \
			--sysconfdir=${BIND_DESTETC}
SUB_LIST+=	BIND_DESTETC="${BIND_DESTETC}"
PLIST_SUB+=	BIND_DESTETC="${BIND_DESTETC}"

PORTDOCS=	*

PLIST_SUB+=	NOBASE="@comment " BASE=""
.if ${PORT_OPTIONS:MSSL}
WITH_OPENSSL_PORT=	yes
.endif

post-patch:
.for FILE in check/named-checkconf.8 named/named.8 nsupdate/nsupdate.1 \
	rndc/rndc.8
	@${REINPLACE_CMD} -e 's#/etc/named.conf#${BIND_DESTETC}/named.conf#g' \
		-e 's#/etc/rndc.conf#${BIND_DESTETC}/rndc.conf#g' \
		-e "s#/var\/run\/named\/named.pid#/var/run/named/pid#" \
		${WRKSRC}/bin/${FILE}
.endfor

post-configure:
	${REINPLACE_CMD} -e '/^SO_LDFLAGS/s/-Wl,-rpath/-rpath /' ${WRKSRC}/bin/tests/system/dlzexternal/Makefile

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}/arm
	${INSTALL_DATA} ${WRKSRC}/doc/arm/*.html ${DOCSDIR}/arm
	${INSTALL_DATA} ${WRKSRC}/doc/arm/Bv9ARM.pdf ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/CHANGES ${WRKSRC}/COPYRIGHT ${WRKSRC}/FAQ \
		${WRKSRC}/HISTORY ${WRKSRC}/README ${DOCSDIR}
.endif
.for i in dynamic master slave working
	@${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/$i
.endfor
	${INSTALL_DATA} ${FILESDIR}/named.root ${FAKE_DESTDIR}${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/empty.db ${FAKE_DESTDIR}${ETCDIR}/master
	${INSTALL_DATA} ${FILESDIR}/localhost-forward.db ${FAKE_DESTDIR}${ETCDIR}/master
	${INSTALL_DATA} ${FILESDIR}/localhost-reverse.db ${FAKE_DESTDIR}${ETCDIR}/master
	${INSTALL_DATA} ${WRKSRC}/bin/rndc/rndc.conf ${FAKE_DESTDIR}${ETCDIR}/rndc.conf.sample


.include <bsd.port.mk>
