# New ports collection makefile for:	Ruby/GNUstep
# Date created:		14 September 2001
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/devel/ruby-gnustep/Makefile,v 1.3 2008/06/14 16:21:40 laffer1 Exp $
# $FreeBSD: ports/devel/ruby-gnustep/Makefile,v 1.35 2007/01/31 18:17:57 dinoex Exp $
#

PORTNAME=	gnustep
PORTVERSION=	0.2.2
PORTREVISION=	3
CATEGORIES=	devel lang ruby gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	rigs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Ruby interface to the GNUstep development environment
LICENSE=	gpl2

USE_RUBY=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}
MAKE_FLAGS+=	debug=no

post-extract:
	${FIND} ${WRKSRC}/ -type f -name '.cvsignore' -delete
	${FIND} -d ${WRKSRC}/ -type d -name CVS -exec ${RM} -rf "{}" ";"

post-patch:
	${ECHO_CMD} "" > ${WRKSRC}/Source/${MAKEFILE}.postamble
	${RUBY} -i~ -p \
		-e 'gsub(/-lpthread/, "-pthread");' \
		-e 'gsub(/-lgmodel/, "");' \
		${WRKSRC}/Source/${MAKEFILE}
	${FIND} ${WRKSRC}/ -type f | \
		${XARGS} ${RUBY} -i -pe 'gsub(/ ruby -/, " ${RUBY} -")'

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}/${LOCALBASE}/lib/ruby/site_ruby/1.8/i386-freebsd0

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/Source/obj/librigs.so $(RUBY_SITEARCHLIBDIR)/
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${RUBY_MODEXAMPLESDIR}
	${CP} -R ${WRKSRC}/Examples/* ${RUBY_MODEXAMPLESDIR}/
.endif
.if !defined(NOPORTDOCS)
	${MKDIR} ${RUBY_MODDOCDIR}
.for f in ChangeLog NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${f} ${RUBY_MODDOCDIR}/
.endfor
.endif

.include <bsd.port.mk>
