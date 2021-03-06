# $MidnightBSD$

PORTNAME=	psycopg2
PORTVERSION=	2.5.3
CATEGORIES=	databases python
MASTER_SITES=	http://initd.org/psycopg/tarballs/PSYCOPG-2-5/ \
		CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance Python adapter for PostgreSQL

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_PGSQL=		yes
USE_PYTHON=		yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

DOCSDIR=	${PREFIX}/share/doc/py-psycopg2
EXAMPLESDIR=	${PREFIX}/share/examples/py-psycopg2

PORTEXAMPLES=	binary.py copy_from.py copy_to.py cursor.py dialtone.py \
		dict.py dt.py encoding.py fetch.py lastrowid.py lobject.py \
		mogrify.py myfirstrecipe.py notify.py simple.py somehackers.jpg \
		threads.py typecast.py tz.py usercast.py whereareyou.jpg

PORTDOCS=	AUTHORS INSTALL README NEWS PKG-INFO

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${PORTEXAMPLES:S,^,${WRKSRC}/examples/,} ${EXAMPLESDIR}

	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}

.include <bsd.port.mk>
