# $MidnightBSD: mports/devel/bugzilla3/Makefile,v 1.13 2013/03/02 21:53:54 laffer1 Exp $

PORTNAME=	bugzilla
PORTVERSION=	3.6.13
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_MOZILLA}
MASTER_SITE_SUBDIR=	webtools webtools/archived
PKGNAMESUFFIX=	-3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Bug-tracking system developed by Mozilla Project
LICENSE=	mpl

FAKE_MAKEARGS+=	BUGZILLADIR=${FAKE_DESTDIR}/${BUGZILLADIR}

OPTIONS=	MYSQL "MySQL database support" off \
		PGSQL "PostgreSQL database support" off \
		GRAPH_REPORTS "Graphical Reports" on \
		CHARTING_MODULES "Bug charting support" on \
		PATCH_VIEWER "Patch Viewer" on \
		MORE_HTML "More HTML in Product/Group Descriptions" on \
		INBOUND_EMAIL "Inbound Email" off \
		MAIL_QUEUEING "Mail Queueing" off \
		MOVE_BUGZ "Move Bugs Between Installations" off \
		BMP2PNG "BMP Attachments to PNGs" off \
		XMLRPC "XML-RPC Interface" off \
		JSONRPC "JSON-RPC Interface" off \
		MODPERL2 "With mod_perl2 support" off \
		GRAPHVIZ "Use GraphViz" off \
		EXPORT_IMPORT "Import/export bugs (via XML)" off \
		CONTRIB	"Install user-contributed scripts" off \
		LDAP "LDAP Authentication" off \
		RADIUS "RADIUS Authentication" off

RUN_DEPENDS+=	\
		${SITE_PERL}/Date/Parse.pm:${PORTSDIR}/devel/p5-TimeDate \
		p5-DBI>=1.41:${PORTSDIR}/databases/p5-DBI \
		p5-Template-Toolkit>=2.22:${PORTSDIR}/www/p5-Template-Toolkit \
		p5-DateTime>=0.28:${PORTSDIR}/devel/p5-DateTime \
		p5-DateTime-TimeZone>=0.71:${PORTSDIR}/devel/p5-DateTime-TimeZone \
		p5-Digest-SHA>=0:${PORTSDIR}/security/p5-Digest-SHA \
		p5-URI>=0:${PORTSDIR}/net/p5-URI \
		p5-Email-Send>=2.00:${PORTSDIR}/mail/p5-Email-Send \
		p5-Email-MIME>=1.861:${PORTSDIR}/mail/p5-Email-MIME

CONFLICTS=	bugzilla-2.[0-9]*

PORTSCOUT=	limitw:1,even

USE_PERL5=	yes

BINMODE=	700
PKGMESSAGE=	${WRKDIR}/pkg-message

.ifndef BUGZILLADIR
.ifdef APACHE_DATADIR
BUGZILLADIR=	${APACHE_DATADIR}/data/bugzilla
.else
BUGZILLADIR=	${PREFIX}/www/data/bugzilla
.endif
.endif

SUB_FILES=	pkg-message
SUB_LIST=	BUGZILLADIR=${BUGZILLADIR}
PLIST_SUB+=	BUGZILLADIR=${BUGZILLADIR:S!^${PREFIX}/!!}

DATA_DIRS_LIST=	images js skins

NO_BUILD=

.include <bsd.port.pre.mk>

.ifdef WITH_MYSQL
RUN_DEPENDS+=	p5-DBD-mysql>=2.9003:${PORTSDIR}/databases/p5-DBD-mysql
USE_MYSQL=	yes
IGNORE_WITH_MYSQL=	323
.endif

.ifdef WITH_PGSQL
RUN_DEPENDS+=	p5-DBD-Pg>=1.45:${PORTSDIR}/databases/p5-DBD-Pg
USE_PGSQL=	yes
.endif

.ifdef WITH_GRAPH_REPORTS
RUN_DEPENDS+=	p5-GD>=1.20:${PORTSDIR}/graphics/p5-GD \
		${SITE_PERL}/GD/Graph.pm:${PORTSDIR}/graphics/p5-GD-Graph \
		${SITE_PERL}/GD/Text.pm:${PORTSDIR}/graphics/p5-GD-TextUtil \
		${SITE_PERL}/Template/Plugin/GD/Image.pm:${PORTSDIR}/www/p5-Template-GD
.endif

.ifdef WITH_CHARTING_MODULES
RUN_DEPENDS+=	p5-Chart>=2.1:${PORTSDIR}/graphics/p5-chart
.endif

.ifdef WITH_PATCH_VIEWER
RUN_DEPENDS+=	p5-PatchReader>=0.9.4:${PORTSDIR}/devel/p5-PatchReader \
		interdiff:${PORTSDIR}/misc/patchutils
.endif

.ifdef WITH_MORE_HTML
RUN_DEPENDS+=	p5-HTML-Parser>=3.40:${PORTSDIR}/www/p5-HTML-Parser \
		${SITE_PERL}/HTML/Scrubber.pm:${PORTSDIR}/www/p5-HTML-Scrubber
.endif

.ifdef WITH_INBOUND_EMAIL
RUN_DEPENDS+=	${SITE_PERL}/Email/MIME/Attachment/Stripper.pm:${PORTSDIR}/mail/p5-Email-MIME-Attachment-Stripper \
		${SITE_PERL}/Email/Reply.pm:${PORTSDIR}/mail/p5-Email-Reply
.endif

.ifdef WITH_MAIL_QUEUEING
RUN_DEPENDS+=	p5-TheSchwartz>=0:${PORTSDIR}/devel/p5-TheSchwartz \
		p5-Daemon-Generic>=0:${PORTSDIR}/net/p5-Daemon-Generic
.endif

.ifdef WITH_MOVE_BUGZ
RUN_DEPENDS+=	${SITE_PERL}/MIME/Parser.pm:${PORTSDIR}/mail/p5-MIME-Tools \
		${SITE_PERL}/XML/Twig.pm:${PORTSDIR}/textproc/p5-XML-Twig
.endif

.ifdef WITH_BMP2PNG
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Image/Magick.pm:${PORTSDIR}/graphics/ImageMagick
.endif

.if defined(WITH_XMLRPC) || defined(WITH_JSONRPC)
RUN_DEPENDS+=	p5-Test-Taint>=0:${PORTSDIR}/devel/p5-Test-Taint
.endif

.ifdef WITH_XMLRPC
RUN_DEPENDS+=	${SITE_PERL}/SOAP/Lite.pm:${PORTSDIR}/net/p5-SOAP-Lite
.endif

.ifdef WITH_JSONRPC
RUN_DEPENDS+=	p5-JSON-RPC>=0:${PORTSDIR}/devel/p5-JSON-RPC
.endif

.ifdef WITH_MODPERL2
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/mod_perl2.pm:${PORTSDIR}/www/mod_perl2 \
		${SITE_PERL}/Apache/DBI.pm:${PORTSDIR}/www/p5-Apache-DBI
.endif

.ifdef WITH_GRAPHVIZ
RUN_DEPENDS+=	dot:${PORTSDIR}/graphics/graphviz
.endif

.ifdef WITH_EXPORT_IMPORT
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/XML/Parser.pm:${PORTSDIR}/textproc/p5-XML-Parser \
		${SITE_PERL}/XML/Twig.pm:${PORTSDIR}/textproc/p5-XML-Twig
.endif

.ifdef WITH_CONTRIB
PLIST_SUB+=	CONTRIB=""
.else
PLIST_SUB+=	CONTRIB="@comment "
.endif

.ifdef WITH_LDAP
RUN_DEPENDS+=	${SITE_PERL}/Net/LDAP.pm:${PORTSDIR}/net/p5-perl-ldap
.endif

.ifdef WITH_RADIUS
RUN_DEPENDS+=	p5-Authen-Radius>=0:${PORTSDIR}/security/p5-Authen-Radius
.endif

post-patch:
	@${PERL} -pi -e 's/(default => ON_WINDOWS.+)apache/$$1www/' \
		${WRKSRC}/Bugzilla/Install/Localconfig.pm
.if defined(WITH_PGSQL) && !defined(WITH_MYSQL)
	@${PERL} -pi -e 's/(default =>.+|Default is )mysql/$$1Pg/' \
		${WRKSRC}/Bugzilla/Install/Localconfig.pm
.endif
	@${FIND} ${WRKSRC} \( -name "CVS" -or -name ".cvsignore" -or -name "*.orig" \
		-or -name ".bzr*" -or -name "README.docs" \) | ${XARGS} ${RM} -rf
	${FIND} ${WRKSRC} -type f -exec ${REINPLACE_CMD} -i '' \
		-e 's!/usr/lib/sendmail!/usr/sbin/sendmail!g; s=/usr/bin/perl=${PERL}=g' {} \+
	@${FIND} ${WRKSRC}/docs -type f | \
		${XARGS} ${REINPLACE_CMD} -i '' -e "s!/var/www/html/bugzilla!${BUGZILLADIR}!"

do-install:
	${MKDIR} ${BUGZILLADIR}
	${FIND} ${WRKSRC} \! -type d -maxdepth 1 \! -name "UPGRADING*" -exec \
		${INSTALL_SCRIPT} {} ${BUGZILLADIR} \;
	@${MKDIR} ${DATA_DIRS_LIST:S!^!${BUGZILLADIR}/!}
.for D in ${DATA_DIRS_LIST}
	(cd ${WRKSRC}/${D} && ${COPYTREE_SHARE} . ${BUGZILLADIR}/${D})
.endfor
	${TAR} -C ${WRKSRC} -cf - Bugzilla template | ${TAR} --unlink -C ${BUGZILLADIR} -xf -
.ifndef NOPORTDOCS
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${DOCSDIR}/)
.endif
.ifdef WITH_CONTRIB
	${MKDIR} ${BUGZILLADIR}/contrib
	@cd ${WRKSRC}/contrib && \
		${FIND} . -type d -exec ${MKDIR} "${BUGZILLADIR}/contrib/{}" \; && \
		${FIND} . -type f -exec ${INSTALL_DATA} "{}" "${BUGZILLADIR}/contrib/{}" \;
.endif

.include <bsd.port.post.mk>
