# ex:ts=8
# New ports collection makefile for:    wine
# Date created:         Sa   9 Nov 1996 00:52:22 MET
# Whom:			se
#
# $MidnightBSD: mports/emulators/wine/Makefile,v 1.2 2007/03/09 20:29:15 laffer1 Exp $
# $FreeBSD: ports/emulators/wine/Makefile,v 1.222 2006/11/25 18:15:21 gerald Exp $
#

PORTNAME=	wine
PORTVERSION=	0.9.26
PORTEPOCH=	1
CATEGORIES=	emulators
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_EXTENDED} \
		http://ibiblio.org/pub/linux/system/emulators/wine/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Microsoft Windows compatibility layer for Unix-like systems

# wine/dlls/glut32/ depends on the presence of libglut.
LIB_DEPENDS=	lcms.1:${PORTSDIR}/graphics/lcms \
		freetype.9:${PORTSDIR}/print/freetype2 \
		gdraw.1:${PORTSDIR}/print/fontforge \
		glut.4:${PORTSDIR}/graphics/libglut

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--mandir=${MANPREFIX}/man
CONFIGURE_ENV=	CPPFLAGS=-I${PREFIX}/include \
		LDFLAGS="-L${PREFIX}/lib -L${LOCALBASE}/lib" \
		LIBS=-Wl,-rpath,${PREFIX}/lib/wine \
		EXTRA_BINARIES="wine-kthread"
USE_LDCONFIG=	${PREFIX}/lib ${PREFIX}/lib/wine
MAN1=		widl.1 wine.1 winebuild.1 winedbg.1 winedump.1 winegcc.1 \
		winemaker.1 wineprefixcreate.1 wineserver.1 wmc.1 wrc.1
ONLY_FOR_ARCHS=	i386
USE_BISON=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GL=		yes
USE_XPM=	yes

SUB_FILES=	pkg-message

.include <bsd.port.pre.mk>

pre-build:
	cd ${WRKSRC} && make depend

post-install:
	${RM} ${PREFIX}/man/man1/wineg++.1
	${MV} -f ${PREFIX}/lib/libwine.so.1.0 ${PREFIX}/lib/libwine.so.1
	${LN} -sf ${PREFIX}/lib/libwine.so.1 ${PREFIX}/lib/libwine.so
.if !defined(NOPORTDOCS)
	-@${MKDIR} ${DOCSDIR}
.for i in README ANNOUNCE AUTHORS LICENSE
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.for i in progman uninstaller winedbg winemine
	${INSTALL_DATA} ${WRKSRC}/programs/${i}/README ${DOCSDIR}/README.${i}
.endfor
	${INSTALL_DATA} ${WRKSRC}/tools/winedump/README ${DOCSDIR}/README.winedump
.endif
	@${INSTALL_SCRIPT} ${WRKSRC}/tools/bug_report.pl ${PREFIX}/lib/wine

.include <bsd.port.post.mk>
