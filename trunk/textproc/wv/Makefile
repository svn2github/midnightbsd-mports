# $MidnightBSD$

PORTNAME=	wv
PORTVERSION=	1.2.9
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://www.abisource.com/downloads/wv/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library and executables to access Microsoft Word files

LICENSE=	gpl2

LIB_DEPENDS=	wmf.2:${PORTSDIR}/graphics/libwmf

USE_GNOME=	libgsf
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	MKDIR_P="${MKDIR}"
CONFIGURE_ARGS=	--with-png=${LOCALBASE} \
		--with-libwmf=${LOCALBASE}
MAKEFILE=	GNUmakefile
MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
USE_LDCONFIG=	yes

MAN1=	wvAbw.1 wvCleanLatex.1 wvDVI.1 wvHtml.1 wvLatex.1 wvMime.1 wvPDF.1 \
	wvPS.1 wvRTF.1 wvSummary.1 wvText.1 wvVersion.1 wvWare.1 wvWml.1
MLINKS=	wvWare.1 wvConvert.1

.include <bsd.port.mk>
