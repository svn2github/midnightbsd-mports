# $MidnightBSD: mports/java/bouncycastle/Makefile,v 1.1 2006/10/06 02:36:03 laffer1 Exp $

PORTNAME=	bouncycastle
PORTVERSION=	1.33
CATEGORIES=	java security
MASTER_SITES=	http://www.bouncycastle.org/download/ \
		http://polydistortion.net/bc/download/ \
		http://bouncycastle.gva.es/download/
DISTNAME=	crypto-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cleanroom build of Java Cryptography Extensions
LICENSE=	mit

NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.4+
JDKMVERSION=	${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1\2/}
DISTVERSION=	${PORTVERSION:S/.//}

JARS=		bcprov bcmail bctsp bcpg bctest

PORTDOCS=	*

do-install:
.for jar in ${JARS}
	${INSTALL_DATA} ${WRKSRC}/jars/${jar}-jdk${JDKMVERSION}-${DISTVERSION}.jar \
	      ${JAVAJARDIR}/${jar}.jar
.endfor
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
