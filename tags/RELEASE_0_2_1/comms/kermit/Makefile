# New ports collection makefile for:	kermit
# Date created:		Oct 27, 1994
# Whom:			pst
#
# $MidnightBSD$
# $FreeBSD: ports/comms/kermit/Makefile,v 1.38 2007/04/14 16:20:45 gabor Exp $
#

PORTNAME=	kermit
PORTVERSION=	8.0.211
CATEGORIES=	comms
MASTER_SITES=	ftp://kermit.columbia.edu/kermit/archives/ \
		ftp://ftp.icm.edu.pl/pub/kermit/archives/
DISTNAME=	cku211

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Serial and network communications package
LICENSE=	other

USE_OPENSSL=	yes
NO_WRKSUBDIR=	yes
MAN1=		kermit.1

MAKEFILE=	makefile
ALL_TARGET=	krbmit

MAKE_ARGS=	KTARGET=freebsd CC="${CC}" CC2="${CC}" \
		CFLAGS="${CFLAGS} -I${OPENSSLINC} \
		-DBSD44 -DCK_NCURSES -DCK_NEWTERM \
		-DTCPSOCKET -DNOCOTFMC -DFREEBSD4 -DUSE_UU_LOCK -DFNFLOAT \
		-funsigned-char -DTPUTSARGTYPE=int -DUSE_STRERROR -DCKHTTP \
		-DCK_SSL -DCK_AUTHENTICATION -DCK_ENCRYPTION -DCK_DES \
		-DOPENSSL_DES_LIBDES_COMPATIBILITY -DOPENSSL_097" \
		LIBS="-L${OPENSSLLIB} \
		-lssl -lcrypto -lncurses -lcrypt -lutil -lm"

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/krbmit ${PREFIX}/bin/kermit
	${INSTALL_MAN} ${WRKSRC}/ckuker.nr ${PREFIX}/man/man1/kermit.1
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ckaaaa.txt ${DOCSDIR}/READ.ME
	@for file in COPYING.TXT ckcbwr.txt ckccfg.txt ckcplm.txt \
	    ckermit70.txt ckermit80.txt ckubwr.txt ckuins.txt ckututor.txt; \
	do \
	    ${ECHO} "Installing ${DOCSDIR}/$${file} ..." ; \
	    ${INSTALL_DATA} ${WRKSRC}/$${file} ${DOCSDIR}; \
	done
.endif
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/ckermit.ini ${EXAMPLESDIR}/dot.kermrc
	${INSTALL_DATA} ${WRKSRC}/ckermod.ini ${EXAMPLESDIR}/dot.mykermrc

.include <bsd.port.mk>
