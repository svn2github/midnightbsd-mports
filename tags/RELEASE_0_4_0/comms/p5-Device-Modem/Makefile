# $MidnightBSD: mports/comms/p5-Device-Modem/Makefile,v 1.2 2010/11/12 13:59:24 laffer1 Exp $

PORTNAME=	Device-Modem
PORTVERSION=	1.56
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl class to interface generic modems (AT-compliant)
LICENSE=	perl

BUILD_DEPENDS=	p5-Device-SerialPort>=0:${PORTSDIR}/comms/p5-Device-SerialPort
RUN_DEPENDS=	p5-Device-SerialPort>=0:${PORTSDIR}/comms/p5-Device-SerialPort

PERL_CONFIGURE=	yes

MAN3=		Device::Modem.3 \
		Device::Modem::FAQ.3 \
		Device::Modem::Log::File.3 \
		Device::Modem::Log::Syslog.3 \
		Device::Modem::Protocol::Xmodem.3 \
		Device::Modem::UsRobotics.3

post-install:
.ifndef(NOPORTEXAMPLES)
	@${ECHO_MSG} "===>   Installing examples for ${PKGNAME}"
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${EXAMPLESDIR}
.endif

.include <bsd.port.mk>
