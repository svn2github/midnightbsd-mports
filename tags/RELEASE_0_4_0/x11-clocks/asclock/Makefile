# $MidnightBSD: mports/x11-clocks/asclock/Makefile,v 1.5 2009/05/31 18:15:02 laffer1 Exp $

PORTNAME=	asclock
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	x11-clocks afterstep
MASTER_SITES=	${MASTER_SITE_XCONTRIB}
MASTER_SITE_SUBDIR=	applications
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Afterstep clock with some language extensions
LICENSE=	unknown

CONFLICTS=	asclock-gtk-[0-9]* asclock-xlib-[0-9]*

# clang's cpp destroys whitespace, particularly hard tabs in makefiles,
# which is fatal for imake.
USE_GCC=	any
USE_IMAKE=	yes
USE_XORG=	xpm xext x11
MAN1=		asclock.1
PLIST_FILES=	bin/asclock

pre-configure:
	(cd ${WRKSRC}; \
	${ECHO_CMD} ${ASCLOCK_LANG} | ${WRKSRC}/configure > /dev/null)
	@${ECHO_MSG} "*****************  NOTE  *****************"
	@${ECHO_MSG} "*                                        *"
	@${ECHO_MSG} "*  You can choose languages for asclock. *"
	@${ECHO_MSG} "* 1) english [DEFAULT]                   *"
	@${ECHO_MSG} "* 2) german                              *"
	@${ECHO_MSG} "* 3) portuguese                          *"
	@${ECHO_MSG} "* 4) dutch                               *"
	@${ECHO_MSG} "* 5) norwegian                           *"
	@${ECHO_MSG} "* 6) italian                             *"
	@${ECHO_MSG} "* 7) swedish                             *"
	@${ECHO_MSG} "* 8) spanish                             *"
	@${ECHO_MSG} "* 9) hungarian                           *"
	@${ECHO_MSG} "* 0) breton                              *"
	@${ECHO_MSG} "* a) french                              *"
	@${ECHO_MSG} "* b) czech                               *"
	@${ECHO_MSG} "*                                        *"
	@${ECHO_MSG} "* Specify the number you want when make. *"
	@${ECHO_MSG} "* Example: \" make ASCLOCK_LANG=1 \"       *"
	@${ECHO_MSG} "******************************************"

.include <bsd.port.mk>
