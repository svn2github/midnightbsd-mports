# $MidnightBSD$

PORTNAME=	DBD-Pg
PORTVERSION=	3.4.0
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides access to PostgreSQL databases through the DBI

LICENSE=	artistic gpl
LICENSE_COMB=	dual

PERL_CONFIGURE=	yes

BUILD_DEPENDS=	p5-DBI>=1.614:${PORTSDIR}/databases/p5-DBI
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_PGSQL=	yes

.include <bsd.port.mk>
