# $MidnightBSD$
# $FreeBSD: ports/net/linux-nx-client/Makefile,v 1.15 2010/03/28 06:41:22 dinoex Exp $

PORTNAME=	linux-nx-client
PORTVERSION=	3.4.0
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	http://web04.nomachine.com/download/${PORTVERSION}/Linux/
DISTNAME=		nxclient-${PORTVERSION}-5.i386

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The NoMachine NX client
LICENSE=	gpl2
# agg but gpl2 is the worst case

NO_WRKSUBDIR=	yes
ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX=	yes
USE_LINUX_APPS=	libaudiofile jpeg png
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes

NXSRC=		${WRKSRC}/NX
NXDST=		${PREFIX}/lib/linux-nx-client

PLIST_SUB+=	PORTVERSION=${PORTVERSION}

# Patch binary to expect EINVAL (FreeBSD) instead of EOPNOTSUPP (Linux) when
# trying to set TCP_NODELAY on the X11 unix domain socket.
do-build:
	${REINPLACE_CMD} -e 's/\x83\xf8\x5f\x0f\x84/\x83\xf8\x16\x0f\x84/' \
		${NXSRC}/lib/libXcomp.so.${PORTVERSION}

do-install:
	${MKDIR} ${NXDST}/bin
	${INSTALL_PROGRAM} ${NXSRC}/bin/* ${NXDST}/bin
	${MKDIR} ${NXDST}/lib
.for f in libXcomp libXcompsh
	${INSTALL_DATA} ${NXSRC}/lib/${f}.so.${PORTVERSION} ${NXDST}/lib
	${LN} -sf ${f}.so.${PORTVERSION} ${NXDST}/lib/${f}.so
	${LN} -sf ${f}.so.${PORTVERSION} ${NXDST}/lib/${f}.so.3
.endfor
	${INSTALL_DATA} ${NXSRC}/lib/libcrypto.so.0.9.8 ${NXDST}/lib
	${LN} -sf libcrypto.so.0.9.8 ${NXDST}/lib/libcrypto.so
	${MKDIR} ${NXDST}/share
	${INSTALL_DATA} ${NXSRC}/share/keyboards ${NXDST}/share
	${MKDIR} ${NXDST}/share/keys
	${INSTALL_DATA} ${NXSRC}/share/keys/* ${NXDST}/share/keys
	${MKDIR} ${NXDST}/share/images
	${INSTALL_DATA} ${NXSRC}/share/images/* ${NXDST}/share/images

	${MKDIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${NXSRC}/share/icons/48x48/*.png ${PREFIX}/share/pixmaps
	${MKDIR} ${PREFIX}/share/icons/crystalsvg/48x48 \
		${PREFIX}/share/icons/crystalsvg/32x32 \
		${PREFIX}/share/icons/crystalsvg/22x22 \
		${PREFIX}/share/icons/crystalsvg/16x16
.for x in 16x16 22x22 32x32 48x48
	${MKDIR} ${PREFIX}/share/icons/crystalsvg/${x}
	${INSTALL_DATA} ${NXSRC}/share/icons/${x}/* \
		${PREFIX}/share/icons/crystalsvg/${x}
.endfor

.for f in nxclient nxesd nxkill nxservice nxssh
	${ECHO_CMD} "#!/bin/sh" > ${WRKSRC}/${f}
	${ECHO_CMD} "export NXDIR=${NXDST}" >> ${WRKSRC}/${f}
	${ECHO_CMD} "exec \$$NXDIR/bin/${f} \"\$$@\"" >> ${WRKSRC}/${f}
	${REINPLACE_CMD} 's|${FAKE_DESTDIR}||g' ${WRKSRC}/${f}
	${INSTALL_SCRIPT} ${WRKSRC}/${f} ${PREFIX}/bin
	${BRANDELF} -t Linux ${NXDST}/bin/${f}
.endfor

.include <bsd.port.mk>
