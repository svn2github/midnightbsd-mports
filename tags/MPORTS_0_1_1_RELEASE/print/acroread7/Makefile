# New ports collection makefile for:	acroread7
# Date created:		16 March 2005
# Whom:			Trevor Johnson <trevor@freebsd.org>
#
# $MidnightBSD: mports/print/acroread7/Makefile,v 1.2 2007/03/25 01:51:12 ctriv Exp $
# $FreeBSD: ports/print/acroread7/Makefile,v 1.21 2006/09/02 23:18:10 kris Exp $
#

PORTNAME=	acroread7
PORTVERSION?=	7.0.8
PORTREVISION?=	1
PORTEPOCH?=	1
CATEGORIES?=	print linux
MASTER_SITES?=	http://ardownload.adobe.com/pub/adobe/reader/unix/7x/${VERSIONDIR}/${ADOBE_LANG:L}/ \
		ftp://ftp.adobe.com/pub/adobe/reader/unix/7x/${VERSIONDIR}/${ADOBE_LANG:L}/
DISTNAME=	# redefined below
DIST_SUBDIR=	acroread

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Reader for view, print, and search PDF documents (${ADOBE_LANG})
LICENSE=	restricted

RUN_DEPENDS=	acroread:${PORTSDIR}/print/acroreadwrapper \
		${LINUXBASE}/usr/lib/libgtk-x11-2.0.so.0:${PORTSDIR}/x11-toolkits/linux-gtk2 \
		${LINUXBASE}/usr/lib/libpango-1.0.so.0:${PORTSDIR}/x11-toolkits/linux-pango

RESTRICTED=	Must fill out redistribution form at http://www.adobe.com/products/acrobat/distribute.html
ONLY_FOR_ARCHS=	amd64 i386
USE_LINUX=	yes
USE_XLIB=	yes
#USE_GNOME=	desktopfileutils
NO_BUILD=	yes
PLIST=		${PKGDIR}/pkg-plist.${PORTVERSION}
PLIST_SUB=	ACRODIR=${ACRODIR} \
		PLUGINDIR=${PLUGINDIR} \
		ADOBE_LANG=${ADOBE_LANG:U} \
		LOCALE_NAME=${LOCALE_NAME}
SUB_FILES=	ln mv rm pkg-message
SUB_LIST=	ADOBE_LANG=${ADOBE_LANG:U}
PKGMESSAGE=	${WRKDIR}/pkg-message
WRKSRC=		${WRKDIR}/AdobeReader

.if ${PORTVERSION} == 7.0.8
VERSIONDIR=	${PORTVERSION}
DISTNAME=	AdobeReader_${ADOBE_LANG:L}-${PORTVERSION}-1.i386
POSTPROCESS=	> /dev/null
.else
VERSIONDIR=	7.0
DISTNAME=	AdbeRdr701_linux_${ADOBE_LANG:L}
IS_INTERACTIVE=	yes
.endif
LANGCODE=	chs:zh_CN cht:zh_TW dan:da_DK deu:de_DE enu:en_US \
		esp:es_ES fra:fr_FR ita:it_IT jpn:ja_JP kor:ko_KR \
		nld:nl_NL nor:nb_NO ptb:pt_BR suo:fi_FI sve:sv_SE

ADOBE_LANG?=	ENU
.for L in ${ADOBE_LANG:L}
LOCALE_NAME=	${LANGCODE:M${L}\:*:C/.*\://}
LANG_${L:U}=	""
.endfor
.for L in ${LANGCODE:C/\:.*//:U}
LANG_${L}?=	"@comment "
PLIST_SUB+=	LANG_${L}=${LANG_${L}}
.endfor
.if ${ADOBE_LANG:U} == ENU
LANG_NONENU?=	"@comment "
.endif
PLIST_SUB+=	LANG_NONENU=${LANG_NONENU}

ACRODIR=	Adobe/Acrobat7.0/${ADOBE_LANG:U}
PLUGINDIR=	lib/browser_linux_plugins
INSTALLDIR=	${PREFIX}/${ACRODIR}
INSTALLEXEC=	${SETENV} UNAME_s=Linux \
			InstallDir=${INSTALLDIR} \
			UNAME_r="Linux Compatibility on FreeBSD" \
			${SH} ./INSTALL --install_path=${INSTALLDIR} ${POSTPROCESS}

pre-install:
	@${MKDIR} ${INSTALLDIR}
	@${MKDIR} ${WRKDIR}/bin
	@${INSTALL_SCRIPT} \
		${WRKDIR}/ln ${WRKDIR}/rm ${WRKDIR}/mv \
		${WRKDIR}/bin
do-install:
	@${ECHO_CMD} Installing...
	@cd ${WRKSRC} && ${SETENV} PATH=${WRKDIR}/bin:${PATH} ${INSTALLEXEC}
	${CHMOD} 0 ${INSTALLDIR}/Reader/intellinux/plug_ins/PPKLite.api
	${BRANDELF} -t Linux ${INSTALLDIR}/Reader/intellinux/bin/acroread


.include <bsd.port.mk>
