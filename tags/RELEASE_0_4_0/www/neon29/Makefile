# $MidnightBSD: mports/www/neon29/Makefile,v 1.5 2013/03/30 20:35:52 laffer1 Exp $

PORTNAME=	neon29
PORTVERSION=	0.29.6
PORTREVISION=	5
CATEGORIES=	www
MASTER_SITES=	http://www.webdav.org/neon/
DISTNAME=	neon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An HTTP and WebDAV client library for Unix systems
LICENSE=	lgpl

CONFLICTS=	neon2[6|8]-[0-9]*

OPTIONS_DEFINE=	OPENSSL NLS GSSAPI PROXY DOCS
OPTIONS_DEFAULT=	EXPAT OPENSSL NLS GSSAPI
OPTIONS_SINGLE=	XML
OPTIONS_SINGLE_XML=	EXPAT LIBXML
XML_DESC=	XML parser library
LIBXML_DESC=	libxml2 XML parser support
PROXY_DESC=	libproxy support

USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes

USES=		pathfix
USE_GNOME=	ltverhack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--with-libs=${LOCALBASE}:${PREFIX}

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEXPAT}
CONFIGURE_ARGS+=--with-expat
LIB_DEPENDS+=	expat.6:${PORTSDIR}/textproc/expat2
.endif

.if ${PORT_OPTIONS:MLIBXML}
CONFIGURE_ARGS+=--with-libxml2
LIB_DEPENDS+=	xml2.5:${PORTSDIR}/textproc/libxml2
.endif

.if ${PORT_OPTIONS:MOPENSSL}
CONFIGURE_ARGS+=--with-ssl
USE_OPENSSL=	yes
.endif

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.if ! ${PORT_OPTIONS:MGSSAPI}
CONFIGURE_ARGS+=--without-gssapi
.endif

.if ${PORT_OPTIONS:MPROXY}
CONFIGURE_ARGS+=--with-libproxy
LIB_DEPENDS+=	proxy.1:${PORTSDIR}/net/libproxy
.else
CONFIGURE_ARGS+=--without-libproxy
.endif

MAN1=	neon-config.1
MAN3=	ne_add_request_header.3 ne_addr_resolve.3 ne_buffer.3 \
	ne_buffer_append.3 ne_buffer_clear.3 ne_buffer_create.3 \
	ne_buffer_destroy.3 ne_get_error.3 ne_get_response_header.3 \
	ne_get_status.3 ne_i18n_init.3 ne_iaddr_make.3 ne_has_support.3 \
	ne_malloc.3 ne_request_create.3 ne_session_create.3 \
	ne_set_request_body_buffer.3 ne_set_request_flag.3 ne_set_session_flag.3 \
	ne_set_server_auth.3 ne_set_useragent.3 ne_shave.3 ne_sock_init.3 \
	ne_ssl_cert_cmp.3 ne_ssl_cert_identity.3 ne_ssl_cert_read.3 \
	ne_ssl_clicert_read.3 ne_ssl_readable_dname.3 ne_ssl_set_verify.3 \
	ne_ssl_trust_cert.3 ne_status.3 ne_token.3 ne_version_match.3 \
	ne_xml_create.3 neon.3
MLINKS=	ne_add_request_header.3 ne_print_request_header.3 \
	ne_addr_resolve.3 ne_addr_destroy.3 \
	ne_addr_resolve.3 ne_addr_error.3 \
	ne_addr_resolve.3 ne_addr_first.3 \
	ne_addr_resolve.3 ne_addr_next.3 \
	ne_addr_resolve.3 ne_addr_result.3 \
	ne_buffer_append.3 ne_buffer_concat.3 \
	ne_buffer_append.3 ne_buffer_zappend.3 \
	ne_buffer_clear.3 ne_buffer_altered.3 \
	ne_buffer_clear.3 ne_buffer_grow.3 \
	ne_buffer_create.3 ne_buffer_ncreate.3 \
	ne_buffer_destroy.3 ne_buffer_finish.3 \
	ne_get_error.3 ne_set_error.3 \
	ne_get_response_header.3 ne_response_header_iterate.3 \
	ne_iaddr_make.3 ne_iaddr_cmp.3 \
	ne_iaddr_make.3 ne_iaddr_free.3 \
	ne_iaddr_make.3 ne_iaddr_print.3 \
	ne_iaddr_make.3 ne_iaddr_typeof.3 \
	ne_iaddr_make.3 ne_iaddr_parse.3 \
	ne_iaddr_make.3 ne_iaddr_raw.3 \
	ne_iaddr_make.3 ne_iaddr_reverse.3 \
	ne_malloc.3 ne_calloc.3 \
	ne_malloc.3 ne_oom_callback.3 \
	ne_malloc.3 ne_realloc.3 \
	ne_malloc.3 ne_strdup.3 \
	ne_malloc.3 ne_strndup.3 \
	ne_request_create.3 ne_request_destroy.3 \
	ne_request_create.3 ne_request_dispatch.3 \
	ne_session_create.3 ne_close_connection.3 \
	ne_session_create.3 ne_session_destroy.3 \
	ne_session_create.3 ne_session_proxy.3 \
	ne_set_request_body_buffer.3 ne_set_request_body_fd.3 \
	ne_set_request_body_buffer.3 ne_set_request_body_fd64.3 \
	ne_set_session_flag.3 ne_get_session_flag.3 \
	ne_set_request_flag.3 ne_get_request_flag.3 \
	ne_set_server_auth.3 ne_forget_auth.3 \
	ne_set_server_auth.3 ne_set_proxy_auth.3 \
	ne_set_useragent.3 ne_get_scheme.3 \
	ne_set_useragent.3 ne_get_server_hostport.3 \
	ne_set_useragent.3 ne_set_persist.3 \
	ne_set_useragent.3 ne_set_read_timeout.3 \
	ne_set_useragent.3 ne_set_connect_timeout.3 \
	ne_sock_init.3 ne_sock_exit.3 \
	ne_ssl_cert_cmp.3 ne_ssl_cert_free.3 \
	ne_ssl_cert_identity.3 ne_ssl_cert_issuer.3 \
	ne_ssl_cert_identity.3 ne_ssl_cert_signedby.3 \
	ne_ssl_cert_identity.3 ne_ssl_cert_subject.3 \
	ne_ssl_cert_read.3 ne_ssl_cert_export.3 \
	ne_ssl_cert_read.3 ne_ssl_cert_import.3 \
	ne_ssl_cert_read.3 ne_ssl_cert_write.3 \
	ne_ssl_clicert_read.3 ne_ssl_clicert_decrypt.3 \
	ne_ssl_clicert_read.3 ne_ssl_clicert_encrypted.3 \
	ne_ssl_clicert_read.3 ne_ssl_clicert_free.3 \
	ne_ssl_clicert_read.3 ne_ssl_clicert_name.3 \
	ne_ssl_clicert_read.3 ne_ssl_clicert_owner.3 \
	ne_ssl_readable_dname.3 ne_ssl_dname_cmp.3 \
	ne_ssl_trust_cert.3 ne_ssl_trust_default_ca.3 \
	ne_token.3 ne_qtoken.3 \
	ne_version_match.3 ne_version_string.3 \
	ne_xml_create.3 ne_xml_destroy.3

PLIST_SUB+=	PORTVERSION=${PORTVERSION}
DOCSDIR=	${PREFIX}/share/doc/neon

post-install:
	${INSTALL_MAN} ${WRKSRC}/doc/man/*.1 ${MANPREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/man/*.3 ${MANPREFIX}/man/man3
.if ${PORT_OPTIONS:MDOCS}
	(cd ${WRKSRC} ; ${MAKE} ${FAKE_MAKEARGS} install-html)
.endif

.include <bsd.port.mk>
