# $MidnightBSD$
#
# This port is self contained in the src directory.

PORTNAME=	portlint
PORTVERSION=	2.15.4
CATEGORIES=	ports-mgmt
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verifier for mports directory

LICENSE=	unknown

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/src
USE_PERL5_RUN=	yes

SRC=		${.CURDIR}/src

PLIST_FILES=	bin/portlint \
		man/man1/portlint.1.gz

.if !defined(NOPORTEXAMPLES)
PLIST_FILES+=	%%EXAMPLESDIR%%/portlintgrep
PLIST_DIRS=	%%EXAMPLESDIR%%
.endif

do-fetch:
	@${DO_NADA}

pre-patch:
	@${CP} -R ${SRC} ${WRKDIR}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' ${WRKSRC}/portlint.pl
	@${REINPLACE_CMD} -e 's|/usr/bin/perl|${PERL}|' \
		${WRKSRC}/portlintgrep.pl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/portlint.pl ${TARGETDIR}/bin/portlint
	${INSTALL_MAN} ${WRKSRC}/portlint.1 ${MAN1PREFIX}/man/man1
.if !defined(NOPORTEXAMPLES)
	${INSTALL} -o ${SHAREOWN} -g ${SHAREGRP} -m ${BINMODE} -d ${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/portlintgrep.pl ${EXAMPLESDIR}/portlintgrep
.endif

.include <bsd.port.mk>
