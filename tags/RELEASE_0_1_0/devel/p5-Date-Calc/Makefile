# New ports collection makefile for:	p5-Date-Calc
# Date created:				25 February 2000
# Whom:	      				Brad Hendrickse <bradh@uunet.co.za>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Date-Calc/Makefile,v 1.11 2007/01/27 19:20:17 mat Exp $
#

PORTNAME=	Date-Calc
PORTVERSION=	5.5
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../authors/id/T/TC/TCHATZI
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gregorian calendar date calculations

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Bit/Vector.pm:${PORTSDIR}/math/p5-Bit-Vector
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Date::Calc.3 Date::Calc::Object.3 Date::Calendar.3 \
		Date::Calendar::Profiles.3 Date::Calendar::Year.3

.include <bsd.port.mk>
