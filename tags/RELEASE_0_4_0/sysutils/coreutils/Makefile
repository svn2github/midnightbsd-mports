# $MidnightBSD: mports/sysutils/coreutils/Makefile,v 1.8 2013/02/26 04:34:10 laffer1 Exp $

PORTNAME=	coreutils
PORTVERSION=	8.20
PORTREVISION=	1
CATEGORIES=	sysutils textproc
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Free Software Foundation's core utilities
LICENSE=	gpl3

CONFLICTS=	id-utils-[0-9]* linux-gid-[0-9]*

MAKE_JOBS_UNSAFE=	yes

GNU_CONFIGURE=	yes
# A rather nasty hack to stop gnustat from conflicting with base gstat
CONFIGURE_ARGS=	--program-prefix=g	\
		--program-transform-name=s/stat/nustat/
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib" FORCE_UNSAFE_CONFIGURE=1
CPPFLAGS+=	"-I${LOCALBASE}/include"

USE_XZ=		yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_PERL5_BUILD=	yes # Required for tests and man page generation
#USE_BISON=	yes

INFO=		coreutils

MAN1=	gbasename.1 gcat.1 gchcon.1 gchgrp.1 gchmod.1 gchown.1 gchroot.1 \
	gcksum.1 gcomm.1 gcp.1 gcsplit.1 gcut.1 gdate.1 gdd.1 gdf.1 gdir.1 \
	gdircolors.1 gdirname.1 gdu.1 gecho.1 genv.1 gexpand.1 gexpr.1 \
	gfactor.1 gfalse.1 gfmt.1 gfold.1 ggroups.1 ghead.1 ghostid.1 \
	gid.1 ginstall.1 gjoin.1 gkill.1 glink.1 gln.1 \
	glogname.1 gls.1 gmd5sum.1 gmkdir.1 gmkfifo.1 gmknod.1 gmktemp.1 \
	gmv.1 gnice.1 gnl.1 gnohup.1 god.1 gpaste.1 gpathchk.1 gpinky.1 \
	gpr.1 gprintenv.1 gprintf.1 gptx.1 gpwd.1 greadlink.1 grealpath.1 grm.1 \
	grmdir.1 gruncon.1 gseq.1 gsha1sum.1 gshred.1 gsleep.1 gsort.1 \
	gsplit.1 gstdbuf.1 gnustat.1 gstty.1 gsum.1 gsync.1 gtac.1 \
	gtail.1 gtee.1 gtest.1 gtimeout.1 gtouch.1 gtr.1 gtrue.1 gtruncate.1 \
	gtsort.1 gtty.1 guname.1 gunexpand.1 guniq.1 gunlink.1 guptime.1 \
	gusers.1 gvdir.1 gwc.1 gwho.1 gwhoami.1 gyes.1 gbase64.1 gsha224sum.1 \
	gsha256sum.1 gsha384sum.1 gsha512sum.1 gshuf.1 gnproc.1

OPTIONS=	GMP "Build with GNU Multiple Precision Arithmetic Library" off

.include <bsd.mport.options.mk>

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USES+=	gettext
PLIST_SUB+=	NLS=""
.endif

.if defined(WITH_GMP)
LIB_DEPENDS+=	gmp:${PORTSDIR}/math/gmp
.else
CONFIGURE_ARGS+=--without-gmp
.endif

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 4015
EXTRA_PATCHES=	${PATCHDIR}/extra-patch-stty.c
.endif

post-build:
	@${REINPLACE_CMD} -e "s/ lib / /g" ${WRKSRC}/Makefile

.include <bsd.port.post.mk>
