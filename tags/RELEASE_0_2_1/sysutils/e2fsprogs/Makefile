# New ports collection makefile for:	e2fsprogs
# Date created:				3 July 2001
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/sysutils/e2fsprogs/Makefile,v 1.3 2008/07/05 23:45:36 crash Exp $
# $FreeBSD: ports/sysutils/e2fsprogs/Makefile,v 1.42 2008/04/29 11:09:27 miwi Exp $
#

PORTNAME=	e2fsprogs
PORTVERSION=	1.40.11
PORTREVISION?=	0
CATEGORIES?=	sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_EXTENDED}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	Utilities & library to manipulate ext2/ext3/ext4 filesystems
LICENSE=	agg

PATCH_STRIP=	-p1
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-fsck --disable-e2initrd-helper \
		--with-cc='${CC}' --with-linker='${LD}' \
		--with-ccopts='${CFLAGS}' \
		--with-root-prefix='${PREFIX}'

CONFIGURE_ENV+=	CPPFLAGS='${CPPFLAGS} -I${WRKSRC}/lib \
		-I${LOCALBASE}/include'

MAKE_ARGS+=	LDFLAGS='${LDFLAGS} -L${LOCALBASE}/lib'

OPTIONS=	NLS "Enable national language support" on

.if !defined(MASTERDIR)
MAN1=	chattr.1 lsattr.1
MAN5=	e2fsck.conf.5 mke2fs.conf.5
MAN8=	badblocks.8 debugfs.8 dumpe2fs.8 e2fsck.8 e2image.8 e2label.8 \
	mke2fs.8 mklost+found.8 resize2fs.8 tune2fs.8 \
	fsck.ext2.8 fsck.ext3.8 mkfs.ext2.8 mkfs.ext3.8 \
	findfs.8 blkid.8 logsave.8 fsck_ext2fs.8

post-extract:
	@${CHMOD} u+w ${WRKSRC}/po/*.po ${WRKSRC}/po/*.pot \
		${WRKSRC}/${CONFIGURE_SCRIPT}
.endif

.include <bsd.port.pre.mk>

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB=	NLS=""
.endif

post-patch::
	@${REINPLACE_CMD} -E -e \
		's:\$$\(libdir\)/pkgconfig:${PREFIX}/libdata/pkgconfig:' \
		${WRKSRC}/lib/*/Makefile.in
# don't build/install libext2fs.info
	@${REINPLACE_CMD} -e 's/ install-doc-libs$$//' ${WRKSRC}/Makefile.in

.if ${MASTERDIR} == ${.CURDIR}
post-build:
# Relink e2fsck statically - We need to make sure that tools for the root file
# system are statically linked against anything that is outside the root fs,
# else we're in trouble if e2fsck is needed for boot:
# (we don't use e2fsck.static, since we can link libc.so dynamically)
	cd ${WRKSRC}/e2fsck && ${RM} -f e2fsck \
		&& ${MAKE} e2fsck \
		STATIC_LIBS="../lib/libext2fs.a ../lib/libcom_err.a \
		../lib/libblkid.a  ../lib/libuuid.a" \
		LIBINTL="${LOCALBASE}/lib/libintl.a ${LOCALBASE}/lib/libiconv.a"
# Regression check: avoid a port (not upstream!) regression from 1.40.5,
# check that e2fsck isn't dynalinked against anything but libc.so:
	@${ECHO_CMD} -n "===>  checking that e2fsck depends on no shared objects beyond libc.so: "
	@a="$$(ldd ${WRKSRC}/e2fsck/e2fsck 2>/dev/null \
	    | ${GREP} -v 'not a dynamic executable' \
	    | ${GREP} '=>' \
	    | ${AWK}  '{print $$3;}' \
	    | ${GREP} -v '^/lib/libc\.so\.' || :)"; \
	if test "x$$a" = "x" ; then echo 'PASS' ; else \
	    echo 'FAIL' ; echo '===>  e2fsck depends on:' ; echo "$$a" ; exit 1 ; fi
# Update translation binary files
.if !defined(WITHOUT_NLS)
	cd ${WRKSRC}/po && ${MAKE} update-gmo
.endif
# Build fsck(8) wrapper
	${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} -s ${LIBS} \
		-o ${WRKSRC}/fsck_ext2fs ${FILESDIR}/fsck_ext2fs.c
# While the ${MAKE} check can take a minute on an end user's system, the
# correctness of tools such as e2fsck is critical to the health of the
# file systems.  The upstream is not using any *BSD as his development
# system, and therefore let's exercise due diligence in running the self-
# test on each and every system and not just package building hosts.
# There have been subtle failures induced by Linux-isms in the past.
# -- Matthias Andree, package maintainer, 2007-09-18
	@${ECHO_CMD} '===>  Running e2fsprogs self-test suite'
	cd ${WRKSRC}/tests && ${MAKE} check \
	    || { head -n30000 ${WRKSRC}/tests/*.failed 2>/dev/null ; exit 1 ; }

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/fsck_ext2fs ${PREFIX}/sbin/
	@: # stuff into /sbin since we might need e2fsck early on
	${LN} ${PREFIX}/sbin/fsck_ext2fs /sbin/ 2>/dev/null || \
		${INSTALL_PROGRAM} ${PREFIX}/sbin/fsck_ext2fs /sbin/
	${LN} ${PREFIX}/sbin/e2fsck /sbin/ 2>/dev/null || \
		${INSTALL_PROGRAM} ${PREFIX}/sbin/e2fsck /sbin/
	${INSTALL_MAN} ${FILESDIR}/fsck_ext2fs.8 ${PREFIX}/man/man8/
	[ -f ${PREFIX}/etc/mke2fs.conf ] || \
		${CP} -p ${PREFIX}/etc/mke2fs.conf.dist \
			${PREFIX}/etc/mke2fs.conf
.endif

.include <bsd.port.post.mk>
