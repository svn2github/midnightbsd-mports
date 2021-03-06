# $MidnightBSD: mports/devel/qt4/Makefile,v 1.2 2010/01/09 22:53:19 laffer1 Exp $

PORTNAME=	qt4
PORTVERSION=	${QT4_VERSION}
CATEGORIES=	devel
MASTER_SITES=	# empty
DISTFILES=	# none
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiplatform C++ application framework (metaport)
LICENSE=	agg

OPTIONS=	SQL_PLUGINS "Database connectivity plugins for QtSql" off \
		QTCONFIG "Qt configuration (depends on PHONON)" off \
		PHONON "Phonon support (conflicts with KDE4)" off \
		CODECS "Enable support for CN, JP, KR, TW" off \
		TOOLS "Install Qt tools (qmake, moc, etc.)" off

USE_QT_VER=	4
QT_COMPONENTS=	accessible assistant assistant-adp assistantclient \
		clucene  corelib dbus designer doc help gui iconengines \
		imageformats inputmethods network opengl qdbusviewer \
		qt3support qtestlib qvfb script scripttools sql svg webkit \
		xml xmlpatterns xmlpatterns-tool

NO_BUILD=	yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_NLS)
RUN_DEPENDS+=	qt4-l10n>=${QT4_VERSION}:${PORTSDIR}/misc/qt4-l10n
.endif

.if defined(WITH_TOOLS)
QT_COMPONENTS+=	help-tools linguist makeqpf moc pixeltool \
		porting qmake rcc uic uic3 qdoc3
.endif

.if defined(WITH_QTCONFIG)
QT_COMPONENTS+=	qtconfig
.endif

.if defined(WITH_PHONON)
QT_COMPONENTS+=	phonon phonon-gst
.endif

.if defined(WITH_CODECS)
QT_COMPONENTS+=	codecs-cn codecs-jp codecs-kr codecs-tw
.endif

.if defined(WITH_SQL_PLUGINS)
RUN_DEPENDS+=	\
		${LOCALBASE}/lib/qt4/plugins/sqldrivers/libqsqlmysql.so:${PORTSDIR}/databases/qt4-mysql-plugin \
		${LOCALBASE}/lib/qt4/plugins/sqldrivers/libqsqlodbc.so:${PORTSDIR}/databases/qt4-odbc-plugin \
		${LOCALBASE}/lib/qt4/plugins/sqldrivers/libqsqlpsql.so:${PORTSDIR}/databases/qt4-pgsql-plugin \
		${LOCALBASE}/lib/qt4/plugins/sqldrivers/libqsqlite.so:${PORTSDIR}/databases/qt4-sqlite3-plugin
.endif

do-install:	#empty
	${DO_NADA}

.include <bsd.port.post.mk>
