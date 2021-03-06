# New ports collection makefile for:	ucd-snmp
# Date created:				26 June 1996
# Whom:					gpalmer
#
# $FreeBSD: ports/net-mgmt/net-snmp4/Makefile,v 1.103 2006/09/10 23:47:36 kris Exp $
# $MidnightBSD: mports/net-mgmt/net-snmp4/Makefile,v 1.1 2007/01/25 22:28:37 laffer1 Exp $
#

BROKEN=	build fails.

PORTNAME=	ucd-snmp
PORTVERSION=	4.2.6
PORTREVISION=	5
CATEGORIES=	net-mgmt ipv6
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	net-snmp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An extendable SNMP implementation
LICENSE=	bsd3

OPTIONS=	SSL "Enable OpenSSL support" On

GNU_CONFIGURE=	yes
USE_PERL5=	yes
USE_LDCONFIG=	yes
CFLAGS+=	-fPIC

CONFIGURE_ARGS+=	--enable-shared \
			--with-mib-modules="host ucd-snmp/diskio" \
		 	--with-gnu-ld --with-libwrap --with-libs="-ldevstat"
.if defined(BATCH)
CONFIGURE_ARGS+=	--with-defaults --with-sys-contact=nobody@no.where
.else
IS_INTERACTIVE=	yes
.endif

MAN1=		snmpbulkget.1 snmpbulkwalk.1 snmpcmd.1 snmpconf.1 snmpd.1 \
		snmpdelta.1 snmpdf.1 snmpget.1 snmpgetnext.1 snmpinform.1 \
		snmpnetstat.1 snmpset.1 snmpstatus.1 snmptable.1 snmptest.1 \
		snmptranslate.1 snmptrap.1 snmpusm.1 snmpwalk.1
MAN3=		add_mibdir.3 add_module_replacement.3 default_store.3 \
		get_module_node.3 init_mib.3 init_mib_internals.3 mib_api.3 \
		print_description.3 print_mib.3 print_objid.3 print_value.3 \
		print_variable.3 read_all_mibs.3 read_config.3 read_mib.3 \
		read_module.3 read_module_node.3 read_objid.3 shutdown_mib.3 \
		snmp_agent_api.3 snmp_alarm.3 snmp_api.3 \
		snmp_api_errstring.3 snmp_close.3 \
		snmp_error.3 snmp_free_pdu.3 snmp_open.3 snmp_perror.3 \
		snmp_read.3 snmp_select_info.3 \
		snmp_send.3 snmp_sess_api.3 snmp_sess_async_send.3 \
		snmp_sess_close.3 snmp_sess_error.3 snmp_sess_init.3 \
		snmp_sess_open.3 snmp_sess_perror.3 \
		snmp_sess_read.3 snmp_sess_select_info.3 \
		snmp_sess_send.3 snmp_sess_session.3 snmp_sess_timeout.3 \
		snmp_set_mib_warnings.3 snmp_set_save_descriptions.3 \
		snmp_timeout.3 snmp_trap_api.3
MAN5=		snmp.conf.5 snmp_config.5 snmpd.conf.5 \
		snmptrapd.conf.5 variables.5
MAN8=		snmptrapd.8
BIN=		snmpbulkwalk snmpget snmpgetnext snmpnetstat snmpset \
		snmpstatus snmptest snmptranslate snmptrap snmpwalk
SBIN=		snmpd snmptrapd

STARTUP_FILE=	${PREFIX}/etc/rc.d/snmpd.sh

CONFLICTS=	net-snmp-5.*

.include <bsd.port.pre.mk>

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS+=	--without-openssl
.else
USE_OPENSSL=	YES
CONFIGURE_ARGS+=	--with-openssl=/usr
CFLAGS+=	-DOPENSSL_DES_LIBDES_COMPATIBILITY
.endif

SHLIB_VERSION=	4
PLIST_SUB+=	shlib=${SHLIB_VERSION}

CONFIGURE_ARGS+=	--enable-ipv6

post-patch:
	@${REINPLACE_CMD} \
		-e 's|%%LTCONFIG%%|${LTCONFIG}|g' \
		-e 's|%%LTMAIN%%|${LTMAIN}|g' \
		${WRKSRC}/aclocal.m4

post-install:
	@( cd ${PREFIX}/bin && ${STRIP_CMD} ${BIN} )
	@( cd ${PREFIX}/sbin && ${STRIP_CMD} ${SBIN} )
	@${FIND} ${PREFIX}/include/ucd-snmp ${PREFIX}/share/snmp/mibs -type f \
		| ${XARGS} ${CHMOD} 644
	@${MKDIR} ${PREFIX}/share/examples/ucd-snmp
	@for F in ${WRKSRC}/EXAMPLE.conf  ${WRKSRC}/agent/mibgroup/examples/ucdDemoPublic.conf; do \
		${INSTALL_DATA} $$F ${PREFIX}/share/examples/ucd-snmp ; done
	@if [ ! -f ${STARTUP_FILE} ]; then \
		${ECHO} "Creating ${PREFIX}/etc/rc.d/snmpd.sh startup file."; \
		${INSTALL_SCRIPT} -m 751 ${FILESDIR}/snmpd.sh.sample ${STARTUP_FILE}; \
	 fi

.include <bsd.port.post.mk>
