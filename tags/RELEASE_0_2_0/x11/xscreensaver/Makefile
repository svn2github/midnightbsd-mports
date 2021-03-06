# New ports collection makefile for:    xscreensaver
# Date created:         10 July 1995
# Whom:                 dom@myrddin.demon.co.uk
#
# $MidnightBSD: mports/x11/xscreensaver/Makefile,v 1.13 2008/08/23 21:15:31 laffer1 Exp $
# $FreeBSD: ports/x11/xscreensaver/Makefile,v 1.89 2006/09/20 05:52:16 dougb Exp $
#

PORTNAME=	xscreensaver
PORTVERSION=	5.06
PORTREVISION=   4
CATEGORIES?=	x11
MASTER_SITES=	http://www.jwz.org/xscreensaver/ \
		http://dougbarton.us/Downloads/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT=	Save your screen while you entertain your cat
LICENSE=	x11

# This doesn't build with imake, but the app-defaults is created with that utility normally.
BUILD_DEPENDS=	imake:${PORTSDIR}/devel/imake
LIB_DEPENDS=	gle.4:${PORTSDIR}/graphics/gle \
		xml2.5:${PORTSDIR}/textproc/libxml2 \
		jpeg.9:${PORTSDIR}/graphics/jpeg \
		png.5:${PORTSDIR}/graphics/png \
		freetype.9:${PORTSDIR}/print/freetype2

DESTDIRNAME=	install_prefix

USE_GNOME=	glib20 gtk20 libglade2
USE_XORG=	xpm xrandr xrender xt xmu xinerama xext xf86miscproto xi xaw xcomposite ice x11
USE_GL=		yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-gtk --with-gl --with-gle --with-pixbuf --with-xpm \
		--with-jpeg=${LOCALBASE} --with-xshm-ext --with-xdbe-ext \
		--with-hackdir=${PREFIX}/bin/xscreensaver-hacks/ \
		--with-configdir=${PREFIX}/share/xscreensaver/config/ \
		--with-x-app-defaults=${PREFIX}/lib/X11/app-defaults \
		--with-dpms-ext --with-xinerama-ext --with-xf86vmode-ext \
		--with-xf86gamma-ext --with-randr-ext --enable-locking

OPTIONS=	ALL_FORTUNES "Run fortune with -sa argument" off \
		KERBEROS "Add support for kerberos" off \
		PAM "Add support for pam authentication" off \
		SETUID_HACKS "Install sonar hack suid so it can ping" off

.include <bsd.port.pre.mk>

.if defined(WITH_ALL_FORTUNES)
CONFIGURE_ARGS+=	--with-fortune="/usr/games/fortune -sa"
.endif
.if defined(WITH_KERBEROS)
CONFIGURE_ARGS+=	--with-kerberos
.else
CONFIGURE_ARGS+=	--without-kerberos
.endif
.if defined(WITH_PAM)
CONFIGURE_ARGS+=	--with-pam
PLIST_SUB+=		PAM=""
.else
CONFIGURE_ARGS+=	--without-pam
PLIST_SUB+=		PAM="@comment not installed: "
.endif
.if defined(WITH_SETUID_HACKS)
CONFIGURE_ARGS+=	--with-setuid-hacks
.endif

.undef HAVE_GNOME

CONFIGURE_ENV=	X_CFLAGS=-I${LOCALBASE}/include/gnome-xml

MAN1=	xscreensaver-command.1 xscreensaver-demo.1 \
	xscreensaver-getimage-file.1 xscreensaver-getimage-video.1 \
	xscreensaver-getimage.1 xscreensaver-text.1 xscreensaver.1

MAN6=	anemone.6 anemotaxis.6 antinspect.6 antmaze.6 antspotlight.6 \
	apollonian.6 apple2.6 atlantis.6 attraction.6 atunnel.6 barcode.6 \
	blaster.6 blinkbox.6 blitspin.6 blocktube.6 boing.6 bouboule.6 \
	bouncingcow.6 boxed.6 boxfit.6 braid.6 bsod.6 bubble3d.6 bubbles.6 \
	bumps.6 cage.6 carousel.6 ccurve.6 celtic.6 circuit.6 cloudlife.6 \
	compass.6 coral.6 crackberg.6 critical.6 crystal.6 cube21.6 \
	cubenetic.6 cubestorm.6 cynosure.6 dangerball.6 decayscreen.6 deco.6 \
	deluxe.6 demon.6 discrete.6 distort.6 drift.6 endgame.6 engine.6 \
	epicycle.6 eruption.6 euler2d.6 extrusion.6 fadeplot.6 fiberlamp.6 \
	fireworkx.6 flag.6 flame.6 flipflop.6 flipscreen3d.6 fliptext.6 flow.6 \
	fluidballs.6 flurry.6 flyingtoasters.6 fontglide.6 forest.6 \
	fuzzyflakes.6 galaxy.6 gears.6 gflux.6 glblur.6 gleidescope.6 \
	glforestfire.6 glhanoi.6 glknots.6 glmatrix.6 glplanet.6 glschool.6 \
	glslideshow.6 glsnake.6 gltext.6 goop.6 grav.6 greynetic.6 halftone.6 \
	halo.6 helix.6 hopalong.6 hyperball.6 hypercube.6 hypertorus.6 ifs.6 \
	imsmap.6 interaggregate.6 interference.6 intermomentary.6 jigglypuff.6 \
	jigsaw.6 juggle.6 juggler3d.6 julia.6 kaleidescope.6 klein.6 kumppa.6 \
	lament.6 laser.6 lavalite.6 lightning.6 lisa.6 lissie.6 ljlatest.6 \
	lmorph.6 loop.6 maze.6 memscroller.6 menger.6 metaballs.6 mirrorblob.6 \
	mismunch.6 moebius.6 moire.6 moire2.6 molecule.6 morph3d.6 mountain.6 \
	munch.6 nerverot.6 noof.6 noseguy.6 pacman.6 pedal.6 penetrate.6 \
	penrose.6 petri.6 phosphor.6 piecewise.6 pinion.6 pipes.6 polyhedra.6 \
	polyominoes.6 polytopes.6 pong.6 providence.6 pulsar.6 pyro.6 qix.6 \
	queens.6 rd-bomb.6 ripples.6 rocks.6 rorschach.6 rotor.6 rotzoomer.6 \
	rubik.6 sballs.6 shadebobs.6 sierpinski.6 sierpinski3d.6 slidescreen.6 \
	slip.6 sonar.6 speedmine.6 sphere.6 spheremonics.6 spiral.6 \
	spotlight.6 sproingies.6 squiral.6 stairs.6 starfish.6 \
	starwars.6 stonerview.6 strange.6 substrate.6 superquadrics.6 \
	swirl.6 t3d.6 tangram.6 thornbird.6 timetunnel.6 topblock.6 \
	triangle.6 truchet.6 twang.6 vermiculate.6 vidwhacker.6 vines.6 \
	wander.6 webcollage.6 whirlwindwarp.6 whirlygig.6 worm.6 wormhole.6 \
	xanalogtv.6 xflame.6 xjack.6 xlyap.6 xmatrix.6 xrayswarm.6 \
	xspirograph.6 xsublim.6 zoom.6 cwaves.6 glcells.6 voronoi.6 \
	abstractile.6 moebiusgears.6 lockward.6 cubicgrid.6 hypnowheel.6 \
        lcdscrub.6 skytentacles.6 \
	xscreensaver-gl-helper.6

.if ${ARCH} == "amd64"
CFLAGS+=	-O0
.endif

USE_DOS2UNIX=	hacks/glx/topblock.c
post-patch:
	@ ${CP} ${WRKSRC}/configure ${WRKSRC}/configure.Patched
	@ ${SED} -e 's#-lpthread#${PTHREAD_LIBS}#g' \
		-e 's#malloc.h#stdlib.h#g' \
		-e 's#/usr/X11R6#${LOCALBASE}#g' \
		${WRKSRC}/configure.Patched > ${WRKSRC}/configure
.if defined(WITH_PAM)
.for f in driver/passwd-pam.c driver/xscreensaver.man
	@ ${CP} ${WRKSRC}/${f} ${WRKSRC}/${f}.presed
	@ ${SED} -e "s#/etc/pam.d#${PREFIX}/etc/pam.d#g" \
	    ${WRKSRC}/${f}.presed > ${WRKSRC}/${f}
.endfor
	@ ${CP} ${FILESDIR}/xscreensaver.pam ${WRKSRC}/driver/xscreensaver.pam
.else
	@ ${CP} ${WRKSRC}/driver/Makefile.in ${WRKSRC}/driver/Makefile.in.post
	@ ${SED} -e "s#install-xml install-pam#install-xml#" \
	    ${WRKSRC}/driver/Makefile.in.post > ${WRKSRC}/driver/Makefile.in
.endif

post-install:
	@(if test -x ${PREFIX}/bin/xscreensaver-hacks/webcollage-helper; then \
		${ECHO} "bin/xscreensaver-hacks/webcollage-helper" | \
			${CAT} - ${TMPPLIST} > ${TMPPLIST}.cat && \
			${MV} ${TMPPLIST}.cat ${TMPPLIST}; fi)
	(if ! test -e ${PREFIX}/lib/X11/app-defaults/XScreenSaver; then \
		${CP} ${FILESDIR}/XScreenSaver ${PREFIX}/lib/X11/app-defaults/; fi )

.include <bsd.port.post.mk>
