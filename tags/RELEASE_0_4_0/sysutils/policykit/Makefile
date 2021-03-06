# $MidnightBSD: mports/sysutils/policykit/Makefile,v 1.9 2012/03/10 23:50:22 laffer1 Exp $

PORTNAME=	policykit
PORTVERSION=	0.9
PORTREVISION=	5
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://hal.freedesktop.org/releases/
DISTNAME=	PolicyKit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for controlling access to system-wide components
LICENSE=	x11

LIB_DEPENDS=	dbus-glib-1:${PORTSDIR}/devel/dbus-glib \
    		expat:${PORTSDIR}/textproc/expat2

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
CONFIGURE_ENV=	GTKDOC="false"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.if defined(NO_INSTALL_MANPAGES)
CONFIGURE_ARGS+=--disable-man-pages
.else
BUILD_DEPENDS=	${LOCALBASE}/share/sgml/docbook/4.1/dtd/catalog:${PORTSDIR}/textproc/docbook-410 \
    		xsltproc:${PORTSDIR}/textproc/libxslt \
		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:${PORTSDIR}/textproc/docbook-xsl

MAN1=		polkit-action.1 polkit-auth.1 polkit-config-file-validate.1 \
		polkit-policy-file-validate.1
MAN5=		PolicyKit.conf.5
MAN8=		PolicyKit.8
.endif

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
