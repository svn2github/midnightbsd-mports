# $MidnightBSD: mports/net-mgmt/p5-Net-IP/Makefile,v 1.2 2007/06/06 19:20:48 ctriv Exp $

PORTNAME=	Net-IP
PORTVERSION=	1.26
CATEGORIES=	net-mgmt perl5 ipv6
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for manipulating IPv4/IPv6 addresses
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Net::IP.3

post-configure:
	${PERL} -pi -e 's/-I\S+PERL\S+ //g if m{PERL_DL_NONLAZY}' ${WRKSRC}/Makefile

post-patch:
	${REINPLACE_CMD} "1853s#\\s+#\s*#g" ${WRKSRC}/IP.pm
	${REINPLACE_CMD} "76s#count#count   = 0#" ${WRKSRC}/ipcount

.include <bsd.port.mk>
