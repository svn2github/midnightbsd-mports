# New ports collection makefile for:	xlockmore
# Date created:		9 November 1994
# Whom:			smace
#
# $MidnightBSD: mports/x11/xlockmore/Makefile,v 1.1 2007/03/08 19:10:10 laffer1 Exp $
# $FreeBSD: ports/x11/xlockmore/Makefile,v 1.104 2007/02/02 17:06:22 pav Exp $
#

PORTNAME=	xlockmore
PORTVERSION=	5.23
PORTREVISION=	1
CATEGORIES?=	x11
MASTER_SITES=	ftp://ftp.tux.org/pub/tux/bagleyd/xlockmore/ \
		http://www.tux.org/~bagleyd/latest/

MAINTAINER?=	ports@MidinghtBSD.org
COMMENT=	Like XLock session locker/screen saver, but just more

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-gl --without-motif --without-sx \
		--without-editres --without-dtsaver --without-rplay \
		--without-nas --without-gtk --without-esound \
		--without-gtk2
.if defined(MAKE_KERBEROS4)
CONFIGURE_ARGS+=--enable-kerberos4
KRB4LIB=	-lcom_err -lcrypto
.endif
.if defined(KRB5_HOME) && exists(${KRB5_HOME})
CONFIGURE_ARGS+=--enable-kerberos5
CFLAGS+=	-I${KRB5_HOME}/include
KRB5LIB=	-L${KRB5_HOME}/lib
.endif
USE_XLIB=	yes
USE_XPM=	yes
MAN1=		xlock.1

OPTIONS=MESAGL			"Enable Mesa 3D (for GL modes)"		off \
	MB			"Enable Xmb function series"		off \
	SYSLOG			"Enable syslog logging"			off \
	DISABLE_ALLOW_ROOT	"Allows users to turn off allowroot"	off \
	NICE_ONLY		"Enable only low cpu modes"		off \
	BLANK_ONLY		"Enable blank mode only (boring)"	off \
	PAM			"Enable PAM authentication support"	off \
	BAD_PAM			"Xlock will ask PAM with root rights"	off

.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
WITH_MESAGL=	no
.else
WITH_MESAGL?=	yes
.endif
.if ${WITH_MESAGL} == yes
CONFIGURE_ARGS+=	--with-mesa
MESALIB=${PTHREAD_LIBS}
USE_GL=	yes
.else
CONFIGURE_ARGS+=	--without-mesa --without-opengl
.endif

.if defined(WITH_NICE_ONLY)
CONFIGURE_ARGS+=	--enable-nice-only
.endif

.if defined(WITH_BAD_PAM)
CONFIGURE_ARGS+=	--enable-bad-pam
.endif

.if defined(WITH_PAM)
CONFIGURE_ARGS+=	--enable-pam
.endif

.if defined(WITH_NICE_ONLY)
CONFIGURE_ARGS+=	--enable-nice-only
.endif

.if defined(WITH_BLANK_ONLY)
CONFIGURE_ARGS+=	--enable-blank-only
.endif

.if defined(WITH_MB)
CONFIGURE_ARGS+=	--enable-use-mb
.endif

.if defined(XLOCKMORE_LANG)
CONFIGURE_ARGS+=	--with-lang=${XLOCKMORE_LANG}
.endif

.if defined(WITH_SYSLOG)
CONFIGURE_ARGS+=	--enable-syslog
.endif

CONFIGURE_ENV+=		XLOCKLIBS="${KRB5LIB} ${KRB4LIB} ${MESALIB}"

.if defined(WITH_DISABLE_ALLOW_ROOT)
CONFIGURE_ARGS+=	--disable-allow-root
.endif

.if defined(WITH_PAM) && !defined (WITH_BAD_PAM)
pre-extract:
	@${ECHO}
	@${ECHO} "You have enabled PAM support. If you want to authenticate against"
	@${ECHO} "root only accessible PAM modules then define WITH_BAD_PAM=yes also."
	@${ECHO} "For example, pam_unix requires root rights to access shadow passwords."
	@${ECHO}
.endif

post-configure:
	${REINPLACE_CMD} -e 's/-lXdpms//g' ${WRKSRC}/modes/Makefile

PLIST_FILES=	bin/xlock lib/X11/app-defaults/XLock

.include <bsd.port.post.mk>
