# New ports collection makefile for:	quake3
# Date created:				23 August 2005
# Whom:					pypt
#
# $MidnightBSD: mports/games/quake3/Makefile,v 1.1 2008/05/01 07:04:28 laffer1 Exp $
# $FreeBSD: ports/games/quake3/Makefile,v 1.18 2007/11/07 00:37:19 pav Exp $
#

PORTNAME=	quake3
PORTVERSION=	1.32c
CATEGORIES=	games
MASTER_SITES=	http://www.proarena.com/p/ftpx/x8524/quake_3_arena/ \
		http://www.planetgargoyle.com/ \
		http://www.teamdarkside.net/ \
		http://0day.icculus.org/mirrors/quake3/ \
		http://www.olpainless.net/files/ \
		http://ftp.mancubus.net/pub/idgames/idstuff/source/ \
		${MASTER_SITE_IDSOFTWARE:S|$|source/|}
DISTNAME=	${PORTNAME}-${REALVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Quake III Arena -- first person shooter (native build)
LICENSE=	gpl2

ONLY_FOR_ARCHS=	i386
ONLY_FOR_ARCHS_REASON=	does not run properly; try games/ioquake3
USE_ZIP=	yes
USE_DOS2UNIX=	yes
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${REALVERSION}
BUILD_WRKSRC=	${WRKSRC}/code/unix

OPTIONS=	CLIENT "Build client" on \
		DEDICATED "Build dedicated server" on \
		GAMELIBS "Build game libraries (when not mandatory)" off \
		OPTIMIZED_CFLAGS "Enable compilation optimizations" on \
		SMP "Build SMP (threaded) client" on

MAKE_ENV=	LIBDIR="${LIBDIR}"
PLIST_SUB=	LIBDIR="${LIBDIR:S/${PREFIX}\///}"

LIBDIR=		${PREFIX}/lib/${PORTNAME}
REALVERSION=	1.32b
VM_ARCHS=	i386 powerpc

.include <bsd.port.pre.mk>

.if defined(WITHOUT_CLIENT) && defined(WITHOUT_DEDICATED) && \
    defined(WITHOUT_SMP)
IGNORE=		needs at least one of CLIENT, DEDICATED and SMP options
.endif

.if ${ARCH} == "i386"
BUILD_DEPENDS+=	nasm:${PORTSDIR}/devel/nasm
.endif

.for i in ${ARCH}
.   if ${VM_ARCHS:M${i}} != ""
HAVE_VM_COMPILED=	yes
.   endif
.endfor

.if !defined(HAVE_VM_COMPILED)
MAKE_ENV+=	DLL_ONLY=true
.endif

.if !defined(WITHOUT_CLIENT) || !defined(WITHOUT_SMP)
USE_GL=		yes
USE_XORG=	xxf86dga
.endif

.if !defined(WITHOUT_CLIENT)
MAKE_ENV+=	CLIENT=YES
PLIST_SUB+=	CLIENT=""
Q3BIN+=		quake3
.else
PLIST_SUB+=	CLIENT="@comment "
.endif

.if !defined(WITHOUT_DEDICATED)
MAKE_ENV+=	DEDICATED=YES
PLIST_SUB+=	DEDICATED=""
Q3BIN+=		q3ded
.else
PLIST_SUB+=	DEDICATED="@comment "
.endif

.if defined(WITH_GAMELIBS) || !defined(HAVE_VM_COMPILED)
MAKE_ENV+=	GAMELIBS=YES
PLIST_SUB+=	GAMELIBS=""
.else
PLIST_SUB+=	GAMELIBS="@comment "
.endif

.if !defined(WITHOUT_OPTIMIZED_CFLAGS)
MAKE_ENV+=	OPTIMIZED_CFLAGS=YES
.endif

.if !defined(WITHOUT_SMP)
MAKE_ENV+=	SMP=YES \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
PLIST_SUB+=	SMP=""
Q3BIN+=		quake3-smp
.else
PLIST_SUB+=	SMP="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|botlib\.log|/dev/null|' \
		${WRKSRC}/code/botlib/be_interface.c
	@${REINPLACE_CMD} -e \
		's|//[[:blank:]]*\(Swap_Init[[:blank:]]*();\)|\1|' \
		${WRKSRC}/code/botlib/be_interface.c \
		${WRKSRC}/code/renderer/tr_init.c

do-install:
.for bin in ${Q3BIN}
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/release/${bin} ${PREFIX}/bin
.endfor
.if defined(WITH_GAMELIBS) || !defined(HAVE_VM_COMPILED)
.for dir in baseq3 missionpack
	${MKDIR} ${LIBDIR}/${dir}
	${INSTALL_PROGRAM} ${BUILD_WRKSRC}/release/${dir}/*.so ${LIBDIR}/${dir}
.endfor
.endif

.include "${.CURDIR}/../quake3-data/Makefile.include"
.include <bsd.port.post.mk>
