# $MidnightBSD$

PORTNAME=	varnish
PORTVERSION=	3.0.5
CATEGORIES=	www
MASTER_SITES=	http://repo.varnish-cache.org/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Varnish high-performance HTTP accelerator

LICENSE=	bsd2

LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre

GNU_CONFIGURE=	yes
USE_PYTHON_BUILD=	yes
CONFIGURE_ARGS=	--localstatedir=${PREFIX} --enable-tests
CONFIGURE_ENV=	RST2MAN=true
USE_LDCONFIG=	yes
USES=		autoreconf gmake libtool readline pkgconfig python:build
INSTALL_TARGET=	install-strip
USE_RC_SUBR=	varnishd varnishlog varnishncsa
SUB_FILES=	pkg-message
.if defined(NO_INET6) || defined(WITHOUT_INET6)
BAD_TESTS+=	r00832
EXTRA_PATCHES+=	${FILESDIR}/no-inet6.patch
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|\$$(libdir)/pkgconfig|\$$(prefix)/libdata/pkgconfig|' \
		${WRKSRC}/Makefile.am
.if defined(BAD_TESTS)
	${RM} -f ${BAD_TESTS:C|.+|${WRKSRC}/bin/varnishtest/tests/\0.vtc|}
.endif

regression-test check test: build
	${GMAKE} TESTS_PARALLELISM=1 -C ${WRKSRC} check

post-build:
	#
	# It is highly recommended, that you verify the build's
	# correctness by performing:
	#
	#	make check
	#
	# now...
	#

post-install:
	@${MKDIR} ${PREFIX}/share/varnish
	@${INSTALL_SCRIPT} ${WRKSRC}/lib/libvmod_std/vmod.py ${PREFIX}/share/varnish
.for f in cache.h heritage.h steps.h common.h acct_fields.h locks.h body_status.h
	@${INSTALL_DATA} ${WRKSRC}/bin/varnishd/${f} ${PREFIX}/include/varnish
.endfor
.for f in vct.h vmod_abi.h vre.h vrt.h vqueue.h vsb.h libvarnish.h miniobj.h vas.h vav.h http_headers.h vcl_returns.h
	@${INSTALL_DATA} ${WRKSRC}/include/${f} ${PREFIX}/include/varnish
.endfor
	@${RM} -f ${PREFIX}/lib/libvarnishapi.*a ${PREFIX}/lib/varnish/lib*a ${PREFIX}/lib/varnish/vmods/lib*a

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
EXTRA_PATCHES+=	${FILESDIR}/bug-1201.patch
.endif

.include <bsd.port.post.mk>
