# New ports collection makefile for:	uclmmbase
# Date created:				Thanksgiving Day, 1999
# Whom:	      				Garrett Wollman <wollman@lcs.mit.edu>
#
# $MidnightBSD: mports/devel/uclmmbase/Makefile,v 1.1 2007/03/21 17:07:09 laffer1 Exp $
# $FreeBSD: ports/devel/uclmmbase/Makefile,v 1.12 2005/04/12 17:16:21 mi Exp $
#

PORTNAME=	uclmmbase
PORTVERSION=	1.2.16
CATEGORIES=	devel ipv6
MASTER_SITES=	http://www-mice.cs.ucl.ac.uk/multimedia/software/common/
DISTNAME=	common-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common subroutines for UCL mbone applications

WRKSRC=		${WRKDIR}/common
GNU_CONFIGURE=	yes
USE_OPENSSL=	yes
FAKE_OPTS=	trueprefix

post-configure:
	@for f in ${FILESDIR}/*.bsd ; do \
		${LN} -sf $$f ${WRKSRC}/src/`${BASENAME} $$f .bsd` ; \
	done

# Run the test, and fail if we hit an error. Don't fail in case of
# the networking-error, which may be due IPv6 (or IPv4) being unavailable
# or some network (mis)configuration:
post-build test:
	${WRKSRC}/tests/test-libcommon 2>&1 | ${AWK} '	\
		/fail$$/ && $$2 != "networking" { code=1 }	\
		{ print } END { exit code }'

do-install:
	cd ${WRKSRC}/src && \
		${SET_ENV} ${MAKE_ENV} ${FAKE_SETUP} ${MAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--enable-ipv6

.include <bsd.port.post.mk>
