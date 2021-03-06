# Ports collection Makefile for:	nss_ldap
# Date created:				10/08/2007
# Whom:					luke@MidnightBSD.org
#
# $MidnightBSD$
# $FreeBSD: ports/net/nss_ldap/Makefile,v 1.22 2007/03/09 10:50:51 anray Exp $
#

PORTNAME=	nss_ldap
PORTVERSION=	1.${NSS_LDAP_VERSION}
CATEGORIES=	net
MASTER_SITES=	http://www.padl.com/download/ 
DISTNAME=	${PORTNAME}-${NSS_LDAP_VERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 2307 NSS module
LICENSE=	gpl2

NSS_LDAP_VERSION=257

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_OPENLDAP=	yes

PLIST_FILES=	etc/nss_ldap.conf.sample lib/nss_ldap.so.1

CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib -Wl,-rpath,${LOCALBASE}/lib"

CONFIGURE_ARGS=	--with-ldap-conf-file=${PREFIX}/etc/nss_ldap.conf \
		--with-ldap-secret-file=${PREFIX}/etc/nss_ldap.secret \
		--enable-rfc2307bis \
		--enable-schema-mapping \
		--enable-paged-results \
		--enable-configurable-krb5-ccname-env

MAN5=	nss_ldap.5

post-extract:
	${CP} ${FILESDIR}/bsdnss.c ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/nss_ldap.so ${PREFIX}/lib/nss_ldap.so.1
	${INSTALL_DATA} ${WRKSRC}/ldap.conf ${PREFIX}/etc/nss_ldap.conf.sample
	@${REINPLACE_CMD} 's,/etc/ldap.,${PREFIX}/etc/nss_ldap.,g' \
		${WRKSRC}/${MAN5}
	${INSTALL_MAN} ${WRKSRC}/${MAN5} ${MAN5PREFIX}/man/man5

.include <bsd.port.mk>
