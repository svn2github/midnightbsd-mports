# New ports collection makefile for:	courierpassd
# Date created:				26th July 2005
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $FreeBSD: ports/security/courierpassd/Makefile,v 1.9 2006/08/09 06:10:35 ade Exp $
# $MidnightBSD$
#

PORTNAME=	courierpassd
PORTVERSION=	1.1.2
CATEGORIES=	security mail
#MASTER_SITES=	http://www.arda.homeunix.net/store/
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ade

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	User authentication and password changing daemon utility

BUILD_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base
RUN_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS='${CPPFLAGS}' LDFLAGS='${LDFLAGS}'

MINUID?=	100
DELAY?=		3
CONFIGURE_ARGS+=--with-minuid=${MINUID} --with-badpassdelay=${DELAY}

MAN8=		courierpassd.8

pre-everything::
	@${ECHO} ""
	@${ECHO} "###########################################################"
	@${ECHO} ""
	@${ECHO} "The following build options are available:"
	@${ECHO} "
	@${ECHO} "  MINUID=uid"
	@${ECHO} "	Accounts with uids below this value cannot have"
	@${ECHO} "	their passwords changed. Default value is 100."
	@${ECHO} ""
	@${ECHO} "  DELAY=sec"
	@${ECHO} "	Set the delay after a password change failure."
	@${ECHO} "	Default is 3 seconds."
	@${ECHO} ""
	@${ECHO} "###########################################################"
	@${ECHO} ""

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/AUTHORS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif
	@${CAT}	${PKGMESSAGE}

.include <bsd.port.mk>
