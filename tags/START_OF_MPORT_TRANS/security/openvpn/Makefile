# New ports collection makefile for:	openvpn
# Date created:		2002-06-23
# Whom:			Matthias Andree <matthias.andree@gmx.de>
#
# $MidnightBSD: mports/security/openvpn/Makefile,v 1.1 2006/09/21 17:13:41 wintellect Exp $
# $FreeBSD: ports/security/openvpn/Makefile,v 1.28 2006/09/14 01:22:01 rafan Exp $
#

PORTNAME=	openvpn
# -----------------------------------------------------
# DO NOT BOTHER TO SEND NOTICES ABOUT 2.0.8 AS IT FIXES
# WINDOWS-ONLY BUGS THAT DON'T AFFECT *BSD AND THUS
# DOES NOT WARRANT A PORT UPGRADE! AND UPGRADE REQUESTS
# WILL BE DROPPED.       -- Matthias Andree, 2006-09-13
# -----------------------------------------------------
PORTVERSION=	2.0.9
PORTREVISION=	0
CATEGORIES=	security net
# MASTER_SITES points to hosts in distinct data centers,
# so just one MASTER_SITES entry should be OK.
MASTER_SITES=	http://openvpn.net/release/

MAINTAINER=	matthias.andree@gmx.de
COMMENT=	Secure IP/Ethernet tunnel daemon

CONFLICTS=	openvpn-devel-[0-9]*

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=	--with-lzo-lib=${LOCALBASE}/lib \
		--with-lzo-headers=${LOCALBASE}/include

MAN8=		openvpn.8

OPTIONS=	PW_SAVE "Interactive passwords may be read from a file" off

USE_RC_SUBR=	openvpn.sh
USE_LDCONFIG=	${PREFIX}/lib

SUB_FILES=	pkg-message pkg-req
SUB_LIST+=	OSVERSION=${OSVERSION}

.include <bsd.port.pre.mk>

rcsuffix=
SUB_LIST+=	RCSFX=${rcsuffix}

# NOTE: there is no way to explicitly specify the LZO version to OpenVPN,
# if LZO2 and LZO1 are installed, OpenVPN will pick LZO2.
# So depend on LZO1 only if it's already there and LZO2 isn't.
# PACKAGE_BUILDING will also force LZO2.
.if exists(${LOCALBASE}/lib/liblzo2.so.2) || !exists(${LOCALBASE}/lib/liblzo.so.1) || defined(PACKAGE_BUILDING)
LIB_DEPENDS+=	lzo2.2:${PORTSDIR}/archivers/lzo2
.else
LIB_DEPENDS+=	lzo.1:${PORTSDIR}/archivers/lzo
.endif

.if defined(WITH_PW_SAVE)
CONFIGURE_ARGS+=	--enable-password-save
.endif

post-build:
	cd ${WRKSRC}/plugin/down-root && ${MAKE}
	@# self-tests here
.if !defined(WITHOUT_CHECK)
	cd ${WRKSRC} && ${MAKE} check
.endif

pre-install:
	PKG_PREFIX=${PREFIX} ${SH} ${PKGREQ} ${PKGNAME} INSTALL

post-install:
	${MKDIR} ${PREFIX}/lib
	${INSTALL_PROGRAM} ${WRKSRC}/plugin/down-root/openvpn-down-root.so \
		${PREFIX}/lib
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/plugin/down-root/README \
		${DOCSDIR}/README.openvpn-down-root
.for docs in AUTHORS COPYING COPYRIGHT.GPL ChangeLog INSTALL NEWS \
	PORTS README
	${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}
.endfor
	( cd ${WRKSRC} \
	&& ${FIND} easy-rsa sample-config-files sample-scripts -depth \
	| ${GREP} -v easy-rsa/Windows \
	| ${CPIO} -pdmu ${DOCSDIR} )
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
