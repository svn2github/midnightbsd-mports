# $MidnightBSD$

PORTNAME=	FCGI
PORTVERSION=	0.74
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules for perl5, for enabling FastCGI support in CGI scripts

LICENSE=	perl

OPTIONS_DEFINE=	PURE_PERL
PURE_PERL_DESC=	Build pure Perl version (experimental)

PERL_CONFIGURE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPURE_PERL}
CONFIGURE_ARGS+=--pure-perl
PLIST_SUB=	PURE_PERL="@comment "
.else
PLIST_SUB=	PURE_PERL=""
.endif

.include <bsd.port.mk>
