# -*-mode: makefile-*-
#
# $MidnightBSD: mports/x11/kdelibs4/Makefile,v 1.7 2010/05/05 23:49:51 laffer1 Exp $
#

PORTNAME=	kdelibs
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	1
CATEGORIES=	x11 kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMESUFFIX?=	# empty
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base set of libraries needed by KDE programs
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/lib/libhspell.a:${PORTSDIR}/textproc/hspell \
		update-mime-database:${PORTSDIR}/misc/shared-mime-info
LIB_DEPENDS=	searchclient:${PORTSDIR}/deskutils/strigi \
		soprano.4:${PORTSDIR}/textproc/soprano \
		IlmImf:${PORTSDIR}/graphics/OpenEXR \
		aspell:${PORTSDIR}/textproc/aspell \
		jasper:${PORTSDIR}/graphics/jasper \
		pcre:${PORTSDIR}/devel/pcre \
		avahi-core:${PORTSDIR}/net/avahi-app \
		enchant.1:${PORTSDIR}/textproc/enchant \
		ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		idn:${PORTSDIR}/dns/libidn \
		utempter:${PORTSDIR}/sysutils/libutempter \
		hal.1:${PORTSDIR}/sysutils/hal \
		lzma.0:${PORTSDIR}/archivers/xz \
		smbclient.0:${PORTSDIR}/net/samba-libsmbclient
RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme \
		update-mime-database:${PORTSDIR}/misc/shared-mime-info \
		showrgb:${PORTSDIR}/x11/rgb \
		iceauth:${PORTSDIR}/x11/iceauth \
		xauth:${PORTSDIR}/x11/xauth

CONFLICTS=	kdebase-workspace-4.1.*

LATEST_LINK=	${PORTNAME}4

USE_KDE4=	kdeprefix kdehier automoc4 sharedmime
KDE4_BUILDENV=	yes
USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_BISON=	build
USE_OPENSSL=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus gui network opengl qt3support \
		qtestlib script sql svg xml designer phonon \
		assistant svg qdbusviewer makeqpf imageformats \
		qmake_build moc_build rcc_build uic_build
USE_GNOME=	libxml2 libxslt
MAKE_JOBS_SAFE=	yes

CMAKE_ARGS+=	-DWITH_FAM:BOOL=Off \
		-DWITH_ACL:BOOL=Off \
		-DKDE4_PREFIX:String=${KDE4_PREFIX}

MAN1=	checkXML.1 \
	kde4-config.1 \
	kdecmake.1 \
	kjs.1 \
	kjscmd.1 \
	kross.1 \
	makekdewidgets.1
MAN7=	kdeoptions.7 \
	qtoptions.7
MAN8=	kbuildsycoca4.8 \
	kcookiejar4.8 \
	kded4.8 \
	kdeinit4.8 \
	meinproc4.8

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/include/avahi-compat-libdns_sd/dns_sd.h) || defined(WITH_LIBDNS)
LIB_DEPENDS+=	avahi-qt4:${PORTSDIR}/net/avahi-qt4 \
		dns_sd:${PORTSDIR}/net/avahi-libdns
.else
.if ${OSVERSION} < 3015
LIB_DEPENDS+=	dns_sd:${PORTSDIR}/net/mDNSResponder
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${LOCALBASE},g' \
		${PATCH_WRKSRC}/kde3support/kdeui/k3sconfig.cpp \
		${PATCH_WRKSRC}/kdecore/network/k3socks.cpp \
		${PATCH_WRKSRC}/kdecore/kernel/kstandarddirs.cpp \
		${PATCH_WRKSRC}/kdeui/dialogs/kcupsoptionswidget_p.cpp \
		${PATCH_WRKSRC}/kdeui/kernel/start-session-bus.sh \
		${PATCH_WRKSRC}/kio/kssl/kopenssl.cpp \
		${PATCH_WRKSRC}/kio/kio/ksambashare.cpp \
		${PATCH_WRKSRC}/kjsembed/qtonly/FindQJSInternal.cmake
#Fix rgb named colors database path.
	${REINPLACE_CMD} -e 's|/usr/X11R6|${LOCALBASE}|g' \
		${PATCH_WRKSRC}/kdeui/colors/kcolordialog.cpp

pre-configure:
	${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' \
			 -e 's|/usr/X11R6|${LOCALBASE}|g' \
		${PATCH_WRKSRC}/cmake/modules/*.cmake \
		${PATCH_WRKSRC}/ConfigureChecks.cmake \
		${PATCH_WRKSRC}/doc/api/doxygen.sh
#	FindBerkeleyDB.cmake should be rewritten to support multiple version
#	provided by ports, instead of hardcoding one of them
# 	${REINPLACE_CMD} -e 's|/usr/local/include/db4|${BDB_INCLUDE_DIR}|' \
# 		-e 's|NAMES db|NAMES ${BDB_LIB_NAME} ${LOCALBASE}/lib|' \
# 		${PATCH_WRKSRC}/cmake/modules/FindBerkeleyDB.cmake
#	prevent updating mime during build
#	${REINPLACE_CMD} -e '/^update_xdg_mimetypes/d; /SharedMimeInfo/d' \
#		${PATCH_WRKSRC}/mimetypes/CMakeLists.txt
#	default KDEHOME dir
	${REINPLACE_CMD} -e '/KDE_DEFAULT_HOME/s|.kde|.kde4|' \
		${PATCH_WRKSRC}/CMakeLists.txt

post-install:
	@-update-mime-database ${PREFIX}/share/mime

.include <bsd.port.post.mk>
