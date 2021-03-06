# New ports collection makefile for:    python
# Date created:         08 August 1995
# Whom:                 jkh
#
# $FreeBSD: ports/lang/python22/Makefile,v 1.115 2006/08/12 04:24:41 perky Exp $
# $MidnightBSD: mports/lang/python22/Makefile,v 1.2 2007/08/02 09:15:46 laffer1 Exp $
#

PORTNAME=	python
PORTVERSION=	2.2.3
PORTREVISION=	9
CATEGORIES=	lang python ipv6
MASTER_SITES=	${PYTHON_MASTER_SITES}
MASTER_SITE_SUBDIR=	${PYTHON_MASTER_SITE_SUBDIR}
DISTFILES=	${PYTHON_DISTFILE}

PATCH_SITES=	http://www.python.org/security/PSF-2005-001/
PATCHFILES=	patch-2.2.txt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An interpreted object-oriented programming language
LICENSE=	python

DIST_SUBDIR=	python
WRKSRC=		${PYTHON_WRKSRC}
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-fpectl
CONFIGURE_ENV=	OPT="${CFLAGS}"
INSTALL_TARGET=	altinstall
MAN1=		${PYTHON_VERSION}.1

NO_LATEST_LINK=	yes
USE_PYTHON=	yes
PYTHON_VERSION=	python2.2
PYTHON_NO_DEPENDS=	yes

#
# If you don't want to use Python's thread module, you need to set
# WITHOUT_THREADS.
#
.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--with-threads
CFLAGS+=		${PTHREAD_CFLAGS}
.if !defined(WANT_HUGE_STACK_SIZE)
CFLAGS+=		-DTHREAD_STACK_SIZE=0x20000
.else
CFLAGS+=		-DTHREAD_STACK_SIZE=0x100000
.endif
CONFIGURE_ENV+=		LDFLAGS="${PTHREAD_LIBS} ${LDFLAGS}"
.else
CONFIGURE_ARGS+=	--without-threads
.if defined(LDFLAGS)
CONFIGURE_ENV+=		LDFLAGS="${LDFLAGS}"
.endif # defined(LDFLAGS)
.endif # !defined(WITHOUT_THREADS)

DEMODIR=	${PREFIX}/share/examples/${PYTHON_VERSION}

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+= --enable-ipv6

PLATFORMS=plat-freebsd4 plat-freebsd5 plat-freebsd7

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

pre-su-install:
.for platform in ${PLATFORMS}
	${MKDIR} ${PYTHONPREFIX_LIBDIR}/${platform}
.for file in IN.py regen
	${INSTALL_DATA} ${WRKSRC}/Lib/${platform}/${file} \
		${PYTHONPREFIX_LIBDIR}/${platform}/
.endfor
.endfor

post-extract:
	${SED} -e '1s,^.*$$,#!${PREFIX}/bin/${PYTHON_VERSION},' \
		${WRKSRC}/Tools/scripts/pydoc > ${WRKDIR}/pydoc2.2

post-install:
	${INSTALL_SCRIPT} ${WRKDIR}/pydoc2.2 ${PREFIX}/bin/
	@${MKDIR} ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/Misc/python.man \
		${MANPREFIX}/man/man1/${PYTHON_VERSION}.1
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
