# $MidnightBSD$

PORTNAME=	logcheck
PORTVERSION=	1.3.14
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Auditing tool for system logs on Unix boxes
LICENSE=	gpl2

RUN_DEPENDS=	mime-construct:${PORTSDIR}/mail/mime-construct \
		lockfile:${PORTSDIR}/mail/procmail \
		bash:${PORTSDIR}/shells/bash

LOGCHECK_USER=	logcheck
LOGCHECK_UID=	915
LOGCHECK_GROUP=	logcheck
LOGCHECK_GID=	915

# Enable Perl dependency for logtail script
USE_PERL5=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
BINMODE=	755
SHAREMODE=	640
SUB_LIST+=	LOGCHECK_USER=${LOGCHECK_USER} \
		LOGCHECK_UID=${LOGCHECK_UID} \
		LOGCHECK_GROUP=${LOGCHECK_GROUP} \
		LOGCHECK_GID=${LOGCHECK_GID} \
		PW=${PW}
SUB_FILES=	pkg-install pkg-deinstall pkg-message
CONFIG_DIRS=	cracking.d ignore.d.paranoid ignore.d.server \
		ignore.d.workstation violations.d violations.ignore.d
DOCS=		AUTHORS CHANGES CREDITS LICENSE TODO docs/README*
PORTDOCS=	${DOCS:T}
MAN8=		logcheck.8 logtail.8 logtail2.8

PATCH_LIST=	extra-patch-debian__logcheck.cron.d \
		extra-patch-docs__logcheck.8 \
		extra-patch-etc__logcheck.conf \
		extra-patch-src__logcheck \
		extra-patch-src__logtail2
EXTRA_PATCHES=	${PATCH_LIST:C|^|${WRKDIR}/|g}

pre-patch:
.for patch in ${PATCH_LIST}
	@${SED} ${_SUB_LIST_TEMP} ${FILESDIR}/${patch}.in > ${WRKDIR}/${patch}
.endfor

do-build:
	@${REINPLACE_CMD} -e 's!/var/log/syslog!/var/log/messages!' \
		${WRKSRC}/etc/logcheck.logfiles
	@${REINPLACE_CMD} -e "s|#!/usr/bin/perl|#!${PERL}|" \
		${WRKSRC}/src/logtail

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/logcheck ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/src/logtail ${PREFIX}/sbin
	${INSTALL_SCRIPT} ${WRKSRC}/src/logtail2 ${PREFIX}/sbin
	@PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL
	@${INSTALL} -d /var/db/logcheck
	@${INSTALL} -d /var/run/logcheck
	${CHOWN} ${LOGCHECK_USER}:${LOGCHECK_GROUP} /var/db/logcheck
	@${ECHO_CMD} '@exec ${CHOWN} -R ${LOGCHECK_USER}:${LOGCHECK_GROUP} \
		/var/db/logcheck' >> ${TMPPLIST}
	${CHOWN} ${LOGCHECK_USER}:${LOGCHECK_GROUP} /var/run/logcheck
	@${ECHO_CMD} '@exec ${CHOWN} -R ${LOGCHECK_USER}:${LOGCHECK_GROUP} \
		/var/run/logcheck' >> ${TMPPLIST}
	@${INSTALL} -d ${ETCDIR}
	@${INSTALL_DATA} ${WRKSRC}/etc/logcheck.conf \
		${ETCDIR}/logcheck.conf.sample
	@${INSTALL_DATA} ${WRKSRC}/etc/logcheck.logfiles \
		${ETCDIR}/logcheck.logfiles.sample
.for i in ${CONFIG_DIRS}
	@${INSTALL} -d ${ETCDIR}/${i}
	@${INSTALL_DATA} ${WRKSRC}/rulefiles/linux/${i}/* ${ETCDIR}/${i}
.endfor
	@${INSTALL} -d ${DATADIR}/detectrotate
	@${INSTALL_DATA} ${WRKSRC}/src/detectrotate/*.dtr ${DATADIR}/detectrotate
.if !defined(NOPORTEXAMPLES)
	@${INSTALL} -d ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/debian/logcheck.cron.d \
		${EXAMPLESDIR}/crontab.in
.endif
	${CHOWN} -R root:${LOGCHECK_GROUP} ${ETCDIR}
	@${ECHO_CMD} '@exec ${CHOWN} -R root:${LOGCHECK_GROUP} \
		${ETCDIR:S|^${PREFIX}/|%D/|}' >> ${TMPPLIST}
	${CHOWN} -R root:${LOGCHECK_GROUP} ${DATADIR}
	@${ECHO_CMD} '@exec ${CHOWN} -R root:${LOGCHECK_GROUP} \
		${DATADIR:S|^${PREFIX}/|%D/|}' >> ${TMPPLIST}
	@${INSTALL_MAN} ${WRKSRC}/docs/*.8 ${MAN8PREFIX}/man/man8

post-install:
.if !defined(NOPORTDOCS)
	@${INSTALL} -d ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
	@${CHMOD} 644 ${DOCSDIR}/*
.endif

.include <bsd.port.mk>
