# Created by: Motoyuki Kasahara <m-kasahr@sra.co.jp>
# $FreeBSD: head/devel/libtool/Makefile 370099 2014-10-05 18:01:19Z tijl $
# $MidnightBSD$

PORTNAME=	libtool
PORTREVISION=	2

COMMENT=	Generic shared library support script

.include "${.CURDIR}/../libtool/Makefile.common"

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-ltdl-install \
		--host=${ARCH}-portbld-freebsd9.1 \
		--target=${ARCH}-portbld-freebsd9.1 \
		--build=${ARCH}-portbld-freebsd9.1
MAKE_ARGS=	MAKEINFOFLAGS=--no-split
USES+=		makeinfo

INFO=		libtool

post-patch:
	@${RM} -f ${WRKSRC}/doc/*.info*
.for f in build-aux/ltmain.sh configure libtoolize.in m4/libtool.m4
	@${TOUCH} -mr ${WRKSRC}/${f}.orig ${WRKSRC}/${f}
.endfor

.include <bsd.port.mk>
