# New ports collection makefile for:	p5-PatchReader
# Date created:				2004-02-11
# Whom:					Toni Viemer� <toni.viemero@iki.fi>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-PatchReader/Makefile,v 1.4 2004/08/12 12:47:58 mat Exp $
#

PORTNAME=	PatchReader
PORTVERSION=	0.9.5
CATEGORIES=	devel perl5
MASTER_SITES=${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../by-authors/id/J/JK/JKEISER
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module with utilities to read and manipulate patches and CVS

PERL_CONFIGURE=	yes

MAN3=		PatchReader.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500800
BUILD_DEPENDS+=	${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp
RUN_DEPENDS+=	${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp
.endif

.include <bsd.port.post.mk>
