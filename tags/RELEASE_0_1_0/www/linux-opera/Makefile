# New ports collection makefile for:		linux-opera
# Date created:					December 6th 2000
# Whom:						des
#
# $MidnightBSD: mports/www/linux-opera/Makefile,v 1.1 2007/04/04 16:01:35 laffer1 Exp $
# $FreeBSD: ports/www/linux-opera/Makefile,v 1.78 2006/12/18 18:46:27 mezz Exp $
#

PORTNAME=	opera
PORTVERSION=	${OPERA_VER}.${OPERA_DATE}
CATEGORIES=	www linux
MASTER_SITES=	ftp://ftp.opera.com/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.sunet.se/pub/www/clients/Opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://sunsite.cnlab-switch.ch/mirror/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.tiscali.nl/pub/mirrors/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.ntua.gr/pub/www/Opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		http://mirrors.pmmf.hu/mirror/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.task.gda.pl/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		ftp://ftp.planetmirror.com/pub/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		http://gd.tuwien.ac.at/infosys/browsers/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,net/www/opera/linux/${OPERA_VER:S/.//}/final/en/i386/static/&,}
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}-${OPERA_VER}-${OPERA_DATE}.1-static-qt.i386-en

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A blazingly fast, full-featured, standards-compliant browser

RUN_DEPENDS=	${LINUXBASE}/usr/lib/libaspell.so.15:${PORTSDIR}/textproc/linux-aspell

WRKSRC=		${WRKDIR}/${DISTNAME}-${OPERA_BUILD}
USE_XLIB=	yes
USE_BZIP2=	yes
USE_LINUX=	yes
ONLY_FOR_ARCHS=	i386 amd64

NO_BUILD=	yes

OPERA_VER=	9.22
OPERA_DATE=	20070716
OPERA_BUILD=	655
DATADIR=	${PREFIX}/share/${UNIQUENAME}
DOCSDIR=	${PREFIX}/share/doc/${UNIQUENAME}

MAN1=		linux-opera.1

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g ; s|%%X11BASE%%|${X11BASE}|g' \
			${WRKSRC}/install.sh ${WRKSRC}/ini/pluginpath.ini
	@${FIND} ${WRKSRC} -name '*.orig' -delete
	@${FIND} ${WRKSRC} -name '*.bak' -delete

do-install:
	@(cd ${WRKSRC} && ./install.sh \
			--prefix=${PREFIX} \
			--docdir=${DOCSDIR} \
			--sharedir=${DATADIR} \
			--exec_prefix=${DATADIR}/bin \
			--plugindir=${DATADIR}/plugins)

.include <bsd.port.mk>
