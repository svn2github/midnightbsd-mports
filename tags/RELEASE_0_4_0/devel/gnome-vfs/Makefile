# New ports collection makefile for:	gnomevfs2
# Date created:				28th June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gnome-vfs/Makefile,v 1.8 2010/02/28 21:14:00 laffer1 Exp $
# $FreeBSD: ports/devel/gnome-vfs/Makefile,v 1.123 2007/04/11 14:52:49 marcus Exp $
#   $MCom: ports/devel/gnome-vfs/Makefile,v 1.167 2007/03/13 13:02:20 ahze Exp $
#

PORTNAME=	gnome-vfs
PORTVERSION=	2.24.1
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Virtual File System
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)


RUN_DEPENDS=	${LOCALBASE}/share/mime/magic:${PORTSDIR}/misc/shared-mime-info

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack gnomemimedata gconf2 \
		ltverhack referencehack
USE_AUTOTOOLS=	libtool
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-openssl \
		--disable-gnutls \
		--disable-howl \
		--with-hal-mount=/sbin/mount \
		--with-hal-umount=/sbin/umount
CONFIGURE_ENV=	CPPFLAGS="${PTHREAD_CFLAGS} -I${LOCALBASE}/include -DPTHREAD_LIB=\"${PTHREAD_LIBS}\""
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall

GCONF_SCHEMAS=	desktop_default_applications.schemas \
		desktop_gnome_url_handlers.schemas system_dns_sd.schemas \
		system_http_proxy.schemas system_smb.schemas

OPTIONS=	SAMBA "Enable SMB volume support" on \
		MDNS "Enable Bonjour/Rendezvous support" on \
                HAL "Enable HAL support" on

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/lib/libfam.so) || !defined(WITHOUT_FAM)
USE_FAM=	yes
.endif

.if exists(${LOCALBASE}/lib/libkrb5.so)
LIB_DEPENDS+=	krb5:${PORTSDIR}/security/heimdal
.endif

.if !defined(WITHOUT_HAL)
CONFIGURE_ARGS+=--enable-hal
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=--disable-hal
.endif


.if !defined(WITHOUT_SAMBA)
LIB_DEPENDS+=	smbclient.0:${PORTSDIR}/net/samba-libsmbclient
PLIST_SUB+=	SAMBA=""
.else
PLIST_SUB+=	SAMBA="@comment "
CONFIGURE_ARGS+=--disable-samba
.endif

.if !defined(WITHOUT_MDNS)
LIB_DEPENDS+=	avahi-client:${PORTSDIR}/net/avahi-app
.else
CONFIGURE_ARGS+=--disable-avahi
.endif


post-patch:
	@${REINPLACE_CMD} -e 's|@PTHREAD_LIB@|${PTHREAD_LIBS}|' \
		${WRKSRC}/gnome-vfs-2.0.pc.in ${WRKSRC}/gnome-vfs-module-2.0.pc.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
		${WRKSRC}/libgnomevfs/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g ; \
		s|%%LOCALBASE%%|${LOCALBASE}|g' \
		${WRKSRC}/libgnomevfs/xdgmime.c \
		${WRKSRC}/libgnomevfs/gnome-vfs-hal-mounts.c
	@${REINPLACE_CMD} -e 's|-lacl||g' \
		${WRKSRC}/configure
	@${SED} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		< ${MASTERDIR}/pkg-install.in > ${PKGINSTALL}
	@${SED} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
		< ${MASTERDIR}/pkg-deinstall.in > ${PKGDEINSTALL}

pre-configure:
	@if [ -n "`${PKG_INFO} -xI '^bind[0-9]*-base-[0-9]' 2> /dev/null`" ]; then \
		${ECHO_CMD} "${PKGNAME}: bind installed with PORT_REPLACES_BASE_BIND causes build problems."; \
		${FALSE}; \
	fi

.if defined(WITHOUT_KERBEROS)
	@${ECHO_CMD} "${PKGNAME}: KERBEROS is required."
	@${FALSE}
.endif

.include <bsd.port.post.mk>

.endif
