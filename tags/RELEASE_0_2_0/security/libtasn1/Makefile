# New ports collection makefile for:	libtasn1
# Date created:		7 Nov 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/libtasn1/Makefile,v 1.3 2008/03/21 01:35:09 laffer1 Exp $
# $FreeBSD: ports/security/libtasn1/Makefile,v 1.32 2007/07/23 09:36:30 rafan Exp $
#

PORTNAME=	libtasn1
PORTVERSION=	1.3
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.gnutls.org/pub/gnutls/libtasn1/ \
		http://josefsson.org/gnutls/releases/libtasn1/
MASTER_SITE_SUBDIR=	alpha/gnutls/libtasn1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 structure parser library
LICENSE=	gpl2

USE_LDCONFIG=	yes
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

DOCS=		AUTHORS NEWS README THANKS doc/TODO \
		doc/libtasn1.html doc/libtasn1.pdf doc/libtasn1.ps
INFO=		libtasn1
MAN1=		asn1Parser.1 \
		asn1Coding.1 \
		asn1Decoding.1
MAN3=		\
		asn1_array2tree.3 \
		asn1_bit_der.3 \
		asn1_check_version.3 \
		asn1_copy_node.3 \
		asn1_create_element.3 \
		asn1_delete_element.3 \
		asn1_delete_structure.3 \
		asn1_der_coding.3 \
		asn1_der_decoding.3 \
		asn1_der_decoding_element.3 \
		asn1_der_decoding_startEnd.3 \
		asn1_expand_any_defined_by.3 \
		asn1_expand_octet_string.3 \
		asn1_find_node.3 \
		asn1_find_structure_from_oid.3 \
		asn1_get_bit_der.3 \
		asn1_get_length_der.3 \
		asn1_get_octet_der.3 \
		asn1_get_tag_der.3 \
		asn1_length_der.3 \
		asn1_number_of_elements.3 \
		asn1_octet_der.3 \
		asn1_parser2array.3 \
		asn1_parser2tree.3 \
		asn1_print_structure.3 \
		asn1_read_tag.3 \
		asn1_read_value.3 \
		asn1_write_value.3 \
		libtasn1_perror.3 \
		libtasn1_strerror.3

post-patch:
	@${REINPLACE_CMD} -e 's,(libdir)/pkgconfig,(prefix)/libdata/pkgconfig,' \
		${WRKSRC}/lib/Makefile.in

.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
