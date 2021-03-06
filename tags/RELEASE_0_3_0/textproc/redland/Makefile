# New ports collection makefile for:	redland
# Date created:			Nov 22, 2001
# Whom:				ijliao
#
# $MidnightBSD: mports/textproc/redland/Makefile,v 1.1 2008/10/17 18:01:53 laffer1 Exp $
# $FreeBSD: ports/textproc/redland/Makefile,v 1.33 2008/08/10 16:20:02 miwi Exp $
#

PORTNAME=	redland
PORTVERSION=	1.0.7
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://librdf.org/dist/source/
MASTER_SITE_SUBDIR=	librdf

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A high-level interface for RDF
LICENSE=	gpl2

LIB_DEPENDS=	raptor.3:${PORTSDIR}/textproc/raptor

USE_BDB=	yes
WITH_BDB_HIGHEST=	yes
INVALID_BDB_VER=2
USE_GNOME=	gnomehack gnometarget lthack pkgconfig
USE_OPENSSL=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

CPPFLAGS=	-I${BDB_INCLUDE_DIR} -I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--with-raptor=system \
		--with-rasqal=internal \
		--with-threestore=no \
		--with-sqlite=no

USE_LDCONFIG=	yes
USE_PERL5_BUILD=	yes

MAN1=		rasqal-config.1 rdfproc.1 redland-config.1 \
		redland-db-upgrade.1 roqet.1
MAN3=		librasqal.3 redland.3

OPTIONS+=	MYSQL "Use MySQL instead of BDB" off

.include <bsd.port.pre.mk>

.if defined(WITH_MYSQL)
USE_MYSQL=	yes
CONFIGURE_ARGS+=--with-mysql=yes
PLIST_SUB+=	MYSQL=""
.else
CONFIGURE_ARGS+=--with-mysql=no
PLIST_SUB+=	MYSQL="@comment "
.endif

pre-everything::
	@${ECHO_CMD} "You can choose BDB version by setting WITH_BDB_VER to one off:"
	@${ECHO_CMD} "3 40 41 42 43 44 3+ 40+ 41+ 42+ 43+ 44+ (current: ${BDB_VER})"
.	if defined(WITH_MYSQL)
	@${ECHO_CMD} "MySQL version to be used: ${MYSQL_VER}"
	@${ECHO_CMD} "If you don't have MySQL installed you can stop the build now"
	@${ECHO_CMD} "and set WITH_MYSQL_VER to the desired version"
.	endif

.include <bsd.port.post.mk>
