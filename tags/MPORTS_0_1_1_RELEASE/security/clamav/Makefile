# New ports collection makefile for:	clamav
# Date created:		15 July 2002
# Whom:			markun@onohara.to
#
# $MidnightBSD: mports/security/clamav/Makefile,v 1.6 2007/05/13 14:33:45 ctriv Exp $
# $FreeBSD: ports/security/clamav/Makefile,v 1.95 2007/03/16 19:16:32 garga Exp $
#

PORTNAME=	clamav
PORTVERSION=	0.91.1
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line virus scanner written entirely in C

LIB_DEPENDS=	gmp.7:${PORTSDIR}/math/libgmp4
RUN_DEPENDS=	lha:${PORTSDIR}/archivers/lha \
		arj:${PORTSDIR}/archivers/arj \
		arc:${PORTSDIR}/archivers/arc

OPTIONS=	MILTER "Compile the milter interface" Off \
		LDAP "libmilter was built with LDAP" Off \
		STDERR "Print logs to stderr instead of stdout" Off \
		EXPERIMENTAL "Build experimental code" Off

USE_AUTOTOOLS=	libtool:15
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes
USE_RC_SUBR=	clamav-clamd clamav-freshclam

PORTDOCS=	*

DBDIR=		/var/db/clamav
LOGDIR=		/var/log/clamav
RUNDIR=		/var/run/clamav
PLIST_SUB+=	DBDIR=${DBDIR} LOGDIR=${LOGDIR} RUNDIR=${RUNDIR}

CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--with-dbdir=${DBDIR} \
		--with-zlib=/usr \
		--mandir=${MANPREFIX}/man \
		--disable-zlib-vcheck \
		--disable-clamuko \
		--disable-clamav \
		--enable-bigstack \
		--disable-gethostbyname_r \
		--enable-readdir_r \
		--disable-dependency-tracking
CPPFLAGS+=	-I${LOCALBASE}/include \
		${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib \
		${PTHREAD_LIBS}

MAN1=		clamconf.1 \
		clamscan.1 \
		freshclam.1 \
		sigtool.1 \
		clamdscan.1
MAN5=		clamd.conf.5 \
		freshclam.conf.5
MAN8=		clamd.8 \
		clamav-milter.8

CLAMAVUSER?=	clamav
CLAMAVGROUP?=	clamav

CLAMAV_CLAMD_SOCKET?=	${RUNDIR}/clamd
CLAMAV_MILTER_SOCKET?=	${RUNDIR}/clmilter.sock

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST+=	DBDIR=${DBDIR} \
		LOGDIR=${LOGDIR} \
		RUNDIR=${RUNDIR} \
		CLAMAVUSER=${CLAMAVUSER} \
		CLAMAVGROUP=${CLAMAVGROUP} \
		CLAMAV_CLAMD_SOCKET=${CLAMAV_CLAMD_SOCKET} \
		CLAMAV_MILTER_SOCKET=${CLAMAV_MILTER_SOCKET}

SED_CONF=	-E -e 's|^\#?(Example)$$|\#\1|' \
		-e 's|^\#?((Update)?LogFile) .*/([a-z]+\.log)$$|\1 ${LOGDIR}/\3|' \
		-e 's|^\#?(PidFile) .*/([a-z]+\.pid)$$|\1 ${RUNDIR}/\2|' \
		-e 's|^\#?(LocalSocket) .*$$|\1 ${CLAMAV_CLAMD_SOCKET}|' \
		-e 's|^\#?(User) .*$$|\1 ${CLAMAVUSER}|' \
		-e 's|^\#?(AllowSupplementaryGroups).*$$|\1 yes|' \
		-e 's|^\#?(ScanMail).*$$|\1 yes|' \
		-e 's|^\#?(DatabaseDirectory) .*$$|\1 ${DBDIR}|' \
		-e 's|^\#?(DatabaseOwner) .*$$|\1 ${CLAMAVUSER}|' \
		-e 's|^\#?(FixStaleSocket).*$$|\1 yes|' \
		-e 's|^\#?(NotifyClamd) .*$$|\1 ${PREFIX}/etc/clamd.conf|'

PLIST_SUB+=	CLAMAVUSER=${CLAMAVUSER} \
		CLAMAVGROUP=${CLAMAVGROUP}

.include <bsd.port.pre.mk>

# Only works with -lthr
PTHREAD_LIBS=	-lthr

.if defined(WITH_MILTER)
USE_RC_SUBR+=	clamav-milter
.if defined(WITH_LDAP) && exists(${LOCALBASE}/lib/libldap.so)
USE_OPENLDAP=	yes
LDFLAGS+=	-lldap
.endif
.if !exists(/usr/lib/libmilter.a) || exists(${LOCALBASE}/lib/libmilter.a)
BUILD_DEPENDS+=	${LOCALBASE}/lib/libmilter.a:${PORTSDIR}/mail/sendmail
CONFIGURE_ARGS+=	--with-sendmail=${LOCALBASE}/sbin/sendmail
.else
CONFIGURE_ARGS+=	--with-sendmail=/usr/sbin/sendmail
.endif
CONFIGURE_ARGS+=	--enable-milter
PLIST_SUB+=	CLAMAV-MILTER=""
.else
PLIST_SUB+=	CLAMAV-MILTER="@comment "
.endif

.if defined(WITH_STDERR)
EXTRA_PATCHES+=		${FILESDIR}/extra-patch-shared_output.c
.endif

.if defined(WITH_EXPERIMENTAL)
CONFIGURE_ARGS+=	--enable-experimental
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g' \
		${WRKSRC}/${CONFIGURE_SCRIPT}
	@${REINPLACE_CMD} -E 's,^(pkgconfigdir = ).*$$,\1$$(prefix)/libdata/pkgconfig,g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|0x100000000|0x100000000ULL|g' \
		${WRKSRC}/libclamav/unrar/unrar.c
	@${REINPLACE_CMD} ${SED_CONF} \
		${WRKSRC}/etc/clamd.conf \
		${WRKSRC}/etc/freshclam.conf


post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/html
	@${INSTALL_DATA} ${WRKSRC}/NEWS ${WRKSRC}/ChangeLog ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/docs/html/* ${DOCSDIR}/html
.endif

.include <bsd.port.post.mk>
