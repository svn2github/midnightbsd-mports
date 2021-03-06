# New ports collection makefile for:	djbfft
# Date created:				Wed May 15 16:29:51 BRT 2002
# Whom:			Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD: mports/math/djbfft/Makefile,v 1.3 2008/09/16 19:45:29 laffer1 Exp $
# $FreeBSD: ports/math/djbfft/Makefile,v 1.16 2006/09/03 17:33:38 kris Exp $
#

PORTNAME=	djbfft
PORTVERSION=	0.76
PORTREVISION=	2
CATEGORIES=	math
MASTER_SITES=	http://cr.yp.to/djbfft/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An extremely fast library for floating-point convolution
LICENSE=	publicdom

DISABLE_SIZE=	yes
ALL_TARGET=
INSTALL_TARGET=setup check
MAKE_JOBS_SAFE=	yes

HEADER_FILES=	complex4.h complex8.h fftc4.h fftc8.h fftfreq.h \
		fftr4.h fftr8.h real4.h real8.h
LIB_FILES=	libdjbfft.a

post-patch:
	@${FIND} ${WRKSRC} -type f -exec \
		${REINPLACE_CMD} -E -e 's!(djbfft.a)!lib\1!' {} \;
	@${REINPLACE_CMD} -E 's|("include)|\1/${PORTNAME}|' ${WRKSRC}/hier.c

do-configure:
	@${ECHO_CMD} '${CC} ${CFLAGS} -fPIC' > ${WRKSRC}/conf-cc
	@${ECHO_CMD} '${CC}' > ${WRKSRC}/conf-ld
	@${ECHO_CMD} ${PREFIX} > ${WRKSRC}/conf-home
.ifdef(WITH_OPT_PENTIUM)
	@${ECHO_CMD} 'pentium' > ${WRKSRC}/conf-opt
.endif
.ifdef(WITH_OPT_PPRO)
	@${ECHO_CMD} 'ppro' > ${WRKSRC}/conf-opt
.endif
.ifdef(WITH_OPT_SPARC)
	@${ECHO_CMD} 'sparc' > ${WRKSRC}/conf-opt
.endif

pre-su-install:
	@${MKDIR} ${PREFIX}/include/${PORTNAME}

do-install:
.for file in ${HEADER_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/include/${PORTNAME}
.endfor
.for file in ${LIB_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/lib
.endfor

.include <bsd.port.pre.mk>

pre-everything::
.ifndef(WITH_OPT_PENTIUM)
	@${ECHO_MSG} '===> Set WITH_OPT_PENTIUM to optimize for both Pentium and Pentium MMX'
	@${ECHO_MSG} '     like processors.'
.endif
.ifndef(WITH_OPT_PPRO)
	@${ECHO_MSG} '===> Set WITH_OPT_PPRO to optimize for Pentium Pro, Pentium II, and'
	@${ECHO_MSG} '     Pentium III like processors.'
.endif
.ifndef(WITH_OPT_SPARC)
	@${ECHO_MSG} '===> Set WITH_OPT_SPARC to optimize for Sparc family of processors.'
	@${ECHO_MSG} '     Works well with UltraSPARC-I and UltraSPARC-II processors.'
.endif

.include <bsd.port.post.mk>
