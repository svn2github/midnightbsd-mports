# New ports collection makefile for:	IO
# Date created:		27 Dec 2000
# Whom:			Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-IO/Makefile,v 1.7 2007/09/18 11:11:54 skv Exp $
#

PORTNAME=	IO
PORTVERSION=	1.2301
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Various IO modules for Perl
LICENSE=	perl

PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	INSTALLDIRS=site POLLUTE=1

MAN3=		IO.3 IO::Dir.3 IO::File.3 IO::Handle.3 IO::Pipe.3 IO::Poll.3 \
		IO::Seekable.3 IO::Select.3 IO::Socket.3 IO::Socket::INET.3 \
		IO::Socket::UNIX.3

.include <bsd.port.mk>
