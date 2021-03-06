# New ports collection makefile for:	bind
# Date created:				6 October 2000
# Whom:					will
#
# $MidnightBSD: mports/dns/bind9/Makefile,v 1.7 2008/06/07 15:28:41 laffer1 Exp $
# $FreeBSD: ports/dns/bind9/Makefile,v 1.71 2006/09/06 18:42:40 dougb Exp $
#

PORTNAME=	bind9
PORTVERSION=	9.3.5.1
CATEGORIES=	dns net ipv6
MASTER_SITES=	${MASTER_SITE_ISC} \
		http://dougbarton.us/Downloads/%SUBDIR%/
MASTER_SITE_SUBDIR=	bind9/${ISCVERSION}
DISTNAME=	bind-${ISCVERSION}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${DISTNAME}${EXTRACT_SUFX}.asc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Completely new version of the BIND DNS suite with updated DNSSEC

# ISC releases things like 9.3.0rc1, which our versioning doesn't like
ISCVERSION=	9.3.5-P1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=/var --disable-linux-caps \
		--with-randomdev=/dev/random

USE_OPENSSL=	yes

CONFLICTS=	bind9-9.4.* bind9-9.5.* bind9-dlz-[0-9]* bind9-sdb-mysql-[0-9]* host-[0-9]*

OPTIONS=	REPLACE_BASE "Replace base BIND with this version" off \
		THREADS	"Compile with thread support (NOT RECOMMENDED!)" off

.include <bsd.port.pre.mk>

.if defined(WITH_OPENSSL_PORT)
CONFIGURE_ARGS+=	--with-openssl=${LOCALBASE}
.else
CONFIGURE_ARGS+=	--with-openssl
.endif

# ISC staff has informed me that for 9.3.x, threads are always a bad idea.
# Leave the affirmative option for those that want to experiment.
.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if defined(WITH_REPLACE_BASE)
PKGNAMESUFFIX=	-base
PREFIX=		/usr
BIND_DESTETC=	/etc/namedb
CONFIGURE_ARGS+=	--prefix=${PREFIX} \
			--sysconfdir=${BIND_DESTETC} \
			--mandir=${MANPREFIX}/man
.else
BIND_DESTETC=	${PREFIX}/etc
.endif

PLIST_SUB=	BIND_DESTETC="${BIND_DESTETC}"

MAN1=	dig.1 host.1 nslookup.1
MAN3=	lwres.3 lwres_addr_parse.3 lwres_buffer.3 lwres_buffer_add.3 \
	lwres_buffer_back.3 lwres_buffer_clear.3 lwres_buffer_first.3 \
	lwres_buffer_forward.3 lwres_buffer_getmem.3 lwres_buffer_getuint16.3 \
	lwres_buffer_getuint32.3 lwres_buffer_getuint8.3 lwres_buffer_init.3 \
	lwres_buffer_invalidate.3 lwres_buffer_putmem.3 \
	lwres_buffer_putuint16.3 lwres_buffer_putuint32.3 \
	lwres_buffer_putuint8.3 lwres_buffer_subtract.3 lwres_conf_clear.3 \
	lwres_conf_get.3 lwres_conf_init.3 lwres_conf_parse.3 \
	lwres_conf_print.3 lwres_config.3 lwres_context.3 \
	lwres_context_allocmem.3 lwres_context_create.3 \
	lwres_context_destroy.3 lwres_context_freemem.3 \
	lwres_context_initserial.3 lwres_context_nextserial.3 \
	lwres_context_sendrecv.3 lwres_endhostent.3 lwres_endhostent_r.3 \
	lwres_freeaddrinfo.3 lwres_freehostent.3 lwres_gabn.3 \
	lwres_gabnrequest_free.3 lwres_gabnrequest_parse.3 \
	lwres_gabnrequest_render.3 lwres_gabnresponse_free.3 \
	lwres_gabnresponse_parse.3 lwres_gabnresponse_render.3 \
	lwres_gai_strerror.3 lwres_getaddrinfo.3 lwres_getaddrsbyname.3 \
	lwres_gethostbyaddr.3 lwres_gethostbyaddr_r.3 lwres_gethostbyname.3 \
	lwres_gethostbyname2.3 lwres_gethostbyname_r.3 lwres_gethostent.3 \
	lwres_gethostent_r.3 lwres_getipnode.3 lwres_getipnodebyaddr.3 \
	lwres_getipnodebyname.3 lwres_getnamebyaddr.3 lwres_getnameinfo.3 \
	lwres_getrrsetbyname.3 lwres_gnba.3 lwres_gnbarequest_free.3 \
	lwres_gnbarequest_parse.3 lwres_gnbarequest_render.3 \
	lwres_gnbaresponse_free.3 lwres_gnbaresponse_parse.3 \
	lwres_gnbaresponse_render.3 lwres_herror.3 lwres_hstrerror.3 \
	lwres_inetntop.3 lwres_lwpacket_parseheader.3 \
	lwres_lwpacket_renderheader.3 lwres_net_ntop.3 lwres_noop.3 \
	lwres_nooprequest_free.3 lwres_nooprequest_parse.3 \
	lwres_nooprequest_render.3 lwres_noopresponse_free.3 \
	lwres_noopresponse_parse.3 lwres_noopresponse_render.3 \
	lwres_packet.3 lwres_resutil.3 lwres_sethostent.3 \
	lwres_sethostent_r.3 lwres_string_parse.3
MAN5=	named.conf.5 rndc.conf.5
MAN8=	dnssec-keygen.8 dnssec-signzone.8 lwresd.8 named-checkconf.8 \
	named-checkzone.8 named.8 nsupdate.8 rndc-confgen.8 rndc.8

verify:	checksum
	gpg --verify ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}.asc

post-patch:
.for FILE in check/named-checkconf.8 named/named.8 nsupdate/nsupdate.8 \
	rndc/rndc.8
	@${MV} ${WRKSRC}/bin/${FILE} ${WRKSRC}/bin/${FILE}.Dist
	@${SED} -e 's#/etc/named.conf#${BIND_DESTETC}/named.conf#g' \
		-e 's#/etc/rndc.conf#${BIND_DESTETC}/rndc.conf#g' \
		${WRKSRC}/bin/${FILE}.Dist > ${WRKSRC}/bin/${FILE}
.endfor

	@${MV} ${WRKSRC}/bin/nsupdate/nsupdate.8 \
	    ${WRKSRC}/bin/nsupdate/nsupdate.8.patched
	@${SED} -e "s@^\.HP [0-9]* @@" \
	    ${WRKSRC}/bin/nsupdate/nsupdate.8.patched \
	    > ${WRKSRC}/bin/nsupdate/nsupdate.8
	@${MV} ${WRKSRC}/bin/dig/nslookup.1 ${WRKSRC}/bin/dig/nslookup.1.Dist
	@${SED} -e "s@^host \[server\]@\\\fBhost\\\fR \\\fI[server]\\\fR@" \
	    ${WRKSRC}/bin/dig/nslookup.1.Dist > ${WRKSRC}/bin/dig/nslookup.1

post-install:
	${INSTALL_DATA} ${WRKSRC}/bin/rndc/rndc.conf \
		${BIND_DESTETC}/rndc.conf.sample
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/arm ${DOCSDIR}/misc
	${INSTALL_DATA} ${WRKSRC}/doc/arm/Bv9ARM*html ${DOCSDIR}/arm
	${INSTALL_DATA} ${WRKSRC}/doc/misc/[a-z]* ${DOCSDIR}/misc
	${CP} ${WRKSRC}/CHANGES ${WRKSRC}/COPYRIGHT ${WRKSRC}/FAQ \
		${WRKSRC}/README ${DOCSDIR}/
.endif

.include <bsd.port.post.mk>
