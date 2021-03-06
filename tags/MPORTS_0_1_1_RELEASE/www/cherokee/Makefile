# New ports collection makefile for:	cherokee
# Date created:			01 Jun 2002
# Whom:				silence <oksala@videotron.ca>
#
# $MidnightBSD: mports/www/cherokee/Makefile,v 1.4 2007/01/19 15:22:11 wintellect Exp $
# $FreeBSD: ports/www/cherokee/Makefile,v 1.26 2006/08/15 01:11:31 clsung Exp $
#

PORTNAME=	cherokee
PORTVERSION=	0.5.6
PORTREVISION=
CATEGORIES=	www
MASTER_SITES=	http://www.cherokee-project.com/download/%SUBDIR%/ \
		http://www.alaskaparadise.com/freebsd/
MASTER_SITE_SUBDIR=	${PORTVERSION:R}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.com
COMMENT=	An extremely fast and flexible web server

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

USE_GNOME=	gnomehack gnometarget pkgconfig
USE_RC_SUBR=	cherokee.sh
USE_BISON=	yes
USE_GETOPT_LONG=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--mandir=${MANPREFIX}/man \
		--with-wwwroot=${PREFIX}/www

OPTIONS=	GNUTLS	"TLS/SSL Use gnutls"	on \
		OPENSSL	"TLS/SSL Use openssl"	off \
		NOTLS	"No TLS/SSL"		off \
		NOIPV6	"No IPv6"		off

USE_LDCONFIG=	yes

MAN1=		cget.1 cherokee-config.1 cherokee.1 cherokee_logrotate.1

CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=	gnutls.13:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--enable-tls=gnutls
.endif

.if defined(WITH_OPENSSL)
CFLAGS+=	-DHAVE_OPENSSL
CONFIGURE_ARGS+=--enable-tls=openssl
LDFLAGS+=	-lssl -lcrypto
.endif

.if defined(WITH_NOTLS)
CONFIGURE_ARGS+=--disable-tls
.endif

.if defined(WITH_NOIPV6)
CONFIGURE_ARGS+=--disable-ipv6
.endif

PLIST_SUB+=	PAM="@comment "

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|@mkdir_p@|${MKDIR} --|g'

pre-build:
.for file in advanced.conf cherokee.conf mods-ssl sites-default sites-example
	@cd ${BUILD_WRKSRC} && ${SED} -e \
		's:%sysconfdir%:${PREFIX}/etc:g ; \
		 s:%datadir%:${PREFIX}/share:g ; \
		 s:%wwwroot%:${PREFIX}/www:g ; \
		 s:%prefix%:${PREFIX}:g' < ${file}.sample.pre > ${file}.sample
.endfor

pre-install:
	@if [ ! -f ${PREFIX}/www ]; then \
		${MKDIR} ${PREFIX}/www;\
	fi
	@if [ ! -f ${PREFIX}/www/data ] ; then \
		${MKDIR} ${PREFIX}/www/data;\
	fi
	@${ECHO_MSG} " `pwd` "

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.png ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/images/*.png ${DOCSDIR}
.endif
	${INSTALL_DATA} ${WRKSRC}/doc/develop/Intro.txt ${DATADIR}
	@${ECHO_MSG} " "
	@${ECHO_MSG} " Dont forget to read the doc "
	@${ECHO_MSG} " ${PREFIX}/share/cherokee/Intro.txt"
	@${ECHO_MSG} " "

.include <bsd.port.post.mk>
