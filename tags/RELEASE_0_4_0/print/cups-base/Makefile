# $MidnightBSD: mports/print/cups-base/Makefile,v 1.32 2012/09/08 16:59:19 laffer1 Exp $
# $FreeBSD: ports/print/cups-base/Makefile,v 1.167 2011/10/19 17:31:07 dinoex Exp $

PORTNAME=	cups
PORTVERSION=	1.5.0
PORTREVISION=	1
DISTVERSIONSUFFIX=	-source
CATEGORIES=	print
MASTER_SITES=	EASYSW/${PORTNAME}/${DISTVERSION}
PKGNAMESUFFIX=	${CUPS_SUFFIX}${PKGNAMESUFFIX2}
UNIQUENAME=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common UNIX Printing System: ${COMMENT2}
LICENSE=	gpl2

CONFLICTS=	LPRng-[0-9]*

DESTDIRNAME=    BUILDROOT

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CFLAGS+=	${PTHREAD_CFLAGS}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
DSOFLAGS=	-Wl,-rpath,${PREFIX}/lib -L${PREFIX}/lib ${LDFLAGS}
CONFIGURE_ENV=	DSOFLAGS="${DSOFLAGS}"
CONFIGURE_ARGS+=	--localstatedir=/var			\
			--disable-slp				\
			--disable-gssapi			\
			--with-cups-user=${CUPSOWN}		\
			--with-cups-group=${CUPSGRP}		\
			--with-system-groups=${CUPSSYSGRP}	\
			--with-docdir=${DOCSDIR}		\
			--with-icondir=${PREFIX}/share/icons	\
			--with-menudir=${DESKTOPDIR}		\
			--with-domainsocket=${CUPS_SOCKET}	\
			--with-cachedir=${CUPS_CACHEDIR}	\
			--with-pam-module="unix"		\
			--enable-ssl

OPTIONS?=	GNUTLS		"Build with GNUTLS instead of OpenSSL" on \
		PHP		"Build PHP support" off \
		PYTHON		"Build PYTHON support" off \
		LIBPAPER	"Build with libpaper support" off \
		DNSSD		"Build with DNS_SD (avahi) support" off \
		PAM		"Build with PAM support" off \
		LDAP		"Build with LDAP support" off \
		DBUS		"Build with DBUS support" off \
		LIBUSB		"Build with USB support" off \
		GHOSTSCRIPT	"Build pdftops with GHOSTSCRIPT" on \
		XPDF		"Build pdftops with XPDF" off \
		XDG_OPEN	"Build with XDG_OPEN as browser" off

CUPS_ETCDIR=	${PREFIX}/etc/cups
CUPS_CACHEDIR?=	/var/db/cups
CUPS_SPOOLDIR=	/var/spool/cups
CUPS_SOCKET?=	/var/run/cups.sock
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

# file, dir ownership
CUPSGRP=	cups
CUPSOWN=	cups
CUPSSYSGRP=	wheel
# GROUPS/USERS does not work here
#GROUPS=	cups
#USERS=		cups

# UNIQUENAME must be set before bsd.port.pre.mk so OPTIONSFILE can be included
.if defined(CUPS_CLIENT)
LICENSE=	lgpl
CUPS_SUFFIX=	-client
.elif defined(CUPS_IMAGE)
CUPS_SUFFIX=	-image
LICENSE=	lgpl
.else
PORTREVISION=	0
CUPS_SUFFIX=	-base
CONFLICTS+=	cupsddk-*
.endif

.include <bsd.port.pre.mk>

.if defined(CUPS_CLIENT)
COMMENT2=	Library cups
INSTALL_WRKSRC=	${WRKSRC}/cups
PLIST=		${MASTERDIR}/pkg-plist.client
USE_LDCONFIG=	yes
PKGMESSAGE=	${NONEXISTENT}
DESCR=		${MASTERDIR}/pkg-descr.client
.elif defined(CUPS_IMAGE)
LIB_DEPENDS+=	cups:${PORTSDIR}/${PKGCATEGORY}/cups-client \
		jpeg:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		tiff:${PORTSDIR}/graphics/tiff
# force build if old cups is installed.
BUILD_DEPENDS+=	cups-client${PKGNAMESUFFIX2}>=${PORTVERSION}:${PORTSDIR}/${PKGCATEGORY}/cups-client
COMMENT2=	Library cupsimage
CONFIGURE_ARGS+=	--disable-pdftops
INSTALL_WRKSRC=	${WRKSRC}/filter
PLIST=		${MASTERDIR}/pkg-plist.image
USE_LDCONFIG=	yes
PKGMESSAGE=	${NONEXISTENT}
DESCR=		${MASTERDIR}/pkg-descr.image
.else
LIB_DEPENDS+=	cups.2:${PORTSDIR}/${PKGCATEGORY}/cups-client
LIB_DEPENDS+=	cupsimage.2:${PORTSDIR}/${PKGCATEGORY}/cups-image
# force build if old cups is installed.
BUILD_DEPENDS+=	cups-client${PKGNAMESUFFIX2}>=${PORTVERSION}:${PORTSDIR}/${PKGCATEGORY}/cups-client
BUILD_DEPENDS+=	cups-image${PKGNAMESUFFIX2}>=${PORTVERSION}:${PORTSDIR}/${PKGCATEGORY}/cups-image
COMMENT2=	Server
USE_RC_SUBR=	cupsd
PLIST_SUB+=	CACHEDIR="${CUPS_CACHEDIR}"
.endif

.if defined(CUPS_OVERWRITE_BASE)
PLIST_SUB+=		OVERWRITE=""
CONFIGURE_ARGS+=	--with-printcap=/etc/printcap
.else
PLIST_SUB+=		OVERWRITE="@comment "
CONFIGURE_ARGS+=	--with-printcap=${PREFIX}/etc/printcap
.endif

.if defined(WITH_GNUTLS)
CONFIGURE_ARGS+=	--disable-openssl --enable-gnutls
LIB_DEPENDS+=		gcrypt.18:${PORTSDIR}/security/libgcrypt
LIB_DEPENDS+=		gnutls.42:${PORTSDIR}/security/gnutls
USE_PKGCONFIG=	yes
.else
CONFIGURE_ARGS+=	--disable-gnutls --enable-openssl
EXTENSIONS+=	openssl
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_PHP)
CONFIGURE_ARGS+=	--with-php
USE_PHP=		yes
USE_PHP_BUILD=		yes
PLIST_SUB+=		PHP=""
.else
CONFIGURE_ARGS+=	--without-php
PLIST_SUB+=		PHP="@comment "
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && !defined(WITHOUT_GHOSTSCRIPT)
.if defined(WITH_XPDF)
IGNORE=			pick ghostscript or xpdf, not both
.endif
USE_GHOSTSCRIPT=	yes
CONFIGURE_ARGS+=	--enable-pdftops --with-pdftops=${LOCALBASE}/bin/gs
PLIST_SUB+=		WITH_PDFTOPS=""
.elif !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_XPDF)
BUILD_DEPENDS+=		pdftops:${PORTSDIR}/graphics/xpdf
RUN_DEPENDS+=		pdftops:${PORTSDIR}/graphics/xpdf
CONFIGURE_ARGS+=	--enable-pdftops --with-pdftops=${LOCALBASE}/bin/pdftops
PLIST_SUB+=		WITH_PDFTOPS=""
.else
PLIST_SUB+=		WITH_PDFTOPS="@comment "
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_PYTHON)
CONFIGURE_ARGS+=	--with-python
USE_PYTHON=		yes
EXTENSIONS+=		python
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_LIBPAPER)
CONFIGURE_ARGS+=	--enable-libpaper
LIB_DEPENDS+=		paper.2:${PORTSDIR}/print/libpaper
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_DNSSD)
CONFIGURE_ARGS+=	--enable-dnssd \
			--with-dnssd-libs=${LOCALBASE}/lib/ \
			--with-dnssd-includes=${LOCALBASE}/include/avahi-compat-libdns_sd/
LIB_DEPENDS+=		dns_sd:${PORTSDIR}/net/avahi-libdns
BROKEN=			missing function, see http://www.avahi.org/ticket/303
.else
CONFIGURE_ARGS+=	--disable-dnssd
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_PAM)
CONFIGURE_ARGS+=	--enable-pam
PLIST_SUB+=		WITH_PAMD=""
.else
CONFIGURE_ARGS+=	--disable-pam
PLIST_SUB+=		WITH_PAMD="@comment "
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_LDAP)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--enable-ldap
.else
CONFIGURE_ARGS+=	--disable-ldap
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_DBUS)
LIB_DEPENDS+=		dbus-1.3:${PORTSDIR}/devel/dbus
CONFIGURE_ARGS+=	--enable-dbus
PLIST_SUB+=		WITH_DBUS=""
.else
CONFIGURE_ARGS+=	--disable-dbus
PLIST_SUB+=		WITH_DBUS="@comment "
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_XDG_OPEN)
RUN_DEPENDS+=		xdg-open:${PORTSDIR}/devel/xdg-utils
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE) && defined(WITH_LIBUSB)
LIB_DEPENDS+=		usb:${PORTSDIR}/devel/libusb
.else
CONFIGURE_ARGS+=	--disable-libusb
.endif

.if defined(CUPS_CLIENT)
MAN1=	cups-config.1
.elif defined(CUPS_IMAGE)
.else
MAN1=	cancel.1 \
	cupstestdsc.1 \
	cupstestppd.1 \
	ipptool.1 \
	lp.1 \
	lpoptions.1 \
	lppasswd.1 \
	lpq.1 \
	lprm.1 \
	lpr.1 \
	lpstat.1 \
	ppdc.1 \
	ppdhtml.1 \
	ppdi.1 \
	ppdmerge.1 \
	ppdpo.1
MAN5=	classes.conf.5 \
	client.conf.5 \
	cups-snmp.conf.5 \
	cupsd.conf.5 \
	ipptoolfile.5 \
	mailto.conf.5 \
	mime.convs.5 \
	mime.types.5 \
	ppdcfile.5 \
	printers.conf.5 \
	subscriptions.conf.5
MAN7=	backend.7 \
	filter.7 \
	notifier.7
MAN8=	accept.8 \
	cupsaccept.8 \
	cupsaddsmb.8 \
	cupsctl.8 \
	cupsd.8 \
	cupsenable.8 \
	cupsfilter.8 \
	cups-deviced.8 \
	cups-driverd.8 \
	cups-lpd.8 \
	cups-polld.8 \
	lpadmin.8 \
	lpinfo.8 \
	lpmove.8 \
	lpc.8

MLINKS=	accept.8 reject.8 \
	cupsaccept.8 cupsreject.8 \
	cupsenable.8 cupsdisable.8

SUB_FILES+=	ulpt-cupsd.conf ulpt-cupsd.sh
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@PIEFLAGS@||' ${WRKSRC}/Makedefs.in
.if defined(WITH_XDG_OPEN)
	@${REINPLACE_CMD} -e 's|htmlview|xdg-open|' ${WRKSRC}/desktop/cups.desktop.in
.endif
	@${REINPLACE_CMD} -e '/SILENT/d' ${WRKSRC}/Makedefs.in
	@${REINPLACE_CMD} -e 's|/etc/cups|${LOCALBASE}/etc/cups|g' ${WRKSRC}/man/*.man*
	@${REINPLACE_CMD} -e 's|-lpthreads.*;|${PTHREAD_LIBS};|g' \
		-e 's|/private/etc/pam.d|${LOCALBASE}/etc/pam.d|' \
		-e 's|-D_LARGEFILE64_SOURCE||g' \
		${WRKSRC}/${CONFIGURE_SCRIPT}
.if defined(CUPS_CLIENT)
	@${REINPLACE_CMD} \
		-e 's|cups test|cups|' \
		-e 's|cups filter |cups |' \
		-e 's|driver ppdc scheduler||' \
		-e 's|$$.PHPDIR. $$.FONTS.||' \
		${WRKSRC}/Makefile
.elif defined(CUPS_IMAGE)
	@${REINPLACE_CMD} \
		-e 's|cups test||' \
		-e 's|cups filter |filter |' \
		-e 's|driver ppdc scheduler||' \
		-e 's|$$.PHPDIR. $$.FONTS.||' \
		${WRKSRC}/Makefile
.else
	@${REINPLACE_CMD} \
		-e 's|cups test|test|' \
		-e 's|cups filter driver|driver|' \
		-e 's|$$.INSTALL_SCRIPT. cups-config|echo skip: cups-config|' \
		${WRKSRC}/Makefile
	@${REINPLACE_CMD} \
		-e 's|cups-config.$$.MAN1EXT. ||' \
		${WRKSRC}/man/Makefile
.endif

pre-configure::
	@${ECHO_MSG} Configuring CUPS with options:
	@${ECHO_MSG} ${CONFIGURE_ARGS} | fmt

post-configure:
.if defined(CUPS_CLIENT)
	@${REINPLACE_CMD} \
		-e 's|filter .* templates||' \
		${WRKSRC}/Makedefs
.elif defined(CUPS_IMAGE)
	@${REINPLACE_CMD} \
		-e 's|filter .* templates|filter|' \
		${WRKSRC}/Makedefs
.else
	@${REINPLACE_CMD} \
		-e 's|filter backend|backend|' \
		${WRKSRC}/Makedefs
.endif

.if !defined(CUPS_CLIENT)
pre-build:
	${CP} -p ${LOCALBASE}/lib/libcups.a ${WRKSRC}/cups/
	${CP} -p ${LOCALBASE}/lib/libcups.so ${WRKSRC}/cups/
	${CP} -p ${LOCALBASE}/lib/libcups.so.2 ${WRKSRC}/cups/
.if !defined(CUPS_IMAGE)
	${CP} -p ${LOCALBASE}/lib/libcupsimage.so ${WRKSRC}/filter/
	${CP} -p ${LOCALBASE}/lib/libcupsimage.so.2 ${WRKSRC}/filter/
.endif
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE)
post-build:
	cd ${WRKSRC}/filter && ${MAKE} pdftops
.endif

.if !defined(CUPS_CLIENT) && !defined(CUPS_IMAGE)
pre-su-install:
	@${INSTALL} -d ${DESKTOPDIR}/
	if ! pw groupshow ${CUPSGRP}; then pw groupadd ${CUPSGRP} -g 193; fi
	if ! pw usershow ${CUPSOWN}; then pw useradd ${CUPSOWN} -g ${CUPSGRP} -u 193 \
		-h - -d ${NONEXISTENT} -s /usr/sbin/nologin -c "CUPS Owner"; fi
.if defined(CUPS_OVERWRITE_BASE)
	if test -e /usr/bin/lp; then ${CHMOD} -h 0 /usr/bin/lp; fi
	if test -e /usr/bin/lpq; then ${CHMOD} -h 0 /usr/bin/lpq; fi
	if test -e /usr/bin/lpr; then ${CHMOD} -h 0 /usr/bin/lpr; fi
	if test -e /usr/bin/lprm; then ${CHMOD} -h 0 /usr/bin/lprm; fi
	if test -e /usr/sbin/lpc; then ${CHMOD} -h 0 /usr/sbin/lpc; fi
.endif
.endif

post-install:
.if defined(CUPS_CLIENT)
	${INSTALL_SCRIPT} ${WRKSRC}/cups-config ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/cups/libcups.a ${PREFIX}/lib/
	${INSTALL_MAN} ${WRKSRC}/man/cups-config.man ${PREFIX}/man/man1/cups-config.1
.elif defined(CUPS_IMAGE)
	${INSTALL_DATA} ${WRKSRC}/cups/raster.h ${PREFIX}/include/cups/
.else
.if !defined(WITHOUT_GHOSTSCRIPT) || defined(WITH_XPDF)
	${INSTALL_PROGRAM} ${WRKSRC}/filter/pdftops ${PREFIX}/libexec/cups/filter/
.endif
	${LN} -s ${PREFIX}/bin/lpr ${PREFIX}/bin/lpr-cups
	${INSTALL} -d ${CUPS_ETCDIR}/
	${CP} -p ${WRKSRC}/conf/snmp.conf ${WRKSRC}/conf/snmp.conf.N
.for f in cupsd.conf mime.convs mime.types snmp.conf
	${INSTALL_DATA} ${WRKSRC}/conf/${f} ${CUPS_ETCDIR}/${f}.N
	cd ${CUPS_ETCDIR}/; if test ! -f ${f}; then ${CP} -p ${f}.N ${f}; fi
.endfor
.if defined(WITH_PAM)
	@if [ ! -f ${PREFIX}/etc/pam.d/cups ]; then \
		${CP} -p ${PREFIX}/etc/pam.d/cups.default \
		${PREFIX}/etc/pam.d/cups ; \
	fi
.endif
	${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKDIR}/ulpt-cupsd.conf ${EXAMPLESDIR}/
	${INSTALL_SCRIPT} ${WRKDIR}/ulpt-cupsd.sh ${PREFIX}/sbin/
	${INSTALL} -d ${CUPS_SPOOLDIR}/tmp/
	${CHOWN} -R ${CUPSOWN}:${CUPSGRP} ${CUPS_SPOOLDIR}/
	${CHMOD} -R g+w ${CUPS_SPOOLDIR}/
	${INSTALL} -d -m 775 -g ${CUPSGRP} ${CUPS_CACHEDIR}
.endif

.include <bsd.port.post.mk>
