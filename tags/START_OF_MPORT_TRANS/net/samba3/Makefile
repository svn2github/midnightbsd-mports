# New ports collection makefile for:	samba
# Date created:				11th Feb 1995
# Whom:					Gary Palmer <gpalmer>
#
# $MidnightBSD$
# $FreeBSD: ports/net/samba3/Makefile,v 1.157 2007/02/07 08:40:44 sem Exp $
#

PORTNAME=		samba
PORTVERSION?=		3.0.24
PORTREVISION?=		0
PORTEPOCH?=		1
CATEGORIES?=		net
MASTER_SITES=		${MASTER_SITE_SAMBA}
MASTER_SITE_SUBDIR=	. old-versions rc pre
DISTNAME=		${PORTNAME}-${PORTVERSION:S/.p/pre/:S/.r/rc/}

MAINTAINER?=		ports@MidnightBSD.org
COMMENT?=		A free SMB and CIFS client and server for UNIX

CONFLICTS?=		ja-samba-2.* ja-samba-3.* samba-2.* sharity-light-1.*

USE_ICONV=		yes
GNU_CONFIGURE=		yes
USE_AUTOTOOLS=		autoconf:259 autoheader:259

LATEST_LINK?=		${PKGNAMEPREFIX}${PORTNAME}3${PKGNAMESUFFIX}
EXAMPLESDIR=		${PREFIX}/share/examples/${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
WRKSRC=			${WRKDIR}/${DISTNAME}/source
# directories
VARDIR?=		${DESTDIR}/var
SAMBA_SPOOL=		${VARDIR}/spool/samba
SAMBA_LOGDIR=		${VARDIR}/log/samba
SAMBA_RUNDIR=		${VARDIR}/run
SAMBA_LOCKDIR=		${VARDIR}/db/samba
SAMBA_SWATDIR=		${PREFIX}/share/swat
# DEPRECATED: This is an old location of the private dir
SAMBA_PRIVATE?=		${PREFIX}/private
SAMBA_CONFDIR?=		${PREFIX}/etc
SAMBA_PRIVATEDIR?=	${SAMBA_CONFDIR}/samba
SAMBA_CONFIG=		smb.conf
SAMBA_LIB=		lib
SAMBA_LIBDIR=		${PREFIX}/${SAMBA_LIB}
SAMBA_MODULEDIR=	${SAMBA_LIBDIR}/samba

CONFIGURE_TARGET=	--build="${MACHINE_ARCH}-portbld-freebsd6.0"

CONFIGURE_ARGS+=	--exec-prefix="${PREFIX}" \
			--localstatedir="${VARDIR}" \
		        --with-configdir="${SAMBA_CONFDIR}" \
			--with-pammodulesdir="${SAMBA_LIBDIR}" \
	    		--with-libdir="${SAMBA_MODULEDIR}" \
			--with-swatdir="${SAMBA_SWATDIR}" \
			--with-piddir="${SAMBA_RUNDIR}" \
			--with-lockdir="${SAMBA_LOCKDIR}" \
			--with-privatedir="${SAMBA_PRIVATEDIR}" \
			--with-logfilebase="${SAMBA_LOGDIR}"

CONFIGURE_ARGS+=	--with-libiconv="${LOCALBASE}"

.if !defined(SAMBA_SUBPORT)
# Samba server itself
OPTIONS=	LDAP		"With LDAP support" on \
		ADS		"With Active Directory support" off \
		CUPS		"With CUPS printing support" on \
		WINBIND		"With WinBIND support" on \
		ACL_SUPPORT	"With ACL support" off \
		FAM_SUPPORT	"With File Alteration Monitor" off \
		SYSLOG		"With Syslog support" off \
		QUOTAS		"With Disk quota support" off \
		UTMP		"With UTMP accounting support" on \
		MSDFS		"With MSDFS support" off \
		PAM_SMBPASS	"With PAM authentication vs passdb backends" off \
		CLUSTER		"With experimental cluster support" off \
		EXP_MODULES	"With experimental modules" off \
		POPT		"With system-wide POPT library" on \
		MAX_DEBUG	"With maximum debuging" off
.endif

.include <bsd.port.pre.mk>

.if defined(SAMBA_SUBPORT)
# Switch off all extra functionality
CONFIGURE_ARGS+=	--disable-cups --disable-fam --without-winbind \
			--without-syslog --without-quotas --without-utmp \
			--without-pam --without-pam_smbpass --without-aio-support

# Dirty hack to work around usage of OPTIONS in slave ports
.	if exists(${.CURDIR}/Makefile.inc)
.		include "${.CURDIR}/Makefile.inc"
.	endif
.else
# Samba server itself
USE_RC_SUBR=		samba
SUB_FILES=		pkg-install pkg-message pkg-deinstall smb.conf.sample

PLIST=			${WRKDIR}/.PLIST

CONFIGURE_ARGS+=	--with-pam --with-readline --with-sendfile-support \
			--without-libsmbclient --without-libmsrpc \
			--without-libsmbsharemodes --without-python \
			--with-included-iniparser

.if !defined(WITHOUT_LDAP)
SAMBA_WANT_LDAP=	yes
.endif

.if !defined(WITHOUT_CUPS)
LIB_DEPENDS+=		cups.2:${PORTSDIR}/print/cups-base
CONFIGURE_ARGS+=	--enable-cups
SUB_LIST+=		CUPSD=""
.else
CONFIGURE_ARGS+=	--disable-cups
SUB_LIST+=		CUPSD="@comment "
.endif

.if defined(WITH_MAX_DEBUG)
LIB_DEPENDS+=		dmalloc.1:${PORTSDIR}/devel/dmalloc
CPPFLAGS+=		"-I${LOCALBASE}/include"
LDFLAGS+=		"-L${LOCALBASE}/lib"
CONFIGURE_ENV+=		CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS+=	--enable-debug --enable-developer --enable-krb5developer --enable-dmalloc --with-profiling-data
.else
CONFIGURE_ARGS+=	--disable-debug --disable-developer --disable-krb5developer --disable-dmalloc --without-profiling-data
.endif

.if defined(WITH_SYSLOG)
CONFIGURE_ARGS+=	--with-syslog
.else
CONFIGURE_ARGS+=	--without-syslog
.endif

.if defined(WITH_QUOTAS)
CONFIGURE_ARGS+=	--with-quotas
.else
CONFIGURE_ARGS+=	--without-quotas
.endif

.if !defined(WITHOUT_UTMP)
CONFIGURE_ARGS+=	--with-utmp
.else
CONFIGURE_ARGS+=	--without-utmp
.endif

.if defined(WITH_MSDFS)
CONFIGURE_ARGS+=	--with-msdfs
.else
CONFIGURE_ARGS+=	--without-msdfs
.endif

.if !defined(WITHOUT_WINBIND)
CONFIGURE_ARGS+=	--with-winbind
PLIST_SUB+=		WINBIND=""
SUB_LIST+=		WINBIND=""
.	if ${OSVERSION} >= 500112
WITH_WINBIND_NSS=	yes
PLIST_SUB+=		WINBIND_NSS=""
.	else
PLIST_SUB+=		WINBIND_NSS="@comment "
.	endif
.else
CONFIGURE_ARGS+=	--without-winbind
PLIST_SUB+=		WINBIND="@comment "
SUB_LIST+=		WINBIND="@comment "
.endif

.if defined(WITH_FAM_SUPPORT)
USE_FAM=		yes
CONFIGURE_ARGS+=	--enable-fam
.else
CONFIGURE_ARGS+=	--disable-fam
.endif

.if defined(WITH_EXP_MODULES)
.	if !defined(WANT_EXP_MODULES) || empty(WANT_EXP_MODULES)
WANT_EXP_MODULES=	idmap_ad idmap_rid charset_weird
.		if !defined(WITH_MAX_DEBUG)
WANT_EXP_MODULES+=	rpc_echo
.		endif
.	endif
WANT_EXP_MODULES!=	${ECHO_CMD} ${WANT_EXP_MODULES} | ${SED} -E 's/ +/,/g'
CONFIGURE_ARGS+=	--with-shared-modules="${WANT_EXP_MODULES}"
.endif

.if defined(WITH_PAM_SMBPASS)
CONFIGURE_ARGS+=	--with-pam_smbpass
PLIST_SUB+=		SMBPASS=""
.else
CONFIGURE_ARGS+=	--without-pam_smbpass
PLIST_SUB+=		SMBPASS="@comment "
.endif

.if defined(WITH_ACL_SUPPORT)
.if ${OSVERSION} < 500018
BROKEN=			ACL support requires FreeBSD 5.x at least after 20010326. Disable ACL support
.endif
CONFIGURE_ARGS+=	--with-acl-support
.else
CONFIGURE_ARGS+=	--without-acl-support
.endif

.if defined(WITH_SMBSH)
IGNORE=			broken IPC and code. Disable SMBSH support
CONFIGURE_ARGS+=	--with-smbwrapper
PLIST_SUB+=		SMBSH=""
.else
CONFIGURE_ARGS+=	--without-smbwrapper
PLIST_SUB+=		SMBSH="@comment "
.endif

.if defined(WITH_CLUSTER)
CONFIGURE_ARGS+=	--with-cluster-support
.else
CONFIGURE_ARGS+=	--without-cluster-support
.endif

.if defined(WITH_AIO_SUPPORT)
IGNORE=			broken kernel API until now (7-CURRENT). Disable AIO support
CONFIGURE_ARGS+=	--with-aio-support
.else
CONFIGURE_ARGS+=	--without-aio-support
.endif

.if !defined(WITHOUT_POPT)
LIB_DEPENDS+=		popt.0:${PORTSDIR}/devel/popt
CONFIGURE_ARGS+=	--without-included-popt
.else
CONFIGURE_ARGS+=	--with-included-popt
.endif
# !SAMBA_SUBPORT
.endif

###
### Common part for port and it's subports
###
# For 4.8 - 4.11 combination of Kerberos and OpenLDAP is broken
# due the conflict between system and OpenSSL port libcrypto libraries
.if ${OSVERSION} > 470103 && ${OSVERSION} < 500000
.	if defined(WITH_ADS)
IGNORE=			broken dependency between OpenSSL, OpenLDAP and Heimdal for FreeBSD 4.x. Disable ADS support
.	endif
.	undef		WITH_ADS
WITHOUT_ADS=		on
.endif

.if defined(WITH_ADS)
SAMBA_WANT_LDAP=	yes
SAMBA_WANT_KRB5=	yes
CONFIGURE_ARGS+=	--with-ads
.else
CONFIGURE_ARGS+=	--without-ads
.endif
# Kerberos5 is necessary for ADS
.if defined(SAMBA_WANT_KRB5)
.if defined(KRB5_HOME) && exists(${KRB5_HOME}/lib/libgssapi_krb5.so)
CONFIGURE_ARGS+=	--with-krb5="${KRB5_HOME}"
.elif defined(HEIMDAL_HOME) && exists(${HEIMDAL_HOME}/lib/libgssapi.so)
CONFIGURE_ARGS+=	--with-krb5="${HEIMDAL_HOME}"
.elif exists(${DESTDIR}/usr/lib/libkrb5.so) && exists(${DESTDIR}/usr/bin/krb5-config)
CONFIGURE_ARGS+=	--with-krb5="${DESTDIR}/usr"
.else
LIB_DEPENDS+=		krb5:${PORTSDIR}/security/heimdal
CONFIGURE_ARGS+=	--with-krb5="${LOCALBASE}"
.endif
.else
CONFIGURE_ARGS+=	--without-krb5
.endif

.if defined(SAMBA_WANT_LDAP)
USE_OPENLDAP=		yes
CONFIGURE_ARGS+=	--with-ldap
.else
CONFIGURE_ARGS+=	--without-ldap
.endif

.if !defined(SAMBA_SUBPORT)
# Samba server itself
MAN1=		findsmb.1 log2pcap.1 nmblookup.1 ntlm_auth.1 profiles.1 \
		rpcclient.1 smbcacls.1 smbclient.1 smbcontrol.1 smbcquotas.1 \
		smbget.1 smbstatus.1 smbtar.1 smbtree.1 testparm.1 vfstest.1
MAN5=		lmhosts.5 smb.conf.5 smbgetrc.5 smbpasswd.5
MAN7=		samba.7
MAN8=		net.8 nmbd.8 pdbedit.8 smbd.8 smbpasswd.8 smbspool.8 \
		swat.8 tdbbackup.8 tdbdump.8
.if defined(WITH_SMBSH)
MAN1+=		smbsh.1
.endif
.if !defined(WITHOUT_WINBIND)
MAN1+=		wbinfo.1
MAN7+=		pam_winbind.7
MAN8+=		winbindd.8
.endif

PLIST_SUB+=	SAMBA_LOGDIR="${SAMBA_LOGDIR}" \
		SAMBA_LOCKDIR="${SAMBA_LOCKDIR}" \
		SAMBA_CONFDIR="${SAMBA_CONFDIR}" \
		SAMBA_CONFIG="${SAMBA_CONFIG}" \
		SAMBA_RUNDIR="${SAMBA_RUNDIR}" \
		SAMBA_SWATDIR="${SAMBA_SWATDIR}" \
		SAMBA_SPOOL="${SAMBA_SPOOL}" \
		SAMBA_PRIVATEDIR="${SAMBA_PRIVATEDIR}"

SUB_LIST+=	SAMBA_LOGDIR="${SAMBA_LOGDIR}" \
		SAMBA_LOCKDIR="${SAMBA_LOCKDIR}" \
		SAMBA_CONFDIR="${SAMBA_CONFDIR}" \
		SAMBA_CONFIG="${SAMBA_CONFIG}" \
		SAMBA_RUNDIR="${SAMBA_RUNDIR}" \
		SAMBA_SWATDIR="${SAMBA_SWATDIR}" \
		SAMBA_SPOOL="${SAMBA_SPOOL}" \
		SAMBA_PRIVATEDIR="${SAMBA_PRIVATEDIR}" \
		SAMBA_PRIVATE="${SAMBA_PRIVATE}"

pre-everything::
	@${ECHO_CMD} "===>  NOTICE: This version of port has changed location of Samba password"
	@${ECHO_CMD} "===>  NOTICE: (smbpasswd) directory. Files in '${SAMBA_PRIVATE}'"
	@${ECHO_CMD} "===>  NOTICE: have moved to '${SAMBA_PRIVATEDIR}'."
	@if [ -d "${SAMBA_PRIVATE}" -a -n "`${LS} ${SAMBA_PRIVATE}/*.tdb 2>/dev/null`" ]; then \
	    ${ECHO_CMD} ""; \
	    ${ECHO_CMD} "===>  The directory '${SAMBA_PRIVATE}' is not empty. You possibly need"; \
	    ${ECHO_CMD} "===>  to move its files to '${SAMBA_PRIVATEDIR}' and remove directory."; \
	    ${ECHO_CMD} ""; \
	fi

pre-fetch:
	@${ECHO_MSG} "===>  -------------------------------------------"
	@${ECHO_MSG} "===>  Run 'make config' to (re)configure the port"
	@${ECHO_MSG} "===>  -------------------------------------------"

post-patch:
	@${RM} -rf ${WRKDIR}/${DISTNAME}/examples/LDAP/smbldap-tools-*
	@${RM} -rf ${WRKDIR}/${DISTNAME}/examples/libsmbclient
	@${RM} -rf ${WRKDIR}/${DISTNAME}/examples/libmsrpc
	@${RM} -rf ${WRKDIR}/${DISTNAME}/swat/lang
	@${RM} -f ${WRKDIR}/${DISTNAME}/docs/htmldocs/manpages/libsmbclient.7.html
	@${FIND} ${WRKSRC} -name CVS -o -name .cvsignore | ${XARGS} ${RM}
	@${FIND} ${WRKDIR}/${DISTNAME} -type d | ${XARGS} ${CHMOD} u+w,a+rx
	@${FIND} ${WRKDIR}/${DISTNAME} -type f | ${XARGS} ${CHMOD} u+w,a+r

pre-install:
	-@${FIND} "${SAMBA_MODULEDIR}" -type f 2>/dev/null | ${SORT} | ${SED} -E 's|^${PREFIX}/?||;' >> ${WRKDIR}/.PLIST.exclude
	@${CAT} ${PKGDIR}/pkg-plist > ${PLIST}
	@${CAT} ${PKGDIR}/pkg-plist.swat >> ${PLIST}

post-install:
.for sect in 1 5 7 8
	@${MKDIR} ${MAN${sect}PREFIX}/man/man${sect}
.	for man in ${MAN${sect}}
	    @${INSTALL_MAN} "${WRKDIR}/${DISTNAME}/docs/manpages/${man}" "${MAN${sect}PREFIX}/man/man${sect}"
.	endfor
.endfor
# Put examples in place
	@${MKDIR} ${EXAMPLESDIR}
	@${CP} -Rp ${WRKDIR}/${DISTNAME}/examples/* "${EXAMPLESDIR}"
.if defined(WITH_PAM_SMBPASS)
	@${MKDIR} ${EXAMPLESDIR}/pam_smbpass
	@${CP} -Rp ${WRKSRC}/pam_smbpass/samples/* "${EXAMPLESDIR}/pam_smbpass"
.endif
	${CP} -p "${WRKDIR}/${SAMBA_CONFIG}.sample" "${EXAMPLESDIR}"
	${INSTALL_SCRIPT} "${WRKSRC}/script/mksmbpasswd.sh" "${PREFIX}/bin/make_smbpasswd"
# Winbind
.if !defined(WITHOUT_WINBIND)
.	if defined(WITH_WINBIND_NSS)
	    ${INSTALL_PROGRAM} "${WRKSRC}/nsswitch/nss_winbind.so" "${SAMBA_LIBDIR}/nss_winbind.so.1"
	    ${INSTALL_PROGRAM} "${WRKSRC}/nsswitch/nss_wins.so" "${SAMBA_LIBDIR}/nss_wins.so.1"
	    @${ECHO_CMD} "${SAMBA_LIB}/nss_winbind.so.1" >> ${TMPPLIST};
	    @${ECHO_CMD} "${SAMBA_LIB}/nss_wins.so.1" >> ${TMPPLIST};
.	endif
	${INSTALL_PROGRAM} "${WRKSRC}/bin/pam_winbind.so" "${SAMBA_LIBDIR}"
	@${ECHO_CMD} "${SAMBA_LIB}/pam_winbind.so" >> ${TMPPLIST};
.endif
.if defined(WITH_PAM_SMBPASS)
	${INSTALL_PROGRAM} "${WRKSRC}/bin/pam_smbpass.so" "${SAMBA_LIBDIR}"
	@${ECHO_CMD} "${SAMBA_LIB}/pam_smbpass.so" >> ${TMPPLIST};
.endif
# smbwrapper.so
.if defined(WITH_SMBSH)
	${INSTALL_PROGRAM} "${WRKSRC}/bin/smbsh" "${PREFIX}/bin"
	${INSTALL_PROGRAM} "${WRKSRC}/bin/smbwrapper.so" "${SAMBA_MODULEDIR}"
.endif
# Lib
	@${FIND} "${SAMBA_MODULEDIR}" -type f | ${SED} -E 's|^${PREFIX}/?||;' | ${EGREP} -F -v -f ${WRKDIR}/.PLIST.exclude | ${SORT} >> ${TMPPLIST}
	@for d in `${FIND} "${SAMBA_MODULEDIR}" -type d | ${SORT} -r`; do \
	    ${ECHO_CMD} "@unexec ${RMDIR} \"$$d\" 2>/dev/null || true" >> ${TMPPLIST}; \
	done
# Documentation
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${CP} -Rp "${WRKDIR}/${DISTNAME}/docs/registry" "${DOCSDIR}"
.	for f in Samba3-ByExample.pdf Samba3-HOWTO.pdf Samba3-Developers-Guide.pdf
	    @${INSTALL_DATA} "${WRKDIR}/${DISTNAME}/docs/${f}" "${DOCSDIR}"
.	endfor
	@${INSTALL_DATA} "${FILESDIR}/README.FreeBSD" "${DOCSDIR}"
.	for f in README COPYING Manifest Read-Manifest-Now Roadmap \
		WHATSNEW.txt docs/THANKS docs/history
	    @${INSTALL_DATA} "${WRKDIR}/${DISTNAME}/${f}" "${DOCSDIR}"
.	endfor
# !NOPORTDOCS
.endif
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${CAT} ${PKGMESSAGE}
# !SAMBA_SUBPORT
.endif

.include <bsd.port.post.mk>
