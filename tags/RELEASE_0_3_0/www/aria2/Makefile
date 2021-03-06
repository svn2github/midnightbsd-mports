# $MidnightBSD: mports/www/aria2/Makefile,v 1.9 2010/05/28 23:08:40 laffer1 Exp $

PORTNAME=	aria2
PORTVERSION=	1.9.3
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/stable/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another download tool
LICENSE=	gpl2

CONFIGURE_ARGS=	--with-libintl-prefix=${LOCALBASE} --with-openssl \
		--with-libxml2 --without-gnutls --without-libares \
		--without-libcares --program-transform-name="" \
		--with-libz --enable-bittorrent --with-sqlite3 \
		--enable-metalink --disable-epoll --enable-threads=pth

USE_BZIP2=	yes
USE_GNOME=	gnomehack libxml2
USE_GETTEXT=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

.ifdef WITHOUT_NLS
CONFIGURE_ARGS+=	--disable-nls
.else
LINGUAS=	bg ca da de el en@boldquot en@quot es fi fr he hu id it ja \
		nl nn pl pt pt_BR ru sk sr sv th tr uk vi zh_CN zh_TW
.endif

PLIST_FILES=	bin/aria2c \
		${LINGUAS:S|^|share/locale/|:S|$|/LC_MESSAGES/aria2.mo|} \
		share/doc/aria2/xmlrpc/aria2mon \
		share/doc/aria2/xmlrpc/aria2rpc \
		share/doc/aria2/xmlrpc/README.txt

PLIST_DIRS=	share/doc/aria2/xmlrpc \
		share/doc/aria2

MAN1=		aria2c.1

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 3000
BROKEN=		Does not compile on MidnightBSD 0.2
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^install-data-am:/s|install-dist_docDATA||'\
		${WRKSRC}/Makefile.in ${WRKSRC}/doc/Makefile.in

post-configure:
	@${REINPLACE_CMD} -e '/SETMODE/d' ${WRKSRC}/config.h

.include <bsd.port.post.mk>
