# New ports collection makefile for:	gentoo
# Date created:				12 August 2001
# Whom:					Anders Nordby <anders@fix.no>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-fm/gentoo/Makefile,v 1.52 2006/08/28 12:01:16 miwi Exp $
#

PORTNAME=	gentoo
PORTVERSION=	0.19.13
PORTREVISION=	0
CATEGORIES=	x11-fm
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}/ \
		http://mirror.4bit.ws/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gtk+ based, file manager inspired by DirectoryOpus
LICENSE=	gpl2

OPTIONS_DEFINE=	FAM DOCS

USE_GNOME=	gnomehack gtk20
USES=		gettext
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MKDIR_P="${MKDIR}"

MAN1=		gentoo.1

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MFAM}
USE_FAM=	yes
.else
CONFIGURE_ARGS+=	--disable-fam
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/share|${PREFIX}/share|g ; \
		 s|/bin/mount|/sbin/mount|g ; \
		 s|/bin/umount|/sbin/umount|g' ${WRKSRC}/gentoorc.in
	@${REINPLACE_CMD} -e '/^CFLAGS/s|@GENTOO_CFLAGS@|@CFLAGS@|g' \
		${WRKSRC}/src/Makefile.in
	@${REINPLACE_CMD} -e 's|#define GTK_DISABLE_DEPRECATED||g' \
		${WRKSRC}/src/odmultibutton.c

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/gentoo.1x ${MANPREFIX}/man/man1/gentoo.1
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for file in BUGS CONFIG-CHANGES CREDITS NEWS README README.NLS README.gtkrc \
	TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/docs --exclude "gentoo.1x*" -cf - . | \
		${TAR} -C ${DOCSDIR} --unlink -xf -
	@${FIND} ${DOCSDIR} | ${XARGS} ${CHOWN} ${SHAREOWN}:${SHAREGRP}
	@${FIND} ${DOCSDIR} | ${XARGS} ${CHMOD} ${SHAREMODE}
	@${FIND} ${DOCSDIR} -type d | ${XARGS} ${CHMOD} a+x
.endif

.include <bsd.port.mk>
