# ex:ts=8
# Ports collection makefile for:	mirmon
# Date created:			May 21 2008
# Whom:				Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/misc/mirmon/Makefile,v 1.1 2008/05/21 21:23:59 laffer1 Exp $
#

PORTNAME=	mirmon
PORTVERSION=	1.38
CATEGORIES=	misc
MASTER_SITES=	http://jadawin.tuxaco.net/freebsd/ \
		http://www.cs.uu.nl/people/henkp/mirmon/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Monitor the status of mirrors
LICENSE=	other
#bsdish

NO_BUILD=	yes
USE_PERL5_RUN=	yes

SUB_FILES=	pkg-message
SUB_LIST=	PREFIX=${PREFIX}

PLIST_FILES=	bin/mirmon

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

post-patch:
	@${REINPLACE_CMD} -e "s,/etc,${LOCALBASE}/etc," \
		-e "s,/sw/bin/perl,/usr/bin/env perl," \
		-e "s,/sw,${LOCALBASE}," \
		${WRKSRC}/mirmon ${WRKSRC}/mirmon.html

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/mirmon ${PREFIX}/bin
	@${MKDIR} ${DATADIR}
	${CP} -R ${WRKSRC}/countries.list ${WRKSRC}/icons ${DATADIR}
	@${FIND} ${DATADIR} ! -type d | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${DATADIR} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${CP} ${WRKSRC}/mirmon.html ${DOCSDIR}
.endif

.include <bsd.port.mk>
