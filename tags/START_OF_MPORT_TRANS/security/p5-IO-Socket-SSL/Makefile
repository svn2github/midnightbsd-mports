# New ports collection makefile for:	p5-IO-Socket-SSL
# Date created:				October 27th 2000
# Whom:	      				Marc G. Fournier <scrappy@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/security/p5-IO-Socket-SSL/Makefile,v 1.13 2006/09/21 23:22:21 leeym Exp $
#

PORTNAME=	IO-Socket-SSL
PORTVERSION=	1.01
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to SSL sockets

RUN_DEPENDS=	p5-Net-SSLeay>=1.21:${PORTSDIR}/security/p5-Net-SSLeay
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		IO::Socket::SSL.3

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/example/* ${EXAMPLESDIR}
.endif

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500702
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
.endif

.include <bsd.port.post.mk>
