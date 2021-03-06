# $MidnightBSD: mports/news/tin/Makefile,v 1.3 2007/08/20 03:20:04 laffer1 Exp $

PORTNAME=	tin
PORTVERSION=	1.8.3
CATEGORIES+=	news ipv6
MASTER_SITES=	ftp://ftp.tin.org/pub/news/clients/tin/stable/ \
		ftp://ftp.stikman.com/pub/tin/stable/ \
		ftp://ftp.sunet.se/pub/news/readers/tin/stable/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Easy-to-use threaded newsreader with NOV/NNTP support
LICENSE=	bsd3

LIB_DEPENDS=	uu.3:${PORTSDIR}/converters/uulib \
		pcre.0:${PORTSDIR}/devel/pcre
RUN_DEPENDS=	${LOCALBASE}/etc/mime.types:${PORTSDIR}/misc/mime-support

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
WITH_TIN_EDITOR?=	/usr/bin/ee

# --with-mime-default-charset=US-ASCII needed to build tin in the non-ascii
# national environment.
CONFIGURE_ARGS+=--with-nntp-default-server=news \
		--with-spooldir=/var/news \
		--with-libdir=${PREFIX}/news/lib \
		--with-defaults-dir=${PREFIX}/etc \
		--with-editor=${WITH_TIN_EDITOR} \
		--enable-nls \
		--with-pcre=yes \
		--with-screen=ncurses \
		--enable-break-long-lines \
		--with-libiconv-prefix=${LOCALBASE} \
		--with-mime-default-charset=US-ASCII
CONFIGURE_ENV=	CFLAGS='${CFLAGS} -DNNTP_SERVER_FILE="\"${PREFIX}/etc/nntpserver\""' \
		CPPFLAGS='${CPPFLAGS} -I${LOCALBASE}/include' \
		LDFLAGS='${LDFLAGS} -L${LOCALBASE}/lib'
ALL_TARGET=	build
MAN1=		tin.1 w2r.pl.1 opt-case.pl.1 tinews.pl.1
MAN5=		tin.5 mbox.5 mmdf.5
MLINKS=		tin.1 rtin.1

.if defined(WITH_TIN_NNTP_ONLY)
CONFIGURE_ARGS+=	--enable-nntp-only
.endif

.include <bsd.port.pre.mk>

.if defined(WITHOUT_TIN_PGP_GPG)
CONFIGURE_ARGS+=	--disable-pgp-gpg
.elif defined(WITH_TIN_GPG) || \
    (exists(${LOCALBASE}/bin/gpg) && !defined(WITH_TIN_PGP))
RUN_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg
CONFIGURE_ARGS+=	--with-gpg=${PREFIX}/bin/gpg \
		 --without-pgp --without-pgpk
.elif defined(WITH_TIN_PGP) || exists(${LOCALBASE}/bin/pgp)
RUN_DEPENDS+=	pgp:${PORTSDIR}/security/pgp6
CONFIGURE_ARGS+=	--with-pgp=${PREFIX}/bin/pgp \
		 --without-pgpk --without-gpg
.elif defined(WITH_TIN_PGP5) || exists(${LOCALBASE}/bin/pgpk)
RUN_DEPENDS+=	pgpk:${PORTSDIR}/security/pgp5
CONFIGURE_ARGS+=	--with-pgpk=${PREFIX}/bin/pgpk \
		 --without-pgp --without-gpg
.else
CONFIGURE_ARGS+=	--disable-pgp-gpg
.endif

.if defined(WITH_TIN_ISPELL) || \
    (exists(${LOCALBASE}/bin/ispell) && !defined(WITHOUT_TIN_ISPELL))
RUN_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
CONFIGURE_ARGS+=	--with-ispell=${PREFIX}/bin/ispell
.endif

.if defined(WITH_TIN_METAMAIL) || \
    (exists(${LOCALBASE}/bin/metamail) && !defined(WITHOUT_TIN_METAMAIL))
RUN_DEPENDS+=	metamail:${PORTSDIR}/mail/metamail
CONFIGURE_ARGS+=	--with-metamail=${PREFIX}/bin/metamail
.endif

post-patch:
	${REINPLACE_CMD} -e 's:/var/spool/news:/var/news:' \
		-e 's:/etc/nntpserver:${PREFIX}/etc/nntpserver:' \
		-e 's:/usr/lib/news:${PREFIX}/news/lib:' \
		-e 's:/etc/mime\.types:${PREFIX}/etc/mime.types:' \
		${WRKSRC}/doc/tin.1 ${WRKSRC}/doc/tin.5
	${REINPLACE_CMD} \
		-e 's:/etc/mime\.types:${PREFIX}/etc/mime.types:' \
		${WRKSRC}/src/mimetypes.c

.if defined(WITH_TIN_CANLOCK)
MAKE_ARGS+=	CANLIB='-L../libcanlock -lcanlock' \
		CANLOCK=-DUSE_CANLOCK
.endif

pre-build:
.if defined(WITH_TIN_CANLOCK)
	cd ${WRKSRC}/src; ${GMAKE} canlock
.endif

post-build:
	cd ${WRKSRC}/po; ${GMAKE}

post-install:
	cd ${WRKSRC}/doc; ${INSTALL_DATA} tin.defaults ${PREFIX}/etc/tin.defaults.dist
	if [ ! -f ${PREFIX}/etc/tin.defaults ] ; then \
		${CP} ${PREFIX}/etc/tin.defaults.dist ${PREFIX}/etc/tin.defaults; \
	fi

.include <bsd.port.post.mk>
