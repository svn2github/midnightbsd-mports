# New ports collection makefile for:	pcre
# Date created:				08 July 1998
# Whom:					dom
#
# $MidnightBSD: mports/devel/pcre/Makefile,v 1.1 2006/09/17 22:56:58 archite Exp $
# $FreeBSD: ports/devel/pcre/Makefile,v 1.37 2006/07/07 07:58:19 krion Exp $
#

PORTNAME=	pcre
PORTVERSION=	6.7
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/%SUBDIR%/ \
		ftp://ftp.fu-berlin.de/unix/misc/%SUBDIR%/ \
		ftp://ftp.tin.org/pub/libs/%SUBDIR%/
MASTER_SITE_SUBDIR=${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl Compatible Regular Expressions library

CONFLICTS?=	pcre-utf8-[0-9]*

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

.if defined(WITH_UTF8)
CONFIGURE_ARGS+=--enable-utf8 \
		--enable-unicode-properties
.endif

.if defined(WITH_LINK_SIZE)
CONFIGURE_ARGS+=--with-link-size=${WITH_LINK_SIZE}
.endif

CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}

MAN1=		pcregrep.1 pcretest.1
MAN3=		pcre.3 pcre_compile.3 pcre_compile2.3 pcre_config.3 \
		pcre_copy_named_substring.3 pcre_copy_substring.3 \
		pcre_dfa_exec.3 pcre_exec.3 pcre_free_substring.3 \
		pcre_free_substring_list.3 pcre_fullinfo.3 \
		pcre_get_named_substring.3 pcre_get_stringnumber.3 \
		pcre_get_stringtable_entries.3 pcre_get_substring.3 \
		pcre_get_substring_list.3 pcre_info.3 \
		pcre_maketables.3 pcrepartial.3 pcreprecompile.3 pcre_refcount.3 \
		pcre_study.3 pcre_version.3 pcreapi.3 \
		pcrebuild.3 pcrecallout.3 pcrecompat.3 \
		pcrecpp.3 pcrematching.3 pcrepattern.3 \
		pcreperform.3 pcreposix.3 pcresample.3 pcrestack.3

post-install:
	@${STRIP_CMD} ${DESTDIR}${PREFIX}/bin/pcregrep ${DESTDIR}${PREFIX}/bin/pcretest
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DESTDIR}${DOCSDIR} ${DESTDIR}${DOCSDIR}/html
	@cd ${WRKSRC}; ${INSTALL_DATA} ChangeLog NEWS LICENCE doc/Tech.Notes doc/*.txt ${DESTDIR}${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/html/*.html ${DESTDIR}${DOCSDIR}/html
.endif

.include <bsd.port.mk>
