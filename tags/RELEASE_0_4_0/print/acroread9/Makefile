# $MidnightBSD  mports/print/acroread9/Makefile,v 1.9 2010/04/28 16:39:24 Exp $
#

PORTNAME=	acroread9
PORTVERSION=	9.4.2
CATEGORIES?=	print linux
MASTER_SITES?=	http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/${PORTVERSION}/${ADOBE_LANG:L}/ \
		ftp://ftp.adobe.com/pub/adobe/reader/unix/9.x/${PORTVERSION}/${ADOBE_LANG:L}/
DISTNAME=	AdbeRdr${PORTVERSION:S,.0$,,}-1_i486linux_${ADOBE_LANG:L}
DIST_SUBDIR=	acroread

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Reader for view, print, and search PDF documents (${ADOBE_LANG})
LICENSE=	restricted

RUN_DEPENDS=	acroreadwrapper>=0.0.20110529:${PORTSDIR}/print/acroreadwrapper

RESTRICTED=	Must fill out redistribution form at http://www.adobe.com/products/acrobat/distribute.html
ONLY_FOR_ARCHS=	amd64 i386
USE_BZIP2=	yes
USE_LINUX=	yes
USE_LINUX_APPS=	gdkpixbuf gtk2 libxml2 pango
USE_LDCONFIG=	yes
#USE_GNOME=	desktopfileutils
NO_BUILD=	yes
PLIST_SUB=	ACRODIR=${ACRODIR} \
		ACROBASE=${ACROBASE} \
		ADOBEBASE=${ADOBEBASE} \
		PLUGINDIR=${PLUGINDIR} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		LOCALE_NAME=${LOCALE_NAME}
SUB_FILES=	ln mv rm pkg-message pkg-deinstall
SUB_LIST=	ADOBE_LANG=${ADOBE_LANG:U} \
		ACROBASE=${ACROBASE}
PKGMESSAGE=	${WRKDIR}/pkg-message
PKGDEINSTALL=	${WRKDIR}/pkg-deinstall
WRKSRC=		${WRKDIR}/AdobeReader

SKIP_FAKE_CHECK=.*\.config

LANGCODE=	chs:zh_CN cht:zh_TW dan:da_DK deu:de_DE enu:en_US \
		esp:es_ES fra:fr_FR ita:it_IT jpn:ja_JP kor:ko_KR \
		nld:nl_NL nor:nb_NO ptb:pt_BR suo:fi_FI sve:sv_SE

ADOBE_LANG?=	ENU
.for L in ${ADOBE_LANG:L}
LOCALE_NAME=	${LANGCODE:M${L}\:*:C/.*\://}
LANG_${L:U}=	""
LANG_NON${L:U}=	"@comment "
.endfor
.for L in ${LANGCODE:C/\:.*//:U}
LANG_${L}?=	"@comment "
LANG_NON${L}?=	""
PLIST_SUB+=	LANG_${L}=${LANG_${L}}
PLIST_SUB+=	LANG_NON${L}=${LANG_NON${L}}
.endfor

ADOBEBASE=	Adobe
ACROBASE=	${ADOBEBASE}/Reader9
ACRODIR=	${ACROBASE}/${ADOBE_LANG:U}
PLUGINDIR=	lib/browser_linux_plugins
INSTALLDIR=	${PREFIX}/${ACRODIR}
INSTALLEXEC=	${SETENV} UNAME_s=Linux \
			InstallDir=${INSTALLDIR} \
			UNAME_r="Linux Compatibility on MidnightBSD" \
			${SH} ./INSTALL --install_path=${INSTALLDIR} > /dev/null

pre-install:
	@${MKDIR} ${WRKDIR}/bin
	@${INSTALL_SCRIPT} \
		${WRKDIR}/ln ${WRKDIR}/rm ${WRKDIR}/mv \
		${WRKDIR}/bin

do-install:
	@${ECHO_CMD} Installing...
	@${MKDIR} ${INSTALLDIR}
	@${MKDIR} ${PREFIX}/share/desktop-directories
	@cd ${WRKSRC} && ${SETENV} PATH=${WRKDIR}/bin:${PATH} ${INSTALLEXEC} > /dev/null

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
