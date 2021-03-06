# New ports collection makefile for:	clive
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/clive/Makefile,v 1.57 2011/03/06 19:06:32 culot Exp $

PORTNAME=	clive
PORTVERSION=	2.2.23
CATEGORIES=	multimedia
MASTER_SITES=	SF/${PORTNAME}/2.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line video extraction tool for YouTube and others
LICENSE=	gpl3

RUN_DEPENDS=	p5-HTML-Parser>=3.59:${PORTSDIR}/www/p5-HTML-Parser \
		p5-WWW-Curl>=4.05:${PORTSDIR}/www/p5-WWW-Curl \
		p5-Class-Singleton>=1.4:${PORTSDIR}/devel/p5-Class-Singleton \
		p5-Getopt-ArgvFile>=1.11:${PORTSDIR}/devel/p5-Getopt-ArgvFile \
		p5-Config-Tiny>=2.12:${PORTSDIR}/devel/p5-Config-Tiny \
		p5-URI>=1.39:${PORTSDIR}/net/p5-URI

# deskutils/ljclive, multimedia/clive1 (same executable/manpage/distfile name)
CONFLICTS=	clive-[0-1]* ljclive-[0-9]*

OPTIONS=	CACHE	 "With video page cache" off \
		SIGWINCH "With resizing progressbar" on

MAN1=		clive.1

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
RUN_DEPENDS+=	p5-Digest-SHA>=5.47:${PORTSDIR}/security/p5-Digest-SHA
.endif

.if defined(WITH_CACHE)
RUN_DEPENDS+=	p5-BerkeleyDB>=0.36:${PORTSDIR}/databases/p5-BerkeleyDB
.endif

.if defined(WITH_SIGWINCH)
RUN_DEPENDS+=	p5-Term-ReadKey>=2.30:${PORTSDIR}/devel/p5-Term-ReadKey
.endif

.include <bsd.port.post.mk>
