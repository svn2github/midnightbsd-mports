# $MidnightBSD: mports/net-mgmt/p5-Cflow/Makefile,v 1.2 2007/06/06 18:43:16 ctriv Exp $

PORTNAME=	Cflow
PORTVERSION=	1.053
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://net.doit.wisc.edu/~plonka/Cflow/ \
		http://net.doit.wisc.edu/~plonka/Cflow/old/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analyze raw flow files written by cflowd (Cisco NetFlow data)
LICENSE=	gpl2

OPTIONS=	FLOW_TOOLS	"Enable flow-tools support"	off

.include <bsd.port.pre.mk>

.if defined(WITH_FLOW_TOOLS)
BUILD_DEPENDS+=	${LOCALBASE}/lib/libft.a:${PORTSDIR}/net-mgmt/flow-tools
RUN_DEPENDS+=	${LOCALBASE}/lib/libft.a:${PORTSDIR}/net-mgmt/flow-tools

CFLAGS+=	-I${LOCALBASE}/include -DOSU
CONFIGURE_ARGS+=	\
	"LDDLFLAGS= -shared -L${LOCALBASE}/lib -lft -lz" \
	"INC= -I${LOCALBASE}/include" "LDLOADLIBS= -L${LOCALBASE}/lib -lft -lz"
.endif
PERL_CONFIGURE=	YES

MAN1=		flowdumper.1
MAN3=		Cflow.3

.include <bsd.port.post.mk>
