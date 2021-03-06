# $MidnightBSD: mports/graphics/opencv/Makefile,v 1.2 2012/09/09 05:03:48 laffer1 Exp $
# $FreeBSD: ports/graphics/opencv/Makefile,v 1.36 2012/01/16 09:46:55 martymac Exp $

PORTNAME?=	opencv
PORTVERSION=	2.3.1
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}library/${PORTNAME}-unix/${PORTVERSION}
DISTNAME=	OpenCV-${DISTVERSION}a

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source Computer Vision library from Intel
LICENSE=	bsd3

USE_GNOME=	pkgconfig
WANT_GSTREAMER=	yes
MAKE_JOBS_UNSAFE=	yes
USE_BZIP2=	yes
USE_CMAKE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/OpenCV-${DISTVERSION}

NOT_FOR_ARCHS=	sparc64
NOT_FOR_ARCHS_REASON_sparc64=	does not compile on sparc64

DATADIR=	${PREFIX}/share/OpenCV
PLIST_SUB+=	VERSION=${DISTVERSION}

.if !defined(_BUILDING_OPENCV_CORE) && !defined(_BUILDING_OPENCV_PYTHON)
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-opencv
LIB_DEPENDS+=	opencv_core.2:${PORTSDIR}/graphics/opencv-core
LDFLAGS+=	-L${LOCALBASE}/lib

PORTDOCS=	*

OPTIONS=	EIGEN2	"Include Eigen 2 support" on \
		FFMPEG	"Include FFmpeg support" off \
		GSTREAMER	"Include Gstreamer support" off \
		GTK	"Include GTK+ support" off \
		JASPER	"Include JPEG 2000 support" on \
		JPEG	"Include JPEG support" on \
		OPENEXR	"Include OpenEXR support" off \
		PNG	"Include PNG support" on \
		QT4	"Build with Qt backend support" off \
		TBB	"Include TBB support" off \
		TIFF	"Include TIFF support" on \
		V4L	"Include Video4Linux support" on \
		XINE	"Include XINE support" off

.include <bsd.mport.options.mk>

.if !defined(NOPORTEXAMPLES)
CMAKE_ARGS+=	-DBUILD_EXAMPLES:BOOL=On -DINSTALL_C_EXAMPLES:BOOL=On
PORTEXAMPLES+=	c cpp gpu
.endif

.if !defined(WITHOUT_EIGEN2)
BUILD_DEPENDS+=	${LOCALBASE}/include/eigen2/Eigen/Eigen:${PORTSDIR}/math/eigen2
CMAKE_ARGS+=	-DWITH_EIGEN2:BOOL=On
.else
CMAKE_ARGS+=	-DDWITH_EIGEN2:BOOL=Off
.endif

.if defined(WITH_FFMPEG)
LIB_DEPENDS+=	avcodec.1:${PORTSDIR}/multimedia/ffmpeg
CMAKE_ARGS+=	-DWITH_FFMPEG:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_FFMPEG:BOOL=Off
.endif

.if defined(WITH_GSTREAMER)
USE_GSTREAMER=	yes
CMAKE_ARGS+=	-DWITH_GSTREAMER:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_GSTREAMER:BOOL=Off
.endif

.if defined(WITH_GTK)
USE_GNOME=	gtk20
CMAKE_ARGS+=	-DWITH_GTK:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_GTK:BOOL=Off
.endif

.if !defined(WITHOUT_JASPER)
LIB_DEPENDS+=	jasper.4:${PORTSDIR}/graphics/jasper
CMAKE_ARGS+=	-DWITH_JASPER:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_JASPER:BOOL=Off
.endif

.if !defined(WITHOUT_JPEG)
LIB_DEPENDS+=	jpeg.11:${PORTSDIR}/graphics/jpeg
CMAKE_ARGS+=	-DWITH_JPEG:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_JPEG:BOOL=Off
.endif

.if defined(WITH_OPENEXR)
LIB_DEPENDS+=	IlmImf:${PORTSDIR}/graphics/OpenEXR
CMAKE_ARGS+=	-DWITH_OPENEXR:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_OPENEXR:BOOL=Off
.endif

.if !defined(WITHOUT_PNG)
LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png
CMAKE_ARGS+=	-DWITH_PNG:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_PNG:BOOL=Off
.endif

.if defined(WITH_QT4)
USE_QT4+=	opengl moc_build qmake_build rcc_build uic_build qtestlib
CMAKE_ARGS+=	-DWITH_QT:BOOL=On -DWITH_QT_OPENGL:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_QT:BOOL=Off
.endif

.if defined(WITH_TBB)
LIB_DEPENDS+=	tbb.4:${PORTSDIR}/devel/tbb
CMAKE_ARGS+=	-DWITH_TBB:BOOL=On \
		-DTBBLIB_FOUND:BOOL=1 -DTBB_FOUND:BOOL=On \
		-DTBB_INCLUDE_DIRS:STRING="${LOCALBASE}/include" \
		-DTBB_LIBRARY_DIRS:STRING="${LOCALBASE}/lib" \
		-DTBB_LIBRARIES:STRING="tbb"
.else
CMAKE_ARGS+=	-DWITH_TBB:BOOL=Off
.endif

.if !defined(WITHOUT_TIFF)
LIB_DEPENDS+=	tiff.4:${PORTSDIR}/graphics/tiff
CMAKE_ARGS+=	-DWITH_TIFF:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_TIFF:BOOL=Off
.endif

.if !defined(WITHOUT_V4L)
LIB_DEPENDS+=	v4l2.0:${PORTSDIR}/multimedia/libv4l
BUILD_DEPENDS+=	${LOCALBASE}/include/linux/videodev2.h:${PORTSDIR}/multimedia/v4l_compat
CMAKE_ARGS+=	-DWITH_V4L:BOOL=On \
		-DCMAKE_REQUIRED_INCLUDES:STRING="${LOCALBASE}/include"
.else
CMAKE_ARGS+=	-DWITH_V4L:BOOL=Off
.endif

.if defined(WITH_XINE)
LIB_DEPENDS+=	xine.2:${PORTSDIR}/multimedia/libxine
CMAKE_ARGS+=	-DWITH_XINE:BOOL=On
.else
CMAKE_ARGS+=	-DWITH_XINE:BOOL=Off
.endif

.else # defined(_BUILDING_OPENCV_CORE) || defined(_BUILDING_OPENCV_PYTHON)

. if defined(_BUILDING_OPENCV_CORE)
COMMENT=	OpenCV core libraries
PLIST=		${PKGDIR}/pkg-plist.oc
PKGNAMESUFFIX=	-core
LATEST_LINK=	${PORTNAME}-core
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-opencv-core

. elif defined(_BUILDING_OPENCV_PYTHON)
COMMENT=	OpenCV Python library
CATEGORIES=	graphics python
PLIST=		${PKGDIR}/pkg-plist.python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	# no suffix

LIB_DEPENDS+=	opencv_legacy.2:${PORTSDIR}/graphics/opencv
CMAKE_ENV+=	LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"
INSTALL_WRKSRC=	${WRKSRC}/modules/python
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-opencv-python

USE_PYTHON=	yes
BUILD_DEPENDS+=	${PYNUMPY}
RUN_DEPENDS+=	${PYNUMPY}
. endif	# defined(_BUILDING_OPENCV_PYTHON)
CMAKE_ARGS+=	-DBUILD_EXAMPLES:BOOL=Off \
		-DINSTALL_PYTHON_EXAMPLES:BOOL=Off \
		-DBUILD_TESTS:BOOL=Off \
		-DDWITH_EIGEN2:BOOL=Off \
		-DWITH_FFMPEG:BOOL=Off \
		-DWITH_GSTREAMER:BOOL=Off \
		-DWITH_GTK:BOOL=Off \
		-DWITH_JASPER:BOOL=Off \
		-DWITH_JPEG:BOOL=Off \
		-DWITH_OPENEXR:BOOL=Off \
		-DWITH_PNG:BOOL=Off \
		-DWITH_QT:BOOL=Off \
		-DWITH_TBB:BOOL=Off \
		-DWITH_V4L:BOOL=Off \
		-DWITH_TIFF:BOOL=Off \
		-DWITH_XINE:BOOL=Off \
		-DWITH_PVAPI:BOOL=Off \
		-DWITH_1394:BOOL=Off \
		-DWITH_CUDA:BOOL=Off
.endif # defined(_BUILDING_OPENCV_CORE) || defined(_BUILDING_OPENCV_PYTHON)

.if defined(_BUILDING_OPENCV_PYTHON)
CMAGE_ARGS+=	-DBUILD_NEW_PYTHON_SUPPORT:BOOL=On
.else
CMAGE_ARGS+=	-DBUILD_NEW_PYTHON_SUPPORT:BOOL=Off
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${MKDIR} ${CONFIGURE_WRKSRC}
	@${REINPLACE_CMD} -e 's:set(OPENCV_SOVERSION.*:set(OPENCV_SOVERSION "$${OPENCV_VERSION_MAJOR}"):' \
		-e 's:-pthread:${PTHREAD_LIBS}:g' \
		-e 's:$${OPENCV_LIB_INSTALL_PATH}/pkgconfig:$${CMAKE_INSTALL_PREFIX}/libdata/pkgconfig:g' \
		-e 's:share/OpenCV/doc:share/doc/opencv:g' \
		${WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|${PORTNAME}/samples|examples/${PORTNAME}|g' \
		${WRKSRC}/samples/*/CMakeLists.txt \
		${WRKSRC}/samples/*/*/CMakeLists.txt
	@${FIND} ${WRKSRC} -name '*.orig' -exec rm {} \;

.if defined(_BUILDING_OPENCV_CORE) && !defined(_BUILDING_OPENCV_PYTHON)
	@${REINPLACE_CMD} -e '/add_subdirectory(data)/ d' \
		-e '/add_subdirectory(include)/ d' \
		-e 's|opencv.pc|opencv-core.pc|g' \
		-e 's|OpenCVConfig.cmake|OpenCVConfig-core.cmake|g' \
		-e 's|OpenCVConfig-version.cmake|OpenCVConfig-core-version.cmake|g' \
		-e 's|    set(root_files README)||g' \
		-e 's|    install(CODE "exec_program.*||g' \
		${WRKSRC}/CMakeLists.txt
	@${SED} -E -e \
		's|Name:.*|Name: OpenCV-core|' -e \
		's|Libs:.*|Libs: -L$${libdir} -lopencv_core@OPENCV_DLLVERSION@ -lopencv_imgproc@OPENCV_DLLVERSION@ -lopencv_video@OPENCV_DLLVERSION@ -lopencv_flann@OPENCV_DLLVERSION@|' \
		${WRKSRC}/opencv.pc.cmake.in > ${WRKSRC}/opencv-core.pc.cmake.in
	@${SED} -E -e \
		's|    set\(OPENCV_LIB_COMPONENTS .*|    set\(OPENCV_LIB_COMPONENTS opencv_core opencv_imgproc opencv_video opencv_ml opencv_flann\)|g' \
		${WRKSRC}/OpenCVConfig.cmake.in > ${WRKSRC}/OpenCVConfig-core.cmake.in
	@${LN} -sf OpenCVConfig-version.cmake.in ${WRKSRC}/OpenCVConfig-core-version.cmake.in
.endif
.if defined(NOPORTDOCS) || defined(_BUILDING_OPENCV_CORE) || defined(_BUILDING_OPENCV_PYTHON)
	@${REINPLACE_CMD} -e '/add_subdirectory(doc)/ d' \
		${WRKSRC}/CMakeLists.txt
.endif

.include <bsd.port.post.mk>
