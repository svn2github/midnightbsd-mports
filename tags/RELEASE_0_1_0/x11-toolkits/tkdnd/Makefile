# New ports collection makefile for:	tkdnd
# Date created:		14 October 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/tkdnd/Makefile,v 1.2 2006/12/03 02:55:48 sat Exp $
#

PORTNAME=	tkdnd
PORTVERSION=	1.0
DISTVERSION=	1.0.20040304
CATEGORIES=	x11-toolkits tk84
MASTER_SITES=	CSME
# Distfile prepared from SourceForge CVS

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Native drag and drop capabilities

LIB_DEPENDS=	tk${USE_TK}.1:${PORTSDIR}/x11-toolkits/tk${USE_TK}

USE_BZIP2=	yes
USE_TK=		yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-tcl=${TCL_LIBDIR} --with-tk=${TK_LIBDIR} \
		--x-libraries=${X11BASE}/lib --x-includes=${X11BASE}/include \
		--with-tclinclude=${TCL_INCLUDEDIR} --with-tkinclude=${TK_INCLUDEDIR} --enable-shared
CPPFLAGS=	-I${TK_INCLUDEDIR}/generic -I${TCL_INCLUDEDIR}/generic
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}"
TKPKG=		${PORTNAME}${PORTVERSION}
PLIST_SUB=	TKPKG=${TKPKG}
USE_LDCONFIG=	${PREFIX}/lib/${TKPKG}
MANN=		${PORTNAME}.n

post-patch:
	@${REINPLACE_CMD} -Ee '/^install:/s#install-doc##' -e 's#.*txt.*##' ${WRKSRC}/Makefile.in

post-install:
	@${LN} -sf ${USE_LDCONFIG}/lib${TKPKG}.so ${USE_LDCONFIG}/lib${TKPKG}.so.0
	@${INSTALL_MAN} ${WRKSRC}/doc/tkDND.n ${MANNPREFIX}/man/mann/${MANN}

.include <bsd.port.mk>
