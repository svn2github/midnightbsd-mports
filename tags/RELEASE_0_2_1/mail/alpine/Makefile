# New ports collection makefile for:	alpine
# Date created:				December 21, 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/mail/alpine/Makefile,v 1.3 2008/06/23 01:58:57 laffer1 Exp $
#

PORTNAME?=	alpine
PORTVERSION=	1.10
PORTREVISION=	1
CATEGORIES?=	mail news ipv6
MASTER_SITES=	ftp://ftp.cac.washington.edu/alpine/ \
		http://dougbarton.us/Downloads/alpine-${PORTVERSION}/
DIST_SUBDIR=	alpine-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mail and news client descended from Pine
LICENSE=	apache2

OPTIONS+=	THREADS "Support for pthreads" on \
		MOUSE "Enable mouse support for xterm" on \
		NLS "National Language Support" off \
		ISPELL "Use ispell instead of aspell as default speller" off \
		NOSPELL "Use no default speller (overrides both)" off
.if !defined(PICO_ALPINE_SLAVE)
OPTIONS+=	PICO "Build and install pico, the default editor" on \
		IPV6 "Add support for IPv6" on \
		LDAP "Add support for LDAP" off \
		PASSFILE "Support for a stored password file (DANGEROUS)" off \
		CONS25 "Add a patch to support color for default console" off \
		QUOTA "Add a patch for disk quota checking on IMAP" off \
		MAILDIR "Add a patch for maildir support" off
.endif

USE_BZIP2=	yes

GNU_CONFIGURE=	yes

.if !defined(PICO_ALPINE_SLAVE)
CONFIGURE_ARGS+=--with-system-pinerc=${PREFIX}/etc/alpine.conf \
		--with-system-fixed-pinerc=${PREFIX}/etc/alpine.conf.fixed \
		--with-password-prog=/usr/bin/passwd \
		--with-system-mail-directory=/var/mail \
		--enable-background-post --without-krb5 --without-tcl
.endif
CONFIGURE_ARGS+=--with-debug-level=2

CONFLICTS=	pico-4* pine4-4*

USE_OPENSSL=	yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--with-pthread
.else
CONFIGURE_ARGS+=	--without-pthread
.endif

.if !defined(WITHOUT_MOUSE)
CONFIGURE_ARGS+=	--enable-mouse
.else
CONFIGURE_ARGS+=	--disable-mouse
.endif

.if defined(WITH_NLS)
CONFIGURE_ARGS+=	--with-nls
.else
CONFIGURE_ARGS+=	--without-nls
.endif

.if !defined(WITH_NOSPELL)
.if !defined(WITH_ISPELL)
CONFIGURE_ARGS+=--with-spellcheck-prog="${LOCALBASE}/bin/aspell --dont-backup --mode=email check"
RUN_DEPENDS+=	aspell:${PORTSDIR}/textproc/aspell
.else
CONFIGURE_ARGS+=	--with-spellcheck-prog="${LOCALBASE}/bin/ispell"
RUN_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
.endif
.endif

.if !defined(PICO_ALPINE_SLAVE)
.if !defined(WITHOUT_PICO)
RUN_DEPENDS+=	pico:${PORTSDIR}/editors/pico-alpine
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--with-ipv6
.else
CONFIGURE_ARGS+=	--without-ipv6
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--with-ldap --with-ldap-dir=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--without-ldap
.endif

.if defined(WITH_PASSFILE)
ALPINE_PASSFILE?=	.alpine.pwd
CONFIGURE_ARGS+=	--with-passfile=".alpine.pwd"
.endif

.if defined(WITH_CONS25)
EXTRA_PATCHES=	${FILESDIR}/cons25-alpine_keymenu.c
.endif

.if defined(WITH_QUOTA) || defined(WITH_MAILDIR)
PATCH_SITES=	http://staff.washington.edu/chappa/alpine/patches/alpine-${PORTVERSION}/ \
		http://dougbarton.us/Downloads/alpine-${PORTVERSION}/ \
		${MASTER_SITE_LOCAL}
PATCH_SITE_SUBDIR=	dougb/alpine-${PORTVERSION}/
PATCH_DIST_ARGS+=	-E --quiet -d ${PATCH_WRKSRC} -p1
.endif

.if defined(WITH_QUOTA)
PATCHFILES+=	quota.patch.gz
.endif

.if defined(WITH_MAILDIR)
PATCHFILES+=	maildir.patch.gz
.endif

.if defined(WITHOUT_SSL)
MAKE_ARGS+=	SSLTYPE=none
.else
EXTRA_OPTS+=	SSLINCLUDE=${OPENSSLINC} SSLLIB=${OPENSSLLIB}
.if defined(WITH_SSL_AND_PLAINTEXT)
EXTRA_OPTS+=	SSLTYPE=nopwd
.else
EXTRA_OPTS+=	SSLTYPE=unix
.endif
.endif

MAN1=		alpine.1 rpdump.1 rpload.1

pre-patch:
	@${CHMOD} -R u+w ${WRKSRC}

post-patch:
	@${CP} ${WRKSRC}/imap/Makefile ${WRKSRC}/imap/Makefile.presed
	@${SED}	-e "s#^\(all:.*\) bundled\$$#\1#" \
	    ${WRKSRC}/imap/Makefile.presed > ${WRKSRC}/imap/Makefile
	@${CP} ${WRKSRC}/pico/Makefile.in ${WRKSRC}/pico/Makefile.in.presed
	@${SED} -e "s#^bin_PROGRAMS = pico.*#bin_PROGRAMS =#" \
	    -e "s#\$$(pico_SOURCES) \$$(pilot_SOURCES)##" \
	    ${WRKSRC}/pico/Makefile.in.presed > ${WRKSRC}/pico/Makefile.in
	@${CP} ${WRKSRC}/Makefile.in ${WRKSRC}/Makefile.in.presed
	@${SED}	-e "s#doc/pico.1 doc/pilot.1 ##" \
	    ${WRKSRC}/Makefile.in.presed > ${WRKSRC}/Makefile.in
	@for i in ${WRKSRC}/README ${WRKSRC}/doc/alpine.1 \
	    ${WRKSRC}/doc/tech-notes.txt ${WRKSRC}/doc/tech-notes/*.html \
	    ${WRKSRC}/pith/pine.hlp ; do \
		${CP} $$i $$i.presed ; \
		${SED}	-e "s:/usr/local/etc/:${PREFIX}/etc/:g" \
		    -e "s:/usr/local/lib/:${PREFIX}/etc/:g" \
		    -e "s:@@PREFIX@@:${PREFIX}:g" \
		    -e "s:/usr/local/pine.conf:${PREFIX}/etc/alpine.conf:g" \
		    $$i.presed > $$i ; \
	done

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL} -d -o ${SHAREOWN} -g ${SHAREGRP} ${DOCSDIR} \
	    ${DOCSDIR}/tech-notes
	${INSTALL_DATA} ${WRKSRC}/LICENSE ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NOTICE ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/brochure.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/tech-notes.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/tech-notes/*.html ${DOCSDIR}/tech-notes
.endif
	${PREFIX}/bin/alpine -P ${PREFIX}/etc/alpine.conf -conf >${WRKSRC}/alpine.conf
	${INSTALL_DATA} ${WRKSRC}/alpine.conf ${PREFIX}/etc/alpine.conf

.endif	# !defined(PICO_ALPINE_SLAVE)

.include <bsd.port.post.mk>
