# New ports collection Makefile for: rxvt
# Date created:         5th December 1994
# Whom:                 gpalmer@FreeBSD.org
#
# $MidnightBSD: mports/x11/rxvt/Makefile,v 1.1 2007/02/19 23:56:29 laffer1 Exp $
# $FreeBSD: ports/x11/rxvt/Makefile,v 1.61 2006/12/09 05:06:13 rafan Exp $
#
# If possible, please consider updating the simple ports/x11-clocks/rclock
# (and maybe ports/chinese/rxvt) when you upgrade rxvt.  These ports all use
# the same distfile.

PORTNAME=	rxvt
PORTVERSION=	2.6.4
PORTREVISION=	3
CATEGORIES+=	x11
MASTER_SITES=	\
		http://public.planetmirror.com/pub/rxvt/%SUBDIR%/ \
		http://slackware.osuosl.org/slackware-8.1/source/xap/rxvt/ \
		ftp://ftp.fu-berlin.de/unix/X11/terms/rxvt/%SUBDIR%/
MASTER_SITE_SUBDIR=	. old devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low memory usage xterm replacement that supports color

FETCH_DEPENDS=	wget:${PORTSDIR}/ftp/wget

USE_XLIB=	yes
USE_XPM=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-utmp --enable-wtmp \
		--with-xpm --enable-xpm-background --enable-transparency \
		--with-xpm-includes=${X11BASE}/include/X11 \
		--with-xpm-library=${X11BASE}/lib
USE_BZIP2=	yes
MAN1=		rxvt.1
PLIST_FILES=	bin/rxvt

# fetch(1) is misbehaving with these MASTER_SITES
FETCH_CMD=	${LOCALBASE}/bin/wget
FETCH_REGET=	0
DISABLE_SIZE=	yes
FETCH_BEFORE_ARGS=
FETCH_AFTER_ARGS=

# enable big5 support
.if defined(WITH_BIG5)
CONFIGURE_ARGS+=	--enable-big5
.endif # WITH_BIG5
#
# enable gb support
.if defined(WITH_GB)
CONFIGURE_ARGS+=	--enable-gb
.endif # WITH_GB
#
# enable greek keyboard support
.if defined(WITH_GREEK_KEYBOARD)
CONFIGURE_ARGS+=	--enable-greek
.endif # WITH_GREEK_KEYBOARD
#
# enable half width/height shadows scrollbar
.if defined(WITH_HALF_SHADOW)
CONFIGURE_ARGS+=	--enable-half-shadow
.endif
#
# enable kanji support
.if defined(WITH_KANJI)
CONFIGURE_ARGS+=	--enable-kanji
.endif # WITH_KANJI
#
# enable menubar
.if defined(WITH_MENUBAR)
CONFIGURE_ARGS+=	--enable-menubar
.endif # WITH_MENUBAR
#
# enable NeXT style scrollbar
.if defined(WITH_NEXT_SCROLLBAR)
CONFIGURE_ARGS+=	--enable-next-scroll
.endif
#
# make resources checking via XGetDefault()
.if defined(WITH_XGETDEFAULT)
CONFIGURE_ARGS+=	--enable-xgetdefault
.endif # WITH_XGETDEFAULT
#
# XIM (X Input Method) protocol support
.ifndef(WITHOUT_XIM)
CONFIGURE_ARGS+=	--enable-xim
.endif # WITH_XIM
#
# enable Xterm style scrollbar
.if defined(WITH_XTERM_SCROLLBAR)
CONFIGURE_ARGS+=	--enable-xterm-scroll
.endif # WITH_XTERM_SCROLLBAR
#

pre-fetch:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "You may use the following build options:"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "WITHOUT_XIM=yes		disable support for XIM (X Input Method) protocol"
	@${ECHO_MSG} "WITH_XGETDEFAULT=yes	make resources checking via XGetDefault()"
	@${ECHO_MSG} "WITH_BIG5=yes		add support for Chinese characters (BIG5)"
	@${ECHO_MSG} "WITH_GB=yes		add support for Chinese characters (GB)"
	@${ECHO_MSG} "WITH_GREEK_KEYBOARD=yes	add support for greek keyboard"
	@${ECHO_MSG} "WITH_HALF_SHADOW=yes	use half width/height shadows on non-Xterm scrollbar"
	@${ECHO_MSG} "WITH_KANJI=yes		add support for Kanji characters"
	@${ECHO_MSG} "WITH_MENUBAR=yes	add support for rxvt menu bar system"
	@${ECHO_MSG} "WITH_NEXT_SCROLLBAR=yes	add support for a NeXT-like scrollbar"
	@${ECHO_MSG} "WITH_XTERM_SCROLLBAR=yes	make the scrollbar look like an Xterm scrollbar"
	@${ECHO_MSG} "WITH_CLEARTEXTPASSWD=yes 	use cleartext passwords"

post-install:
	@${CHMOD} 4711 ${PREFIX}/bin/rxvt

.include <bsd.port.mk>
