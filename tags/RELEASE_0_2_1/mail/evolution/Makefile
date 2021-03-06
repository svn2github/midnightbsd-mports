# New ports collection makefile for:	evolution
# Date created:				28th June 2000
# Whom:					Ade Lovett <ade@FreeBSD.org>
#
# $MidnightBSD: mports/mail/evolution/Makefile,v 1.6 2008/06/23 18:07:41 laffer1 Exp $
# $FreeBSD: ports/mail/evolution/Makefile,v 1.151 2008/01/08 02:59:45 marcus Exp $
#   $MCom: ports-stable/mail/evolution/Makefile,v 1.1 2007/11/30 21:33:37 marcus Exp $
#

PORTNAME=	evolution
PORTVERSION=	2.22.2
CATEGORIES=	mail gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An integrated mail, calendar and address book distributed suite
LICENSE=	gpl2

LIB_DEPENDS=	nss3.1:${PORTSDIR}/security/nss \
		tasn1.3:${PORTSDIR}/security/libtasn1
RUN_DEPENDS=	${LOCALBASE}/lib/gnome-spell/libgnome-spell-component-0.3.so:${PORTSDIR}/textproc/gnome-spell

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_GETTEXT=	yes
USE_XLIB=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack evolutiondataserver gtkhtml3 \
		desktopfileutils gnomedocutils ltasneededhack
USE_AUTOTOOLS=	libtool:15
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
LDCONFIG_DIRS=	%%PREFIX%%/lib/evolution/%%VERSION%%
CONFIGURE_ARGS=	--enable-nss=yes \
		--enable-mono=no \
		--with-sub-version=" MidnightBSD Port"
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

GCONF_SCHEMAS=	apps-evolution-mail-notification.schemas \
		apps-evolution-mail-prompts-checkdefault.schemas \
		apps_evolution_addressbook.schemas \
		apps_evolution_calendar.schemas \
		apps_evolution_shell.schemas \
		apps-evolution-attachment-reminder.schemas \
		bogo-junk-plugin.schemas \
		evolution-mail.schemas

EVO_VERSION=	2.22
PLIST_SUB=	VERSION=${EVO_VERSION} \
		PORTVERSION=2.12

OPTIONS=	PILOT "Enable Palm Pilot sync support" off \
		LDAP "Enable LDAP support" on \
		SPAMASSASSIN "Enable SpamAssassin spam filtering" off

.include <bsd.port.pre.mk>

USE_LDCONFIG=	${PREFIX}/lib/evolution/${EVO_VERSION}

.if defined(PACKAGE_BUILDING)
WITH_DBUS=	yes
.endif

.if exists(${LOCALBASE}/lib/libdbus-glib-1.so)
WITH_DBUS=	yes
.endif

.if defined(WITH_PILOT)
LIB_DEPENDS+=	gpilotdconduit.2:${PORTSDIR}/palm/gnome-pilot
CONFIGURE_ARGS+=	--with-pisock=${LOCALBASE} \
			--enable-pilot-conduits=yes
PLIST_SUB+=	PILOT:=""
.else
PLIST_SUB+=	PILOT:="@comment "
.endif

.if !defined(WITHOUT_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--with-openldap=${LOCALBASE}
.else
CONFIGURE_ARGS+=--with-openldap=no
.endif

.if defined(WITH_SPAMASSASSIN)
RUN_DEPENDS+=	spamassassin:${PORTSDIR}/mail/p5-Mail-SpamAssassin
.endif

.if defined(WITH_DBUS)
LIB_DEPENDS+=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib
PLIST_SUB+=	DBUS=""
.else
PLIST_SUB+=	DBUS="@comment "
.endif

.if !defined(NO_KERBEROS) && exists(/usr/lib/libkrb5.so)
CONFIGURE_ARGS+=	--with-krb5=/usr
.else
LIB_DEPENDS+=		krb5:${PORTSDIR}/security/heimdal
.if defined(HEIMDAL_HOME)
CONFIGURE_ARGS+=	--with-krb5=${HEIMDAL_HOME} --with-krb5-includes=${HEIMDAL_HOME}/include
.else
CONFIGURE_ARGS+=	--with-krb5=${LOCALBASE}
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^plugins_standard_always/s/audio-inline//' \
	    	${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|stdlib.n|stdlib.h|' \
	    	${WRKSRC}/iconv-detect.c
	@${REINPLACE_CMD} -e 's|/usr|${LOCALBASE}|g' \
		${WRKSRC}/plugins/bogo-junk-plugin/bf-junk-filter.c
	@${REINPLACE_CMD} -e 's|/usr/sbin|${LOCALBASE}/bin|g' \
		${WRKSRC}/plugins/sa-junk-plugin/em-junk-filter.c

post-install: 
	${MKDIR} ${PREFIX}/include/evolution-${EVO_VERSION}/composer
	${INSTALL_DATA} ${WRKSRC}/composer/e-msg*.h ${PREFIX}/include/evolution-${EVO_VERSION}/composer
	${INSTALL_DATA} ${WRKSRC}/composer/Editor.h ${PREFIX}/include/evolution-${EVO_VERSION}/composer

.include <bsd.port.post.mk>
