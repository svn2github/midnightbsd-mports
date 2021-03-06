# $MidnightBSD: mports/math/gnumeric/Makefile,v 1.1 2008/06/05 21:52:13 crash Exp $

PORTNAME=	gnumeric
PORTVERSION=	1.8.4
CATEGORIES=	math gnome
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/${PORTVERSION:R}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNOME 2 spreadsheet
LICENSE=        gpl2

LIB_DEPENDS=	goffice-0.6.6:${PORTSDIR}/devel/goffice \
		psiconv.10:${PORTSDIR}/converters/psiconv

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_PERL5=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix intlhack gnomehack gnomehier \
		libgsf_gnome pygtk2 desktopfileutils libgnomeui
USE_PYTHON=	2.6+
INSTALLS_OMF=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-guile --with-bonobo
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LIBS="-L${LOCALBASE}/lib -liconv ${PTHREAD_LIBS}" \
		python_prog=${PYTHON_VERSION}

GCONF_SCHEMAS=	gnumeric-dialogs.schemas gnumeric-general.schemas \
		gnumeric-plugins.schemas

MAN1=		gnumeric.1 ssconvert.1 ssindex.1

PLIST_SUB=	VERSION=${PORTVERSION}

OPTIONS=	GNOMEDB "Enable libgnomedb support" off

.include <bsd.port.pre.mk>

.if defined(WITH_GNOMEDB)
USE_GNOME+=		libgnomedb
CONFIGURE_ARGS+=	--with-gda
PLIST_SUB+=		GNOMEDB=""
.else
CONFIGURE_ARGS+=	--without-gda
PLIST_SUB+=		GNOMEDB="@comment "
.endif

post-extract:
	@${CP} ${FILESDIR}/gnumeric-C.omf ${WRKSRC}/doc/C

post-patch:
	@${RM} -f ${WRKSRC}/GNOME_Gnumeric.server.in
	@${REINPLACE_CMD} -e 's|gda-3.0 >= 3.1.1|gda-3.0 >= 3.0.1|g' \
		-e 's|gnomedb-3.0 >= 3.0.1|gnomedb-3.0 >= 3.0.0|g' \
		${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/gnumeric.desktop ${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/gnumeric.mime ${PREFIX}/share/mime-info
	@-update-desktop-database
.for dir in share lib
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py ${PREFIX}/${dir}/gnumeric
.endfor

.include <bsd.port.post.mk>
