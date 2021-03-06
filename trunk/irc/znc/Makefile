# $MidnightBSD$

PORTNAME=	znc
PORTVERSION=	1.4
CATEGORIES=	irc ipv6
MASTER_SITES=	http://znc.in/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An advanced IRC bouncer

LICENSE=	apache2

GNU_CONFIGURE=	yes
USE_RC_SUBR=	znc
USES=		pkgconfig iconv gmake

NO_OPTIONS_SORT=	yes

OPTIONS_DEFINE=	DEBUG IPV6 OPENSSL CYRUS PERL PYTHON TCL DOCS
OPTIONS_DEFAULT=	OPENSSL PERL
OPTIONS_SUB=	yes

CYRUS_DESC=	Cyrus SASL module
DEBUG_DESC=	Debugging support
PERL_DESC=	Perl scripting module
PYTHON_DESC=	Python scripting module
TCL_DESC=	Tcl scripting module

CYRUS_CONFIGURE_ON=	--enable-cyrus
CYRUS_LDFLAGS=	-L${LOCALBASE}/lib
CYRUS_LIB_DEPENDS=	libsasl2.so:${PORTSDIR}/security/cyrus-sasl2
DEBUG_CONFIGURE_ON=	--enable-debug
IPV6_CONFIGURE_OFF=	--disable-ipv6
PERL_BUILD_DEPENDS=	swig>=2.0.11:${PORTSDIR}/devel/swig20
PERL_CONFIGURE_ENABLE=	perl
PERL_CONFIGURE_ON=	--enable-swig
PERL_USES=	perl5
PYTHON_BUILD_DEPENDS=	swig>=2.0.11:${PORTSDIR}/devel/swig20
PYTHON_CONFIGURE_ON=	--enable-python=python-${PYTHON_VER} --enable-swig
PYTHON_USES=	perl5
OPENSSL_CONFIGURE_OFF=	--disable-openssl
TCL_CONFIGURE_ENABLE=	tcl

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENSSL}
EXTENSIONS+=		openssl
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
.endif

.if ${PORT_OPTIONS:MPERL}
USE_PERL5+=		run build
.endif

.if ${PORT_OPTIONS:MTCL}
USES+=			tcl
CONFIGURE_ARGS+=	--with-tcl=${TCL_LIBDIR}
.endif

.if ${PORT_OPTIONS:MPYTHON}
USE_PYTHON=		3
USE_PERL5+=		build
.endif

PORTDOCS=		README.md

pre-configure:
# No need to cast to char** in AM_ICONV, fixes charset/iconv detection
# and by extension, successfully builds charset module
	@${REINPLACE_CMD} -e \
		's#(char \*\*)##g' \
		${WRKSRC}/configure
# Instead of using bundled swig generated files, delete them to force
# regeneration using swig 2.0.11+ (fixes port compilation using clang)
.if ${PORT_OPTIONS:MPERL}
	@${RM} ${WRKSRC}/modules/modperl/ZNC.cpp
.endif
.if ${PORT_OPTIONS:MPYTHON}
	@${RM} ${WRKSRC}/modules/modpython/_znc_core.cpp
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		's#$$(libdir)/pkgconfig#${PREFIX}/libdata/pkgconfig#' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e \
		's#/usr/local#${LOCALBASE}#' ${WRKSRC}/configure

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${STAGEDIR}${DOCSDIR}
.endfor
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}"
.endif

.include <bsd.port.mk>
