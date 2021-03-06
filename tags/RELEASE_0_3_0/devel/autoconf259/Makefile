# New ports collection makefile for:	autoconf
# Date created:		7 October 1995
# Whom:			torstenb@FreeBSD.org
#
# $MidnightBSD: mports/devel/autoconf259/Makefile,v 1.3 2008/03/24 17:57:03 laffer1 Exp $
# $FreeBSD: ports/devel/autoconf259/Makefile,v 1.64 2006/05/04 21:40:23 edwin Exp $
#

PORTNAME=	autoconf
PKGNAMESUFFIX=	259
PORTVERSION=	2.59
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	autoconf
DISTNAME=	autoconf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatically configure source code on many Un*x platforms (2.59)
LICENSE=	gpl2

DEPRECATED=	Autoconf 2.61 supersedes it
EXPIRES=	March 31, 2008

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4 \
		help2man:${PORTSDIR}/misc/help2man
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

BUILD_VERSION=	259
PLIST_SUB=	BUILD_VERSION=${BUILD_VERSION}
LATEST_LINK=	autoconf${BUILD_VERSION}
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5=	yes
INFO=		autoconf${BUILD_VERSION} standards${BUILD_VERSION}

GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CONFIG_SHELL=${SH}
CONFIGURE_ENV+=	M4=${LOCALBASE}/bin/gm4
CONFIGURE_ARGS=	--program-suffix=${BUILD_VERSION} --without-lispdir
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

GENERIC_TOOLS=	config.guess config.sub	elisp-comp install-sh mdate-sh \
		missing	mkinstalldirs

MAN1_PAGES=	autoconf autoheader autom4te autoreconf autoscan \
		autoupdate config.guess config.sub ifnames
MAN1=		${MAN1_PAGES:S/$/${BUILD_VERSION}.1/g}

post-patch:
	@(cd ${WRKSRC} && ${REINPLACE_CMD} -E 's,(PACKAGE=autoconf),\1${BUILD_VERSION},' configure)
	@(cd ${WRKSRC}/man && \
		for file in *.[1x]; do \
			${REINPLACE_CMD} -E 's,([^-]auto)(conf|make|reconf|update|header|scan),\1\2${BUILD_VERSION},g ; \
						s,(config\.guess|config\.sub|ifnames),\1${BUILD_VERSION},g' $$file ; \
		done)
	@(cd ${WRKSRC}/doc && \
		${RM} -f *.info && \
		${MV} autoconf.texi autoconf${BUILD_VERSION}.texi && \
		${MV} standards.texi standards${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(autoconf)\),\1${BUILD_VERSION}\),g' autoconf${BUILD_VERSION}.texi && \
		${REINPLACE_CMD} -E 's,(autoconf|standards)\.(info|texi),\1${BUILD_VERSION}\.\2,g' Makefile.in)

post-install:
.for FILE in ${GENERIC_TOOLS}
	@${INSTALL_SCRIPT} ${WRKSRC}/config/${FILE} ${PREFIX}/share/autoconf${BUILD_VERSION}
.endfor
	@-${RM} -fr ${PREFIX}/libexec/autoconf${BUILD_VERSION}
	@${MKDIR} ${PREFIX}/libexec/autoconf${BUILD_VERSION}
.for i in autoconf autoheader autoreconf autoscan autoupdate ifnames
	@${LN} -sf ${PREFIX}/bin/${i}${BUILD_VERSION} \
		${PREFIX}/libexec/autoconf${BUILD_VERSION}/${i}
.endfor

.include <bsd.port.mk>
