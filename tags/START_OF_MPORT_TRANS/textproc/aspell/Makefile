# New ports collection makefile for:	aspell
# Date created:				7 December 1998
# Whom:					Josh Gilliam <josh@quick.net>
#
# $MidnightBSD: mports/textproc/aspell/Makefile,v 1.2 2007/04/05 05:28:55 ctriv Exp $
# $FreeBSD: ports/textproc/aspell/Makefile,v 1.81 2006/08/06 21:05:14 thierry Exp $
#

PORTNAME=	aspell
PORTVERSION=	0.60.4
PORTREVISION=	4
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	aspell
.if defined(WITHOUT_DICTEN)
PKGNAMESUFFIX=	-without-dicten
.endif
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Spelling checker with better suggestion logic than ispell

FAKE_OPTS=	libs bin

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=		--enable-dict-dir=${DATADIR}	\
			--enable-docdir=${DOCSDIR}	\
			--enable-static
PTHREAD_CFLAGS=		# Disable threading
PTHREAD_LIBS=		# libaspell may be used by unthreaded apps.
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}"	\
			LDFLAGS="-L${LOCALBASE}/lib ${LDFLAGS} ${PTHREAD_LIBS}"
USE_GMAKE=		yes
USE_ICONV=		yes
USE_GETTEXT=		yes
USE_PERL5_BUILD=	yes
USE_LDCONFIG=		yes

SLAVEDIRS=		textproc/aspell-without-dicten

MAKE_ARGS=		NOPORTDOCS=${NOPORTDOCS}
VERINST=		${PORTVERSION:R}
SUB_FILES=		aspell.ver
PLIST_SUB=		VER=${VERINST}
SUB_LIST=		VERINST=${VERINST}

.if defined(WITHOUT_DICTEN)
CONFLICTS=		aspell-0.*
DICT_TARGET=
.else
VERDICT_EN=		6-en-6.0-0
DICT_SUFFIX=		.tar.bz2
MASTER_SITES+=		${MASTER_SITE_GNU:S|%SUBDIR%/|%SUBDIR%/dict/en/:dicten|}
DISTFILES+=		aspell${VERDICT_EN}${DICT_SUFFIX}:dicten
CONFLICTS=		aspell-without-dicten-0.*
DICT_TARGET=		inst-dicten
CONF_DICT_ENV=		ASPELL="${PREFIX}/bin/aspell"\
			PREZIP="${PREFIX}/bin/prezip"   \
			WORD_LIST_COMPRESS="${PREFIX}/bin/word-list-compress"  
.endif

.if defined(WITH_ISPELL)
CONFLICTS+=		ispell* ??-ispell*
SCRIPTS=		ispell spell
PLIST_SUB+=		SCRIPTS=""
.else
PLIST_SUB+=		SCRIPTS="@comment "
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
PLIST_SUB+=		NLS=""
.endif

.if !defined(NOPORTDOCS)
MAN1=			aspell-import.1 aspell.1 pspell-config.1		\
			run-with-aspell.1 word-list-compress.1 prezip-bin.1
INFO=			aspell-dev aspell
.endif

# Does not link without at least -O
.if !defined(CFLAGS) || ${CFLAGS:M-O*} == ""
CFLAGS+=		-O
.endif

pre-everything::
	@${ECHO_MSG} ""
.if !defined(WITH_ISPELL)
	@${ECHO_MSG} "Define WITH_ISPELL to install Ispell's wrapper."
	@${ECHO_MSG} ""
.endif
.if !defined(WITHOUT_DICTEN)
	@${ECHO_MSG} "Define WITHOUT_DICTEN to not install english dictionary."
	@${ECHO_MSG} ""
.endif

post-extract:
.if !defined(WITHOUT_DICTEN)
	cd ${WRKDIR} && \
	${TAR} -xjf ${DISTDIR}/aspell${VERDICT_EN}${DICT_SUFFIX}
.endif

pre-configure:
	@cd ${WRKSRC} && ${ACLOCAL}

post-install:	${DICT_TARGET}
	${INSTALL_DATA} ${WRKDIR}/aspell.ver ${PREFIX}/etc
.if defined(WITH_ISPELL)
	${INSTALL_SCRIPT} ${SCRIPTS:S|^|${WRKSRC}/scripts/|} ${PREFIX}/bin
.endif
	@${ECHO_CMD} "@dirrm share/aspell" >> ${TMPPLIST}
	@${ECHO_CMD} "@dirrm lib/aspell-${VERINST}" >> ${TMPPLIST}

# work with bsd.port.mk
FAKE_DESTDIR?=/

inst-dicten:
# Install en-aspell by default
.if !exists(${LOCALBASE}/lib/aspell-${VERINST}/en.dat) && !defined(WITHOUT_DICTEN)
	@${ECHO_MSG} "===>   Installing for en dictionaries"
	cd ${WRKDIR}/aspell${VERDICT_EN} &&		\
	 ${SETENV} ${CONF_DICT_ENV} ./${CONFIGURE_SCRIPT} --vars DESTDIR=${FAKE_DESTDIR} ASPELL_FLAGS="--data-dir=${PREFIX}/lib/aspell-0.60" && \
	 ${GMAKE} ${INSTALL_TARGET}
	${SED} -e "s|%%VER%%|${VERINST}|" ${MASTERDIR}/pkg-plist.en	\
		>> ${TMPPLIST}
.endif

.include <bsd.port.mk>
