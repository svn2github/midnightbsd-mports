# ex:ts=8
# New ports collection makefile for:	autogen
# Date created:		Mar 11, 2001
# Whom:			Ying-Chieh Liao <ijliao@FreeBSD.org>
#
# $MidnightBSD: mports/devel/autogen/Makefile,v 1.3 2008/03/26 00:20:55 laffer1 Exp $
# $FreeBSD: ports/devel/autogen/Makefile,v 1.59 2007/07/30 03:53:29 clsung Exp $
#

PORTNAME=	autogen
PORTVERSION=	5.9.5
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		${MASTER_SITE_GNU:S/$/:gnu/}
MASTER_SITE_SUBDIR=	${PORTNAME} ${PORTNAME}/rel${PORTVERSION}/:gnu
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:DEFAULT,gnu

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Automated Program Generator
LICENSE=	gpl2

LIB_DEPENDS=	guile.19:${PORTSDIR}/lang/guile

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget libxml2
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libguile=yes --with-libxml2=yes --datadir=${PREFIX}/share
USE_LDCONFIG=	yes

MAN1=	autogen.1 autoopts-config.1 columns.1 getdefs.1 xml2ag.1
MAN3=	ao_string_tokenize.3 configFileLoad.3 optionFileLoad.3 \
	optionFindNextValue.3 optionFindValue.3 optionFree.3 \
	optionGetValue.3 optionLoadLine.3 optionNextValue.3 \
	optionProcess.3 optionRestore.3 optionOnlyUsage.3 \
	optionSaveFile.3 optionSaveState.3 optionUnloadNested.3 \
	optionVersion.3 strequate.3 streqvcmp.3 streqvmap.3 strneqvcmp.3 \
	strtransform.3

INFO=	autogen

.include <bsd.port.mk>
