# $MidnightBSD: mports/textproc/intltool/Makefile,v 1.9 2013/03/09 23:05:56 laffer1 Exp $

PORTNAME=	intltool
PORTVERSION=	0.50.2
CATEGORIES=	textproc gnome
MASTER_SITES=	http://launchpadlibrarian.net/94524169/
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to internationalize various kinds of data files
LICENSE=	gpl2

BUILD_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser
RUN_DEPENDS=	p5-XML-Parser>=0:${PORTSDIR}/textproc/p5-XML-Parser

USE_GMAKE=	yes
USE_ICONV=	yes
USE_PERL5=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--libdir="${PREFIX}/libdata"

MAN8=		intltool-extract.8 intltool-merge.8 intltool-prepare.8 \
		intltool-update.8 intltoolize.8

CONFLICTS=	xml-i18n-tools-[0-9]*

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} \
		-E -e '/^mkinstalldirs[[:space:]]*=/s^/\.\.^^g'

post-install:
	@${MKDIR} ${PREFIX}/share/intltool/XML/Parser/Style
	@${INSTALL_DATA} ${FILESDIR}/OrigTree.pm \
		${PREFIX}/share/intltool/XML/Parser/Style

.include <bsd.port.mk>
