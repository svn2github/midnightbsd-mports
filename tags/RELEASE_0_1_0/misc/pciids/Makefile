# New ports collection makefile for:	pciids
# Date created:		2006-08-07
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/pciids/Makefile,v 1.6 2007/02/26 00:56:11 ahze Exp $
#    $MCom: ports/misc/pciids/Makefile,v 1.8 2006/10/26 16:14:10 ahze Exp $

PORTNAME=	pciids
PORTVERSION=	20070225
CATEGORIES=	misc
MASTER_SITES=	http://www.ahze.net/~ahze/distfiles/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ahze

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database of all known ID's used in PCI devices

USE_BZIP2=	yes
NO_BUILD=	yes
PLIST_FILES=	%%DATADIR%%/pci.ids \
		%%DATADIR%%/pci.db
PLIST_DIRS=	%%DATADIR%%

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/pci.ids ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/pci.db ${DATADIR}

.include <bsd.port.pre.mk>

# Below only contains code to create a tar file for this beast
CT_DATE!=	date "+%Y%m%d"
CT_WRKSRC=	${WRKDIR}/tmp
CT_DESTDIR=	${PORTNAME}-${CT_DATE}
CT_TEMPDIR=	${CT_WRKSRC}/${CT_DESTDIR}
CT_MASTER_SITE=	http://pciids.sourceforge.net/v2.2/
CT_DISTFILES=	pci.ids pci.db

maketar: extract
	${MKDIR} ${CT_TEMPDIR}
.for file in ${CT_DISTFILES}
	(cd ${CT_TEMPDIR} && ${FETCH_CMD} ${CT_MASTER_SITE}/${file})
.endfor
	${DIFF} -u ${WRKSRC}/pci.ids ${CT_TEMPDIR}/pci.ids || ${TRUE}
	(cd ${CT_WRKSRC} && ${TAR} -jcf ${PORTNAME}-${CT_DATE}.tar.bz2 ${CT_DESTDIR})
	${SED} -i.bak -e 's|${PORTVERSION}|${CT_DATE}|' ${.CURDIR}/Makefile
	@(cd ${.CURDIR} && ${CP} -f ${CT_WRKSRC}/${PORTNAME}-${CT_DATE}.tar.bz2 ${DISTDIR} && \
		${MAKE} makesum)

.include <bsd.port.post.mk>
