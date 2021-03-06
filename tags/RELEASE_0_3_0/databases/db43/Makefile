# $MidnightBSD: mports/databases/db43/Makefile,v 1.4 2009/03/03 23:59:26 laffer1 Exp $

PORTNAME=	db43
PORTVERSION=	4.3.29
PORTREVISION=	2
CATEGORIES=	databases
MASTER_SITES=	http://download.oracle.com/berkeley-db/ 
DISTNAME=	db-${PORTVERSION}
DIST_SUBDIR=	bdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Berkeley DB package, revision 4.3
LICENSE=	bdb

WRKSRC=		${WRKDIR}/${DISTNAME}/build_unix

USE_LDCONFIG=		yes
GNU_CONFIGURE=	yes
CONFIGURE_SCRIPT=	../dist/configure
LIBTOOLFILES=		${CONFIGURE_SCRIPT}
CONFIGURE_TARGET=	--target=${ARCH}-portbld-freebsd6.1 \
			--build=${ARCH}-portbld-freebsd6.1 \
			--host=${ARCH}-portbld-freebsd6.1
BDBVER=			${PORTVERSION:R}
BDBMINOR=		${BDBVER:E:S/^\.//}
BDBDIR=			BerkeleyDB.${BDBVER}
CONFIGURE_ARGS=		--enable-compat185 --enable-dump185 \
			--enable-cxx --enable-dynamic \
			--enable-rpc \
			--includedir=${PREFIX}/include/${PORTNAME} \
			--libdir=${PREFIX}/lib/${PORTNAME} \
			--bindir=${PREFIX}/bin/${PORTNAME}
INSTALL_TARGET=		install_include install_lib install_utilities
.if !defined(NOPORTDOCS)
INSTALL_TARGET+=	install_docs docdir=${DOCSDIR}
PORTDOCS=		*
.endif

pre-patch:
	${REINPLACE_CMD} -Ee 's|-l?pthread|${PTHREAD_LIBS}|g; s,/usr/bin/objformat \|\| echo aout,/usr/bin/objformat || echo elf,' ${WRKSRC}/${CONFIGURE_SCRIPT}

pre-configure:
	${CHMOD} u+w ${WRKSRC}/../dist/configure

post-configure:
	${REINPLACE_CMD} -e '/^extern  void db_rpc_serverprog/ d;' ${WRKSRC}/db_server.h

post-install:
.for i in libdb libdb_cxx
	${LN} -s -f ${PORTNAME}/${i}-${BDBVER}.so.0 ${PREFIX}/lib
	${LN} -s -f ${i}-${BDBVER}.so.0 ${PREFIX}/lib/${i}-${BDBVER}.so
.endfor
.if !defined(NOPORTDOCS)
	@${RMDIR} ${DOCSDIR}/ref/splash 2>/dev/null || :
.endif
	cd ${PREFIX}/bin/${PORTNAME} ; \
	for i in * ; do ${LN} -s -f ${PORTNAME}/$$i ../$$i-${BDBVER} ; done
.include <bsd.port.pre.mk>

.if ${ARCH} == amd64
CONFIGURE_ARGS+=	--with-mutex=x86/gcc-assembly
.endif

.include <bsd.port.post.mk>
