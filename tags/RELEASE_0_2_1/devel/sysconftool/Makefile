# New ports collection makefile for:	sysconftool
# Date created:				17 October 2001
# Whom:				Yarema <yds@CoolRat.org>
#
# $FreeBSD: ports/devel/sysconftool/Makefile,v 1.12 2005/11/15 06:49:04 ade Exp $
# $MidnightBSD: mports/devel/sysconftool/Makefile,v 1.3 2008/03/28 02:34:47 laffer1 Exp $
#

PORTNAME=	sysconftool
PORTVERSION=	0.15
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	courier

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helps to install application configuration files
LICENSE=	gpl2

USE_BZIP2=	yes
USE_PERL5=	yes
HAS_CONFIGURE=	yes

USE_AUTOTOOLS=	automake:19 aclocal:19 autoconf:261

MAN1=	sysconftool.1 sysconftoolcheck.1
MAN7=	sysconftool.7

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

.include <bsd.port.mk>
