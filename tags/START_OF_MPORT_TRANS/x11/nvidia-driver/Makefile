# New ports collection makefile for:	nvidia-driver
# Date created:				4 December 2002
# Whom:					Stijn Hoop <stijn@win.tue.nl>
#
# $MidnightBSD: mports/x11/nvidia-driver/Makefile,v 1.4 2007/03/14 21:09:35 laffer1 Exp $
# $FreeBSD: ports/x11/nvidia-driver/Makefile,v 1.56 2007/02/26 11:29:34 danfe Exp $
#

PORTNAME=	nvidia-driver
PORTVERSION=	1.0.${NVVERSION}
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_NVIDIA}
MASTER_SITE_SUBDIR=	freebsd/1.0-${NVVERSION}
DISTNAME=	NVIDIA-FreeBSD-x86-${PORTVERSION:S/0./0-/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NVidia graphics card binary drivers for hardware OpenGL rendering

ONLY_FOR_ARCHS=	i386

USE_X_PREFIX=	yes
NO_PACKAGE=	should be recompiled for a particular BSD kernel
USE_LDCONFIG=	yes
SUB_FILES+=	pkg-message
DOCSDIR=	${PREFIX}/share/doc/NVIDIA_GLX-1.0

OPTIONS=	FREEBSD_AGP	"Use BSD AGP GART driver" off \
		VM86_INT10CALL	"Use VM86 interface for video BIOS calls" off \
		ACPI		"Enable support for ACPI Power Management" off \
		LINUX		"Build with support for Linux compatibility" on

# Starting with version 7667, NVidia has dropped support for numerous
# "legacy" GPUs.  One can, however, build the port with specific NVVERSION
# value set.  Currently supported "legacy" values are 7184 and 9631.
# Consult NVidia README (Appendix A) to find out whether you need to use
# legacy driver version.  Alternatively, you can install corresponding
# `x11/nvidia-driver-XXXX' slave port, where XXXX == needed ${NVVERSION}.
#
NVVERSION?=	9746			# The latest version to date

.if ${NVVERSION} == 7184
EXTRA_PATCHES+=	${FILESDIR}/6113-patch-lib::Makefile
.else
EXTRA_PATCHES+=	${FILESDIR}/7667-* \
		${FILESDIR}/crash-patch-by-zander-1759235
.endif

LIB_DEPENDS+=	m.3:${PORTSDIR}/misc/compat5x

.include <bsd.port.pre.mk>

# XXX Should use ${PKG_INFO} XXX
#
XSERVVERSION!=	/usr/sbin/pkg_info -O x11-servers/XFree86-4-Server 2>/dev/null | ${GREP} Server- || /usr/sbin/pkg_info -O x11-servers/xorg-server 2>/dev/null | ${GREP} server- || true
XLIBVERSION!=	/usr/sbin/pkg_info -O x11/XFree86-4-libraries 2>/dev/null | ${GREP} libraries- || /usr/sbin/pkg_info -O x11/xorg-libraries 2>/dev/null | ${GREP} libraries- || true

PLIST_SUB+=	XSERVVERSION=${XSERVVERSION} XLIBVERSION=${XLIBVERSION} \
		LINUXBASE=${LINUXBASE} NVVERSION=${NVVERSION}

.if !defined(WITHOUT_LINUX)
# Add explicit X11 libraries dependency since USE_LINUX causes the port to
# RUN_DEPEND on the Linux libraries rather than LIB_DEPEND on native ones
LIB_DEPENDS+=	X11.6:${X_LIBRARIES_PORT}
USE_LINUX=	yes
PLIST_SUB+=	LINUX=""
.else
PLIST_SUB+=	LINUX="@comment "
# Propagate WITHOUT_LINUX variable down to inner Makefiles
MAKE_ENV+=	WITHOUT_LINUX=yes
.endif

post-patch: .SILENT
# We should support -CURRENT: kill the check
.if ${NVVERSION} >= 7174
	${REINPLACE_CMD} '24,26d' ${WRKSRC}/src/nv-freebsd.h
.endif
	${REINPLACE_CMD} '/bus_memio\.h/d' ${WRKSRC}/src/nv-freebsd.h
.if defined(WITH_FREEBSD_AGP)
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_OS_AGP)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITH_VM86_INT10CALL)
	${REINPLACE_CMD} -E 's/undef (NV_USE_OS_VM86_INT10CALL)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITH_ACPI)
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_ACPI_PM)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITHOUT_LINUX)
	${REINPLACE_CMD} -E 's/define (NV_SUPPORT_LINUX_COMPAT)/undef \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if ${NVVERSION} < 9746
	${REINPLACE_CMD} -E 's/(extension).*/\1/' ${WRKSRC}/x11/Makefile
.else
	${REINPLACE_CMD} -E 's/(lib).*/\1/' ${WRKSRC}/x11/Makefile
.endif
	${REINPLACE_CMD} '/bin/d ; /man/d' ${WRKSRC}/x11/Makefile

post-install:
# pkg-plist is already overbloated, so use this hack instead of PLIST_SUB's
.if ${NVVERSION} < 8174
	@${REINPLACE_CMD} '/libnvidia-cfg/d ; /html/d' ${TMPPLIST}
.else
	@${REINPLACE_CMD} '/README\.Linux/d ; /nvidia_drv\.o/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 9746
	@${REINPLACE_CMD} '/wfb/d ; /chapter-10/d' ${TMPPLIST}
.endif
	${LN} -sf libXvMCNVIDIA.so.1 ${PREFIX}/lib/libXvMCNVIDIA_dynamic.so.1
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
