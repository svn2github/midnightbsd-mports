# New ports collection makefile for:	rssh
# Date created:				Fri Apr 16 02:04:33 CEST 2004
# Whom:					enigmatyc
#
# $MidnightBSD$
# $FreeBSD: ports/shells/rssh/Makefile,v 1.10 2006/07/17 20:03:19 rafan Exp $
#

PORTNAME=	rssh
PORTVERSION=	2.3.2
CATEGORIES=	shells security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Restricted Secure SHell only for sftp or/and scp

GNU_CONFIGURE=	yes

MAN1=		rssh.1
MAN5=		rssh.conf.5

OPTIONS=	RSYNC "rsync support" off \
		RDIST "rdist support" off

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 500000
IGNORE=		wordexp() is not supported on 4.x
.endif

.if defined(WITH_RSYNC)
RUN_DEPENDS+=	${LOCALBASE}/bin/rsync:${PORTSDIR}/net/rsync
CONFIGURE_ARGS+=--with-rsync=${LOCALBASE}/bin/rsync
.endif

.if defined(WITH_RDIST)
RUN_DEPENDS+=	${LOCALBASE}/bin/rdist6:${PORTSDIR}/net/rdist6
CONFIGURE_ARGS+=--with-rdist=${LOCALBASE}/bin/rdist6
.endif

post-patch:
	@${REINPLACE_CMD} -E -e 's,(\$$\(DESTDIR\)\$$\(sysconfdir\)/\$$\$$f),\1.dist,g' \
		${WRKSRC}/Makefile.in

post-install:
	@${ECHO_MSG} "updating /etc/shells"
	@${CP} /etc/shells /etc/shells.bak
	@(${GREP} -v ${PREFIX}/bin/${PORTNAME} /etc/shells.bak; \
		${ECHO_CMD} ${PREFIX}/bin/${PORTNAME}) > /etc/shells
	@${RM} /etc/shells.bak

.include <bsd.port.post.mk>
