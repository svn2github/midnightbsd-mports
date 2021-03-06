#
# $MidnightBSD: ports/x11/kde4/Makefile,v 1.100 2008/08/09 16:52:23 miwi Exp $
#

PORTNAME?=	kde4
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11 kde
MASTER_SITES=	# empty
DISTFILES=	# none
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	The "meta-port" for KDE
LICENSE=	agg

OPTIONS=	KDEACCESSIBILITY "Accessibility applications" on \
		KDEADMIN "KDE Administration applications" on \
    		KDEARTWORK "Additional themes, sounds, etc" on \
		KDEGAMES "Games like kolf, patience, atlantik, etc" on \
		KDEEDU "Educational applications" on \
		KDEGRAPHICS "Graphics utilities like kview, kpaint, etc" on \
		KDENETWORK "Network-related programs like kopete, etc" on \
		KDEMULTIMEDIA "Multimedia utilities like noatun, etc" on \
		KDEPIM "Personal Information Management: mail, etc" on \
		KDEPLASMA "Extra plasmoids for KDE" on \
		KDESDK "KDE software development kit" on \
		KDETOYS "Miscellaneous small applications" on \
		KDEUTILS "Utilities like kcalc, kcharselect, etc" on \
		KDEWEBDEV "Website development environment" on

USE_KDE4=	kdelibs kdebase pimlibs workspace kdeprefix runtime
NO_BUILD=	yes

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_KDEACCESSIBILITY)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kmag:${PORTSDIR}/accessibility/kdeaccessibility4
.endif
.if !defined(WITHOUT_KDEADMIN)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kuser:${PORTSDIR}/sysutils/kdeadmin4
.endif
.if !defined(WITHOUT_KDEARTWORK)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kbanner.kss:${PORTSDIR}/x11-themes/kdeartwork4
.endif
.if !defined(WITHOUT_KDEGAMES)
RUN_DEPENDS+=	${KDE4_PREFIX}/bin/kjumpingcube:${PORTSDIR}/games/kdegames4
.endif
.if !defined(WITHOUT_KDEEDU)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/khangman:${PORTSDIR}/misc/kdeedu4
.endif
.if !defined(WITHOUT_KDEGRAPHICS)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/gwenview:${PORTSDIR}/graphics/kdegraphics4
.endif
.if !defined(WITHOUT_KDENETWORK)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kppp:${PORTSDIR}/net/kdenetwork4
.endif
.if !defined(WITHOUT_KDEMULTIMEDIA)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kmix:${PORTSDIR}/multimedia/kdemultimedia4
.endif
.if !defined(WITHOUT_KDEPIM)
RUN_DEPENDS+=	${KDE4_PREFIX}/bin/korganizer:${PORTSDIR}/deskutils/kdepim4
.endif
.if !defined(WITHOUT_KDEPLASMA)
RUN_DEPENDS+=	kdeplasma-addons>=4:${PORTSDIR}/deskutils/kdeplasma-addons
.endif
.if !defined(WITHOUT_KDETOYS)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/amor:${PORTSDIR}/x11-clocks/kdetoys4
.endif
.if !defined(WITHOUT_KDESDK)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/cervisia:${PORTSDIR}/devel/kdesdk4
.endif
.if !defined(WITHOUT_KDEUTILS)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kdessh:${PORTSDIR}/misc/kdeutils4
.endif
.if !defined(WITHOUT_KDEWEBDEV)
RUN_DEPENDS+=   ${KDE4_PREFIX}/bin/kommander:${PORTSDIR}/www/kdewebdev4
.endif

do-install:
	${DO_NADA}

.include <bsd.port.post.mk>
