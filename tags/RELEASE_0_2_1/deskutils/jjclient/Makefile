# New ports collection makefile for:	jjclient
# Date created:				27 Feb 2008
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/deskutils/jjclient/Makefile,v 1.3 2008/06/17 19:11:38 laffer1 Exp $
#

PORTNAME=	jjclient
PORTVERSION=	1.0.2
CATEGORIES=	deskutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://www.justjournal.com/software/unix/
MASTER_SITE_SUBDIR=	justjournal

MAINTAINER=	luke@midnightbsd.org
COMMENT=	A command line client for posting JustJournal entries
LICENSE=	bsd2

LIB_DEPENDS+=	xmlrpc_client.9:${PORTSDIR}/net/xmlrpc-c

.include <bsd.port.mk>
