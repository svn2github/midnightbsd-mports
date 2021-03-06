# $MidnightBSD: mports/mail/p5-Mail-SpamAssassin/Makefile,v 1.13 2012/04/19 19:03:55 laffer1 Exp $

PORTNAME=	Mail-SpamAssassin
PORTVERSION=	3.3.2
PORTREVISION=	1
CATEGORIES=	mail perl5
MASTER_SITES=	${MASTER_SITE_APACHE:S/$/:apache/} ${MASTER_SITE_PERL_CPAN:S/$/:cpan/}
MASTER_SITE_SUBDIR=	spamassassin/source/:apache Mail/:cpan
PKGNAMEPREFIX=	p5-
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:apache,cpan

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A highly efficient mail filter for identifying spam
LICENSE=	apache2

RUN_DEPENDS=	p5-NetAddr-IP>=4.00.7:${PORTSDIR}/net-mgmt/p5-NetAddr-IP \
		p5-Net-DNS>=0.63:${PORTSDIR}/dns/p5-Net-DNS \
		p5-HTML-Parser>=3.46:${PORTSDIR}/www/p5-HTML-Parser \
		${SITE_PERL}/Bundle/LWP.pm:${PORTSDIR}/www/p5-libwww \
		${SITE_PERL}/${PERL_ARCH}/Encode/Detect.pm:${PORTSDIR}/converters/p5-Encode-Detect \
		${SITE_PERL}/Mail/Internet.pm:${PORTSDIR}/mail/p5-Mail-Tools

BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
USE_PERL5_RUN=	5.12+
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	SYSCONFDIR="${PREFIX}/etc" \
	       	CONTACT_ADDRESS="${CONTACT_ADDRESS}" \
		LOCALSTATEDIR="/var/db/spamassassin"

# You can override it if you like
CONTACT_ADDRESS?=	The administrator of that system

OPTIONS=	AS_ROOT "Run spamd as root (recommended)" on \
		SPAMC "Build spamd/spamc (not for amavisd)" on \
		SACOMPILE "sa-compile" off \
		DKIM "DKIM/DomainKeys Identified Mail" on \
		SSL "Build with SSL support for spamd/spamc" on \
		GNUPG "Install GnuPG (for sa-update)" on \
		MYSQL "Add MySQL support" off \
		PGSQL "Add PostreSQL support" off \
		RAZOR "Add Vipul's Razor support" on \
		SPF_QUERY "Add SPF query support" off \
		RELAY_COUNTRY "Relay country support" off \
		DCC "Add DCC support (see LICENSE)" off

.if !defined(WITHOUT_SSL)
USE_OPENSSL=	yes
.endif

.include <bsd.port.pre.mk>

.if defined (WITH_SPAMC)
CONFIGURE_ARGS+=	BUILD_SPAMC=yes
.else
CONFIGURE_ARGS+=	BUILD_SPAMC=no
WITH_AS_ROOT=
WITHOUT_SSL=1
.endif

.if defined(WITH_SPF_QUERY)
RUN_DEPENDS+=	${SITE_PERL}/Mail/SPF.pm:${PORTSDIR}/mail/p5-Mail-SPF
.endif
.if !defined(WITHOUT_IPV6)
RUN_DEPENDS+=	${SITE_PERL}/IO/Socket/INET6.pm:${PORTSDIR}/net/p5-IO-INET6
.endif

.if !defined(WITHOUT_SSL)
EXTENSIONS+=	openssl
RUN_DEPENDS+=	${SITE_PERL}/IO/Socket/SSL.pm:${PORTSDIR}/security/p5-IO-Socket-SSL
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
CONFIGURE_ARGS+=	ENABLE_SSL=yes
PLIST_SUB+=	SSL=""
.else
CONFIGURE_ARGS+=	ENABLE_SSL=no
PLIST_SUB+=	SSL="@comment "
.endif

.if !defined(WITHOUT_GNUPG)
RUN_DEPENDS+=	gnupg>=1.4.7:${PORTSDIR}/security/gnupg
.endif

.if defined(WITH_MYSQL)
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBD/mysql.pm:${PORTSDIR}/databases/p5-DBD-mysql
.endif

.if defined(WITH_PGSQL)
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBD/Pg.pm:${PORTSDIR}/databases/p5-DBD-Pg
.endif

.if defined(WITH_RAZOR)
RUN_DEPENDS+=	razor-agents>=2.84:${PORTSDIR}/mail/razor-agents
.else
.if   ${PERL_LEVEL} < 501000
.if !defined(WITH_DKIM)
RUN_DEPENDS+=	p5-Digest-SHA1>=2.11:${PORTSDIR}/security/p5-Digest-SHA1
.endif
.endif
.endif

.if defined(WITH_DKIM)
RUN_DEPENDS+=	${SITE_PERL}/IO/Socket/SSL.pm:${PORTSDIR}/security/p5-IO-Socket-SSL
. if ${PERL_LEVEL} < 501000
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Digest/SHA.pm:${PORTSDIR}/security/p5-Digest-SHA
. endif
RUN_DEPENDS+=	p5-Mail-DKIM>=0.37:${PORTSDIR}/mail/p5-Mail-DKIM
RUN_DEPENDS+=	p5-Crypt-OpenSSL-RSA>=0.24:${PORTSDIR}/security/p5-Crypt-OpenSSL-RSA
.endif

.if defined(WITH_SACOMPILE)
RUN_DEPENDS+=	re2c:${PORTSDIR}/devel/re2c
.endif

.if defined(WITH_RELAY_COUNTRY)
RUN_DEPENDS+=	${SITE_PERL}/IP/Country/Fast.pm:${PORTSDIR}/net/p5-IP-Country
.endif

.if defined(WITH_DCC)
RUN_DEPENDS+=	dcc-dccd>=1.3.111:${PORTSDIR}/mail/dcc-dccd
.endif

MAN3=		Mail::SpamAssassin.3 \
		Mail::SpamAssassin::AICache.3 \
		Mail::SpamAssassin::ArchiveIterator.3 \
		Mail::SpamAssassin::AsyncLoop.3 \
		Mail::SpamAssassin::AutoWhitelist.3 \
		Mail::SpamAssassin::Bayes.3 \
		Mail::SpamAssassin::BayesStore.3 \
		Mail::SpamAssassin::BayesStore::BDB.3 \
		Mail::SpamAssassin::BayesStore::MySQL.3 \
		Mail::SpamAssassin::BayesStore::PgSQL.3 \
		Mail::SpamAssassin::BayesStore::SQL.3 \
		Mail::SpamAssassin::Client.3 \
		Mail::SpamAssassin::Conf.3 \
		Mail::SpamAssassin::Conf::LDAP.3 \
		Mail::SpamAssassin::Conf::Parser.3 \
		Mail::SpamAssassin::Conf::SQL.3 \
		Mail::SpamAssassin::DnsResolver.3 \
		Mail::SpamAssassin::Logger.3 \
		Mail::SpamAssassin::Logger::File.3 \
		Mail::SpamAssassin::Logger::Stderr.3 \
		Mail::SpamAssassin::Logger::Syslog.3 \
		Mail::SpamAssassin::Message.3 \
		Mail::SpamAssassin::Message::Metadata.3 \
		Mail::SpamAssassin::Message::Node.3 \
		Mail::SpamAssassin::PerMsgLearner.3 \
		Mail::SpamAssassin::PerMsgStatus.3 \
		Mail::SpamAssassin::PersistentAddrList.3 \
		Mail::SpamAssassin::Plugin.3 \
		Mail::SpamAssassin::Plugin::ASN.3 \
		Mail::SpamAssassin::Plugin::AWL.3 \
		Mail::SpamAssassin::Plugin::AccessDB.3 \
		Mail::SpamAssassin::Plugin::AntiVirus.3 \
		Mail::SpamAssassin::Plugin::AutoLearnThreshold.3 \
		Mail::SpamAssassin::Plugin::Bayes.3 \
		Mail::SpamAssassin::Plugin::BodyRuleBaseExtractor.3 \
		Mail::SpamAssassin::Plugin::Check.3 \
		Mail::SpamAssassin::Plugin::DCC.3 \
		Mail::SpamAssassin::Plugin::DKIM.3 \
		Mail::SpamAssassin::Plugin::Hashcash.3 \
		Mail::SpamAssassin::Plugin::MIMEHeader.3 \
		Mail::SpamAssassin::Plugin::OneLineBodyRuleType.3 \
		Mail::SpamAssassin::Plugin::PhishTag.3 \
		Mail::SpamAssassin::Plugin::Pyzor.3 \
		Mail::SpamAssassin::Plugin::Razor2.3 \
		Mail::SpamAssassin::Plugin::RelayCountry.3 \
		Mail::SpamAssassin::Plugin::ReplaceTags.3 \
		Mail::SpamAssassin::Plugin::Reuse.3 \
		Mail::SpamAssassin::Plugin::Rule2XSBody.3 \
		Mail::SpamAssassin::Plugin::SPF.3 \
		Mail::SpamAssassin::Plugin::Shortcircuit.3 \
		Mail::SpamAssassin::Plugin::SpamCop.3 \
		Mail::SpamAssassin::Plugin::Test.3 \
		Mail::SpamAssassin::Plugin::TextCat.3 \
		Mail::SpamAssassin::Plugin::URIDNSBL.3 \
		Mail::SpamAssassin::Plugin::URIDetail.3 \
		Mail::SpamAssassin::Plugin::VBounce.3 \
		Mail::SpamAssassin::Plugin::WhiteListSubject.3 \
		Mail::SpamAssassin::PluginHandler.3 \
		Mail::SpamAssassin::SQLBasedAddrList.3 \
		Mail::SpamAssassin::SubProcBackChannel.3 \
		Mail::SpamAssassin::Timeout.3 \
		Mail::SpamAssassin::Util.3 \
		Mail::SpamAssassin::Util::DependencyInfo.3 \
		Mail::SpamAssassin::Util::Progress.3 \
		Mail::SpamAssassin::Util::RegistrarBoundaries.3 \
		spamassassin-run.3

MAN1=		spamd.1 spamassassin.1 spamc.1 sa-learn.1 sa-update.1 \
		spamassassin-run.1 sa-compile.1

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
DATADIR=	${PREFIX}/share/spamassassin
DOCS=		CREDITS Changes INSTALL LICENSE NOTICE PACKAGING README TRADEMARK UPGRADE USAGE procmailrc.example
DOCSSQL=	README README.awl README.bayes awl_mysql.sql awl_pg.sql bayes_mysql.sql bayes_pg.sql userpref_mysql.sql userpref_pg.sql
DOCSLDAP=	README README.testing sa_test.ldif
PORTDOCS=	${DOCS} sql ldap

USE_RC_SUBR=	sa-spamd

.if defined(WITH_MYSQL) || defined(WITH_PGSQL)
SUB_LIST+=	SQL_FLAG="-Q"
.else
SUB_LIST+=	SQL_FLAG=""
.endif
.if !defined(WITH_AS_ROOT)
SUB_LIST+=	RUN_AS_USER="-u spamd -H /var/spool/spamd"
.else
SUB_LIST+=	RUN_AS_USER=""
.endif

post-patch:
	@${FIND} ${WRKSRC} -name \*.orig -delete
	@${REINPLACE_CMD} -e 's#B_CONFDIR)/local.cf#B_CONFDIR)/local.cf.sample#g' \
		-e 's#B_CONFDIR)/init.pre#B_CONFDIR)/init.pre.sample#g' \
		-e 's#B_CONFDIR)/v310.pre#B_CONFDIR)/v310.pre.sample#g' \
		-e 's#B_CONFDIR)/v312.pre#B_CONFDIR)/v312.pre.sample#g' \
		-e 's#B_CONFDIR)/v320.pre#B_CONFDIR)/v320.pre.sample#g' \
		-e 's#B_CONFDIR)/v330.pre#B_CONFDIR)/v330.pre.sample#g' \
		-e 's/require DBI/0/' \
		${WRKSRC}/Makefile.PL
	@${REINPLACE_CMD} -e '/^CC =/d; \
		s|@SSLCFLAGS@|& $${CFLAGS}|g' ${WRKSRC}/spamc/Makefile.in

.if defined(WITH_RAZOR)
	${REINPLACE_CMD} -e '/Razor2/s/^#loadplugin/loadplugin/' ${WRKSRC}/rules/v312.pre
.endif
.if defined(WITH_RELAY_COUNTRY)
	${REINPLACE_CMD} -e '/RelayCountry/s/^# ?loadplugin/loadplugin/' ${WRKSRC}/rules/init.pre
.endif
.if !defined(WITH_DKIM)
	${REINPLACE_CMD} -e '/DKIM/s/^loadplugin/#loadplugin/' ${WRKSRC}/rules/v312.pre
.endif
.if !defined(WITH_SPF_QUERY)
	${REINPLACE_CMD} -e '/SPF/s/^loadplugin/#loadplugin/' ${WRKSRC}/rules/init.pre
.endif
.if defined(WITH_DCC)
	${REINPLACE_CMD} -e '/DCC/s/^#loadplugin/loadplugin/' ${WRKSRC}/rules/v310.pre
.endif
.if !defined(WITH_AWL)
	${REINPLACE_CMD} -e '/AWL/s/^loadplugin/#loadplugin/' ${WRKSRC}/rules/v310.pre
.endif
.if defined(WITH_SACOMPILE)
	${REINPLACE_CMD} -e '/Rule2XSBody/s/^# loadplugin/loadplugin/' ${WRKSRC}/rules/v320.pre
.endif

pre-install:
	@${MKDIR}  ${DATADIR}

post-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} spamc/libspamc.so)
.if !defined(WITHOUT_SSL)
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} spamc/libsslspamc.so)
.endif

pre-su-install:
	@${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL
	@${INSTALL_PROGRAM} ${WRKSRC}/spamc/libspamc.so ${PREFIX}/lib/libspamc.so.0
	@${LN} -sf libspamc.so.0 ${PREFIX}/lib/libspamc.so
.if !defined(WITHOUT_SSL)
	@${INSTALL_PROGRAM} ${WRKSRC}/spamc/libsslspamc.so ${PREFIX}/lib/libsslspamc.so.0
	@${LN} -sf libsslspamc.so.0 ${PREFIX}/lib/libsslspamc.so
.endif
	@${INSTALL_DATA} ${WRKSRC}/spamc/libspamc.h ${PREFIX}/include

post-install:
.if defined (WITH_SPAMC)
	@${STRIP_CMD} ${PREFIX}/bin/spamc
.endif
	@[ -f ${PREFIX}/etc/mail/spamassassin/init.pre ] || \
		${CP} ${PREFIX}/etc/mail/spamassassin/init.pre.sample \
			${PREFIX}/etc/mail/spamassassin/init.pre
	@[ -f ${PREFIX}/etc/mail/spamassassin/v310.pre ] || \
		${CP} ${PREFIX}/etc/mail/spamassassin/v310.pre.sample \
			${PREFIX}/etc/mail/spamassassin/v310.pre
	@[ -f ${PREFIX}/etc/mail/spamassassin/v312.pre ] || \
		${CP} ${PREFIX}/etc/mail/spamassassin/v312.pre.sample \
			${PREFIX}/etc/mail/spamassassin/v312.pre
	@[ -f ${PREFIX}/etc/mail/spamassassin/v320.pre ] || \
		${CP} ${PREFIX}/etc/mail/spamassassin/v320.pre.sample \
			${PREFIX}/etc/mail/spamassassin/v320.pre
	@PKG_PREFIX=${PREFIX} BATCH=${BATCH} SU_CMD="${SU_CMD}" ${SH} ${PKGDIR}/pkg-install ${PKGNAME} POST-INSTALL
	@[ -f ${PREFIX}/etc/mail/spamassassin/v330.pre ] || \
		${CP} ${PREFIX}/etc/mail/spamassassin/v330.pre.sample \
			${PREFIX}/etc/mail/spamassassin/v330.pre

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR} ${DOCSDIR}/sql ${DOCSDIR}/ldap
	@${INSTALL_DATA} ${DOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${INSTALL_DATA} ${DOCSSQL:S|^|${WRKSRC}/sql/|} ${DOCSDIR}/sql
	@${INSTALL_DATA} ${DOCSLDAP:S|^|${WRKSRC}/ldap/|} ${DOCSDIR}/ldap

.endif
	@${SED} -e 's#PREFIX#${PREFIX}#' ${PKGMESSAGE}

.include <bsd.port.post.mk>
