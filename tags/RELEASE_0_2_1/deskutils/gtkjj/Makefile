# New ports collection makefile for:	gtkjj
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/deskutils/gtkjj/Makefile,v 1.1 2008/06/19 23:53:27 laffer1 Exp $
#

PORTNAME=	gtkjj
PORTVERSION=	1.0.2
CATEGORIES=	deskutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://www.justjournal.com/software/unix/
MASTER_SITE_SUBDIR=	justjournal
DISTNAME=	jjclient-${PORTVERSION}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	GTK client for posting JustJournal entries
LICENSE=	bsd2

LIB_DEPENDS+=	xmlrpc_client.9:${PORTSDIR}/net/xmlrpc-c
USE_GNOME=	gtk20
WANT_GNOME=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}/gtk

.include <bsd.port.mk>
