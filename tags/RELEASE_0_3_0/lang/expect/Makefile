# $MidnightBSD: mports/lang/expect/Makefile,v 1.2 2010/09/07 23:43:51 laffer1 Exp $

PORTNAME=	expect
PORTVERSION=	5.43.0
PORTREVISION=	1
CATEGORIES=	lang tcl tk
MASTER_SITES=	http://expect.nist.gov/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A sophisticated scripter based on tcl/tk
LICENSE=	unknown

FAKE_OPTS+=	prefixhack

OPTIONS=      X11 "Enable X11 support" on

.if !defined(WITHOUT_X11)
LIB_DEPENDS?=	tk84.1:${PORTSDIR}/x11-toolkits/tk84
.else
LIB_DEPENDS?=	tcl84.1:${PORTSDIR}/lang/tcl84
.endif

EXPECT_VER=	5.43
LIBEXPECT_VER=	543

WRKSRC=		${WRKDIR}/expect-${EXPECT_VER}
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

PLIST_SUB+=	EXPECT_VER="${EXPECT_VER}"
PLIST_SUB+=	LIBEXPECT_VER="${LIBEXPECT_VER}"

.if defined(WITHOUT_X11)
TK_CONFIG_ARGS=
PLIST_SUB+=	XFILES="@comment "
.else
TK_CONFIG_ARGS=	--with-tkconfig=${LOCALBASE}/lib/tk8.4 \
		--with-tkinclude=${LOCALBASE}/include/tk8.4
PLIST_SUB+=	XFILES=""
.endif

CONFIGURE_ARGS?=--enable-shared \
		--with-tclconfig=${LOCALBASE}/lib/tcl8.4 \
		--with-tclinclude=${LOCALBASE}/include/tcl8.4 \
		${TK_CONFIG_ARGS}

.if !defined(NO_MAN_INSTALL)
MAN1=		autoexpect.1 cryptdir.1 decryptdir.1 dislocate.1 \
		expect.1 kibitz.1 mkpasswd.1 multixterm.1 passmass.1 \
		tknewsbiff.1 unbuffer.1 xkibitz.1
.if !defined(WITHOUT_X11)
MAN1+=		expectk.1
.endif
MAN3=		libexpect.3
.endif

post-patch:
	${TOUCH} ${WRKSRC}/configure

post-install:
	${LN} -sf libexpect${LIBEXPECT_VER}.so.1 \
		${PREFIX}/lib/libexpect${LIBEXPECT_VER}.so
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
		${PREFIX}/bin/expect ${PREFIX}/bin/expectk

.include <bsd.port.mk>
