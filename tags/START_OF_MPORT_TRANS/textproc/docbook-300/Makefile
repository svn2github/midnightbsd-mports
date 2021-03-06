# New ports collection makefile for:	docbook-300
# Date created:		7 April 1999
# Whom:			nik
#
# Based heavily on work by jfieber
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/docbook-300/Makefile,v 1.19 2006/04/15 06:46:10 linimon Exp $
#

PORTNAME=	docbook
PORTVERSION=	3.0
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.ora.com/pub/davenport/
DISTFILES=	docbk30.tar.Z
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	V3.0 of the DocBook DTD, designed for technical documentation

RUN_DEPENDS=	${ISOCAT}:${PORTSDIR}/textproc/iso8879 \
		${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

NO_MTREE=	yes
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_SUB=	DTD_NAME=${PORTNAME}
PLIST_SUB+=	DTD_VERSION=${PORTVERSION}
PLIST_SUB+=	XMLCATMGR=${XMLCATMGR}
PLIST_SUB+=	CATALOG_PORTS_SGML=${CATALOG_PORTS_SGML}

INSTDIR=	${PREFIX}/share/sgml/docbook
ISOCAT=		${PREFIX}/share/sgml/iso8879/catalog
XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_SGML=	${PREFIX}/share/sgml/catalog.ports

LATEST_LINK=	docbook-${PORTVERSION}

pre-su-install:
	@[ -d ${INSTDIR}/${PORTVERSION} ] || ${MKDIR} ${INSTDIR}/${PORTVERSION}

do-install:
	@zcat ${DISTDIR}/docbk30.tar.Z | \
		(cd ${INSTDIR}/${PORTVERSION}; ${PAX} -r)
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/${PORTVERSION}/catalog
	@${ECHO_CMD} "CATALOG \"${ISOCAT}\"" >> ${INSTDIR}/${PORTVERSION}/catalog
	@${CHMOD} ${SHAREMODE} ${INSTDIR}/${PORTVERSION}/*
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${INSTDIR}

post-install:
	@${XMLCATMGR} -sc ${CATALOG_PORTS_SGML} add CATALOG ${PORTNAME}/${PORTVERSION}/catalog

.include <bsd.port.mk>
