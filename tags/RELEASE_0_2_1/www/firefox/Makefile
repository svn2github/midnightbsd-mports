# New ports collection makefile for:	phoenix
# Date created:			2002/10/21
# Whom:				Alan Eldridge <alane@FreeBSD.org>
#
# $MidnightBSD: mports/www/firefox/Makefile,v 1.15 2008/07/03 04:10:34 laffer1 Exp $
# $FreeBSD: ports/www/firefox/Makefile,v 1.183 2007/10/10 00:15:32 marcus Exp $
#   $MCom: ports/www/firefox/Makefile,v 1.39 2007/05/31 12:16:54 ahze Exp $
#

PORTNAME=	firefox
DISTVERSION=	2.0.0.16
PORTREVISION=	0
PORTEPOCH=	1
CATEGORIES=	www ipv6
MASTER_SITES=	${MASTER_SITE_MOZILLA_EXTENDED}
MASTER_SITE_SUBDIR=	${PORTNAME}/releases/${DISTVERSION}/source
DISTNAME=	${PORTNAME}-${DISTVERSION}-source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web browser based on the browser portion of Mozilla
LICENSE=	mpl

#BROKEN=	Works fine, but we need to unbrand it.

BUILD_DEPENDS=	nss>=3.11.2:${PORTSDIR}/security/nss

MOZILLA_NAME=	Firefox
MOZ_OPTIONS=	--program-transform-name='s/firefox/${MOZILLA}/'

WANT_GNOME=	yes
ALL_TARGET=	default
CONFIGURE_ENV=	LOCALBASE=${LOCALBASE}
CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd6.0 \
			--target=${ARCH}-portbld-freebsd6.0
EXTRA_CFLAGS=	-O2
HAS_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GCC=	3.4+
WANT_PERL=	yes
GECKO_PLIST_PRE_FILES=	lib/${MOZILLA}/chrome/icons/default/default.xpm
GECKO_PLIST_PRE_DIRS=	lib/${MOZILLA}/chrome/icons/default lib/${MOZILLA}/chrome/icons

FIREFOX_ICON=		${MOZILLA}.xpm
FIREFOX_ICON_SRC=	${PREFIX}/lib/${MOZILLA}/icons/default.xpm
MOZ_OPTIONS=	--enable-application=browser \
		--enable-system-cairo	\
		--enable-official-branding \
		--enable-canvas	\
		--with-system-nss

SYSTEM_PREFS=		${FAKEDIR}/lib/${MOZILLA}/defaults/pref/firefox.js
MOZ_PIS_SCRIPTS=	moz_pis_S50cleanhome

OPTIONS=	NEWTAB "Open external links in a new tab" on \
		SMB "Enable smb:// URI support using gnomevfs" off

.include <bsd.port.pre.mk>

GECKO_PTHREAD_LIBS!=${CC} -dumpspecs | ${GREP} -m 1 pthread | ${SED} -e 's|^.*%{\!pg: %{pthread:|| ; s|}.*$$||' || ${TRUE}

.if ${ARCH} == "sparc64"
IGNORE=	does not run
.endif

MOZ_OPTIONS+=	--enable-svg --enable-svg-renderer=cairo

post-extract::
	@${SED} -e 's|@FIREFOX_ICON@|${FIREFOX_ICON}|' -e 's|@MOZILLA@|${MOZILLA}|' \
		-e 's|@MOZILLA_NAME@|${MOZILLA_NAME}|' \
		<${FILESDIR}/firefox.desktop.in >${WRKDIR}/${MOZILLA}.desktop

post-patch:
	${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS:C/-pthread/${GECKO_PTHREAD_LIBS}/}|' \
		${WRKSRC}/storage/build/Makefile.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/security/manager/ssl/src/Makefile.in
.for ii in modules/libpref/src/init extensions/sroaming/resources/content/prefs \
	embedding/minimo
	@${REINPLACE_CMD} -e '/accessibility.typeaheadfind.enablesound/s/true/false/ ; \
		/dom.disable_window_open_feature.toolbar/s/false/true/' \
		${WRKSRC}/${ii}/all.js
.endfor

pre-install:
	${ECHO_CMD} 'share/applications/${MOZILLA}.desktop' >> ${PLIST}
	${ECHO_CMD} "@unexec ${RMDIR} %D/share/applications 2>/dev/null || ${TRUE}" >> ${PLIST}
	${ECHO_CMD} 'share/pixmaps/${FIREFOX_ICON}' >> ${PLIST}
.if !defined(WITHOUT_NEWTAB)
	${ECHO_CMD} >> ${SYSTEM_PREFS}
	${ECHO_CMD} "// Open external links in new tab" >> ${SYSTEM_PREFS}
	${ECHO_CMD} "pref(\"browser.link.open_external\", 3);" \
		>> ${SYSTEM_PREFS}
.endif # !defined(WITHOUT_NEWTAB)

do-install:
	if [ ! -L ${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ]; then \
		for jpi in ${JPI_LIST}; do \
			if [ -f $${jpi} ]; then \
				${LN} -sf $${jpi} \
					${PREFIX}/lib/browser_plugins/libjavaplugin_oji.so ; \
				break; \
			fi; \
		done; \
	fi

post-install:
	${MKDIR} ${PREFIX}/share/applications ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKDIR}/${MOZILLA}.desktop ${PREFIX}/share/applications/
	${MKDIR} ${PREFIX}/lib/${MOZILLA}/chrome/icons/default
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/lib/${MOZILLA}/chrome/icons/default/default.xpm
	${LN} -sf ${FIREFOX_ICON_SRC} ${PREFIX}/share/pixmaps/${FIREFOX_ICON}

.include "${PORTSDIR}/www/mozilla/Makefile.common"
.include <bsd.port.post.mk>
