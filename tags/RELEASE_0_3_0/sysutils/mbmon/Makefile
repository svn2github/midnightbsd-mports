# $MidnightBSD: mports/sysutils/mbmon/Makefile,v 1.1 2007/02/23 20:54:40 laffer1 Exp $

PORTNAME?=	mbmon
PORTVERSION=	205
PORTREVISION?=	4
CATEGORIES=	sysutils
MASTER_SITES=	http://www.nt.phys.kyushu-u.ac.jp/shimizu/download/xmbmon/
DISTNAME=	xmbmon${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	A tty motherboard monitor for LM78/79, W8378x, AS99127F, VT82C686 and ADM9240
LICENSE=	bsd2

ONLY_FOR_ARCHS=	i386 amd64
GNU_CONFIGURE=	yes

MAKE_ARGS=	PROGRAM="${PORTNAME}"

PLIST_FILES+=	bin/${PORTNAME}
MAN1?=		mbmon.1
PORTDOCS=	ChangeLog ChangeLog.jp ReadMe ReadMe.jp ReadMe.tech

OPTIONS=	SMB "enable smb(4) support" on

.if ${PORTNAME} == "mbmon"
USE_RC_SUBR=	mbmon.sh
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's+/usr/share/doc/mbmon+${DOCSDIR}+' ${WRKSRC}/mbmon.1
.if !defined(WITHOUT_SMB)
	@${REINPLACE_CMD} -e 's/^DEFS=/&-DSMBUS_IOCTL /' ${WRKSRC}/Makefile.in
.endif

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${CHMOD} u+s ${PREFIX}/bin/${PORTNAME}
	${INSTALL_MAN} ${MAN1:S|^|${WRKSRC}/|} ${PREFIX}/man/man1
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
