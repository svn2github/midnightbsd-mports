# New ports collection makefile for:	KDE PIM
# Date created:				2 March 2001
# Whom:					Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD: mports/deskutils/kdepim3/Makefile,v 1.1 2007/12/31 18:18:02 laffer1 Exp $
# $FreeBSD: ports/deskutils/kdepim3/Makefile,v 1.78 2007/11/01 03:45:59 linimon Exp $
#

PORTNAME=	kdepim
PORTVERSION=	${KDE_VERSION}
PORTREVISION=	0
CATEGORIES=	deskutils mail news palm kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Personal Information Management tools for KDE
LICENSE=	gpl2

LIB_DEPENDS=	gpgme:${PORTSDIR}/security/gpgme \
		opensync.0:${PORTSDIR}/devel/libopensync022 \
		pisock:${PORTSDIR}/palm/pilot-link \
		sasl2:${PORTSDIR}/security/cyrus-sasl2

CONFLICTS=	akregator-[0-9]* kdenetwork-3.1.* kdeaddons-kontact-plugins-[0-9]* kdepim-kpilot-3.2.3

USE_KDEBASE_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_BISON=	build
USE_OPENSSL=	yes
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes

USE_LDCONFIG=	yes
LDCONFIG_DIRS+=	%%PREFIX%%/lib %%PREFIX%%/lib/kde3
CONFIGURE_ARGS=	--with-gpg=${LOCALBASE}/bin/gpg \
		--with-gpgsm=${LOCALBASE}/bin/gpgsm \
		--with-ssl-dir=${OPENSSLBASE}

OPTIONS=	GNOKII "KAdressbook import/export for Nokia phones" off

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/bin/gnokii)
.	if !defined(WITH_GNOKII)
GNOKII_OVERRIDE=yes
WITH_GNOKII=	yes
.	endif
.endif

.if defined(WITH_GNOKII)
LIB_DEPENDS+=	gnokii:${PORTSDIR}/comms/gnokii
.endif # defined ($(WITH_GNOKII))

.if defined(DO_NOT_COMPILE)
CONFIGURE_ENV+=DO_NOT_COMPILE="${DO_NOT_COMPILE}"
.endif # defined(DO_NOT_COMPILE)

pre-everything::
.if defined(GNOKII_OVERRIDE)
	@${ECHO_MSG} "*   gnokii is installed and support has been enabled     *"
	@${ECHO_MSG} "* automatically (no additional files will be installed). *"
.endif

.include <bsd.port.post.mk>
