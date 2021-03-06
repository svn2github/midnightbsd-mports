# New ports collection makefile for:   pcsc-lite
# Date created:                15 Oct 2001
# Whom:                        Toni Andjelkovic <toni@soth.at>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/pcsc-lite/Makefile,v 1.39 2008/03/20 09:37:20 pav Exp $
#

PORTNAME=	pcsc-lite
PORTVERSION=	1.4.4
CATEGORIES=	devel security
MASTER_SITES=	http://alioth.debian.org/frs/download.php/2106/
DISTNAME=	pcsc-lite-${PORTVERSION:S/.b./-beta/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A smartcard development library
LICENSE=	bsd3

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomehack pkgconfig
USE_RC_SUBR=	pcscd

USE_LDCONFIG=	yes
CONFIGURE_ENV+=	LIBS="${LIBS} ${PTHREAD_LIBS}" \
		CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}"
CONFIGURE_ARGS+=--enable-debug \
		--enable-syslog \
		--enable-runpid=/var/run/pcscd.pid \
		--enable-ipcdir=/var/tmp/ \
		--enable-confdir=${PREFIX}/etc/ \
		--enable-usbdropdir=${PREFIX}/lib/pcsc/drivers/ \
		--enable-muscledropdir=${PREFIX}/lib/pcsc/services/ \
		--enable-threadsafe

PKGMESSAGE=	${WRKDIR}/pkg-message
MAN5=		reader.conf.5
MAN8=		pcscd.8 update-reader.conf.8

.if !defined(WITHOUT_USB)
LIB_DEPENDS+=	usb-0.1.8:${PORTSDIR}/devel/libusb
CONFIGURE_ARGS+=--enable-libusb=${LOCALBASE}
.endif

post-patch:
	${REINPLACE_CMD} -e "s,^datadir,#datadir,; s,^data_DATA,#data_DATA," ${WRKSRC}/doc/Makefile.in
	${REINPLACE_CMD} -e "s,^confdir,#sysconfdir,; s,^conf_DATA,#sysconf_DATA,; s,^EXTRA_DIST,#EXTRA_DIST," ${WRKSRC}/etc/Makefile.in

pre-everything::
.if !defined(WITHOUT_USB)
	@${ECHO_MSG}
	@${ECHO_MSG} "pcsc-lite has the following option(s):"
	@${ECHO_MSG} "  WITHOUT_USB=yes            Disable USB support"
	@${ECHO_MSG}
.endif

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/README.DAEMON ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.am ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/Makefile.in ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/example/pcsc_demo.c ${EXAMPLESDIR}
	@${MKDIR} ${PREFIX}/lib/pcsc/drivers
	@${MKDIR} ${PREFIX}/lib/pcsc/services
	${TOUCH} ${PREFIX}/lib/pcsc/drivers/.keep_me
	${TOUCH} ${PREFIX}/lib/pcsc/services/.keep_me
	${INSTALL_DATA} ${WRKSRC}/etc/reader.conf \
		${PREFIX}/etc/reader.conf.sample
	@${SED} 's,%%PREFIX%%,${PREFIX},g' < ${FILESDIR}/pkg-message.in > \
		${WRKDIR}/pkg-message

.include <bsd.port.mk>
