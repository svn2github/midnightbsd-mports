#
# $FreeBSD: ports/misc/kdehier4/Makefile,v 1.27 2008/08/09 16:52:18 miwi Exp $
# $MidnightBSD: mports/misc/kdehier4/Makefile,v 1.3 2010/01/23 19:14:37 laffer1 Exp $
#

PORTNAME=	kdehier4
PORTVERSION=	1.1.0
CATEGORIES=	misc kde
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility port that creates hierarchy of shared KDE4 directories
LICENSE=	unknown

NO_BUILD=	yes
USE_LDCONFIG=	${KDE4_PREFIX}/lib
USE_KDE4=	#

.include <bsd.port.pre.mk>

.if ${KDE4_PREFIX} != ${LOCALBASE}
PLIST_SUB+=	MTREE="" \
		LDCONFIG_DIR="${LDCONFIG_DIR}" \
		LDCONFIG32_DIR="${LDCONFIG32_DIR}"
SUB_FILES=	session-kde4.conf \
		system-kde4.conf
SUB_LIST=	KDE4_PREFIX="${KDE4_PREFIX}"
.else
PLIST_SUB+=	MTREE="@comment "
.endif

do-install:
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/dirlist`; \
	do \
		${MKDIR} ${KDE4_PREFIX}/$${dir}; \
	done
.if ${KDE4_PREFIX} != ${LOCALBASE}
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/mtree-dirlist`; \
	do \
		${MKDIR} ${KDE4_PREFIX}/$${dir}; \
	done
	${MKDIR} ${PREFIX}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/session-kde4.conf ${PREFIX}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/system-kde4.conf ${PREFIX}/etc/dbus-1
. for dir in pam.d polkit-1 rc.d
	${LN} -sf ${PREFIX}/etc/${dir} ${KDE4_PREFIX}/etc/
. endfor
	${LN} -sf ${PREFIX}/${LDCONFIG_DIR} ${KDE4_PREFIX}/libdata/
	${LN} -sf ${PREFIX}/${LDCONFIG32_DIR} ${KDE4_PREFIX}/libdata/
	${LN} -sf ${PREFIX}/libdata/pkgconfig ${KDE4_PREFIX}/libdata/
. for dir in services system-services
	${LN} -sf ${PREFIX}/share/dbus-1/${dir} ${KDE4_PREFIX}/share/dbus-1/
. endfor
	${LN} -sf ${PREFIX}/share/polkit-1/actions ${KDE4_PREFIX}/share/polkit-1/
.endif

maintainer-generate-plist:
	cd ${FILESDIR} && ${SH} make-plist.sh

.include <bsd.port.post.mk>
