# New ports collection makefile for:	net-mgmt/p5-NSNMP
# Date created:				14 December 2005
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD: ports/net-mgmt/p5-NSNMP/Makefile,v 1.1 2005/12/14 09:03:19 tobez Exp $
# $MidnightBSD$
#

PORTNAME=	NSNMP
PORTVERSION=	0.5
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	../../authors/id/K/KR/KRAGEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NSNMP - fast, flexible, low-level, pure-Perl SNMP library

PERL_CONFIGURE=	yes

MAN3=	NSNMP.3 \
	NSNMP::Simple.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500800
IGNORE=		requires perl 5.8.0 or later. Install lang/perl5.8 and try again
.endif

.include <bsd.port.post.mk>
