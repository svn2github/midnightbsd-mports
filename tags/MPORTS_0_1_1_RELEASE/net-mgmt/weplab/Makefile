# New ports collection makefile for:	weplab
# Date created:				24 Aug 2006
# Whom:					Anton Karpov <toxa@toxahost.ru>
#
# $FreeBSD: ports/net-mgmt/weplab/Makefile,v 1.1 2006/08/24 13:13:41 garga Exp $
# $MidnightBSD: mports/net-mgmt/weplab/Makefile,v 1.1 2006/12/26 01:30:23 laffer1 Exp $
#

PORTNAME=	weplab
PORTVERSION=	0.1.5
CATEGORIES=	net-mgmt
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WepLab is a tool designed to teach how WEP works
LICENSE=	gpl2

GNU_CONFIGURE=	yes

MAN1=		weplab.1
PLIST_FILES=	bin/weplab

post-patch:
	@${REINPLACE_CMD} -E 's,^(CC|CFLAGS|LDFLAGS) *=,\1 ?=,g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
