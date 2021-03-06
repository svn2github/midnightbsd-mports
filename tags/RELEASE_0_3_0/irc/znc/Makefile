# New ports collection makefile for:   znc
# Date created:        May 9 2008
# Whom:                Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/irc/znc/Makefile,v 1.6 2010/10/23 10:47:08 laffer1 Exp $
#

PORTNAME=	znc
PORTVERSION=	0.094
CATEGORIES=	irc ipv6
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An advanced IRC bouncer
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig
WANT_PERL=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd7.0 \
			--host=${ARCH}-portbld-freebsd7.0

OPTIONS=	DEBUG		"Enable debugging" off \
		IPV6		"Enable IPv6 support" off \
		CARES		"Use c-ares resolver library" off \
		OPENSSL		"Enable OpenSSL support" on \
		EXTRA		"Build extra modules" off \
		PERL		"Enable Perl module support" on \
		TCL		"Enable TCL module support" off \
		TCLALLOWALL	"Allow non-admin users to load TCL module" off \
		SASL		"Enable SASL module support" off

.include <bsd.mport.options.mk>

.if defined(WITH_DEBUG)
CONFIGURE_ARGS+=	--enable-debug
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if defined(WITH_CARES)
LIB_DEPENDS+=		cares.2:${PORTSDIR}/dns/c-ares
.else
CONFIGURE_ARGS+=	--disable-c-ares
.endif

.if defined(WITH_OPENSSL)
EXTENSIONS+=		openssl
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
PLIST_SUB+=		OPENSSL=""
.else
CONFIGURE_ARGS+=	--disable-openssl
PLIST_SUB+=		OPENSSL="@comment "
.endif

.if defined(WITH_PERL)
USE_PERL5=		yes
PLIST_SUB+=		PERL=""
.else
CONFIGURE_ARGS+=	--disable-perl
PLIST_SUB+=		PERL="@comment "
.endif

.if defined(WITH_TCL)
USE_TCL=		84+
.include "${PORTSDIR}/Mk/bsd.tcl.mk"
CONFIGURE_ARGS+=	--enable-tcl --with-tcl=${TCL_LIBDIR}
PLIST_SUB+=		TCL=""
.else
CONFIGURE_ARGS+=	--without-tcl
PLIST_SUB+=		TCL="@comment "
.endif

.if defined(WITH_TCLALLOWALL)
.if defined(WITHOUT_TCL)
IGNORE=			tcl allow all support requires TCL. Please re-rerun 'make config' and enable TCL
.endif
CXXFLAGS+=		-DMOD_MODTCL_ALLOW_EVERYONE
.endif

.if defined(WITH_SASL)
LIB_DEPENDS+=		sasl2.2:${PORTSDIR}/security/cyrus-sasl2
CONFIGURE_ARGS+=	--enable-sasl
CONFIGURE_ENV+=		LDFLAGS="-L${LOCALBASE}/lib"
PLIST_SUB+=		SASL=""
.else
PLIST_SUB+=		SASL="@comment "
.endif

.if defined(WITH_EXTRA)
USE_ICONV=		yes
CONFIGURE_ARGS+=	--enable-extra
PLIST_SUB+=		EXTRA=""
.else
PLIST_SUB+=		EXTRA="@comment "
.endif

MANCOMPREEED= yes
MAN1=         znc.1.gz znc-buildmod.1.gz znc-config.1.gz

.include <bsd.port.mk>
