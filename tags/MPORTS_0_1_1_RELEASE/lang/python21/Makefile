# New ports collection makefile for:    python
# Date created:         08 August 1995
# Whom:                 jkh
#
# $FreeBSD: ports/lang/python21/Makefile,v 1.109 2006/05/09 20:52:19 edwin Exp $
# $MidnightBSD: mports/lang/python21/Makefile,v 1.6 2006/11/17 22:30:46 laffer1 Exp $

PORTNAME=	python
PORTVERSION=	2.1.3
PORTREVISION=	10
CATEGORIES=	lang python
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
DISTFILES=	${PYTHON_DISTFILE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interpreted object-oriented programming language
LICENSE=	python

DIST_SUBDIR=	python
WRKSRC=		${PYTHON_WRKSRC}
USE_AUTOTOOLS=	autoconf:213
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-fpectl
CONFIGURE_ENV=	OPT="${CFLAGS}"
INSTALL_TARGET=	altinstall
MAN1=		${PYTHON_VERSION}.1

USE_PYTHON=	yes
PYTHON_VERSION=	python2.1
PYTHON_NO_DEPENDS=	yes
LATEST_LINK=	${PYTHON_VERSION:S/.//}

#
# If you don't want to use Python's thread module, you need to set
# WITHOUT_THREADS.
#
.if !defined(NOLIBC_R) && !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--with-threads
CFLAGS+=		${PTHREAD_CFLAGS}
CONFIGURE_ENV+=		LDFLAGS="${PTHREAD_LIBS} ${LDFLAGS}"
.else
CONFIGURE_ARGS+=	--without-threads
.endif

DEMODIR=	${PREFIX}/share/examples/${PYTHON_VERSION}

.include <bsd.port.pre.mk>

PLATFORMS=plat-freebsd4 plat-freebsd5 plat-freebsd7

post-extract:
	${SED} -e '1s,^.*$$,#!${PREFIX}/bin/${PYTHON_VERSION},' \
		${WRKSRC}/Tools/scripts/pydoc > ${WRKDIR}/pydoc2.1

pre-patch:
	${REINPLACE_CMD} -e \
		's,/usr/doc/python-docs-,${PREFIX}/share/doc/python,g' \
		${WRKSRC}/Lib/pydoc.py
	${REINPLACE_CMD} -e \
		's|^\(prefixes = .*\)\]$$|\1, "${X11BASE}"]|g' \
		${WRKSRC}/Lib/site.py
.for ver in 6 7
	${MKDIR} ${WRKSRC}/Lib/plat-freebsd${ver}
	${CP} ${WRKSRC}/Lib/plat-freebsd5/regen ${WRKSRC}/Lib/plat-freebsd${ver}/
.endfor
	${MKDIR} ${WRKSRC}/Lib/plat-midnightbsd0
	${CP} ${WRKSRC}/Lib/plat-freebsd5/regen ${WRKSRC}/Lib/plat-midnightbsd0/

pre-su-install:
.for platform in ${PLATFORMS}
	${MKDIR} ${PYTHONPREFIX_LIBDIR}/${platform}
.for file in FCNTL.py IN.py regen
	${INSTALL_DATA} ${WRKSRC}/Lib/${platform}/${file} \
		${PYTHONPREFIX_LIBDIR}/${platform}/
.endfor
.endfor

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/pydoc2.1 ${PREFIX}/bin
	@${MKDIR} ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/Misc/python.man \
		${MANPREFIX}/man/man1/${PYTHON_VERSION}.1
	@${MKDIR} ${PYTHONPREFIX_SITELIBDIR}
.if !defined(NOPORTDOCS)
	@cd ${WRKSRC}; tar -c --exclude='*CVS*' -f - Tools | \
		(cd ${PYTHONPREFIX_LIBDIR}; tar xf -)
	@${MKDIR} ${DEMODIR}
	@cd ${WRKSRC}/Demo; tar -c --exclude='*CVS*' -f - * | \
		(cd ${DEMODIR}; tar xf -)
.endif

.if ${ARCH} == i386
PLIST_SUB+=	X86_ONLY=""
.else
PLIST_SUB+=	X86_ONLY="@comment "
.endif

.include <bsd.port.post.mk>
