# $MidnightBSD: mports/textproc/expat2/Makefile,v 1.7 2009/12/14 01:19:35 laffer1 Exp $

PORTNAME=	expat
PORTVERSION=	2.0.1
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML 1.0 parser written in C
LICENSE=	other

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.1
ALL_TARGET=	default
USE_LDCONFIG=	yes
MAN1=		xmlwf.1

SHLIB_MAJOR=	6

MAKE_ENV=	LIBCURRENT="${SHLIB_MAJOR}" \
		SHELL="/bin/sh"
PLIST_SUB=	SHLIB_MAJOR="${SHLIB_MAJOR}"

list-depend-ports:
	cd ${PORTSDIR}; \
	${FIND} . -mindepth 3 -maxdepth 3 -name Makefile -execdir ${SH} -c \
		'${FIND} . -type f | ${GREP} -v CVS | ${XARGS} ${GREP} -q expat.5' \; \
		-print

.include <bsd.port.mk>
