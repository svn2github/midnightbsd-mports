# Ports collection makefile for:  bison
# Date created:			  27 Mar 1999
# Whom:				  Jerry Hicks
#
# $MidnightBSD$
# $FreeBSD: ports/devel/bison/Makefile,v 1.56 2007/10/18 02:28:45 ade Exp $
#

PORTNAME=	bison
PORTVERSION=	2.3
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A parser generator from FSF, (mostly) compatible with Yacc
LICENSE=	gpl2

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4
RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		bison.1
INFO=		bison

CONFIGURE_ARGS+=--disable-yacc
.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

.ifdef USE_BISON
.error You have `USE_BISON' variable defined either in environment or in make(1) arguments. Please undefine and try again.
.endif

.include <bsd.port.pre.mk>

post-extract:
	@${RM} -f ${WRKSRC}/doc/bison.info*

#
# Requires texinfo 4.8 or above
#
.if ${OSVERSION} < 601000
	@${REINPLACE_CMD} "/^@headitem/d" ${WRKSRC}/doc/bison.texinfo
.endif

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${EXAMPLESDIR}/calc++
	${INSTALL_DATA} ${WRKSRC}/examples/calc++/*.[chly]* \
		${EXAMPLESDIR}/calc++
.endif

.include <bsd.port.post.mk>
