# $MidnightBSD$

PORTNAME=	gnupg
PORTVERSION=	1.4.18
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	gnupg
PKGNAMESUFFIX=	1
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.sig
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU Privacy Guard

LICENSE=	gpl2

CONFLICTS=      gnupg-[0-9]*

USES=		charsetfix gmake tar:bzip2
GNU_CONFIGURE=	YES
CONFIGURE_ARGS=	--infodir=${PREFIX}/info --mandir=${PREFIX}/man
.if ${MACHINE_CPU:Mi586}
MACHINE_ARCH=	i586
.endif
CFLAGS:=	${CFLAGS:S/-pipe//g}
INFO=		gnupg1
DOCSDIR=	${PREFIX}/share/doc/gnupg1
PORTDOCS=	*

OPTIONS_DEFINE=	LDAP LIBICONV LIBUSB SUID_GPG NLS CURL DOCS
OPTIONS_DEFAULT=	CURL
LDAP_DESC=	LDAP keyserver interface
LIBICONV_DESC=	use libiconv
LIBUSB_DESC=	use libusb
SUID_GPG_DESC=	install GPG with suid
CURL_DESC=	use libcurl for the keyserver interface

.include <bsd.mport.options.mk>

.if ${CC} == "clang"
CFLAGS:=	${CFLAGS:S/$/ -std=c89/}
.if (${ARCH} == "i386")
CFLAGS:=	${CFLAGS:S/$/ -fheinous-gnu-extensions/}
.endif
.endif

.if ${PORT_OPTIONS:MLIBICONV}
USES+=		iconv
.else
CONFIGURE_ARGS+=	--disable-gnupg-iconv
.endif

.if ${PORT_OPTIONS:MLIBUSB}
CONFIGURE_ARGS+=	--with-libusb=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-libusb
.endif

.if ${PORT_OPTIONS:MLDAP}
USE_OPENLDAP=	yes
PLIST_SUB+=	WITH_LDAP=""
CONFIGURE_ARGS+=	--with-ldap=${LOCALBASE}
#CONFIGURE_ENV+=	LDFLAGS="-L/usr/lib"
.else
PLIST_SUB+=	WITH_LDAP="@comment "
CONFIGURE_ARGS+=	--disable-ldap
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ${PORT_OPTIONS:MCURL}
LIB_DEPENDS+=	libcurl.so:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-libcurl=${LOCALBASE}
# Work around a GnuPG configure buglet
CONFIGURE_ENV+=	_libcurl_config=${LOCALBASE}/bin/curl-config
.else
CONFIGURE_ARGS+=--without-libcurl
.endif

post-install:

	${MKDIR} ${DOCSDIR}
.for i in DETAILS FAQ HACKING OpenPGP
	${INSTALL_DATA} ${WRKSRC}/doc/${i} ${DOCSDIR}
.endfor
.for i in ABOUT-NLS AUTHORS BUGS COPYING INSTALL NEWS PROJECTS \
	README THANKS TODO VERSION
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.if ${PORT_OPTIONS:MSUID_GPG}
	${CHMOD} u+s ${PREFIX}/bin/gpg
.endif

check:
	(cd ${WRKSRC}; ${MAKE} check)

.include <bsd.port.mk>
