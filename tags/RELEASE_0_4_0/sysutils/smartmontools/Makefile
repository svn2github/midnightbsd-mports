# $MidnightBSD: mports/sysutils/smartmontools/Makefile,v 1.5 2013/02/26 04:51:12 laffer1 Exp $

PORTNAME=	smartmontools
PORTVERSION=	6.1
CATEGORIES=	sysutils
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	S.M.A.R.T. disk monitoring tools
LICENSE=	gpl2

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-drivedb --enable-sample \
		--with-initscriptdir=${PREFIX}/etc/rc.d

SUB_FILES=	pkg-message smart
USE_RC_SUBR=	smartd

MAN5=		smartd.conf.5
MAN8=		smartd.8 smartctl.8

PORTDOCS=	*

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MDOCS}
CONFIGURE_ARGS+=	--without-docdir --without-exampledir
.else
CONFIGURE_ARGS+=	--with-docdir=${DOCSDIR}
.endif

CFLAGS:=	${CFLAGS:S/-O2/-O/} -Wno-write-strings

post-patch:
	@${REINPLACE_CMD} -e 's| install-initdDATA| |' ${WRKSRC}/Makefile.in

post-install:
	${MKDIR} ${PREFIX}/etc/periodic/daily
	${INSTALL_SCRIPT} ${WRKDIR}/smart ${PREFIX}/etc/periodic/daily/smart

	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
