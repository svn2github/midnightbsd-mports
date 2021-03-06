# New ports collection makefile for:	netpbm
# Date created:		?
# Whom:			jmz (original)
#
# $MidnightBSD: mports/graphics/netpbm/Makefile,v 1.1 2006/09/27 16:00:05 laffer1 Exp $
# $FreeBSD: ports/graphics/netpbm/Makefile,v 1.130 2006/08/05 06:01:42 dinoex Exp $
#

PORTNAME=	netpbm
.if defined(WITH_NETPBM_DEVEL)
PORTVERSION= 	10.30
.else
PORTVERSION=	10.26.30
.endif
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}
.if defined(WITH_NETPBM_DEVEL)
PKGNAMESUFFIX=	-devel${PKGNAMESUFFIX2}
.endif
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A toolkit for conversion of images between different formats

LIB_DEPENDS=	tiff.4:${PORTSDIR}/graphics/tiff \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		jbig.1:${PORTSDIR}/graphics/jbigkit
#		jasper.4:${PORTSDIR}/graphics/jasper

USE_PERL5=	yes
USE_GMAKE=	yes
MAKE_ENV=	CC="${CC}" LN="${LN}" RANLIB="${RANLIB}"
MAKEFILE=	GNUmakefile
INSTALL_TARGET=	install.bin install.lib install.data install-dev
INSTALLS_SHLIB=	yes

MAN1=		netpbm.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
# -O causes an ICE in converter/other/exif.c with gcc 3.3.3 on sparc64.
CFLAGS+=	-O0
.endif

.if defined(WITH_NETPBM_DEVEL)
EXTRA_PATCHES+=	${FILESDIR}/editor-pnmquant-devel.patch
EXTRA_PATCHES+=	${FILESDIR}/converter-other-cameratopam-identify.patch
PLIST_SUB+=	DEVEL=""
.else
EXTRA_PATCHES+=	${FILESDIR}/editor-pnmquant-stable.patch
EXTRA_PATCHES+=	${FILESDIR}/converter-other-pstopnm.patch
PLIST_SUB+=	DEVEL="@comment "
.endif

pre-configure:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g ; \
		 s|%%LOCALBASE%%|${LOCALBASE}|g ; \
		 s|%%X11BASE%%|${X11BASE}|g' ${WRKSRC}/pm_config.in.h
	@${REINPLACE_CMD} -e 's|<shhopt.h>|<pm_shhopt.h>|g' ${WRKSRC}/lib/pm.h
	@${REINPLACE_CMD} -e 's| jpeg2000||g' \
		${WRKSRC}/converter/other/Makefile
	@${CP} ${FILESDIR}/Makefile.config.FreeBSD ${WRKSRC}/Makefile.config
	@${LN} -sf ${WRKSRC}/lib/util/shhopt.h ${WRKSRC}/lib/util/pm_shhopt.h
	@${LN} -sf ${WRKSRC}/lib/util/nstring.h ${WRKSRC}/lib/util/pm_nstring.h

post-install:
	@${ECHO_MSG} "===>  Installing man pages..."
	@${REINPLACE_CMD} -e 's|doc/USERDOC|${DOCSDIR}/USERDOC|g' \
		${WRKSRC}/doc/netpbm.1
	${INSTALL_MAN} ${WRKSRC}/doc/netpbm.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/USERDOC ${DOCSDIR}/
.endif

.if !defined(WITHOUT_PERL) && ${PERL_LEVEL} < 500800
RUN_DEPENDS+=	${SITE_PERL}/File/Temp.pm:${PORTSDIR}/devel/p5-File-Temp
.endif

.include <bsd.port.post.mk>
