# $MidnightBSD: mports/databases/qt4-pgsql-plugin/Makefile,v 1.5 2011/07/23 23:15:13 laffer1 Exp $
# $FreeBSD: ports/databases/qt4-pgsql-plugin/Makefile,v 1.10 2008/08/04 23:30:31 miwi Exp $

PORTNAME=	qt4-${DB}-plugin
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt PostgreSQL database plugin
LICENSE=	gpl3

FAKE_OPTS=	trueprefix

DB=		psql

USE_QT4=	moc_build sql
QT_NONSTANDARD=	yes
QT_DIST=	yes
MAKE_JOBS_SAFE=	yes

USE_PGSQL=	yes
DRIVER=		src/sql/drivers/${DB}
PLUGIN=		src/plugins/sqldrivers/${DB}
EXTRACT_AFTER_ARGS?=	${DISTNAME}/${DRIVER} \
			${DISTNAME}/${PLUGIN}
MAKEFILE=	${FILESDIR}/Makefile.bsd
MAKE_ENV+=	DB="${DB}" DRIVER="${DRIVER}" MOC="${MOC}" \
		PLUGIN="${PLUGIN}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}" \
		QT_INCDIR="${QT_INCDIR}" \
		QT_LIBDIR="${QT_LIBDIR}"
PLIST_SUB=	DB=${DB}

pre-fake:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/qt4/plugins/sqldrivers

.include <bsd.port.mk>
