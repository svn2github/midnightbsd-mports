# New ports collection makefile for:	portupgrade
# Date created:		18 March 2001
# Whom:			Akinori MUSHA aka knu <knu@idaemons.org>
#
# $MidnightBSD: mports/ports-mgmt/portupgrade/Makefile,v 1.1 2007/02/16 22:22:30 laffer1 Exp $
# $FreeBSD: ports/sysutils/portupgrade/Makefile,v 1.232 2006/08/25 12:46:50 sem Exp $
#
# find ./ -type f -print

PORTNAME=	portupgrade
PORTVERSION=	2.1.3.3
PORTREVISION=	2
PORTEPOCH=	2
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		http://sunner.elcomnet.ru/~sem/
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	pkgtools-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD ports/packages administration and management tool suite

##OPTIONS=	BDB4 "Use Berkeley DB >=2 as backend" on \
##		BDB1 "Use Berkeley DB 1.85 as backend" off

CONFLICTS=	portupgrade-devel-*

USE_BZIP2=	yes
USE_RUBY=	yes
USE_RUBY_FEATURES=	optparse ruby18
USE_PERL5_RUN=	yes

LDCONFIG_DIRS=	%%PREFIX%%/lib/compat/pkg
USE_LDCONFIG=	${PREFIX}/lib/compat/pkg

MAKE_ARGS=	PREFIX="${PREFIX}" RUBY="${RUBY}"

MAN1=		pkg_deinstall.1 \
		pkg_fetch.1 \
		pkg_glob.1 \
		pkg_sort.1 \
		pkgdb.1 \
		portcvsweb.1 \
		portsclean.1 \
		portsdb.1 \
		portupgrade.1 \
		portversion.1
MAN5=		pkgtools.conf.5
MLINKS=		pkgdb.1 pkg_which.1 \
		portupgrade.1 portinstall.1 \
		portsdb.1 ports_glob.1
MANCOMPRESSED=	maybe

INSTALL_TARGET=		install
.if !defined(NOPORTDOCS)
INSTALL_TARGET+=	install-doc
.endif

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

##.if defined(WITH_BDB4)
### For PKG_DBDRIVER={bdb_btree,bdb_hash}
RUN_DEPENDS+=	${RUBY_SITEARCHLIBDIR}/bdb.so:${PORTSDIR}/databases/ruby-bdb
##.endif
##.if defined(WITH_BDB1) && !defined(WITH_BDB4)
### For PKG_DBDRIVER={bdb1_btree,bdb1_hash}
##RUN_DEPENDS+=	${RUBY_SITEARCHLIBDIR}/bdb1.so:${PORTSDIR}/databases/ruby-bdb1
##.endif

#pre-extract:
#.if !defined(WITH_BDB4) && !defined(WITH_BDB1)
#	@${ECHO_MSG} "================================================================="
#	@${ECHO_MSG} "Neither WITH_BDB4 nor WITH_BDB1 are defined. Will use DBD driver."
#	@${ECHO_MSG} "================================================================="
#.endif
#.if defined(WITH_BDB4) && defined(WITH_BDB1)
#	@${ECHO_MSG} "================================================================="
#	@${ECHO_MSG} "Both WITH_BDB4 and WITH_BDB1 are defined. Will use BDB4 driver."
#	@${ECHO_MSG} "================================================================="
#.elif defined(WITH_BDB1) && exists(${RUBY_SITEARCHLIBDIR}/bdb.so)
#	@${ECHO_MSG} "================================================================="
#	@${ECHO_MSG} "WITH_BDB1 is defined but ruby-bdb port installed."
#	@${ECHO_MSG} "Remove ruby-bdb or redefine options."
#	@${ECHO_MSG} "================================================================="
#	@exit 1
#.endif

post-patch:
.for i in bin/pkg_fetch bin/pkg_fetch.1 bin/pkgdb bin/pkgdb.1 bin/portsclean bin/portsdb bin/portsdb.1 bin/portupgrade bin/portupgrade.1 bin/portversion bin/portversion.1 etc/pkgtools.conf Makefile lib/portsdb.rb misc/bash/complete.sample misc/zsh/_pkgtools tests/test_portinfo.rb tests/test_portsdb.rb
	@cd ${WRKSRC}; \
	${SED} 's/\/usr\/ports/\/usr\/mports/' < $i > convert.txt; \
	${MV} convert.txt $i
.endfor

post-install: install-ldconfig-file
	if [ ! -f ${PREFIX}/etc/pkgtools.conf ]; then \
		${CP} -p ${PREFIX}/etc/pkgtools.conf.sample ${PREFIX}/etc/pkgtools.conf; \
	fi

.include <bsd.port.post.mk>
