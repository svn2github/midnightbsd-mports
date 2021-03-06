# $MidnightBSD: mports/www/cherokee/Makefile,v 1.13 2010/12/03 22:47:13 laffer1 Exp $

PORTNAME=	cherokee
PORTVERSION=	1.0.6
CATEGORIES=	www
MASTER_SITES=	http://www.cherokee-project.com/download/1.0/${PORTVERSION}/ \
		http://cherokee.osuosl.org/1.0/${PORTVERSION}/ \
		http://mirror.its.uidaho.edu/pub/cherokee/1.0/\${PORTVERSION}/ \
		http://www.gtlib.gatech.edu/pub/cherokee/1.0/\${PORTVERSION}/ \
		ftp://mirrors.secution.com/cherokee/1.0/${PORTVERSION}/ \
		ftp://ftp.easynet.be/cherokee/1.0/${PORTVERSION}/ \
		http://ftp.heanet.ie/mirrors/cherokee/1.0/${PORTVERSION}/ \
		http://www.ftp.ne.jp/infosystems/cherokee/1.0/${PORTVERSION}/ \
		http://www.ring.gr.jp/archives/net/cherokee/1.0/${PORTVERSION}/ \
		http://ftp.nluug.nl/pub/internet/cherokee/1.0/${PORTVERSION}/ \
		http://ftp.surfnet.nl/pub/internet/cherokee/1.0/${PORTVERSION}/ \
		http://mirror.is.co.za/mirrors/cherokee/1.0/${PORTVERSION}/ \
		http://mirror.aarnet.edu.au/pub/cherokee/1.0/\${PORTVERSION}/ \
		http://ftp.ntua.gr/pub/www/cherokee/1.0/\${PORTVERSION}/ \
		http://ftp.cc.uoc.gr/mirrors/cherokee/1.0/\${PORTVERSION}/ \
		http://cherokee.mirror.garr.it/mirrors/cherokee/1.0/\${PORTVERSION}/ \
		http://ftp.yz.yamagata-u.ac.jp/pub/network/cherokee/1.0/\${PORTVERSION}/ \
		http://ftp.icm.edu.pl/packages/cherokee/1.0/\${PORTVERSION}/ \
		ftp://download.srv.ro/pub/cherokee/1.0/\${PORTVERSION}/ \
		http://mirror.yandex.ru/mirrors/cherokee-project.com/1.0/\${PORTVERSION}/ \
		http://cherokee.hyperial.com/1.0/\${PORTVERSION}/ \
		http://cherokee.labs.itb.ac.id/1.0/\${PORTVERSION}/ \
		http://mirror.cpsc.ucalgary.ca/mirror/cherokee/1.0/\${PORTVERSION}/ \
		http://www.feel3.de/mirrors/cherokee/1.0/\${PORTVERSION}/ \
		http://cherokee.pubcrawler.com/1.0/\${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extremely fast and flexible web server
LICENSE=	gpl2

USE_GNOME=	gnomehack gnometarget pkgconfig
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
USE_GETTEXT=	yes
USE_RC_SUBR=	cherokee.sh
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--with-wwwroot=${PREFIX}/www/cherokee \
		--localstatedir=/var \
		--disable-static
DEFCONFS=	cherokee.conf
CONFSUBDIRS=	ssl mods-available mods-enabled sites-available sites-enabled
MAN1=		cget.1 cherokee-config.1 cherokee.1 cherokee-admin.1 \
		cherokee-tweak.1 cherokee-worker.1
PORTDOCS=	*

OPTIONS=	WWWUSER	"Run as www:www user"	on \
		IPV6	"IPv6 support"	on	\
		MYSQL	"MySQL Database"	off	\
		LDAP	"LDAP Support"	off	\
		GEOIP	"GeoIP Support (recommended)"	on	\
		FFMPEG	"FFMpeg Support"	off	\
		NLS	"NLS Support"	on	\
		INTPCRE	"Use Internal PCRE Library"	off	\
		ADMIN	"Build the Admin Interface"	on \
		RRDTOOL "Usage Graphs Support"  off

.include <bsd.mport.options.mk>

.ifdef WITH_ADMIN
USE_PYTHON=	2.4+
PLIST_SUB+=	ADMIN=""
.else
CONFIGURE_ARGS+=--disable-admin
PLIST_SUB+=	ADMIN="@comment "
.endif

.include <bsd.port.pre.mk>

.ifdef WITH_WWWUSER
CONFIGURE_ARGS+=	--with-wwwuser=www --with-wwwgroup=www
.endif

.ifdef WITHOUT_IPV6
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.ifdef WITH_MYSQL
USE_MYSQL=	yes
CONFIGURE_ARGS+=	--with-mysql=yes
PLIST_SUB+=	MYSQL=""
.else
CONFIGURE_ARGS+=	--with-mysql=no
PLIST_SUB+=	MYSQL="@comment "
.endif

.ifdef WITH_LDAP
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=	--with-ldap=yes
PLIST_SUB+=	LDAP=""
.else
CONFIGURE_ARGS+=	--with-ldap=no
PLIST_SUB+=	LDAP="@comment "
.endif

.ifdef WITH_GEOIP
LIB_DEPENDS+=	GeoIP.5:${PORTSDIR}/net/GeoIP
CONFIGURE_ARGS+=	--with-geoip=yes
PLIST_SUB+=	GEOIP=""
.else
CONFIGURE_ARGS+=	--with-geoip=no
PLIST_SUB+=	GEOIP="@comment "
.endif

.ifdef WITH_FFMPEG
LIB_DEPENDS+=	avformat:${PORTSDIR}/multimedia/ffmpeg \
		avcodec:${PORTSDIR}/multimedia/ffmpeg \
		avutil:${PORTSDIR}/multimedia/ffmpeg
CONFIGURE_ARGS+=	--with-ffmpeg=yes
.else
CONFIGURE_ARGS+=	--with-ffmpeg=no
.endif

.ifdef WITH_NLS
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.ifdef WITH_INTPCRE
CONFIGURE_ARGS+=	--enable-internal-pcre
.else
LIB_DEPENDS+=	pcre.0:${PORTSDIR}/devel/pcre
.endif

.ifdef WITH_RRDTOOL
RUN_DEPENDS+=	rrdtool:${PORTSDIR}/databases/rrdtool
.endif

post-patch:
	@${FIND} ${WRKSRC} -name Makefile.in | ${XARGS} \
		${REINPLACE_CMD} -e 's|@mkdir_p@|${MKDIR} --|g'
	@${REINPLACE_CMD} -e '/cherokee_replace.*%sysconfdir%/d;/^SUBDIRS/s|doc ||;\
		/^install-data-am/s|install-data-local|install-data-local-config|;\
		/^SUBDIRS/s|windows||'\
		${WRKSRC}/Makefile.in
	@for i in ${BUILD_WRKSRC}/*.sample.pre;do ${SED} -e \
		's:%wwwroot%:${PREFIX}/www/cherokee:g; \
		s:%prefix%:${PREFIX}:g; \
		s:%localstatedir%:/var:g' \
		$$i > $${i%.pre};done
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/admin/server.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/05to06.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/06to07.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/07to08.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/08to09.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/09to010.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/011to098.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/098to099.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/0999to09910.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/contrib/tracelor.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/doc/cookbook_dbslayer.html
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/qa/fcgi.py
	@${REINPLACE_CMD} -e 's|/usr/bin/env python|/usr/local/bin/python|' \
		${WRKSRC}/qa/run-tests.py

post-install:
	@${INSTALL} -d ${CONFSUBDIRS:S|^|${PREFIX}/etc/cherokee/|}
	@for i in ${DEFCONFS};do\
		${INSTALL_DATA} ${WRKSRC}/$$i.sample ${PREFIX}/etc/cherokee/$$i.default;done
	@${INSTALL_DATA} ${WRKSRC}/performance.conf.sample ${PREFIX}/etc/cherokee/cherokee.conf.perf_sample
	@:>${PREFIX}/etc/cherokee/mods-enabled/.empty
	@:>${PREFIX}/etc/cherokee/sites-available/.empty
	@:>${PREFIX}/etc/cherokee/sites-enabled/.empty
	@:>${PREFIX}/etc/cherokee/ssl/.empty
	@for i in `${FIND} ${PREFIX}/etc/cherokee/ -name \*.default`;do\
		if [ ! -f $${i%.default} ];then ${CP} $$i $${i%.default};fi;done
	@for i in `${FIND} ${PREFIX}/etc/cherokee/ -name \*.sample`;do\
		if [ ! -f $${i%.sample} ];then ${CP} $$i $${i%.sample};fi;done

.if !defined(NOPORTDOCS)
	@cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${DOCSDIR}
.endif

.ifdef WITH_ADMIN
	@cd ${DATADIR}/admin && ${FIND} . -name "*.py" |\
	${XARGS} ${PYTHON_CMD} ${PYTHON_LIBDIR}/py_compile.py
.endif

.include <bsd.port.post.mk>
