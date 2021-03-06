# -*-mode: makefile-*-
# New ports collection makefile for:	kdebase3.1
# Date created:				29 November 2002
# Whom:					kde@freebsd.org
#
# $FreeBSD: ports/x11/kdebase3/Makefile,v 1.183 2006/09/18 16:31:54 lofi Exp $
# $MidnightBSD$
#

PORTNAME=	kdebase
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	3
CATEGORIES=	x11 kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic applications for the KDE system

RUN_DEPENDS=	${KDE_PREFIX}/env/xdg-env.sh:${PORTSDIR}/misc/kde-xdg-env
BUILD_DEPENDS=	mkfontdir:${X_CLIENTS_PORT} \
		xmkmf:${X_IMAKE_PORT}
LIB_DEPENDS=	sasl2:${PORTSDIR}/security/cyrus-sasl2 \
		smbclient:${PORTSDIR}/net/samba-libsmbclient \
		usb-0.1:${PORTSDIR}/devel/libusb

CONFLICTS=	kdeartwork-3.[2-3]* kdelibs-3.[0-4]* kdeutils-3.[0-2]*

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_GETOPT_LONG=yes
USE_OPENLDAP=	yes
USE_OPENSSL=	yes

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XPM=	yes
SUB_FILES=	kdm pkg-deinstall pkg-install pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message
PKGINSTALL=	${WRKDIR}/pkg-install
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall

USE_AUTOTOOLS=  libtool:15
INSTALLS_SHLIB=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3

CONFIGURE_ENV+=	RUN_KAPPFINDER=no kde_cv_utmp_file=/var/run/utmp
CONFIGURE_ARGS+=--without-java			\
		--with-qt-dir=${X11BASE}	\
		--with-xdmdir=${X11BASE}/lib/X11/xdm \
		--with-ssl-dir=${OPENSSLBASE}

OPTIONS=	ARTSWRAPPER "Suid wrapper for aRts, req'd for realtime prio" on

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if ${X_WINDOW_SYSTEM:L} == xorg
RUN_DEPENDS+=	kompmgr:${PORTSDIR}/x11-wm/kompmgr
.endif

.if !defined(WITHOUT_ARTSWRAPPER)
RUN_DEPENDS+=	artswrapper:${PORTSDIR}/audio/artswrapper
.endif

post-extract:
	@${ECHO} "#!/bin/sh" > ${WRKSRC}/mkpamserv
	@${ECHO} "exit 0" >> ${WRKSRC}/mkpamserv

pre-configure:
	${REINPLACE_CMD} -e "s,%%LOCALBASE%%,${LOCALBASE},g" \
		${WRKSRC}/kdeprint/descriptions/Makefile.in
	${REINPLACE_CMD} -e "s,applications-merged,kde-applications-merged,g" \
		${WRKSRC}/applnk/Makefile.in

post-configure:
	${REINPLACE_CMD} -e "s@^\s*Exec=.*\$$@Exec=ElectricEyes@" \
		${WRKSRC}/kappfinder/apps/Graphics/ElectricEyes.desktop
	${REINPLACE_CMD} -e 's/444/644/g' \
		${WRKSRC}/kdesktop/init/Templates/Makefile

post-install:
	${INSTALL_DATA} ${FILESDIR}/freebsd.keytab ${PREFIX}/share/apps/konsole/
	${RM} -f ${PREFIX}/share/apps/konsole/linux.desktop
	${CHMOD} u+s ${PREFIX}/bin/kcheckpass
	${CHGRP} kmem ${PREFIX}/bin/ksysguardd && \
		${CHMOD} g+s ${PREFIX}/bin/ksysguardd
	@${MV} ${PREFIX}/bin/kdm ${PREFIX}/bin/kdm-bin
	@${MV} ${PREFIX}/bin/kdm_config ${PREFIX}/bin/kdm-bin_config
	@${MV} ${PREFIX}/bin/kdm_greet ${PREFIX}/bin/kdm-bin_greet
	@${INSTALL_SCRIPT} ${WRKDIR}/kdm ${PREFIX}/bin
.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
