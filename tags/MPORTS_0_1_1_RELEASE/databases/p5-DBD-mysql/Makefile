# New ports collection makefile for:    DBD::mysql
# Date created:				27 Nov 2001
# Whom:	      				Sergey Skvortsov <skv@FreeBSD.org>
#
# $MidnightBSD: mports/databases/p5-DBD-mysql/Makefile,v 1.1 2006/10/03 21:03:20 laffer1 Exp $
# $FreeBSD: ports/databases/p5-DBD-mysql/Makefile,v 1.61 2006/09/12 11:45:26 skv Exp $
#

PORTNAME=	DBD-mysql
PORTVERSION=	4.005
DISTNAME=	${PORTNAME}-${PORTVERSION:S/00$//}
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	DBD
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	MySQL driver for the Perl5 Database Interface (DBI)

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS=	${BUILD_DEPENDS}

CONFLICTS?=	p5-Mysql-modules-[0-9]* p5-DBD-mysql4[0-9]-[0-9]* p5-DBD-mysql5[0-9]-[0-9]*

USE_MYSQL=	yes

PERL_CONFIGURE=	yes

MAN3=	Bundle::DBD::mysql.3 DBD::mysql.3 DBD::mysql::INSTALL.3

.include <bsd.port.mk>
