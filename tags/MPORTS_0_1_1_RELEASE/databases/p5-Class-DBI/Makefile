# New ports collection makefile for:	Class-DBI
# Date created:		15 Dec 2001
# Whom:			Sergey Skvortsov <skv@FreeBSD.org>
#
# $FreeBSD: ports/databases/p5-Class-DBI/Makefile,v 1.24 2006/11/20 07:45:48 skv Exp $
# $MidnightBSD$
#

PORTNAME=	Class-DBI
PORTVERSION=	3.0.16
DISTVERSIONPREFIX=	v
CATEGORIES=	databases perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Class
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Simple Database Abstraction
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor \
		${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp \
		${SITE_PERL}/Class/Data/Inheritable.pm:${PORTSDIR}/devel/p5-Class-Data-Inheritable \
		${SITE_PERL}/Ima/DBI.pm:${PORTSDIR}/databases/p5-Ima-DBI \
		${SITE_PERL}/${PERL_ARCH}/Storable.pm:${PORTSDIR}/devel/p5-Storable \
		${SITE_PERL}/UNIVERSAL/moniker.pm:${PORTSDIR}/devel/p5-UNIVERSAL-moniker \
		${SITE_PERL}/${PERL_ARCH}/List/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils \
		${SITE_PERL}/${PERL_ARCH}/version.pm:${PORTSDIR}/devel/p5-version \
		${SITE_PERL}/${PERL_ARCH}/Clone.pm:${PORTSDIR}/devel/p5-Clone \
		${SITE_PERL}/Class/Trigger.pm:${PORTSDIR}/devel/p5-Class-Trigger
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Class::DBI.3 Class::DBI::Attribute.3 \
		Class::DBI::Cascade::Delete.3 Class::DBI::Cascade::Fail.3 \
		Class::DBI::Cascade::None.3 Class::DBI::Column.3 \
		Class::DBI::ColumnGrouper.3 Class::DBI::Iterator.3 \
		Class::DBI::Query.3 Class::DBI::Relationship.3 \
		Class::DBI::SQL::Transformer.3 Class::DBI::Search::Basic.3 \
		Class::DBI::Test::SQLite.3

post-configure:
# dirty hack to deceive irritable pod2man
	@${PERL} -pi -e 's/^(POD2MAN_EXE.*)$$/\1 --lax/;' ${WRKSRC}/Makefile

.include <bsd.port.mk>
