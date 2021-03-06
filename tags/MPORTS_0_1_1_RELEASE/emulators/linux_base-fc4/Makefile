# New ports collection makefile for:	linux_base-fc4
# Date created:				2006-31-05
# Whom:					bsam@ipt.ru
# based on ports/emulators/linux_base-fc3 by netchild and myself
#
# $MidnightBSD: mports/emulators/linux_base-fc4/Makefile,v 1.7 2007/05/25 18:53:38 laffer1 Exp $
# $FreeBSD: ports/emulators/linux_base-fc4/Makefile,v 1.19 2006/08/18 17:02:37 bsam Exp $
#

PORTNAME=		fc
PORTVERSION=		4
PORTREVISION=		9
CATEGORIES=		emulators linux
MASTER_SITES=		${MASTER_SITE_FEDORA_LINUX}
MASTER_SITE_SUBDIR=	${PORTVERSION}/${LINUX_RPM_ARCH}/os/Fedora/RPMS \
			updates/${PORTVERSION}/${LINUX_RPM_ARCH} \
			${PORTVERSION}/SRPMS \
			updates/${PORTVERSION}/SRPMS
PKGNAMEPREFIX=		linux_base-
DISTFILES=		${BIN_DISTFILES} ${SRC_DISTFILES}
DIST_SUBDIR=		rpm/${LINUX_RPM_ARCH}/fedora/${PORTVERSION}
EXTRACT_ONLY=		${BIN_DISTFILES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Base set of packages needed in Linux mode (for i386/amd64)

USE_GCPIO=	yes

# We supply the mtree, so we can't use it.
NO_MTREE=	yes

BIN_DISTFILES=	basesystem-8.0-5.noarch.rpm \
		bash-3.0-31.${LINUX_RPM_ARCH}.rpm \
		bzip2-1.0.2-16.${LINUX_RPM_ARCH}.rpm \
		bzip2-libs-1.0.2-16.${LINUX_RPM_ARCH}.rpm \
		compat-db-4.2.52-3.fc4.${LINUX_RPM_ARCH}.rpm \
		compat-libstdc++-296-2.96-132.fc4.${LINUX_RPM_ARCH}.rpm \
		compat-libstdc++-33-3.2.3-47.fc4.${LINUX_RPM_ARCH}.rpm \
		coreutils-5.2.1-48.1.${LINUX_RPM_ARCH}.rpm \
		db4-4.3.27-5.fc4.${LINUX_RPM_ARCH}.rpm \
		e2fsprogs-1.38-0.FC4.1.${LINUX_RPM_ARCH}.rpm \
		elfutils-libelf-0.108-1.${LINUX_RPM_ARCH}.rpm \
		fedora-release-4-2.noarch.rpm \
		filesystem-2.3.4-1.${LINUX_RPM_ARCH}.rpm \
		freetype-2.1.9-2.${LINUX_RPM_ARCH}.rpm \
		gdbm-1.8.0-25.${LINUX_RPM_ARCH}.rpm \
		glib-1.2.10-16.${LINUX_RPM_ARCH}.rpm \
		glibc-2.3.6-3.${LINUX_RPM_ARCH}.rpm \
		glibc-common-2.3.6-3.${LINUX_RPM_ARCH}.rpm \
		grep-2.5.1-48.2.${LINUX_RPM_ARCH}.rpm \
		info-4.8-8.fc4.2.${LINUX_RPM_ARCH}.rpm \
		krb5-libs-1.4.1-5.${LINUX_RPM_ARCH}.rpm \
		libacl-2.2.32-1.FC4.2.${LINUX_RPM_ARCH}.rpm \
		libattr-2.4.24-1.FC4.1.${LINUX_RPM_ARCH}.rpm \
		libgcc-4.0.2-8.fc4.${LINUX_RPM_ARCH}.rpm \
		libselinux-1.23.11-1.1.${LINUX_RPM_ARCH}.rpm \
		libstdc++-4.0.2-8.fc4.${LINUX_RPM_ARCH}.rpm \
		libtermcap-2.0.8-41.${LINUX_RPM_ARCH}.rpm \
		ncurses-5.4-19.fc4.${LINUX_RPM_ARCH}.rpm \
		pcre-5.0-4.1.fc4.${LINUX_RPM_ARCH}.rpm \
		popt-1.10.1-23.${LINUX_RPM_ARCH}.rpm \
		readline-5.0-3.${LINUX_RPM_ARCH}.rpm \
		rpm-4.4.1-23.${LINUX_RPM_ARCH}.rpm \
		setserial-2.17-19.${LINUX_RPM_ARCH}.rpm \
		setup-2.5.44-1.1.noarch.rpm \
		slang-1.4.9-17.${LINUX_RPM_ARCH}.rpm \
		termcap-5.4-7fc4.noarch.rpm \
		zlib-1.2.2.2-5.fc4.${LINUX_RPM_ARCH}.rpm

.if defined(PACKAGE_BUILDING)

SRC_DISTFILES+=	acl-2.2.32-1.FC4.2.src.rpm \
		attr-2.4.24-1.FC4.1.src.rpm \
		basesystem-8.0-5.src.rpm \
		bash-3.0-31.src.rpm \
		bzip2-1.0.2-16.src.rpm \
		compat-db-4.2.52-3.fc4.src.rpm \
		coreutils-5.2.1-48.1.src.rpm \
		db4-4.3.27-5.fc4.src.rpm \
		e2fsprogs-1.38-0.FC4.1.src.rpm \
		elfutils-0.108-1.src.rpm \
		fedora-release-4-2.src.rpm \
		filesystem-2.3.4-1.src.rpm \
		freetype-2.1.9-2.src.rpm \
		gcc-4.0.2-8.fc4.src.rpm \
		gdbm-1.8.0-25.src.rpm \
		glib-1.2.10-16.src.rpm \
		glibc-2.3.6-3.src.rpm \
		grep-2.5.1-48.2.src.rpm \
		krb5-1.4.1-5.src.rpm \
		libselinux-1.23.11-1.1.src.rpm \
		libtermcap-2.0.8-41.src.rpm \
		ncurses-5.4-19.fc4.src.rpm \
		pcre-5.0-4.1.fc4.src.rpm \
		readline-5.0-3.src.rpm \
		rpm-4.4.1-23.src.rpm \
		setserial-2.17-19.src.rpm \
		setup-2.5.44-1.1.src.rpm \
		slang-1.4.9-17.src.rpm \
		termcap-5.4-7fc4.src.rpm \
		zlib-1.2.2.2-5.fc4.src.rpm

ALWAYS_KEEP_DISTFILES=	yes
.endif

CONFLICTS=		linux_base-7* linux_base-deb* linux_base-gentoo* \
			linux_base-rh-9* linux_base-suse-9* linux_base-8* \
			linux_base-fc3 linux_locale*
ONLY_FOR_ARCHS=		i386 amd64
LINUX_RPM_ARCH=		i386
USE_LINUX_PREFIX=	yes
NO_FILTER_SHLIBS=	yes
MD5_FILE?=		${MASTERDIR}/distinfo.${LINUX_RPM_ARCH}
PLIST_SUB=		GLIBCVER="2.3.6"

RPM2CPIO?=		${LOCALBASE}/bin/rpm2cpio

EXTRACT_DEPENDS+=	${RPM2CPIO}:${PORTSDIR}/archivers/rpm

EXTRACT_ONLY=		${BIN_DISTFILES}
EXTRACT_CMD?=		${RPM2CPIO}
EXTRACT_BEFORE_ARGS?=
EXTRACT_AFTER_ARGS?=	| ${CPIO} -id --quiet

PLIST=			pkg-plist

.include <bsd.port.pre.mk>

REMOVE_DIRS=		boot dev home initrd root tmp var/log var/run var/tmp \
			usr/local usr/tmp
REMOVE_FILES=		bin/df bin/su etc/exports etc/group etc/localtime \
			etc/motd etc/passwd etc/printcap etc/services \
			etc/protocols
ADD_FILES=		var/lib/rpm/packages.rpm \
			var/lib/rpm/nameindex.rpm \
			var/lib/rpm/fileindex.rpm \
			var/lib/rpm/providesindex.rpm \
			var/lib/rpm/requiredby.rpm \
			var/lib/rpm/conflictsindex.rpm \
			var/lib/rpm/groupindex.rpm \
			var/lib/rpm/triggerindex.rpm

.if (${MACHINE_ARCH} == "amd64")
FALLBACK_ELF_MIB=	kern.elf32.fallback_brand
.else
FALLBACK_ELF_MIB=	kern.fallback_elf_brand
.endif

.if (${ARCH} == "amd64")
LATEST_LINK:=		${LATEST_LINK:C/linux/linux32/}
ARCH=			i386
.endif

pre-extract:
	@${MKDIR} ${WRKSRC}

do-extract:
	@for file in ${EXTRACT_ONLY}; do \
		if !(cd ${WRKSRC} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/${DIST_SUBDIR}/$$file ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done 
	@if [ `${ID} -u` = 0 ]; then \
		${CHMOD} -R ug-s ${WRKDIR}; \
		${CHOWN} -R 0:0 ${WRKDIR}; \
	fi
	

do-build:
	@for D in ${REMOVE_DIRS}; do \
		${RM} -rf ${WRKSRC}/$$D; \
	done
	@for F in ${REMOVE_FILES}; do \
		${RM} -f ${WRKSRC}/$$F; \
	done
	@for F in ${ADD_FILES}; do \
		${TOUCH} ${WRKSRC}/$$F; \
	done
#
# Create a good ld.so.conf and touch ld.so.cache
#
	@${ECHO_CMD} -e '/lib\n/usr/lib\n${X11BASE}/lib' >> \
		${WRKSRC}/etc/ld.so.conf
	@${TOUCH} ${WRKSRC}/etc/ld.so.cache
#
# Create yp.conf as a hint to NIS users and make sure there's a
# mtab in etc, albeit an empty one. This is needed in a couple of
# cases. Most notably staroffice6. If yp.conf exists install only
# yp.conf.sample
#
	@${INSTALL} ${COPY} -m 644 ${FILESDIR}/yp.conf.sample ${WRKSRC}/etc
	@${TOUCH} ${WRKSRC}/etc/mtab
#
# If ${PREFIX}/etc/nsswitch.conf exists, don't touch it,
# install only ${PREFIX}/etc/nsswitch.conf.dist
#
	@${MV} ${WRKSRC}/etc/nsswitch.conf ${WRKSRC}/etc/nsswitch.conf.dist
	@${MV} ${WRKSRC}/etc/krb5.conf ${WRKSRC}/etc/krb5.conf.dist

# Fix usr/bin/*db4* permissions to allow "portupgrade -s"
	@${CHMOD} u+w ${WRKSRC}/usr/bin/*db4*

	@${FIND} ${WRKSRC}/bin ${WRKSRC}/sbin/ ${WRKSRC}/usr/bin \
		${WRKSRC}/usr/sbin -type f -print0 | ${XARGS} -0 ${FILE} \
		| ${GREP} ELF | ${CUT} -d : -f 1 \
		| ${XARGS} ${BRANDELF} -t Linux
	@${BRANDELF} -t Linux ${WRKSRC}/lib/ld-2.3.6.so

# Restore the status quo for usr/bin/*db4* files
	@${CHMOD} u-w ${WRKSRC}/usr/bin/*db4*

do-install:
#
# Do install without using linux rpm system
#
	@cd ${WRKSRC}/usr/lib && ln -fs libstdc++-2-libc6.1-1-2.9.0.so libstdc++-libc6.1-1.so.2
	@cd ${WRKSRC} && ${FIND} * -type d -exec ${MKDIR} "${PREFIX}/{}" \;
	@cd ${WRKSRC} && ${FIND} * ! -type d \
		| ${CPIO} -pm -R root:wheel ${PREFIX}

	@${LN} -sf /var/tmp ${PREFIX}/usr/tmp
	@${CHOWN} root:wheel ${PREFIX}/var/lock ${PREFIX}/var/spool/mail
	@${CHMOD} 755 ${PREFIX}/var/lock ${PREFIX}/var/spool/mail



post-install:
	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/etc/mtree
	${INSTALL_DATA} ${FILESDIR}/bsd.linux-compat.mtree ${FAKE_DESTDIR}${LOCALBASE}/etc/mtree



.include <bsd.port.post.mk>
