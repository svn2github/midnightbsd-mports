# New ports collection makefile for:	aide
# Date created:				Tue Jan  4 11:45:29 PST 2000
# Whom:					Cy Schubert (Cy.Schubert@uumail.gov.bc.ca)
#
# $MidnightBSD: mports/security/aide/Makefile,v 1.2 2007/05/13 14:16:48 ctriv Exp $
# $FreeBSD: ports/security/aide/Makefile,v 1.21 2006/02/23 05:05:38 cy Exp $
#

PORTNAME=	aide
PORTVERSION=	0.13.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://www.cs.tut.fi/~rammer/
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A replacement and extension for Tripwire
LICENSE=	gpl2

LIB_DEPENDS=	mhash.2:${PORTSDIR}/security/mhash

USE_GMAKE=	yes
USE_BISON=	yes
USE_AUTOTOOLS=	autoconf:261
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-mhash \
		--with-zlib \
		--with-config_file=${PREFIX}/etc/aide.conf

CONFIGURE_ENV+=	CFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

MAN1=		aide.1
MAN5=		aide.conf.5

SUB_FILES=	pkg-message

post-install:
	@${INSTALL_DATA} ${FILESDIR}/aide.conf.freebsd ${PREFIX}/etc/aide.conf.sample
.if defined(AIDE_FLOPPY)
	@disklabel -w -B /dev/rfd0c fd1440
	@newfs -u 0 -t 0 -i 196608 -m 0 -T minimum -o space /dev/rfd0c
	@mount /dev/fd0c /mnt
	@${CP} ${PREFIX}/bin/aide /mnt/aide
	@${CP} -p /var/db/aide/aide.conf /mnt/aide.conf
	@${CP} < /var/db/aide/databases/aide.db /mnt/aide.db
	@${CHMOD} 555 /mnt/aide
	@umount /mnt
	@${ECHO} Do not forget to remove and write-protect the floppy.
.endif

.include <bsd.port.mk>
