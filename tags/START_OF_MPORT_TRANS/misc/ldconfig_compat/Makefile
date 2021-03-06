# New ports collection makefile for:	ldconfig_compat
# Date created:				30 Dec 2005
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD: mports/misc/ldconfig_compat/Makefile,v 1.1 2006/09/17 07:14:46 archite Exp $
# $FreeBSD: ports/misc/ldconfig_compat/Makefile,v 1.13 2006/06/26 14:38:56 flz Exp $
#

PORTNAME=	ldconfig_compat
PORTVERSION=	1.0
PORTREVISION=	8
CATEGORIES=	misc
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ldconfig compatibility script

NO_BUILD=	yes
SUB_FILES=	ldconfig_compat.sh
USE_RC_SUBR=	yes

LOCAL_DIRS=	${LDCONFIG_DIR} \
		${LDCONFIG32_DIR}

SUB_LIST=	LDCONFIG_DIR=${LDCONFIG_DIR} \
		LDCONFIG32_DIR=${LDCONFIG32_DIR}

.if !defined(WITHOUT_X11)
LOCAL_PREFIXES=	${PREFIX} ${X11BASE}
.else
LOCAL_PREFIXES=	${PREFIX}
.endif

.include <bsd.port.pre.mk>
.include "${.CURDIR}/bsd.ldconfig.mk"

.if !( ${OSVERSION} < 504105 || \
	( ${OSVERSION} >= 700000 && ${OSVERSION} < 700012 ) || \
	( ${OSVERSION} >= 600000 && ${OSVERSION} < 600104 ) )
IGNORE=		isn't needed (part of base rc.d)
.endif

do-fetch:
	@${DO_NADA}

do-install:
.if ${OSVERSION} >= 600101
	@${INSTALL_SCRIPT} ${WRKDIR}/ldconfig_compat.sh ${PREFIX}/etc/rc.d/ldconfig_compat
	@${ECHO_CMD} "etc/rc.d/ldconfig_compat" >> ${TMPPLIST}
.elif ${OSVERSION} >= 500037
	@${INSTALL_SCRIPT} ${WRKDIR}/ldconfig_compat.sh /etc/rc.d/ldconfig_compat
	@${ECHO_CMD} "@cwd /" >> ${TMPPLIST}
	@${ECHO_CMD} "etc/rc.d/ldconfig_compat" >> ${TMPPLIST}
.else
	@${INSTALL_SCRIPT} ${WRKDIR}/ldconfig_compat.sh ${PREFIX}/etc/rc.d/000.ldconfig_compat.sh
	@${ECHO_CMD} "etc/rc.d/000.ldconfig_compat.sh" >> ${TMPPLIST}
.endif
# Special case, recent RELENG_4 versions have no /etc/rc.d/ldconfig script, but directories
# are present in BSD.{x11,local}.dist.
.if !( ${OSVERSION} >= 492101 && ${OSVERSION} < 500000 )
.for prefix in ${LOCAL_PREFIXES}
	@${ECHO_CMD} "@cwd ${prefix}" >> ${TMPPLIST}
.for dir in ${LOCAL_DIRS}
	echo creating  ${prefix}/${dir}
	@${MKDIR} -p ${prefix}/${dir}
	@${ECHO_CMD} "@exec mkdir -p %D/${dir}" >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir %D/${dir} 2>/dev/null || true" >> ${TMPPLIST}
.endfor
.endfor
.endif

.include <bsd.port.post.mk>
