# $MidnightBSD$

PORTNAME=	libwww
PORTVERSION=	6.08
CATEGORIES=	www perl5 devel
MASTER_SITES=	CPAN/LWP
PKGNAMEPREFIX=	p5-
DISTNAME=	libwww-perl-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 library for WWW access

LICENSE=	perl

BUILD_DEPENDS=	p5-Authen-NTLM>=1.02:${PORTSDIR}/security/p5-Authen-NTLM \
		p5-Encode-Locale>=0:${PORTSDIR}/converters/p5-Encode-Locale \
		p5-File-Listing>=6:${PORTSDIR}/sysutils/p5-File-Listing \
		p5-HTML-Parser>=0:${PORTSDIR}/www/p5-HTML-Parser \
		p5-HTTP-Cookies>=6:${PORTSDIR}/www/p5-HTTP-Cookies \
		p5-HTTP-Daemon>=6:${PORTSDIR}/www/p5-HTTP-Daemon \
		p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date \
		p5-HTTP-Message>=6:${PORTSDIR}/www/p5-HTTP-Message \
		p5-HTTP-Negotiate>=6:${PORTSDIR}/www/p5-HTTP-Negotiate \
		p5-LWP-MediaTypes>=6:${PORTSDIR}/www/p5-LWP-MediaTypes \
		p5-Net-HTTP>=6.04:${PORTSDIR}/net/p5-Net-HTTP \
		p5-URI>=1.10:${PORTSDIR}/net/p5-URI \
		p5-WWW-RobotRules>=6:${PORTSDIR}/www/p5-WWW-RobotRules
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	HTTPS

CONFIGURE_ARGS=	--aliases
PERL_CONFIGURE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MHTTPS}
BUILD_DEPENDS+=	p5-Crypt-SSLeay>=0:${PORTSDIR}/security/p5-Crypt-SSLeay \
		p5-LWP-Protocol-https>=0:${PORTSDIR}/www/p5-LWP-Protocol-https
RUN_DEPENDS+=	p5-Crypt-SSLeay>=0:${PORTSDIR}/security/p5-Crypt-SSLeay \
		p5-LWP-Protocol-https>=0:${PORTSDIR}/www/p5-LWP-Protocol-https
.endif

.include <bsd.port.mk>
