# $MidnightBSD$

PORTNAME=	sendxmpp
PORTVERSION=	0.0.8
PORTREVISION=	1
CATEGORIES=	net-im perl5
MASTER_SITES=	http://www.djcbsoftware.nl/code/sendxmpp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl-script to send xmpp (jabber) messages

LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/Net/XMPP.pm:${PORTSDIR}/net-im/p5-Net-XMPP \
		p5-IO-Socket-SSL>0.0:${PORTSDIR}/security/p5-IO-Socket-SSL
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN1=	sendxmpp.1

PLIST_FILES=	bin/sendxmpp
PLIST_DIRS=	%%SITE_PERL%%/mach/auto/sendxmpp

.include <bsd.port.mk>
