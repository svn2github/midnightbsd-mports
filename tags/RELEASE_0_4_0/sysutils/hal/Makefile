# $MidnightBSD: mports/sysutils/hal/Makefile,v 1.20 2013/06/15 01:34:49 laffer1 Exp $

PORTNAME=	hal
DISTVERSION=	0.5.14
PORTREVISION=	5
CATEGORIES=	sysutils
MASTER_SITES=	http://hal.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hardware Abstraction Layer for simplifying device access
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/include/linux/videodev2.h:${PORTSDIR}/multimedia/v4l_compat
LIB_DEPENDS=	polkit.2:${PORTSDIR}/sysutils/policykit \
		volume_id:${PORTSDIR}/devel/libvolume_id \
		ck-connector:${PORTSDIR}/sysutils/consolekit
RUN_DEPENDS=	${LOCALBASE}/share/pciids/pci.ids:${PORTSDIR}/misc/pciids

USE_GMAKE=	yes
USES=		pathfix gettext
USE_GNOME=	intlhack ltverhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_PYTHON=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-backend=freebsd \
		--disable-docbook-docs \
		--with-pci-ids=${LOCALBASE}/share/pciids \
		--disable-usb-ids \
		--without-libpci \
		--disable-usb \
		--disable-smbios \
		--disable-apm \
		--disable-pmu \
		--enable-policy-kit \
		--enable-console-kit \
		--with-socket-dir=/var/run/hald \
		--with-eject=/usr/sbin/cdcontrol \
		--with-pid-file=/var/run/hald/hald.pid \
		--with-deprecated-keys \
		--localstatedir=/var
CONFIGURE_ENV=	GTKDOC="false"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

#HALVERSION=	0.5.10
#SNAPVERSION=	20080218

USERS=		haldaemon
GROUPS=		haldaemon

USE_RC_SUBR=	hald
USE_GNOME_SUBR=	yes
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-${DISTVERSION}
PLIST_SUB=	VERSION=${DISTVERSION}

RC_FILES=	hal.conf:${PREFIX}/etc/dbus-1/system.d
PLIST_FILES=	${PRIV_FILES:S|^|%%DATADIR%%/dist/|}

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	RC_FILES="${RC_FILES}"

MAN1=		hal-disable-polling.1 hal-find-by-capability.1 \
		hal-find-by-property.1 hal-get-property.1 \
		hal-is-caller-locked-out.1 hal-is-caller-privileged.1 \
		hal-lock.1 hal-set-property.1 lshal.1
MAN8=		hald.8

OPTIONS_DEFINE=	FIXED_MOUNTPOINTS
FIXED_MOUNTPOINTS_DESC=	use fixed mountpoints

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MFIXED_MOUNTPOINTS}
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-tools_hal-storage-mount.c
.endif

.include <bsd.port.pre.mk>

.if (${ARCH}=="i386" || ${ARCH}=="amd64" || ${ARCH}=="ia64")
RUN_DEPENDS+=	dmidecode:${PORTSDIR}/sysutils/dmidecode
.endif

.if ${OSVERSION} >= 800063
PLIST_SUB+=	USB2=""
.else
PLIST_SUB+=	USB2="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^scriptdir = /s|[(]libexecdir[)]/scripts|(libexecdir)/hal/scripts|' \
		${WRKSRC}/tools/Makefile.in \
		${WRKSRC}/tools/freebsd/Makefile.in
	@${REINPLACE_CMD} -e 's|[(]libexecdir[)]/scripts|(libexecdir)/hal/scripts|' \
		${WRKSRC}/hald/Makefile.in \
		${WRKSRC}/tools/Makefile.in
	@${REINPLACE_CMD} -e 's|user="0"|group="operator"|g' \
		${WRKSRC}/hal.conf.in
	@${SED} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
	    	< ${FILESDIR}/README.fuse > ${WRKDIR}/README.fuse

post-install:
	${MKDIR} ${DATADIR}/dist
	${INSTALL_DATA} ${WRKSRC}/hal.conf ${DATADIR}/dist
	${MKDIR} ${PREFIX}/share/hal/fdi/policy/10osvendor
	${INSTALL_DATA} ${FILESDIR}/10-mouse-sysmouse.fdi \
	    	${PREFIX}/share/hal/fdi/policy/10osvendor
	${INSTALL_SCRIPT} ${FILESDIR}/mount-fuse \
	    	${PREFIX}/share/hal/mount-fuse
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} \
		${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/hald/freebsd/README \
		${DOCSDIR}/README.freebsd
	${INSTALL_DATA} ${WRKDIR}/README.fuse \
	    	${DOCSDIR}/README.fuse
.endif

.include <bsd.port.post.mk>
