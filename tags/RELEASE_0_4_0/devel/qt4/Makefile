# $MidnightBSD: mports/devel/qt4/Makefile,v 1.6 2013/06/22 02:31:09 laffer1 Exp $

PORTNAME=	qt4
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	devel
MASTER_SITES=	# empty
DISTFILES=	# none
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiplatform C++ application framework (metaport)
LICENSE=	gpl3

USE_QT4=	accessible clucene corelib dbus declarative designer \
		graphicssystems-opengl gui help iconengines \
		imageformats inputmethods multimedia network opengl \
		phonon phonon-gst qt3support qtestlib script \
		scripttools sql svg webkit xml xmlpatterns

NO_BUILD=	yes

OPTIONS_DEFINE=	CODECS DOCS EXAMPLES NLS SQL_PLUGINS TOOLS
OPTIONS_DEFAULT=${OPTIONS_DEFINE}

SQL_PLUGINS_DESC=	Install database plugins for QtSql
TOOLS_DESC=	Install Qt tools (qmake, moc, etc.)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
USE_QT4+=	doc
.endif

.if ${PORT_OPTIONS:MEXAMPLES}
USE_QT4+=	demo
.endif

.if ${PORT_OPTIONS:MNLS}
USE_QT4+=	l10n
.endif

.if ${PORT_OPTIONS:MSQL_PLUGINS}
USE_QT4+=	sql-mysql sql-odbc sql-pgsql sql-sqlite3
.endif

.if ${PORT_OPTIONS:MTOOLS}
USE_QT4+=	assistant help-tools linguist makeqpf moc pixeltool \
		porting qdbusviewer qdoc3 qmake qmlviewer qtconfig \
		qvfb rcc uic uic3 xmlpatterns-tool
.endif

USE_QT4:=	${USE_QT4:C/$/_run/}

do-patch:
	@${DO_NADA}

do-install:
	@${DO_NADA}

.include <bsd.port.mk>
