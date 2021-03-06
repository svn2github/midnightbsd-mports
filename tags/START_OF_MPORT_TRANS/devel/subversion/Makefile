# New ports collection makefile for:	subversion
# Date created:				10 September 2001
# Whom:					rooneg@electricjellyfish.net
#
# $MidnightBSD: mports/devel/subversion/Makefile,v 1.1 2006/11/04 15:16:57 wintellect Exp $
# $FreeBSD: ports/devel/subversion/Makefile,v 1.106 2006/09/13 10:20:27 lev Exp $

PORTNAME=	subversion
PORTVERSION=	1.4.2
PORTREVISION?=	1
CATEGORIES=	devel
MASTER_SITES=	http://subversion.tigris.org/downloads/:main \
		http://svnbook.red-bean.com/en/1.2/:bookhtml \
		http://svnbook.red-bean.com/en/1.2/images/:bookhtmlimg \
		http://svnbook.red-bean.com/en/1.2/:bookpdf
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}:main
DIST_SUBDIR=	subversion
EXTRACT_ONLY=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Version control system

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

INSTALLS_SHLIB=	yes

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool:15
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=		--with-ssl

USE_RC_SUBR=	svnserve.sh

MAN1=		svn.1 svnadmin.1 svnlook.1 svndumpfilter.1 svnsync.1 svnversion.1
MAN5=		svnserve.conf.5
MAN8=		svnserve.8
MANCOMPRESSED=	no

TXT_DOCS=	BUGS CHANGES COMMITTERS COPYING HACKING INSTALL README
.if !defined(NOPORTDOCS)
PORTDOCS=	${TXT_DOCS}
.endif

.if defined(WITH_ASVN)
RUN_DEPENDS= ${LOCALBASE}/bin/gfind:${PORTSDIR}/misc/findutils:install
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
PLIST_SUB+=		WITHOUT_GETTEXT=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		WITHOUT_GETTEXT="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
CFLAGS+=	-fpic -DPIC
.endif

SVNREPOS?=	/home/svn/repos
SVNFSTYPE?=	fsfs

.if make(repository)
WITH_REPOSITORY_CREATION=	yes
.endif

.if defined(WITH_REPOSITORY_CREATION)
MKREPOS_TARGET=	_mkrepos
.endif

.if defined(WITH_MAINTAINER_DEBUG)
CONFIGURE_ARGS+=--enable-maintainer-mode \
		--enable-debug
CFLAGS+=	-g
.endif

.if !defined(WITHOUT_NEON)
LIB_DEPENDS+=	neon.25:${PORTSDIR}/www/neon
CONFIGURE_ARGS+=	--with-neon=${LOCALBASE}
PLIST_SUB+=		WITHOUT_NEON=""
.else
CONFIGURE_ARGS+=	--without-neon
PLIST_SUB+=		WITHOUT_NEON="@comment "
.endif

.if defined(WITHOUT_BDB)
CONFIGURE_ARGS+=	--without-berkeley-db
PLIST_SUB+=		WITHOUT_BDB="@comment "
.else
PLIST_SUB+=		WITHOUT_BDB=""
.endif

.if defined(WITH_PERL)
SWIG_BINDINGS+=		yes
USE_PERL5=		yes
PLIST_SUB+=		WITH_PERL=""
MAN3PREFIX=		${TARGETDIR}/lib/perl5/${PERL_VERSION}
MAN3=			SVN::Base.3 \
			SVN::Client.3 \
			SVN::Core.3 \
			SVN::Delta.3 \
			SVN::Fs.3 \
			SVN::Ra.3 \
			SVN::Repos.3 \
			SVN::Wc.3
.else
PLIST_SUB+=		WITH_PERL="@comment "
.endif

.if defined(WITH_PYTHON)
USE_PYTHON=		yes
.include "${PORTSDIR}/Mk/bsd.python.mk"
SWIG_BINDINGS+=		yes
PLIST_SUB+=		WITH_PYTHON=""
.else
PLIST_SUB+=		WITH_PYTHON="@comment "
.endif

.if defined(WITH_RUBY)
USE_RUBY=		yes
.include "${PORTSDIR}/Mk/bsd.ruby.mk"
SWIG_BINDINGS+=		yes
PLIST_SUB+=		WITH_RUBY=""
.else
PLIST_SUB+=		WITH_RUBY="@comment "
.endif

.if defined(WITH_JAVA)
CATEGORIES+=	java
USE_JAVA=	yes
JAVA_VERSION=	1.2+
JAVA_OS=	native
JAVA_BUILD=	yes
JAVA_RUN=	yes
.include "${PORTSDIR}/Mk/bsd.java.mk"
CONFIGURE_ARGS+=	--enable-javahl --with-jdk=${JAVA_HOME}
PLIST_SUB+=		WITH_JAVA=""
.else
PLIST_SUB+=		WITH_JAVA="@comment "
.endif

.if defined(WITH_JAVA) && ${OSVERSION} < 503000
BROKEN="Java bindings are supported only on FreeBSD 5.3 or newer"
.endif

.if !defined(SWIG_BINDINGS)
CONFIGURE_ARGS+=	--without-swig --disable-swig-bindings
.endif

.if defined(WITH_MOD_DAV_SVN)
WITH_APACHE2_APR=	yes
CONFIGURE_ARGS+=	--with-apxs=${APXS}
PLIST_SUB+=	MOD_DAV_SVN=""
SVNGROUP?=	www
.else
PLIST_SUB+=	MOD_DAV_SVN="@comment "
PKGDEINSTALL=	NONEXISTENT
SVNGROUP?=	svn
.endif

.if defined(WITH_APACHE2_APR)
USE_APACHE=	2.0+
.include "${PORTSDIR}/Mk/bsd.apache.mk"
.if ${APACHE_VERSION} >= 21
APR_APU_DIR=	${LOCALBASE}/bin
APR_CONFIG=	apr-1-config
APU_CONFIG=	apu-1-config
.else
APR_APU_DIR=	${LOCALBASE}/lib/apache2
APR_CONFIG=	apr-config
APU_CONFIG=	apu-config
.endif
APR_PORT=	${APACHE_PORT}
.if !defined(WITHOUT_BDB)
DEPENDS_ARGS+=	WITH_BERKELEYDB=db4
OPT_NAME=	WITH_BERKELEYDB=(db4|db41|db42)
.endif
.else
APR_APU_DIR=	${LOCALBASE}/bin
APR_CONFIG=	apr-1-config
APU_CONFIG=	apu-1-config
.if !defined(WITHOUT_BDB)
LIB_DEPENDS+=	apr-1.2:${PORTSDIR}/devel/apr-svn
APR_PORT=	devel/apr-svn
OPT_NAME=	APR_UTIL_WITH_BERKELEY_DB=yes
.else
LIB_DEPENDS+=	apr-1.2:${PORTSDIR}/devel/apr
APR_PORT=	devel/apr
.endif
.endif
CONFIGURE_ARGS+=--with-apr=${APR_APU_DIR}/${APR_CONFIG} \
		--with-apr-util=${APR_APU_DIR}/${APU_CONFIG}

.if defined(WITH_SVNSERVE_WRAPPER)
PLIST_SUB+=	SVNSERVE_WRAPPER=""
EXTRA_PATCHES=	${PATCHDIR}/build-outputs.mk.patch
.else
PLIST_SUB+=	SVNSERVE_WRAPPER="@comment "
.endif

.if !defined(NOPORTDOCS) && defined(WITH_BOOK)
PORTDOCS+=	book
DISTFILES+=	svn-book.html:bookhtml \
		ch01dia1.png:bookhtmlimg ch02dia1.png:bookhtmlimg \
		ch02dia2.png:bookhtmlimg ch02dia3.png:bookhtmlimg \
		ch02dia5.png:bookhtmlimg ch02dia6.png:bookhtmlimg \
		ch02dia7.png:bookhtmlimg ch04dia1.png:bookhtmlimg \
		ch04dia2.png:bookhtmlimg ch04dia3.png:bookhtmlimg \
		ch04dia4.png:bookhtmlimg ch08dia1.png:bookhtmlimg \
		ch08dia2.png:bookhtmlimg \
		svn-book.pdf:bookpdf
.endif

.if defined(WITH_ASVN)
PLIST_SUB+=	ASVN=""
.else
PLIST_SUB+=	ASVN="@comment "
.endif

SCRIPTS=

SCRIPTS_DATA=

pre-everything::
	@${ECHO_MSG} ""
.if defined(WITHOUT_NEON)
	@${ECHO_MSG} "WebDAV/Delta-V repository access module disabled."
.else
	@${ECHO_MSG} "WebDAV/Delta-V repository access module enabled."
	@${ECHO_MSG} "To disable it define WITHOUT_NEON"
.endif
	@${ECHO_MSG} ""
.if defined(WITHOUT_BDB)
	@${ECHO_MSG} "db4 repository backend disabled."
.else
	@${ECHO_MSG} "db4 repository backend enabled."
	@${ECHO_MSG} "To disable it define WITHOUT_BDB"
.endif
	@${ECHO_MSG} ""
.if defined(WITH_MAINTAINER_DEBUG)
	@${ECHO_MSG} "Build debug version."
.else
	@${ECHO_MSG} "You can enable debug build by defining WITH_MAINTAINER_DEBUG."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_PERL)
	@${ECHO_MSG} "Build with perl bindings."
	@${ECHO_MSG} "Be sure, that apr library and perl both uses OR not uses threads in same time."
.else
	@${ECHO_MSG} "You can enable perl bindings by defining WITH_PERL"
.endif
	@${ECHO_MSG} ""
.if defined(WITH_PYTHON)
	@${ECHO_MSG} "Build with Python bindings."
.else
	@${ECHO_MSG} "You can enable Python bindings by defining WITH_PYTHON."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_RUBY)
	@${ECHO_MSG} "Build with Ruby bindings."
.else
	@${ECHO_MSG} "You can enable Ruby bindings by defining WITH_RUBY."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_JAVA)
	@${ECHO_MSG} "Build with Java (JavaHL) bindings."
.else
	@${ECHO_MSG} "You can enable Java bindings by defining WITH_JAVA."
	@${ECHO_MSG} "You should have apr built with threads for Java support!"
.endif
	@${ECHO_MSG} ""
.if defined(WITH_MOD_DAV_SVN)
	@${ECHO_MSG} "mod_dav_svn module for Apache 2.X enabled."
.else
	@${ECHO_MSG} "You can enable the mod_dav_svn module for Apache 2.X"
	@${ECHO_MSG} "by defining WITH_MOD_DAV_SVN.  This option implies"
	@${ECHO_MSG} "the WITH_APACHE2_APR option."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_APACHE2_APR)
	@${ECHO_MSG} "Using APR from ${APACHE_PORT}.  If you have the devel/apr"
	@${ECHO_MSG} "port/package installed, you may need to remove it."
.else
	@${ECHO_MSG} "You can link subversion against the APR built with"
	@${ECHO_MSG} "the ${APACHE_PORT} port, rather than the devel/apr port,"
	@${ECHO_MSG} "by defining WITH_APACHE2_APR."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_SVNSERVE_WRAPPER)
	@${ECHO_MSG} "svnserve wrapper enabled."
.else
	@${ECHO_MSG} "You can install the svnserve wrapper (sets umask 002)"
	@${ECHO_MSG} "by defining WITH_SVNSERVE_WRAPPER."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_REPOSITORY_CREATION)
	@${ECHO_MSG} "I will create (or use, if it exists) \"${SVNGROUP}\" group."
	@${ECHO_MSG} "Make sure that all committers are its members."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Repository will be created at '${SVNREPOS}' with group '${SVNGROUP}'."
	@${ECHO_MSG} "Type of repository will be '${SVNFSTYPE}'."
	@${ECHO_MSG} "You could change these settings by defining SVNREPOS, SVNGROUP and SVNFSTYPE."
.else
	@${ECHO_MSG} "You can have the repository created for you by defining"
	@${ECHO_MSG} "WITH_REPOSITORY_CREATION."
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Make sure that:"
	@${ECHO_MSG} "* all your svn users are members of a common group"
	@${ECHO_MSG} "* this group is the group id of the db/ and locks/"
	@${ECHO_MSG} "  subdirectories of your repository"
	@${ECHO_MSG} "* the above subdirectories are writable by this group"
.endif
	@${ECHO_MSG} ""
.if !defined(NOPORTDOCS) && defined(WITH_BOOK)
	@${ECHO_MSG} "Subversion Book will be installed."
.else
	@${ECHO_MSG} "You can install the Subversion Book by defining WITH_BOOK."
.endif
	@${ECHO_MSG} ""
.if defined(WITH_ASVN)
	@${ECHO_MSG} "asvn will be installed"
.else
	@${ECHO_MSG} "You can install asvn from contrib by defining WITH_ASVN"
.endif
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Many useful scripts will be installed into ${PREFIX}/share/subversion"

#post-extract:
#	@${RM} -r ${WRKSRC}/neon
#	@${RM} -r ${WRKSRC}/apr
#	@${RM} -r ${WRKSRC}/apr-util

post-patch:
.if ${PREFIX} != "/usr"
	@${REINPLACE_CMD} "s#/etc/subversion#${PREFIX}/etc/subversion#g" ${WRKSRC}/subversion/libsvn_subr/config_file.c
	@${REINPLACE_CMD} "s#/etc/subversion#${PREFIX}/etc/subversion#g" ${WRKSRC}/subversion/libsvn_subr/config_impl.h
.endif
	@${REINPLACE_CMD} "s#^swig_pydir =.*#swig_pydir = ${PYTHON_SITELIBDIR}/libsvn#" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} "s#^swig_pydir_extra =.*#swig_pydir_extra = ${PYTHON_SITELIBDIR}/svn#" ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} "s#^LIBTOOL =.*#LIBTOOL = ${LIBTOOL}#" ${WRKSRC}/Makefile.in

pre-configure:
	@if [ ! -x ${APR_APU_DIR}/${APR_CONFIG} -o ! -x ${APR_APU_DIR}/${APU_CONFIG} ] ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} 'You selected to use`'"${APR_PORT}' for apr library." ; \
		${ECHO_MSG} 'It seems that `'"${APR_PORT}' is not properly installed." ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi
.if !defined(WITHOUT_BDB)
	@if [ `${APR_APU_DIR}/${APU_CONFIG} --db-version` != "4" ] ; then \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} 'You should build `'"${APR_PORT}' with db4 support to use subversion with it." ; \
		${ECHO_MSG} 'Please rebuild `'"${APR_PORT}' with option "'`'"${OPT_NAME}' and try again." ; \
		${ECHO_MSG} "" ; \
		${ECHO_MSG} "Or you can disable db4 support. Only 'fs' repository backend will be available." ; \
		${ECHO_MSG} "To disable db4 support, define WITHOUT_BDB." ; \
		${ECHO_MSG} "" ; \
		${FALSE} ; \
	fi
.endif

post-build:
.if defined(WITH_PERL)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-pl
.endif
.if defined(WITH_PYTHON)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-py
.endif
.if defined(WITH_RUBY)
	cd ${WRKSRC} ; \
	  ${MAKE} swig-rb
.endif
.if defined(WITH_JAVA)
	@${MKDIR} ${WRKSRC}/subversion/bindings/java/javahl/classes
	cd ${WRKSRC} ; \
	  ${MAKE} javahl
.endif

.if defined(WITH_MOD_DAV_SVN)
pre-install:
	${APXS} -e -S LIBEXECDIR=${PREFIX}/${APACHEMODDIR} -a -n dav ${PREFIX}/${APACHEMODDIR}/mod_dav.so
.endif

post-install:	${MKREPOS_TARGET}
	@${MKDIR} ${PREFIX}/share/subversion
	cd ${WRKSRC}/tools ; \
	  tar --exclude '*.in' -cf - * | tar -C ${PREFIX}/share/subversion -xf -
	@${CHMOD} -R a-st,o+rX ${PREFIX}/share/subversion
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	for f in ${TXT_DOCS}; do \
	  ${INSTALL_DATA} ${WRKSRC}/$$f ${DOCSDIR}; \
	done
.if defined(WITH_BOOK)
	${MKDIR} ${DOCSDIR}/book
	${MKDIR} ${DOCSDIR}/book/images
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/svn-book.html ${DOCSDIR}/book
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/*.png         ${DOCSDIR}/book/images
	${INSTALL_DATA} ${DISTDIR}/${DIST_SUBDIR}/svn-book.pdf  ${DOCSDIR}/book
.endif
.endif
.if defined(WITH_ASVN)
	${INSTALL_SCRIPT} ${WRKSRC}/contrib/client-side/asvn ${PREFIX}/bin
.endif
.if defined(WITH_PERL)
	cd ${WRKSRC} ; \
	${REINPLACE_CMD} '/SWIG_PL_DIR/s, install$$, all pure_install,g' ${WRKSRC}/Makefile ; \
	  ${MAKE} install-swig-pl
.endif
.if defined(WITH_PYTHON)
	cd ${WRKSRC} ; \
	  ${MAKE} install-swig-py
.endif
.if defined(WITH_RUBY)
	cd ${WRKSRC} ; \
	  ${MAKE} install-swig-rb
.endif
.if defined(WITH_JAVA)
	cd ${WRKSRC} ; \
	  ${MAKE} install-javahl
.endif
.if defined(WITH_SVNSERVE_WRAPPER)
	@${INSTALL_SCRIPT} ${FILESDIR}/svnserve.wrapper ${PREFIX}/bin/svnserve
.endif

repository:	_mkrepos

_SVNGRPFILES=	dav db locks locks/db.lock locks/db-logs.lock
SVNGRPFILES=	${_SVNGRPFILES:S,^,${SVNREPOS}/,}

_mkrepos:	.USE
.if !exists(${SVNREPOS})
.if defined(WITH_SVNSERVE_WRAPPER)
	@if /usr/sbin/pw groupshow "${SVNGROUP}" >/dev/null 2>&1; then \
	    ${ECHO_MSG} "You already have a group \"${SVNGROUP}\", so I will use it."; \
	else \
	    if /usr/sbin/pw groupadd ${SVNGROUP} -h -; \
	    then \
	        ${ECHO_MSG} "Added group \"${SVNGROUP}\"."; \
	    else \
	        ${ECHO_MSG} "Adding group \"${SVNGROUP}\" failed..."; \
	        ${ECHO_MSG} "Please create it, and try again."; \
	        ${FALSE}; \
	    fi; \
	fi
.endif
	@${MKDIR} ${SVNREPOS}
	@${PREFIX}/bin/svnadmin create --fs-type ${SVNFSTYPE} ${SVNREPOS}
.if defined(WITH_SVNSERVE_WRAPPER)
	@${CHGRP} ${SVNGROUP} ${SVNGRPFILES}
	@${CHMOD} g+w ${SVNGRPFILES}
	@for i in ${SVNREPOS}/db/* ; do \
	    i=$${i##*/}; \
	    case $$i in \
	    DB_CONFIG|fs-type|uuid) ;; \
	    *) ${CHGRP} -R ${SVNGROUP} ${SVNREPOS}/db/$$i; \
	       ${CHMOD} -R g+w ${SVNREPOS}/db/$$i; \
	       ;; \
	    esac; \
	done
.endif
.endif

post-deinstall:
.if defined(WITH_MOD_DAV_SVN)
	@PKG_PREFIX=${PREFIX} ${SH} ${PKGDEINSTALL} ${PKGNAME} POST-DEINSTALL
.endif

.include <bsd.port.post.mk>
