# $MidnightBSD$

PORTNAME?=	postgresql
DISTVERSION?=	8.4.4
CATEGORIES?=	databases
MASTER_SITES=	${MASTER_SITE_PGSQL}
MASTER_SITE_SUBDIR=	source/v${DISTVERSION}
PKGNAMESUFFIX?=	-server

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	The most advanced open-source database available anywhere
LICENSE=	mit

CONFLICTS?=	${PORTNAME}-client-7.* \
		${PORTNAME}${PKGNAMESUFFIX}-7.* \
		${PORTNAME}-client-8.[0-35-9]* \
		${PORTNAME}${PKGNAMESUFFIX}-8.[0-35-9]*

WRKSRC=		${WRKDIR}/postgresql-${DISTVERSION}
DIST_SUBDIR=	postgresql

UNIQUENAME?=	${PORTNAME}84
LATEST_LINK?=	${PKGNAMEPREFIX}${UNIQUENAME}${PKGNAMESUFFIX}

SUB_FILES+=	dot.cshrc dot.profile

PKGINSTALL?=	${PKGDIR}/pkg-install${PKGNAMESUFFIX}
USE_BZIP2=	YES
USE_GMAKE=	YES
GNU_CONFIGURE=	YES
.if defined(NO_BUILD)
.undef USE_GMAKE
.undef GNU_CONFIGURE
.endif

PGUSER=		pgsql
PGGROUP=	pgsql

CONFIGURE_ARGS+=--with-libraries=${LOCALBASE}/lib \
		--with-includes=${LOCALBASE}/include \
		--enable-thread-safety \
		--with-docdir=${DOCSDIR}
CONFIGURE_ENV+=	LDFLAGS="${LDFLAGS}" \
		PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

CFLAGS+=	${PTHREAD_CFLAGS}
LDFLAGS+=	${PTHREAD_LIBS}

PLIST=		${PKGDIR}/pkg-plist${PKGNAMESUFFIX}

BUILD_DIRS?=	src/port src/timezone src/backend src/backend/utils/mb/conversion_procs \
		src/backend/snowball src/bin/initdb src/bin/pg_ctl \
		src/bin/pg_controldata src/bin/pg_resetxlog src/pl

INSTALL_DIRS?=	${BUILD_DIRS}

.if !defined(CLIENT_ONLY) && !defined(SLAVE_ONLY)
SERVER_ONLY=	yes
PORTREVISION=	3
USE_RC_SUBR=	postgresql
USE_PGSQL=	yes
WANT_PGSQL_VER=	${PORTVERSION:C/([0-9][0-9]*)\.([0-9][0-9]*).*/\1\2/g}
.endif

.if !defined(SLAVE_ONLY)
OPTIONS=	NLS "Use internationalized messages" on
.endif

.if !defined(CLIENT_ONLY)
MAKE_ENV=	PATH=${PREFIX}/bin:${PATH}
CONFIGURE_ENV+=	PATH=${PREFIX}/bin:${PATH}
.endif

# Cannot check this with standard OPTION due to a catch-22.
# USE_OPENSSL must precede bsd.port.pre.mk, but then we don't know
# what OPTIONS are set.
#
# If you *don't* want SSL, set WITHOUT_SSL=YES when making
.if !defined(WITHOUT_SSL)
USE_OPENSSL=	yes
CONFIGURE_ARGS+=--with-openssl
.endif

.include <bsd.port.pre.mk>

.if !defined(SLAVE_ONLY)
OPTIONS+=	PAM "Build with PAM support (server only)" off
OPTIONS+=	LDAP "Build with LDAP authentication support" off
OPTIONS+=	MIT_KRB5 "Build with MIT's kerberos support" off
OPTIONS+=	HEIMDAL_KRB5 "Builds with Heimdal kerberos support" off
OPTIONS+=	OPTIMIZED_CFLAGS "Builds with compiler optimizations (-O3)" off
OPTIONS+=	XML "Build with XML data type (server)" on
OPTIONS+=	TZDATA "Use internal timezone database (server)" on
OPTIONS+=	DEBUG "Builds with debugging symbols" off

# See http://people.freebsd.org/~girgen/postgresql-icu/README.html for more info
OPTIONS+=	ICU	"Use ICU 3.x for unicode collation (server)" off
OPTIONS+=	ICU4	"Use ICU 4.x for unicode collation (server)" off

# See http://www.freebsd.org/cgi/query-pr.cgi?pr=ports/76999 for more info
# (requires dump/restore if modified.)
OPTIONS+=	INTDATE "Builds with 64-bit date/time type (server)" on

.  if defined(WITH_ICU) && defined(WITH_ICU4)
IGNORE=		options WITH_ICU and WITH_ICU4 are mutually exclusive
.  endif

.  if (defined(SERVER_ONLY) && (defined(WITH_ICU) || defined(WITH_ICU4))) || make(makesum)
USE_AUTOTOOLS=	autoconf:267
CONFIGURE_ARGS+=--with-icu
PATCH_SITES+=	http://people.freebsd.org/~girgen/postgresql-icu/:icu
PATCHFILES+=	pg-840-icu-2009-09-15.diff.gz:icu
.   if defined(WITH_ICU4)
LIB_DEPENDS+=	icudata.44:${PORTSDIR}/devel/icu4
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-icu4
.   else
LIB_DEPENDS+=	icudata.38:${PORTSDIR}/devel/icu
.   endif
.  endif

PATCH_DIST_STRIP=-p1

.  if defined(SERVER_ONLY) && defined(WITH_PAM)
CONFIGURE_ARGS+=--with-pam
.  endif

.  if defined(SERVER_ONLY) && defined(WITH_LDAP)
CONFIGURE_ARGS+=--with-ldap
USE_OPENLDAP=	YES
.  endif

.  if defined(SERVER_ONLY) && defined(WITH_XML)
CONFIGURE_ARGS+=--with-libxml
LIB_DEPENDS+=	xml2.5:${PORTSDIR}/textproc/libxml2
.  endif

.  if defined(SERVER_ONLY) && defined(WITH_TZDATA)
PLIST_SUB+=	TZDATA=""
.  else
CONFIGURE_ARGS+=--with-system-tzdata=/usr/share/zoneinfo
PLIST_SUB+=	TZDATA="@comment "
.  endif

.  if defined(WITHOUT_INTDATE)
CONFIGURE_ARGS+=--disable-integer-datetimes
.  endif

.  if !(defined(WITHOUT_GETTEXT) || defined(WITHOUT_NLS))
CONFIGURE_ARGS+=--enable-nls
PLIST_SUB+=	GETTEXT=""
USE_GETTEXT=	YES
.  else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	GETTEXT="@comment "
.  endif

.  if defined(WITH_OPTIMIZED_CFLAGS)
CFLAGS+=	-O3 -funroll-loops
.  endif

.  if defined(WITH_DEBUG)
CONFIGURE_ARGS+=--enable-debug
INSTALL_TARGET=	install
.  else
INSTALL_TARGET=	install-strip
.  endif

.  if defined(WITH_MIT_KRB5)
.    if exists(/usr/lib/libkrb5.so) || exists(/usr/bin/krb5-config)
BROKEN=		You must remove heimdal's /usr/bin/krb5-config and /usr/lib/libkrb5.so*, and set NO_KERBEROS=true in /etc/make.conf to build successfully with MIT-KRB
.    endif
# Allow defining a home built MIT Kerberos by setting KRB5_HOME
.    if defined(KRB5_HOME) && exists(${KRB5_HOME}/lib/libgssapi_krb5.a) && exists(${KRB5_HOME}/bin/krb5-config)
CONFIGURE_ARGS+=--with-krb5
.    else
LIB_DEPENDS+=	krb5.3:${PORTSDIR}/security/krb5
CONFIGURE_ARGS+=--with-krb5
.    endif
.  endif

.  if defined(WITH_HEIMDAL_KRB5)
# Allow defining a home built Heimdal Kerberos by setting HEIMDAL_HOME
.    if defined(HEIMDAL_HOME) && exists(${HEIMDAL_HOME}/lib/libgssapi.a) && exists(${HEIMDAL_HOME}/bin/krb5-config)
CONFIGURE_ARGS+=--with-krb5
.    else
# Postgresql apps will not link properly when libpq is linked with base heimdal in /usr,
# so we always use the heimdal port. See
# http://lists.freebsd.org/pipermail/freebsd-stable/2005-October/018809.html
LIB_DEPENDS+=	krb5.23:${PORTSDIR}/security/heimdal
CONFIGURE_ARGS+=--with-krb5
.    endif
.  endif

.endif # !SLAVE_ONLY

.if defined(CLIENT_ONLY)
MAN1=		clusterdb.1 createdb.1 createlang.1 createuser.1   \
		dropdb.1 droplang.1 dropuser.1 ecpg.1 initdb.1	   \
		pg_config.1 pg_controldata.1 pg_ctl.1   \
		pg_dump.1 pg_dumpall.1 pg_resetxlog.1 pg_restore.1 \
		postgres.1 postmaster.1 psql.1 reindexdb.1 vacuumdb.1

MAN7=		abort.7 alter_aggregate.7 alter_conversion.7 alter_database.7 \
		alter_domain.7 alter_foreign_data_wrapper.7 alter_function.7 alter_group.7 alter_server.7 \
		alter_user_mapping.7		alter_index.7 alter_language.7 alter_operator_class.7	      \
		alter_operator_family.7 				      \
		alter_role.7						      \
		alter_schema.7 alter_sequence.7 alter_table.7		      \
		alter_text_search_configuration.7			      \
		alter_text_search_dictionary.7				      \
		alter_text_search_parser.7				      \
		alter_text_search_template.7				      \
		alter_trigger.7 alter_user.7 alter_view.7 analyze.7 begin.7   \
		checkpoint.7 close.7 cluster.7 comment.7 commit.7	      \
		commit_prepared.7					      \
		copy.7 create_aggregate.7 create_cast.7			      \
		create_constraint_trigger.7 create_conversion.7		      \
		create_database.7 create_domain.7 create_foreign_data_wrapper.7 \
		create_function.7	      \
		create_group.7 create_index.7 create_language.7		      \
		create_operator.7 create_operator_class.7		      \
		create_operator_family.7 create_role.7			      \
		create_rule.7 create_schema.7 create_sequence.7		      \
		create_server.7 create_table.7 create_table_as.7			      \
		create_text_search_configuration.7			      \
		create_text_search_dictionary.7				      \
		create_text_search_parser.7				      \
		create_text_search_template.7 create_trigger.7		      \
		create_type.7 create_user.7 create_user_mapping.7 create_view.7 deallocate.7	      \
		declare.7 delete.7 discard.7				      \
		drop_aggregate.7 drop_cast.7 drop_conversion.7		      \
		drop_database.7 drop_domain.7 drop_foreign_data_wrapper.7 drop_function.7		      \
		drop_group.7 drop_index.7 drop_language.7		      \
		drop_operator.7 drop_operator_class.7 drop_operator_family.7  \
		drop_owned.7 drop_role.7 drop_rule.7			      \
		drop_schema.7 drop_sequence.7 drop_server.7 drop_table.7		      \
		drop_text_search_configuration.7			      \
		drop_text_search_dictionary.7				      \
		drop_text_search_parser.7				      \
		drop_text_search_template.7 drop_trigger.7		      \
		drop_type.7 drop_user.7 drop_user_mapping.7 drop_view.7 end.7 execute.7	      \
		explain.7 fetch.7 grant.7 insert.7 listen.7 load.7	      \
		lock.7 move.7 notify.7 prepare.7 prepare_transaction.7	      \
		reassign_owned.7 reindex.7 reset.7			      \
		revoke.7 rollback.7 rollback_prepared.7 select.7	      \
		select_into.7 set.7					      \
		set_constraints.7 set_role.7 set_transaction.7 show.7	      \
		set_session_authorization.7 start_transaction.7		      \
		table.7 truncate.7 unlisten.7 update.7 vacuum.7			      \
		alter_operator.7 alter_tablespace.7 alter_type.7	      \
		create_tablespace.7 drop_tablespace.7			      \
		release_savepoint.7 rollback_to_savepoint.7		      \
		savepoint.7 values.7 with.7
.endif

.if defined(SERVER_ONLY)
pre-everything::
	@${SH} ${PKGINSTALL} ${PORTNAME} BACKUPWARNING
.endif

.if !defined(NO_BUILD)

pre-configure:
.  if defined(WITH_MIT_KRB5) && defined(WITH_HEIMDAL_KRB5)
	@${ECHO} "MIT's and Heimdal Kerberos are mutually exclusive."
	@${ECHO} "Please choose one or the other."
	@exit 1
.  endif

do-build:
	@ cd ${WRKSRC}/src/backend ;\
	${GMAKE} ${FAKE_MAKEARGS} symlinks
	@ for dir in ${BUILD_DIRS}; do \
		cd ${WRKSRC}/$${dir} && ${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS}; \
	done

.  if exists(${FILESDIR}/pkg-message${PKGNAMESUFFIX}.in)
SUB_FILES+=	pkg-message${PKGNAMESUFFIX}
PKGMESSAGE=	${WRKSRC}/pkg-message${PKGNAMESUFFIX}
.  endif
.endif

.if defined(SERVER_ONLY)
pre-install:
	@ ${SETENV} PKG_PREFIX=${FAKE_DESTDIR}${PREFIX} PGUSER=${PGUSER} PGGROUP=${PGGROUP} \
		${SH} ${PKGINSTALL} ${PORTNAME} PRE-INSTALL
.endif

.if !defined(NO_BUILD)
do-install:
	@for dir in ${INSTALL_DIRS}; do \
	    cd ${WRKSRC}/$${dir} && \
		${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS} ${INSTALL_TARGET}; \
	done
.if defined(SERVER_ONLY)
	@ ${MKDIR} ${PREFIX}/share/postgresql
	@ ${MKDIR} ${PREFIX}/pgsql
.for i in profile cshrc
	${INSTALL_DATA} ${WRKDIR}/dot.$i ${PREFIX}/share/postgresql/dot.$i.dist; \
	${INSTALL_DATA} -o pgsql -g pgsql ${WRKDIR}/dot.$i ${PREFIX}/pgsql/dot.$i.dist ; \
	if [ ! -f ${PREFIX}/pgsql/.$i ]; then \
		${CP} -p ${PREFIX}/pgsql/dot.$i.dist ${PREFIX}/pgsql/.$i; \
	fi
.endfor
	@ ${CHOWN} -R pgsql:pgsql ${PREFIX}/pgsql/. ;\
	${MKDIR} ${PREFIX}/etc/periodic/daily ;\
	${INSTALL_SCRIPT} ${FILESDIR}/502.pgsql \
			${PREFIX}/etc/periodic/daily
.  endif # SERVER_ONLY
.  if defined(CLIENT_ONLY)
	@ cd ${WRKSRC}/src && ${SETENV} ${MAKE_ENV} ${GMAKE} ${FAKE_MAKEARGS} install-local
.  endif
	@ if [ -r ${PKGMESSAGE} ]; then \
		${MKDIR} ${DOCSDIR} ;\
		${INSTALL_DATA} ${PKGMESSAGE} ${DOCSDIR}/README${PKGNAMESUFFIX} ;\
		${ECHO} "======================================================================" ;\
		${CAT} ${PKGMESSAGE} ;\
		${ECHO} "======================================================================" ;\
	fi
.endif # !NO_BUILD

.if defined(SERVER_ONLY)
check:
	@if [ `id -u` != 0 ] ; then \
	  ${ECHO} "Running postgresql regressions tests" ;\
	  cd ${WRKSRC}; ${GMAKE} ${FAKE_MAKEARGS} check ;\
	 else \
	  ${ECHO} "You cannot run regression tests when postgresql is built as user root." ; \
	  ${ECHO} "Clean and rebuild the port as a regular user to run the tests." ;\
	 fi
.endif

.include <bsd.port.post.mk>
