# New ports collection makefile for:	p5-IO-Compress-Base
# Date created:		2006-11-07
# Whom:			Thomas Abthorpe <thomas@goodking.ca>
#
# $MidnightBSD$
# $FreeBSD: ports/archivers/p5-IO-Compress-Base/Makefile,v 1.3 2007/01/03 17:58:55 erwin Exp $
#

PORTNAME=	IO-Compress-Base
PORTVERSION=	2.003
CATEGORIES=	archivers perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base Class for IO::Uncompress modules

PERL_CONFIGURE=	YES

MAN3=		IO::Uncompress::AnyUncompress.3 IO::Uncompress::Base.3 \
		File::GlobMapper.3 IO::Compress::Base.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500601
IGNORE=		this module only support perl 5.6.1 or above
.endif

.include <bsd.port.post.mk>
