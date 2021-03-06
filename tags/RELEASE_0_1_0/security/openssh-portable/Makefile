# New ports collection makefile for: openssh
# Date created:  18 Mar 1999
# Whom:   dwcjr@inethouston.net
#
# $MidnightBSD: mports/security/openssh-portable/Makefile,v 1.3 2007/03/09 18:58:30 laffer1 Exp $
# $FreeBSD: ports/security/openssh-portable/Makefile,v 1.111 2006/10/01 19:37:54 mnag Exp $
#

PORTNAME=	openssh
DISTVERSION=	4.6p1
CATEGORIES=	security ipv6
MASTER_SITES=	ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/%SUBDIR%/ \
		ftp://carroll.cac.psu.edu/pub/OpenBSD/OpenSSH/portable/%SUBDIR%/ \
		http://mirror.mcs.anl.gov/openssh/portable/%SUBDIR%/
MASTER_SITE_SUBDIR=	# empty
PKGNAMESUFFIX=	${PORTABLE_SUFFIX}${GSSAPI_SUFFIX}${BASE_SUFFIX}
DISTNAME=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The portable version of OpenBSD's OpenSSH

.if defined(OPENSSH_SNAPSHOT)
PORTREVISION!=		date -v-1d +%Y%m%d
NO_CHECKSUM=		yes
MASTER_SITE_SUBDIR+=	snapshot
DISTNAME+=		${PORTNAME}-SNAP-${PORTREVISION}
.else
DISTNAME+=		${PORTNAME}-${DISTVERSION}
.endif

WRKSRC=			${WRKDIR}/${PORTNAME}-${DISTVERSION}

MAN1=	sftp.1 ssh-add.1 ssh-agent.1 ssh-keygen.1 ssh-keyscan.1 scp.1 ssh.1
MLINKS=	ssh.1 slogin.1
MAN5=	ssh_config.5 sshd_config.5
MAN8=	sftp-server.8 sshd.8 ssh-keysign.8

CONFLICTS?=		openssh-3.* ssh-1.* ssh2-3.*

USE_OPENSSL=		yes
USE_PERL5_BUILD=	yes
GNU_CONFIGURE=		yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=		--prefix=${PREFIX} --mandir=${MANPREFIX}/man \
			--with-md5-passwords --without-zlib-version-check
PRECIOUS=		ssh_config sshd_config ssh_host_key ssh_host_key.pub \
			ssh_host_rsa_key ssh_host_rsa_key.pub ssh_host_dsa_key \
			ssh_host_dsa_key.pub
ETCOLD=			${PREFIX}/etc
PORTABLE_SUFFIX=	-portable

SUDO?=		# empty
MAKE_ENV+=	SUDO="${SUDO}"

OPTIONS=	PAM		"Enable pam(3) support"			on \
		TCP_WRAPPERS	"Enable tcp_wrappers support"		on \
		LIBEDIT		"Enable readline support to sftp(1)"	on \
		KERBEROS	"Enable kerberos (autodetection)"	on \
		SUID_SSH	"Enable suid SSH (Recommended off)"	off \
		GSSAPI		"Enable GSSAPI support"			off \
		OPENSSH_CHROOT	"Enable CHROOT support"			off \
		OPENSC		"Enable OpenSC smartcard support"	off \
		OPENSCPINPATCH	"Enable OpenSC PIN patch"		off \
		HPN		"Enable HPN-SSH patch"			off \
		OVERWRITE_BASE	"OpenSSH overwrite base"		off

.include <bsd.port.pre.mk>

# Preserve deprecated OPENSSH_OVERWRITE_BASE settings
.if defined(OPENSSH_OVERWRITE_BASE)
WITH_OVERWRITE_BASE=	yes
.endif

.if !defined(WITHOUT_PAM) && exists(/usr/include/security/pam_modules.h)
CONFIGURE_ARGS+=	--with-pam
.endif

.if !defined(WITHOUT_TCP_WRAPPERS) && exists(/usr/include/tcpd.h)
CONFIGURE_ARGS+=	--with-tcp-wrappers
.endif

.if !defined(WITHOUT_LIBEDIT)
CONFIGURE_ARGS+=	--with-libedit
.endif

.if !defined(WITH_SUID_SSH)
CONFIGURE_ARGS+=	--disable-suid-ssh
.endif

.if !defined(WITHOUT_KERBEROS)
.if defined(KRB5_HOME) && exists(${KRB5_HOME}) || defined(WITH_GSSAPI)
PORTABLE_SUFFIX=	# empty
GSSAPI_SUFFIX=		-gssapi
CONFLICTS+=		openssh-portable-*-[0-9]*
CONFIGURE_ARGS+=	--with-kerberos5=${KRB5_HOME}
.if ${OPENSSLBASE} == "/usr"
CONFIGURE_ARGS+=	--without-rpath
LDFLAGS=		# empty
.endif
.else
CONFLICTS+=		openssh-gssapi-*-[0-9]*
CONFIGURE_ARGS+=	--with-rpath=${OPENSSLRPATH}
.if exists(/usr/include/krb5.h)
CONFIGURE_ARGS+=	--with-kerberos5
EXTRA_PATCHES+=		${FILESDIR}/gss-serv.c.patch
.endif
.endif
.endif

.if ${OPENSSLBASE} != "/usr"
CONFIGURE_ARGS+=	--with-ssl-dir=${OPENSSLBASE}
.endif

.if defined(WITH_OPENSSH_CHROOT)
CFLAGS+=		-DCHROOT
.endif

.if defined(WITH_OPENSC)
LIB_DEPENDS+=		opensc.2:${PORTSDIR}/security/opensc
CONFIGURE_ARGS+=	--with-opensc=${LOCALBASE}
.endif

# See http://bugzilla.mindrot.org/show_bug.cgi?id=608
.if defined(WITH_OPENSCPINPATCH)
EXTRA_PATCHES+=		${FILESDIR}/scardpin.patch
.endif

.if defined(WITH_HPN)
IGNORE=			option HPN is temporary disabled, waiting patch for new openssh release
PATCH_DIST_STRIP=	-p1
PATCH_SITES+=		http://www.psc.edu/networking/projects/hpn-ssh/
PATCHFILES+=		openssh-4.3p2-hpn12.diff.gz
.endif

.if defined(WITH_OVERWRITE_BASE)
WITH_OPENSSL_BASE=	yes
BASE_SUFFIX=		-overwrite-base
CONFIGURE_ARGS+=	--localstatedir=/var
EMPTYDIR=		/var/empty
PREFIX=			/usr
ETCSSH=			/etc/ssh
USE_RC_SUBR=		yes
SUB_FILES+=		openssh
SUB_LIST+=		ETCSSH="${ETCSSH}"
PLIST_SUB+=		NOTBASE="@comment "
PLIST_SUB+=		BASE=""
.else
.if exists(/var/empty)
EMPTYDIR=		/var/empty
.else
EMPTYDIR=		${PREFIX}/empty
.endif
ETCSSH=			${PREFIX}/etc/ssh
USE_RC_SUBR=		openssh
SUB_LIST+=		ETCSSH="${ETCSSH}"
PLIST_SUB+=		NOTBASE=""
PLIST_SUB+=		BASE="@comment "
.endif

# After all
PLIST_SUB+=		EMPTYDIR="${EMPTYDIR}"
CONFIGURE_ARGS+=	--sysconfdir=${ETCSSH} --with-privsep-path=${EMPTYDIR}

# Sync this with bsd.port.mk
RC_SCRIPT_NAME=		openssh

post-extract:
.if defined(OPENSSH_SNAPSHOT)
	@# rc.d script have same name of openssh snapshot dir
	@${MV} ${WRKDIR}/${PORTNAME} ${WRKDIR}/${PORTNAME}-${DISTVERSION}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-ldes|-lcrypto|g' ${WRKSRC}/configure
.if defined(WITH_OVERWRITE_BASE)
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${LOCALBASE}|' \
		-e 's|%%RC_SCRIPT_NAME%%|${RC_SCRIPT_NAME}|' ${WRKSRC}/sshd.8
.else
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|' \
		-e 's|%%RC_SCRIPT_NAME%%|${RC_SCRIPT_NAME}|' ${WRKSRC}/sshd.8
.endif
	@${REINPLACE_CMD} -E -e 's|SSH_VERSION|TMP_SSH_VERSION|' \
		-e 's|.*SSH_RELEASE.*||' ${WRKSRC}/version.h
	@${ECHO_CMD} '#define FREEBSD_PORT_VERSION	" FreeBSD-${PKGNAME}"' >> \
		${WRKSRC}/version.h
	@${ECHO_CMD} '#define SSH_VERSION	TMP_SSH_VERSION SSH_PORTABLE FREEBSD_PORT_VERSION' >> \
		${WRKSRC}/version.h
	@${ECHO_CMD} '#define SSH_RELEASE	TMP_SSH_VERSION SSH_PORTABLE FREEBSD_PORT_VERSION' >> \
		${WRKSRC}/version.h

pre-install:
.if defined(WITH_OVERWRITE_BASE)
	@${MKDIR} ${EMPTYDIR}
.else
	@${MKDIR} ${PREFIX}/empty
.endif
	if ! pw groupshow sshd; then pw groupadd sshd -g 22; fi
	if ! pw usershow sshd; then pw useradd sshd -g sshd -u 22 \
		-h - -d ${EMPTYDIR} -s /nonexistent -c "sshd privilege separation"; fi
.if !exists(${ETCSSH})
	@${MKDIR} ${ETCSSH}
.endif
.for i in ${PRECIOUS}
.if exists(${ETCOLD}/${i}) && !exists(${ETCSSH}/${i})
	@${ECHO_MSG} "==>   Linking ${ETCSSH}/${i} from old layout."
	${LN} ${ETCOLD}/${i} ${ETCSSH}/${i}
.endif
.endfor

post-install:
	${INSTALL_DATA} -c ${WRKSRC}/ssh_config.out ${ETCSSH}/ssh_config-dist
	${INSTALL_DATA} -c ${WRKSRC}/sshd_config.out ${ETCSSH}/sshd_config-dist
.if defined(WITH_OVERWRITE_BASE)
	@${ECHO_CMD} "===> Installing rc.d startup script(s)"
	@${ECHO_CMD} "@cwd ${LOCALBASE}" >> ${TMPPLIST}
	@${INSTALL_SCRIPT} ${WRKDIR}/openssh ${LOCALBASE}/etc/rc.d/${RC_SCRIPT_NAME}
	@${ECHO_CMD} "etc/rc.d/${RC_SCRIPT_NAME}" >> ${TMPPLIST}
	@${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}
.endif
	@${CAT} ${PKGMESSAGE}

test:	build
	(cd ${WRKSRC}/regress && ${SETENV} ${MAKE_ENV} TEST_SHELL=/bin/sh \
		PATH=${WRKSRC}:${PREFIX}/bin:${PREFIX}/sbin:${PATH} \
		${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS})

.include <bsd.port.post.mk>
