# New ports collection makefile for:	TiEmu-2
# Date created:				21 Feb 2006
# Whom:					Alexey Dokuchaev <danfe@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/emulators/tiemu2/Makefile,v 1.4 2006/10/16 07:47:47 clsung Exp $
#

PORTNAME=	tiemu2
PORTVERSION=	2.08
PORTREVISION=	1
CATEGORIES=	emulators
MASTER_SITES=	http://www.ticalc.org/pub/unix/ \
		http://freebsd.nsu.ru/distfiles/tiemu/
DISTNAME=	tiemu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TI89(ti)/92(+)/V200 hand-helds emulator

LIB_DEPENDS=	ticalcs.10:${PORTSDIR}/devel/libticalcs \
		ticables.12:${PORTSDIR}/comms/libticables \
		tifiles.6:${PORTSDIR}/devel/libtifiles

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk20 libglade2
USE_X_PREFIX=	yes

MAN1=		tiemu.1

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

post-extract: .SILENT
	${REINPLACE_CMD} -e 's,\*-\*-linux\*,\*-\*-freebsd\*,' \
		${WRKSRC}/configure
	${REINPLACE_CMD} -E 's,(install-data-am:).*$$,\1,' ${WRKSRC}/Makefile.in
	${REINPLACE_CMD} -e 's,defined(__LINUX__),& || defined(__BSD__),' \
		${WRKSRC}/src/gui/calc/pckeys.h ${WRKSRC}/src/misc/paths.h

.include <bsd.port.mk>
