# ex:ts=8
# Ports collection makefile for:	xmlsec
# Date created:			Jul 31, 2002
# Whom:				ijliao
#
# $FreeBSD: ports/security/xmlsec/Makefile,v 1.20 2006/09/10 23:52:18 kris Exp $
# $MidnightBSD$
#

PORTNAME=	xmlsec
PORTVERSION=	0.0.15
PORTREVISION=	3
CATEGORIES=	security
MASTER_SITES=	http://www.aleksey.com/xmlsec/download/ \
		ftp://ftp.aleksey.com/pub/xmlsec/releases/ \
		ftp://ftp.xmlsoft.org/xmlsec/releases/ \
		ftp://ftp.rpmfind.net/pub/XML/xmlsec/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML Security Library

RUN_DEPENDS=	pkg-config:${PORTSDIR}/devel/pkg-config
BUILD_DEPENDS=	${RUN_DEPENDS}

USE_OPENSSL=	yes
USE_GNOME=	gnomehack libxslt
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
INSTALLS_SHLIB=	yes

MAN1=	xmlsec.1 xmlsec-config.1

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 700019
BROKEN=		Does not compile on FreeBSD >= 7.0
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${TAR} -C ${WRKSRC}/docs -cf - . | ${TAR} -C ${DOCSDIR} -xf -
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
