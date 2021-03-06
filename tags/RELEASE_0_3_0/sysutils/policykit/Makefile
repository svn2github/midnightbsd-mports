# $MidnightBSD: mports/sysutils/policykit/Makefile,v 1.6 2009/12/28 23:35:04 laffer1 Exp $

PORTNAME=	policykit
PORTVERSION=	0.9
PORTREVISION=	2
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/
DISTNAME=	PolicyKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for controlling access to system-wide components
LICENSE=	x11

BUILD_DEPENDS=	${LOCALBASE}/share/sgml/docbook/4.1/catalog:${PORTSDIR}/textproc/docbook-410 \
		xsltproc:${PORTSDIR}/textproc/libxslt \
		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:${PORTSDIR}/textproc/docbook-xsl
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
    		expat.6:${PORTSDIR}/textproc/expat2
USERS=		polkit
GROUPS=		polkit

USE_GNOME=	gnomehack glib20 intlhack
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-pam-include=system \
		--with-os-type=freebsd \
		--localstatedir=/var \
		--with-polkit-user=polkit \
		--with-polkit-group=polkit
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		GTKDOC="false"

MAN1=		polkit-action.1 polkit-auth.1 polkit-config-file-validate.1 \
		polkit-policy-file-validate.1
MAN5=		PolicyKit.conf.5
MAN8=		PolicyKit.8

post-install:
	${MKDIR} ${PREFIX}/etc/PolicyKit
	if [ ! -f ${PREFIX}/etc/PolicyKit/PolicyKit.conf ]; then \
	    	${INSTALL_DATA} ${WRKSRC}/data/PolicyKit.conf \
			${PREFIX}/etc/PolicyKit/PolicyKit.conf ; \
	fi
	${INSTALL_DATA} ${WRKSRC}/data/PolicyKit.conf \
	    	${PREFIX}/etc/PolicyKit/PolicyKit.conf.dist
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.mk>
