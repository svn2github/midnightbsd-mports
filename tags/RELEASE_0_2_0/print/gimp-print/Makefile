# ports collection makefile for: gimp-print
# Date Created: 2007 09 01
# Whom: Lucas Holt <luke@midnightbsd.org>
# 
# $MidnightBSD$
# $FreeBSD: ports/print/gimp-print/Makefile,v 1.33 2007/05/19 20:20:54 flz Exp $

PORTNAME=	gimp-print
PORTVERSION=	4.2.7
PORTREVISION=	3
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GIMP Print Printer Driver

DEPRECATED=	gimp-print has been renamed gutenprint (print/gutenprint), please \
		consider using it.
EXPIRATION_DATE=2007-07-15

USE_AUTOTOOLS=	libtool:15
USE_GETTEXT=	yes
USE_GETOPT_LONG=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--with-gimp=no
USE_LDCONFIG=	yes

CONFLICTS=	gutenprint-[0-9]*

MAN1=	escputil.1 gimpprint-config.1 ijsgimpprint.1
MAN3=	gimpprint.3
MAN7=	gimpprint-color.7 gimpprint-dithers.7 gimpprint-imagetypes.7 \
	gimpprint-inktypes.7 gimpprint-mediasizes.7 gimpprint-mediasources.7 \
	gimpprint-mediatypes.7 gimpprint-models.7 gimpprint-resolutions.7
MAN8=	cups-calibrate.8
INFO=	gimpprint

CPPFLAGS=	-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

.if defined(WITH_CUPS) && !defined(WITHOUT_CUPS)
LIB_DEPENDS+=	cups.2:${PORTSDIR}/print/cups-base
RUN_DEPENDS+=	espgs:${PORTSDIR}/print/cups-pstoraster
CONFIGURE_ARGS+=	--with-cups=${PREFIX}
PLIST_SUB+=	CUPS=""
.else
PLIST_SUB+=	CUPS="@comment "
CONFIGURE_ARGS+=	--without-cups
.endif

.if defined(WITHOUT_IJS)
PLIST_SUB+=	IJS="@comment "
.else
LIB_DEPENDS+=	ijs.1:${PORTSDIR}/print/libijs
CONFIGURE_ARGS+=	--with-ijs=yes
PLIST_SUB+=	IJS=""
.endif

.if defined(NOPORTDOCS)
CONFIGURE_ARGS+=	--with-user-guide=no
.endif

pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "You may use the following build options:"
	@${ECHO_MSG}
	@${ECHO_MSG} "	WITH_CUPS=yes		build with CUPS driver"
	@${ECHO_MSG} "	WITHOUT_IJS=yes 	build without IJS-based Ghostscript driver"
	@${ECHO_MSG}

post-extract:
	@${RM} -f ${WRKSRC}/doc/gimpprint.info*

post-patch:
	@${REINPLACE_CMD} -e 's|=makeinfo|="makeinfo --no-split"|g ; \
		 s|$${CFLAGS:=} -O|$${CFLAGS}|g' ${WRKSRC}/configure
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|$$(PACKAGE)/doc|doc/$$(PACKAGE)|g ; \
		 s|LANGUAGE=|LANG=|g ; \
		 s|: install-gimp_plug_inPROGRAMS|:|g ; \
		 s|$$(RM) -r|$$(RM) -f -r|g'

.include <bsd.port.mk>
