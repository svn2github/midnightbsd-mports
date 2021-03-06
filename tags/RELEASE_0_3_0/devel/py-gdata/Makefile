# $MidnightBSD: mports/devel/py-gdata/Makefile,v 1.1 2009/12/29 02:44:40 laffer1 Exp $

PORTNAME=	gdata
PORTVERSION=	2.0.4
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GData Python Client Library
LICENSE=	apache2

PROJECTHOST=	gdata-python-client
USE_PYTHON=	yes
USE_PYDISTUTILS=	yes

# optional modules (see src/gdata/tlslite/utils/cryptomath.py)
#OPTIONS=	M2CRYPTO "Add cryptography and SSL toolkit for Python" off \
#	PYCRYPTO "Add cryptography toolkit for Python" off \
#	GMPY "Add multiprecision arithmetic for Python" off

EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 250
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/elementtree/__init__.py:${PORTSDIR}/devel/py-elementtree
.endif

# avoid warning with Python > 2.5
.if ${PYTHON_REL} > 250
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-src_atom-mock_service.py \
		${FILESDIR}/extra-patch-src_gdata_tlslite-mathls.py \
		${FILESDIR}/extra-patch-src_gdata_tlslite-messages.py \
		${FILESDIR}/extra-patch-src_gdata_tlslite-TLSRecordLayer.py \
		${FILESDIR}/extra-patch-src_gdata_tlslite_utils-cryptomath.py \
		${FILESDIR}/extra-patch-src_gdata_tlslite_utils-jython_compat.py
.endif

.if defined(WITH_M2CRYPTO)
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/M2Crypto/__init__.py:${PORTSDIR}/security/py-m2crypto
.endif
.if defined(WITH_PYCRYPTO)
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/Crypto/__init__.py:${PORTSDIR}/security/py-pycrypto
.endif
.if defined(WITH_GMPY)
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/gmpy.so:${PORTSDIR}/math/py-gmpy
.endif

.if !defined(NOPORTEXAMPLES)
post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/samples/ ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
