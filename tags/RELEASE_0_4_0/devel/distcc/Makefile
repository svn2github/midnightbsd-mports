# $MidnightBSD: mports/devel/distcc/Makefile,v 1.3 2011/07/16 15:21:39 laffer1 Exp $

PORTNAME=	distcc
PORTVERSION=	3.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distribute compilation of C(++) code acrosss machines on a network
LICENSE=	gpl2

LIB_DEPENDS=	popt.0:${PORTSDIR}/devel/popt

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-gprof --disable-Werror
WANT_GNOME=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"
DISTCCD_PIDFILE=/var/run/distccd.pid
USE_RC_SUBR=	distccd.sh
SUB_LIST=	DISTCCD_PIDFILE=${DISTCCD_PIDFILE}

OPTIONS=	GNOME	"Build GUI monitor based on GNOME"	Off \
		GTK	"Build GUI monitor based on GTK"	Off \
		RFC2553 "Enable IPv6 support"	Off \
		AVAHI "Enable Avahi Zeroconf/mDNS/Bonjour support"	Off \
		COMPILER_LINKS	"Create symlinks to distcc"	On

.include <bsd.port.pre.mk>

.if defined(WITHOUT_AVAHI)
CONFIGURE_ARGS+=	--without-avahi
.else
LIB_DEPENDS+=	avahi-glib.1:${PORTSDIR}/net/avahi-app
.endif

.if defined(WITHOUT_RFC2553)
CONFIGURE_ARGS+=	--disable-rfc2553
.else
CONFIGURE_ARGS+=	--enable-rfc2553
.endif

.if defined(WITH_COMPILER_LINKS)
CCLINKDIR?=		libexec/distcc
PLIST_DIRS=		${CCLINKDIR}
GNU_COMPILERS=		34 42 44 -ooo
DISTCC_COMPILERS=	cc c++ gcc g++ ${GNU_COMPILERS:S|^|gcc|} ${GNU_COMPILERS:S|^|g++|}
DISTCC_COMPILERS+=	clang clang++ llvm-gcc llvm-c++ llvm-g++
.if ${ARCH} == "i386"
DISTCC_COMPILERS+=	icc icpc
.endif
.if defined(EXTRA_COMPILERS)
DISTCC_COMPILERS+=	${EXTRA_COMPILERS}
.endif
PLIST_FILES+=		${DISTCC_COMPILERS:S|^|${CCLINKDIR}/|}
.endif

.if defined(WITH_GNOME)
USE_GNOME=		libgnomeui
CONFIGURE_ARGS+=	--with-gnome
PKGNAMESUFFIX=		-gnome
PLIST_SUB+=		WITH_GNOME=""
.elif defined(WITH_GTK)
USE_GNOME=		gtk20
CONFIGURE_ARGS+=	--with-gtk
PKGNAMESUFFIX=		-gtk
PLIST_SUB+=		WITH_GNOME=""
.else
PLIST_SUB+=		WITH_GNOME="@comment "
.endif

MAN1=		distcc.1 distccd.1 distccmon-text.1
DOC_FILES=	AUTHORS INSTALL NEWS README \
		doc/protocol-1.txt doc/status-1.txt \
		doc/protocol-2.txt doc/reporting-bugs.txt

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/distcc ${PREFIX}/bin
	@${INSTALL_PROGRAM} ${WRKSRC}/distccmon-text ${PREFIX}/bin
.if defined(WITH_GNOME) || defined(WITH_GTK)
	@${INSTALL_PROGRAM} ${WRKSRC}/distccmon-gnome ${PREFIX}/bin
.endif
	@${INSTALL_PROGRAM} ${WRKSRC}/distccd ${PREFIX}/sbin

post-install:
	@${TOUCH} ${DISTCCD_PIDFILE}
.if defined(WITH_COMPILER_LINKS)
	@${MKDIR} ${PREFIX}/${CCLINKDIR}
.for link in ${DISTCC_COMPILERS}
	${LN} -sf ${PREFIX}/bin/distcc ${PREFIX}/${CCLINKDIR}/${link}
.endfor
.endif
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif
.for f in ${MAN1}
	@${INSTALL_MAN} ${WRKSRC}/man/${f} ${MANPREFIX}/man/man1
.endfor

.include <bsd.port.post.mk>
