# New ports collection makefile for:   xmlcharent # Date created:                31 January 2002
# Whom:                        Kimura Fuyuki <fuyuki@mj.0038.net>
#
# $MidnightBSD: mports/textproc/xmlcharent/Makefile,v 1.1 2006/09/27 14:16:58 laffer1 Exp $
# $FreeBSD: ports/textproc/xmlcharent/Makefile,v 1.7 2006/07/14 16:32:39 hrs Exp $
#

PORTNAME=	xmlcharent
PORTVERSION=	0.3
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/${PORTNAME}/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML character entities

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

USE_ZIP=	yes
NO_WRKSUBDIR=	yes
NO_BUILD=	yes
PLIST_SUB=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	XMLDIR=${XMLDIR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}
PLIST_SUB+=	CATALOG_PORTS_XML=${CATALOG_PORTS_XML}

XMLDIR=		${PREFIX}/share/xml/${PORTNAME}
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports
CATALOG_PORTS_XML=	${PREFIX}/share/xml/catalog.ports

do-install:
	${MKDIR} ${XMLDIR}
	${INSTALL_DATA} ${WRKSRC}/*.ent\
		${FILESDIR}/catalog ${FILESDIR}/catalog.xml ${XMLDIR}

.include <bsd.port.mk>
