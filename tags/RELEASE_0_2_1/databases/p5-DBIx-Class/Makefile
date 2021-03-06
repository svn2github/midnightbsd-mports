# New ports collection makefile for:	DBIx-Class
# Date created:		14 Aug 2005
# Whom:			Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD: ports/databases/p5-DBIx-Class/Makefile,v 1.28 2007/08/12 22:14:17 lbr Exp $
# $MidnightBSD: mports/databases/p5-DBIx-Class/Makefile,v 1.1 2007/09/01 17:51:43 ctriv Exp $
#

PORTNAME=	DBIx-Class
PORTVERSION=	0.08007
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Extensible and flexible object <-> relational mapper
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-Page>=2.00:${PORTSDIR}/databases/p5-Data-Page \
		p5-SQL-Abstract>=1.20:${PORTSDIR}/databases/p5-SQL-Abstract \
		p5-SQL-Abstract-Limit>=0.101:${PORTSDIR}/databases/p5-SQL-Abstract-Limit \
		p5-Scope-Guard>=0.03:${PORTSDIR}/devel/p5-Scope-Guard \
		p5-Class-C3>=0.13:${PORTSDIR}/devel/p5-Class-C3 \
		p5-Class-C3-Componentised>=0:${PORTSDIR}/devel/p5-Class-C3-Componentised \
		p5-Carp-Clan>=0:${PORTSDIR}/devel/p5-Carp-Clan \
		p5-DBI>=1.40:${PORTSDIR}/databases/p5-DBI \
		p5-Module-Find>=0:${PORTSDIR}/devel/p5-Module-Find \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector \
		p5-Class-Accessor-Grouped>=0.05002:${PORTSDIR}/devel/p5-Class-Accessor-Grouped \
		p5-JSON>=1.00:${PORTSDIR}/converters/p5-JSON

PERL_CONFIGURE=	yes

MAN1=	dbicadmin.1
MAN3=	DBIx::Class.3 \
	DBIx::Class::AccessorGroup.3 \
	DBIx::Class::CDBICompat.3 \
	DBIx::Class::Core.3 \
	DBIx::Class::Cursor.3 \
	DBIx::Class::DB.3 \
	DBIx::Class::Exception.3 \
	DBIx::Class::InflateColumn.3 \
	DBIx::Class::InflateColumn::DateTime.3 \
	DBIx::Class::InflateColumn::File.3 \
	DBIx::Class::Manual.3 \
	DBIx::Class::Manual::Component.3 \
	DBIx::Class::Manual::Cookbook.3 \
	DBIx::Class::Manual::DocMap.3 \
	DBIx::Class::Manual::Example.3 \
	DBIx::Class::Manual::FAQ.3 \
	DBIx::Class::Manual::Glossary.3 \
	DBIx::Class::Manual::Intro.3 \
	DBIx::Class::Manual::Joining.3 \
	DBIx::Class::Manual::Troubleshooting.3 \
	DBIx::Class::Ordered.3 \
	DBIx::Class::PK.3 \
	DBIx::Class::PK::Auto.3 \
	DBIx::Class::PK::Auto::DB2.3 \
	DBIx::Class::PK::Auto::MSSQL.3 \
	DBIx::Class::PK::Auto::MySQL.3 \
	DBIx::Class::PK::Auto::Oracle.3 \
	DBIx::Class::PK::Auto::Pg.3 \
	DBIx::Class::PK::Auto::SQLite.3 \
	DBIx::Class::Relationship.3 \
	DBIx::Class::Relationship::Base.3 \
	DBIx::Class::Relationship::BelongsTo.3 \
	DBIx::Class::ResultClass::HashRefInflator.3 \
	DBIx::Class::ResultSet.3 \
	DBIx::Class::ResultSetColumn.3 \
	DBIx::Class::ResultSetManager.3 \
	DBIx::Class::ResultSource.3 \
	DBIx::Class::ResultSource::Table.3 \
	DBIx::Class::ResultSourceHandle.3 \
	DBIx::Class::ResultSourceProxy::Table.3 \
	DBIx::Class::Row.3 \
	DBIx::Class::Schema.3 \
	DBIx::Class::Schema::Versioned.3 \
	DBIx::Class::Serialize::Storable.3 \
	DBIx::Class::Storage.3 \
	DBIx::Class::Storage::DBI.3 \
	DBIx::Class::Storage::DBI::Cursor.3 \
	DBIx::Class::Storage::DBI::DB2.3 \
	DBIx::Class::Storage::DBI::MSSQL.3 \
	DBIx::Class::Storage::DBI::MultiDistinctEmulation.3 \
	DBIx::Class::Storage::DBI::NoBindVars.3 \
	DBIx::Class::Storage::DBI::ODBC.3 \
	DBIx::Class::Storage::DBI::ODBC::DB2_400_SQL.3 \
	DBIx::Class::Storage::DBI::Oracle.3 \
	DBIx::Class::Storage::DBI::Oracle::Generic.3 \
	DBIx::Class::Storage::DBI::Oracle::WhereJoins.3 \
	DBIx::Class::Storage::DBI::Pg.3 \
	DBIx::Class::Storage::DBI::Replication.3 \
	DBIx::Class::Storage::DBI::SQLite.3 \
	DBIx::Class::Storage::DBI::Sybase.3 \
	DBIx::Class::Storage::DBI::Sybase::MSSQL.3 \
	DBIx::Class::Storage::DBI::mysql.3 \
	DBIx::Class::Storage::Statistics.3 \
	DBIx::Class::Test::SQLite.3 \
	DBIx::Class::UTF8Columns.3 \
	SQL::Translator::Producer::DBIx::Class::File.3

post-extract:
	@${PERL} -i.bak -ne 'print unless /^\s*build_requires/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
