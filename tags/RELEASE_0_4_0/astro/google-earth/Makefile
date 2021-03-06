# $MidnightBSD: mports/astro/google-earth/Makefile,v 1.14 2013/02/18 23:10:57 laffer1 Exp $

PORTNAME=	google-earth
PORTVERSION=	5.2.1.1588
PORTEPOCH=	3
CATEGORIES=	astro deskutils geography
MASTER_SITES=	http://dl.google.com/earth/client/advanced/previous/:previous \
		http://dl.google.com/earth/client/current/:current
DISTFILES=	GoogleEarthLinux.bin:previous
DIST_SUBDIR=	${PORTNAME}/${PORTVERSION}
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Explore, Search and Discover
LICENSE=	restricted

EXTRACT_DEPENDS=	unmakeself:${PORTSDIR}/archivers/unmakeself
RUN_DEPENDS=	update-mime-database:${PORTSDIR}/misc/shared-mime-info

RESTRICTED=	Not sure about redistribution rights

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/\..*//g}/

USE_LINUX=	yes
USE_LINUX_APPS=	xorglibs
USE_GNOME=	desktopfileutils
USE_PERL5_BUILD=	yes

.include <bsd.port.pre.mk>

UNMAKESELF=	${LOCALBASE}/bin/unmakeself

.if defined(WITH_NVIDIA_GL)
RUN_DEPENDS+=	${LINUXBASE}/usr/lib/libGL.so.1:${PORTSDIR}/x11/nvidia-driver
.else
USE_LINUX_APPS+=	dri
.endif

.if ${OSVERSION}<3000
IGNORE=	BSD>=0.3+ is needed with Linux emulation 2.6.x
.elif ${OSVERSION}<4000 && \
	(! defined (OVERRIDE_LINUX_NONBASE_PORTS) || \
	 ! (${OVERRIDE_LINUX_NONBASE_PORTS} == f10))
IGNORE=	needs non-default linux ports (define OVERRIDE_LINUX_BASE_PORT=f10 and OVERRIDE_LINUX_NONBASE_PORTS=f10)
.endif

.if ${OSVERSION} >= 4015 && ${ARCH} == "amd64"
BROKEN=	seems to crash on >= 0.4/amd64
.endif

do-extract:
	@${MKDIR} ${WRKSRC}
	${MKDIR} ${PREFIX}/share/mime/packages/
	${MKDIR} ${PREFIX}/share/applications/
	@${CP} ${DISTDIR}/${DIST_SUBDIR}/${_DISTFILES} ${WRKSRC}
	@cd ${WRKSRC} && ${UNMAKESELF} ${_DISTFILES} && ${RM} -f ${_DISTFILES}
	@cd ${WRKSRC} && ${TAR} xf googleearth-data.tar && ${RM} -f googleearth-data.tar
	@cd ${WRKSRC} && ${TAR} xf googleearth-linux-x86.tar && ${RM} -f googleearth-linux-x86.tar

post-patch:
	@${REINPLACE_CMD} -i "" -e 's|^# Set the home.*|GOOGLEEARTH_DATA_PATH=${DATADIR}|' ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e "s|^# Let's boogie.*|rm -f \$${HOME}/.googleearth/instance-running-lock|" ${WRKSRC}/bin/googleearth
	@${REINPLACE_CMD} -i "" -e 's/^TMPPATH.*/exit 0/' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\"\$$SETUP_INSTALLPATH/|\"${WRKSRC}/|' ${WRKSRC}/postinstall.sh
	@${REINPLACE_CMD} -i "" -e 's|\$$SETUP_INSTALLPATH/googleearth |${PREFIX}/bin/googleearth |' ${WRKSRC}/postinstall.sh
	${PERL} -i -pe 's|/lib/ld-lsb.so.3\0\0\0|/lib/ld-linux.so.2\0|' ${WRKSRC}/googleearth-bin

do-build:
	@${SETENV} SETUP_INSTALLPATH=${DATADIR} ${WRKSRC}/postinstall.sh
	@cd ${WRKSRC} && ${RM} -rf setup.* preuninstall.sh postinstall.sh \
		bin/googleearth.orig

pre-su-install:
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${WRKSRC}

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/googleearth-mimetypes.xml ${PREFIX}/share/mime/packages/
	${INSTALL_DATA} ${WRKSRC}/Google-googleearth.desktop ${PREFIX}/share/applications/googleearth.desktop
	${CP} -rp ${WRKSRC}/* ${DATADIR}
	${RM} -f ${DATADIR}/googleearth-mimetypes.xml ${DATADIR}/googleearth.desktop
	${INSTALL_SCRIPT} ${FILESDIR}/browserwrapper ${DATADIR}/bin
	${LN} -sf ${DATADIR}/bin/googleearth ${PREFIX}/bin/
	-@update-mime-database ${PREFIX}/share/mime
	-@update-desktop-database

.include <bsd.port.post.mk>
