# New ports collection makefile for:		lighttpd
# Date created:					20 May 2004
# Whom:						k@123.org
#
# $MidnightBSD: mports/www/lighttpd/Makefile,v 1.4 2007/08/13 23:02:36 laffer1 Exp $
# $FreeBSD: ports/www/lighttpd/Makefile,v 1.42 2006/09/26 09:07:17 clsung Exp $
#

PORTNAME=	lighttpd
PORTVERSION=	1.4.19
CATEGORIES=	www
MASTER_SITES=	http://www.lighttpd.net/download/ \
		http://mirrors.cat.pdx.edu/lighttpd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A secure, fast, compliant, and very flexible Web Server

LIB_DEPENDS=	pcre.0:${PORTSDIR}/devel/pcre

USE_AUTOTOOLS=	autoconf:261 libtool:15
GNU_CONFIGURE=	yes
USE_GNOME=	lthack
USE_RC_SUBR=	lighttpd.sh
CONFIGURE_ARGS=	--libdir=${PREFIX}/lib/lighttpd --mandir=${PREFIX}/man
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		lighttpd.1 spawn-fcgi.1

OPTIONS=	OPENSSL		"Enable SSL support"	on  \
		OPENLDAP	"Enable LDAP support"	off \
		MYSQL		"Enable MYSQL support"	off \
		IPV6		"Enable IPV6 support"	on \
		CML		"Enable Cache Meta Language support" off

.include <bsd.port.pre.mk>

# Default REQUIRE to rc.d script
_REQUIRE=	DAEMON

.if !defined(WITHOUT_OPENSSL)
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
CONFIGURE_ARGS+=	--with-openssl \
			--with-openssl-includes=${OPENSSLINC} \
			--with-openssl-libs=${OPENSSLLIB}
.endif

.if defined(WITH_OPENLDAP)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--with-ldap
_REQUIRE+=		slapd
.endif

.if defined(WITH_MYSQL)
USE_MYSQL=		yes
CONFIGURE_ARGS+=	--with-mysql
_REQUIRE+=		mysql
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if defined(WITH_CML)
USE_LUA=	5.0
CONFIGURE_ARGS+=	--with-lua
CONFIGURE_ENV+=		CPPFLAGS="-I${LUA_INCDIR}" LDFLAGS="-L${LUA_LIBDIR}"
.endif

SUB_LIST+=		REQUIRE="${_REQUIRE}"

post-patch:
	@${REINPLACE_CMD} -E -e 's|-D_XOPEN_SOURCE=600||' ${WRKSRC}/configure.in

post-install:
	@${INSTALL_DATA} ${FILESDIR}/lighttpd.conf.sample ${PREFIX}/etc
.if !exists(${PREFIX}/etc/lighttpd.conf)
	@${INSTALL_DATA} ${FILESDIR}/lighttpd.conf.sample ${PREFIX}/etc/lighttpd.conf
.endif
	@${LIBTOOL} --finish ${PREFIX}/lib

.include <bsd.port.post.mk>
