# New ports collection makefile for: Courier MTA
# Date created:		17 Oct 2001
# Whom:			Yarema <yds@CoolRat.org>
#
# $FreeBSD: ports/mail/courier/Makefile,v 1.44 2007/01/01 00:00:21 miwi Exp $
# $MidnightBSD: mports/mail/courier/Makefile,v 1.2 2007/05/09 05:22:55 ctriv Exp $
#

PORTNAME=	courier
PORTVERSION=	0.54.0
CATEGORIES=	mail ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	courier

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Courier SMTP IMAP POP3 HTTP mail server suite

BUILD_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base
LIB_DEPENDS=	pcre:${PORTSDIR}/devel/pcre
RUN_DEPENDS=	courierauthconfig:${PORTSDIR}/security/courier-authlib-base \
		${LOCALBASE}/share/sysconftool/sysconftool:${PORTSDIR}/devel/sysconftool \
		${LOCALBASE}/etc/mime.types:${PORTSDIR}/misc/mime-support \
		${SITE_PERL}/Net/CIDR.pm:${PORTSDIR}/net-mgmt/p5-Net-CIDR

CONFLICTS=	exim-4.* courier-imap-2.* maildrop-1.* \
		postfix-1.* postfix-2.* \
		qmail-1.* qmail-*-1.* \
		sendmail-8.* sendmail-*-8.* \
		smail-3.* sqwebmail-3.* zmailer-2.*

.if !defined(BATCH) && !defined(PACKAGE_BUILDING)
IS_INTERACTIVE=	yes
.endif

#
# User-serviceable variables
#
# [ There's no need to add trailing ``/''s ]
#
# set IMAGEURL to where on the web server URL the images are found
# set CACHEOWN to who you'd like to own the cache files
# set MAILDROPDEFAULT to what you'd like the $DEFAULT in maildrop to be
#     recomended values are: /var/mail, ./Mailbox or ./Maildir
#
IMAGEURL?=	/webmail
CACHEOWN?=	pop
MAILDROPDEFAULT?=./Maildir
# End of user-serviceable variables
MAILOWN=	courier
MAILGRP=	courier
MAILUID=	465
MAILGID=	465
ETCDIR=		${PREFIX}/etc
SYSCONFDIR=	${ETCDIR}/courier
USERDB?=	${ETCDIR}/userdb
LIBEXECDIR=	${PREFIX}/libexec
LOCALSTATEDIR=	/var/spool/courier
CACHEDIR=	/var/spool/webmail
CALENDIR=	/var/spool/calendar
MIMETYPES=	${LOCALBASE}/etc/mime.types
WITH_TRANSPORT=	local esmtp dsn

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
USE_FAM=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_OPENSSL=	yes
USE_PERL5=	yes
USE_SUBMAKE=	yes

USE_RC_SUBR=	courier.sh

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	REHASH=${SCRIPTDIR}/c_rehash \
		CPPFLAGS='${CPPFLAGS}' \
		LDFLAGS='${LDFLAGS}'
MAKE_ENV:=	${CONFIGURE_ENV}

CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=	--disable-root-check --with-db=db \
		--enable-syslog=1 --enable-use-flock \
		--program-transform-name=s,^,, \
		--enable-utf7-folder-encoding \
		--enable-unicode \
		--with-mailuser=${MAILOWN} \
		--with-mailgroup=${MAILGRP} \
		--with-mailuid=${MAILUID} \
		--with-mailgid=${MAILGID} \
		--with-etcdir=${ETCDIR} \
		--sysconfdir=${SYSCONFDIR} \
		--with-userdb=${USERDB} \
		--datadir=${DATADIR} \
		--libexecdir=${LIBEXECDIR} \
		--localstatedir=${LOCALSTATEDIR} \
		--enable-mimetypes=${MIMETYPES} \
		--enable-imageurl=${IMAGEURL} \
		--with-cachedir=${CACHEDIR} \
		--with-cacheowner=${CACHEOWN} \
		--with-calendardir=${CALENDIR} \
		--with-transport='${WITH_TRANSPORT}' \
		--with-default-maildrop=${MAILDROPDEFAULT} \
		--with-paranoid-smtpext \
		--enable-workarounds-for-imap-client-bugs \
		--cache-file=${WRKDIR}/courier.cache

INSTALL_TARGET=	install-strip install-perms

PLIST_SUB+=	BINOWN="${BINOWN}" BINGRP="${BINGRP}" \
		MAILOWN="${MAILOWN}" MAILGRP="${MAILGRP}" \
		MAILUID="${MAILUID}" MAILGID="${MAILGID}" \
		CACHEOWN="${CACHEOWN}" CACHEDIR="${CACHEDIR}" \
		CALENDIR="${CALENDIR}" LOCALSTATEDIR="${LOCALSTATEDIR}"
SUB_LIST:=	${PLIST_SUB}
SUB_FILES+=	pkg-install pkg-message crontab sharedindexupdate

OPTIONS+=LDAP "LDAP-based mail aliasing support"
.if (exists(${LOCALBASE}/lib/libldap.a) && exists(${LOCALBASE}/lib/liblber.a)) || defined(WITH_LDAP)
OPTIONS+=on
.else
OPTIONS+=off
.endif

.if exists(${.CURDIR}/../../security/courier-authlib/Makefile.opt)
.include "${.CURDIR}/../../security/courier-authlib/Makefile.opt"
.endif

OPTIONS+=GNUPG "GNU Privacy Guard support for WebMail"
.if exists(${LOCALBASE}/bin/gpg) || defined(WITH_GNUPG)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=ASPELL "ASpell support for WebMail  / mutually"
.if exists(${LOCALBASE}/bin/aspell) || defined(WITH_ASPELL)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=ISPELL "ISpell support for WebMail  \ exclusive"
.if exists(${LOCALBASE}/bin/ispell) || defined(WITH_ISPELL)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=PROCMAIL "Procmail local delivery support"
.if exists(${LOCALBASE}/bin/procmail) || defined(WITH_PROCMAIL)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=SENDFAX "mgetty+sendfax support"
.if exists(${LOCALBASE}/sbin/sendfax) && exists(${LOCALBASE}/bin/pnmscale) && exists(${LOCALBASE}/bin/gs) || defined(WITH_SENDFAX)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=UUCP "UUCP support"
.if exists(/usr/bin/uux) || exists(${LOCALBASE}/bin/uux) || defined(WITH_UUCP)
OPTIONS+=on
.else
OPTIONS+=off
.endif

OPTIONS+=IPV6 "IPv6 support"
.if defined(WITH_IPV6)
OPTIONS+=on
.else
OPTIONS+=off
.endif

.include <bsd.port.pre.mk>
.include "${.CURDIR}/Makefile.doc"
.include "${.CURDIR}/Makefile.man"
.include "${.CURDIR}/Makefile.own"

.if defined(WITH_LDAP) && !defined(WITHOUT_LDAP)
USE_OPENLDAP=	yes
WITH_AUTH_LDAP=	yes
RUN_DEPENDS+=	${LOCALBASE}/lib/courier-authlib/libauthldap.so:${PORTSDIR}/net/courier-authlib-ldap
CONFIGURE_ARGS+=--with-ldapaliasd
PLIST_SUB+=	WITHLDAP=""
SUB_LIST+=	WITHLDAP=""
.else
CONFIGURE_ARGS+=--without-ldapaliasd
PLIST_SUB+=	WITHLDAP="@comment "
SUB_LIST+=	WITHLDAP="@comment "
.endif

.if exists(${.CURDIR}/../../security/courier-authlib/Makefile.dep)
.include "${.CURDIR}/../../security/courier-authlib/Makefile.dep"
.endif

.if defined(WITH_GNUPG) && !defined(WITHOUT_GNUPG)
BUILD_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg
RUN_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg
.endif

.if defined(WITH_ASPELL) && !defined(WITHOUT_ASPELL) && !defined(WITH_ISPELL)
BUILD_DEPENDS+=	aspell:${PORTSDIR}/textproc/aspell
RUN_DEPENDS+=	aspell:${PORTSDIR}/textproc/aspell
CONFIGURE_ARGS+=--with-ispell=${LOCALBASE}/bin/aspell
.endif

.if defined(WITH_ISPELL) && !defined(WITHOUT_ISPELL) && !defined(WITH_ASPELL)
BUILD_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
RUN_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
CONFIGURE_ARGS+=--with-ispell=${LOCALBASE}/bin/ispell
.endif

.if defined(WITH_ASPELL) && defined(WITH_ISPELL)
BROKEN=	ASpell and ISpell are mutually exclusive. Run 'make config' to (re)configure ${PKGNAME}
.endif

.if !defined(WITH_ASPELL) && !defined(WITH_ISPELL)
CONFIGURE_ARGS+=--without-ispell
.endif

.if defined(WITH_PROCMAIL) && !defined(WITHOUT_PROCMAIL)
BUILD_DEPENDS+=	procmail:${PORTSDIR}/mail/procmail
RUN_DEPENDS+=	procmail:${PORTSDIR}/mail/procmail
.endif

.if defined(WITH_SENDFAX) && !defined(WITHOUT_SENDFAX)
USE_GHOSTSCRIPT=yes
SENDFAX_DEPENDS=sendfax:${PORTSDIR}/comms/mgetty+sendfax \
		pnmscale:${PORTSDIR}/graphics/netpbm
BUILD_DEPENDS+=	${SENDFAX_DEPENDS}
RUN_DEPENDS+=	${SENDFAX_DEPENDS}
WITH_TRANSPORT+=fax
PLIST_SUB+=	WITHFAX=""
SUB_LIST+=	WITHFAX=""
.else
PLIST_SUB+=	WITHFAX="@comment "
SUB_LIST+=	WITHFAX="@comment "
.endif

.if defined(WITH_UUCP) && !defined(WITHOUT_UUCP)
.if !exists(/usr/bin/uux)
BUILD_DEPENDS+=	uux:${PORTSDIR}/net/freebsd-uucp
RUN_DEPENDS+=	uux:${PORTSDIR}/net/freebsd-uucp
.endif
WITH_TRANSPORT+=uucp
PLIST_SUB+=	WITHUUCP=""
.else
PLIST_SUB+=	WITHUUCP="@comment "
.endif

.if defined(WITH_IPV6) || !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=--with-ipv6
.else
CONFIGURE_ARGS+=--without-ipv6
.endif

pre-everything::
	@${ECHO_MSG} "===> --------------------------------------------------------"
	@${ECHO_MSG} "===>	Run 'make config' to (re)configure ${PKGNAME}"
	@${ECHO_MSG} "===> --------------------------------------------------------"

pre-patch:
	@${CP} ${TEMPLATES}/config.guess ${TEMPLATES}/config.sub ${WRKSRC}

post-patch:
	@${REINPLACE_CMD} -e 's|^PROG=\./|PROG=exec ./|g' \
		${WRKSRC}/courier/module.*/courier.config
	@${REINPLACE_CMD} -e 's|@datadir@|@sysconfdir@|g' \
		${WRKSRC}/*/mk*cert.* \
		${WRKSRC}/*/*/mk*cert.*
	@${REINPLACE_CMD} -e 's|^\(TLS_CERTFILE=\)@datadir@|\1@sysconfdir@|g' \
		${WRKSRC}/*/*.dist.in \
		${WRKSRC}/*/*/*.dist.in
	@${REINPLACE_CMD} -e 's|^\(RANDFILE = \)@datadir@[^[:space:]]*|\1@sysconfdir@/random.tmp|g' \
		${WRKSRC}/*/*.cnf.in \
		${WRKSRC}/*/*/*.cnf.in
	@${REINPLACE_CMD} -e 's|$$(INSTALL_DATA) \(.$$$$file.\)|${INSTALL_MAN} \1|' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/*/Makefile.in \
		${WRKSRC}/*/*/Makefile.in \
		${WRKSRC}/*/*/*/Makefile.in
	@${REINPLACE_CMD} -e 's|^\(INSTALL_STRIP_PROGRAM=\).*$$|\1"${INSTALL_PROGRAM} -s"|' \
			-e 's|; ldapaliasd="yes"||' \
		${WRKSRC}/configure \
		${WRKSRC}/*/configure \
		${WRKSRC}/*/*/configure \
		${WRKSRC}/*/*/*/configure
	@${REINPLACE_CMD} -E -e 's/(root|bin)[[:space:]]*bin/root	wheel/g' \
		${WRKSRC}/courier/perms.sh.in

pre-configure:
	@if [ -f "${WRKDIR}/courier.cache" -a -s "${WRKDIR}/courier.cache" ]; then \
		${RM} -f "${WRKDIR}/courier.cache"; \
	fi

post-build:
	@${PERL} -pi -e 's|^(auth)\s+(required).*|$$1\t\t$$2\tpam_unix.so\ttry_first_pass|g;' \
		     -e 's|^(account)\s+(required).*|$$1 \t$$2\tpam_unix.so|g;' \
		     -e 's|^(session)\s+(required).*|$$1 \t$$2\tpam_permit.so|g;' \
		${WRKSRC}/*/*.authpam* \
		${WRKSRC}/*/*/*.authpam*
	@${LN} -f ${WRKSRC}/gpglib/README.html		${WRKSRC}/gpglib/README.gpglib.html
	@${LN} -f ${WRKSRC}/imap/BUGS			${WRKSRC}/imap/BUGS.imap
	@${LN} -f ${WRKSRC}/imap/BUGS.html		${WRKSRC}/imap/BUGS.imap.html
	@${LN} -f ${WRKSRC}/imap/README			${WRKSRC}/imap/README.imap
	@${LN} -f ${WRKSRC}/imap/README.html		${WRKSRC}/imap/README.imap.html
	@${LN} -f ${WRKSRC}/maildrop/README.html	${WRKSRC}/maildrop/README.maildrop.html
	@${LN} -f ${WRKSRC}/pcp/README.html		${WRKSRC}/pcp/README.pcp.html
	@${LN} -f ${WRKSRC}/webmail/BUGS		${WRKSRC}/webmail/BUGS.webmail
	@${LN} -f ${WRKSRC}/webmail/BUGS.html		${WRKSRC}/webmail/BUGS.webmail.html
	@${LN} -f ${WRKSRC}/webmail/SECURITY		${WRKSRC}/webmail/SECURITY.webmail
	@${LN} -f ${WRKSRC}/webmail/SECURITY.html	${WRKSRC}/webmail/SECURITY.webmail.html

post-install:
	@${LN} -f ${SYSCONFDIR}/maildrop ${SYSCONFDIR}/maildropfilter
	@${INSTALL_DATA} /dev/null ${SYSCONFDIR}/locallowercase
	@${INSTALL_DATA} ${WRKDIR}/crontab ${SYSCONFDIR}/
	@${INSTALL_SCRIPT} ${WRKDIR}/sharedindexupdate ${DATADIR}/
.for file in ${OWNER0}
	@-${CHOWN} -Rh ${BINOWN}:${BINGRP} ${PREFIX}/${file}
.endfor
.if !defined(NOPORTDOCS)
	@${INSTALL} ${_DOCOWNGRP} -d ${DOCSDIR}/html
.for f in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.for f in ${HTMLDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/html
.endfor
	@${INSTALL_DATA} ${DATADIR}/htmldoc/* ${DOCSDIR}/html
.endif
	@${RM} -rf ${DATADIR}/htmldoc
	@-${CHOWN} -Rh ${SHAREOWN}:${SHAREGRP} ${DATADIR}
	@${CHMOD} -R a+r ${DATADIR}/courierwebadmin
	@${CHMOD} -R a-w ${DATADIR} ${LIBEXECDIR}/courier
	@${CHMOD} 550 ${LIBEXECDIR}/courier/modules/esmtp/courieresmtp*

.include <bsd.port.post.mk>
