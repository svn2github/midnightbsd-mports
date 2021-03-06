# New ports collection makefile for:    gnustep-base
# Date created:         17 April 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/lang/gnustep-base/Makefile,v 1.1 2006/09/21 15:18:26 laffer1 Exp $
# $FreeBSD: ports/lang/gnustep-base/Makefile,v 1.80 2006/08/31 05:35:32 dinoex Exp $
#

PORTNAME=	gnustep-base
PORTVERSION=	1.14.0
CATEGORIES=	lang devel
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep Foundation library

LIB_DEPENDS+=	xml2.5:${PORTSDIR}/textproc/libxml2
LIB_DEPENDS+=	xslt.2:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS+=	gmp.7:${PORTSDIR}/math/libgmp4

ETCDIR=		${LOCALBASE}/etc
USE_AUTOTOOLS=	autoconf:259
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-procfs --with-config-file=${PREFIX}/GNUstep.conf
CONFIGURE_TARGET=
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_CONFIGURE=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_ICONV=	yes
MAKEFILE=
MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
CFLAGS+=	-I${LOCALBASE}/include/libxml2/libxml
BREAKS_IF_PEDANTIC=	yes
NO_FILTER_SHLIBS=	yes
PLIST_SUB+=	LOCALBASE=${LOCALBASE}

.if defined(WITHOUT_OPENSSL)
CONFIGURE_ARGS+=	--disable-openssl
PLIST_SUB+=	OPENSSL="@comment "
.else
USE_OPENSSL=	yes
PLIST_SUB+=	OPENSSL=""
MAKE_APPS=	SSL
INSTALL_APPS=	SSL
.endif

.if !defined(WITHOUT_GNUSTEP_FAKEMAIN)
CONFIGURE_ARGS+=	--enable-fake-main
.endif

PLIST_SUB+=	BASEVERSION=${PORTVERSION:C/[.][0-9]*$//1}

.include <bsd.port.pre.mk>

PATH:=	${PREFIX}/System/Tools:${PATH}

post-build:
.for i in ${MAKE_APPS}
	(cd ${WRKSRC}/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${ALL_TARGET})
.endfor

post-extract:
	@${SED} -e "s=%%PREFIX%%=${LOCALBASE}=" \
		-e "s=%%LDCONFIG_GCC%%=${LDCONFIG_GCC}=" \
		${FILESDIR}/GNUstep.sh \
		> ${WRKSRC}/GNUstep.sh

post-install:
	-@${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/rc.d
	${INSTALL_SCRIPT} ${WRKSRC}/GNUstep.sh ${FAKE_DESTDIR}${ETCDIR}/rc.d/GNUstep.sh
	${INSTALL_DATA} ${FILESDIR}/gdomap_if ${FAKE_DESTDIR}${ETCDIR}
.for i in ${INSTALL_APPS}
	(cd ${WRKSRC}/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
		${SETENV} ${MAKE_ENV} ${GMAKE} -d ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})
.endfor
	${RM} ${PREFIX}/System/Library/Libraries/libgnustep-base.so
	${LN} -s libgnustep-base.so.${PORTVERSION} \
	 ${PREFIX}/System/Library/Libraries/libgnustep-base.so

test:
	@(cd ${WRKSRC}/Testing && . ${SYSTEMDIR}/Makefiles/GNUstep.sh; ${GMAKE})

regression-test:	test

.include <bsd.port.post.mk>
