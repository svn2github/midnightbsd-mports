# New ports collection makefile for:	Xaw3d
# Date created:		18 November 1994
# Whom:			asami
#
# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/Xaw3d/Makefile,v 1.47 2006/08/15 01:13:35 clsung Exp $
#

PORTNAME=	Xaw3d
PORTVERSION=	1.5E
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	ftp://ftp.visi.com/users/hawkeyd/X/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3-D Athena Widget set that looks like Motif

WRKSRC=		${WRKDIR}/xc/lib/Xaw3d
USE_IMAKE=	yes
USE_LDCONFIG=	yes

SUB_FILES=	pkg-message
SUB_LIST=	XAWVER="${XAWVER}"

.include <bsd.port.pre.mk>
.if ${X_WINDOW_SYSTEM:L} == xfree86-3
PLIST_FILES=	lib/libXaw3d.so.6
.endif

post-extract:
	${MKDIR} ${WRKSRC}/X11/Xaw3d
	cd ${WRKSRC}/X11/Xaw3d; ${LN} -sf ../../*.h .

# Workaround a bug in egcs on FreeBSD/Alpha.
.if ${MACHINE_ARCH} == "alpha"
post-configure:
	@(cd ${WRKSRC}; ${MV} Makefile Makefile.orig; ${SED} -e \
	  's/CDEBUGFLAGS = -O/CDEBUGFLAGS =/g' Makefile.orig > Makefile)
.endif

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.XAW3D ${DOCSDIR}
.if ${X_WINDOW_SYSTEM:L} == xfree86-3
	${LN} -sf libXaw3d.so.${XAWVER} ${X11BASE}/lib/libXaw3d.so.6
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
