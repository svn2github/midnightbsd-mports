# New ports collection makefile for:	p5-Cflow
# Date created:			Di  13 M�r 2001 19:37:25 CET
# Whom:				Andreas Klemm <andreas@klemm.gtn.com>
#
# $FreeBSD: ports/net-mgmt/p5-Cflow/Makefile,v 1.13 2006/02/15 09:58:12 ehaupt Exp $
# $MidnightBSD: mports/net-mgmt/p5-Cflow/Makefile,v 1.1 2006/12/26 00:54:50 laffer1 Exp $
#

PORTNAME=	Cflow
PORTVERSION=	1.053
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://net.doit.wisc.edu/~plonka/Cflow/ \
		http://net.doit.wisc.edu/~plonka/Cflow/old/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analyze raw flow files written by cflowd (Cisco NetFlow data)
LICENSE=	gpl2

.if defined(WITH_FLOW_TOOLS)
RUN_DEPENDS+=	${LOCALBASE}/lib/libft.a:${PORTSDIR}/net-mgmt/flow-tools

CFLAGS+=	-I${LOCALBASE}/include -DOSU
CONFIGURE_ARGS+=	\
	"LDDLFLAGS= -shared -L${LOCALBASE}/lib -lft -lz" \
	"INC= -I${LOCALBASE}/include" "LDLOADLIBS= -L${LOCALBASE}/lib -lft -lz"
.endif
PERL_CONFIGURE=	YES

MAN1=		flowdumper.1
MAN3=		Cflow.3

.include <bsd.port.mk>
