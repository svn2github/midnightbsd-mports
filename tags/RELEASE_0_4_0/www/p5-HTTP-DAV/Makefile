# New ports collection makefile for:	HTTP-DAV
# Date created:	   02 June 2002
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD: mports/www/p5-HTTP-DAV/Makefile,v 1.1 2007/08/14 06:09:11 laffer1 Exp $
# $FreeBSD: ports/www/p5-HTTP-DAV/Makefile,v 1.5 2006/08/04 12:34:50 erwin Exp $
#

PORTNAME=	HTTP-DAV
PORTVERSION=	0.31
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	HTTP
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WebDAV client library
LICENSE=        gpl2
BUILD_DEPENDS=	${SITE_PERL}/XML/DOM.pm:${PORTSDIR}/textproc/p5-XML-DOM \
		${SITE_PERL}/LWP.pm:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=		dave.1
MAN3=		HTTP::DAV.3 HTTP::DAV::Lock.3 HTTP::DAV::Resource.3 \
		HTTP::DAV::Response.3

.include <bsd.port.mk>
