# New ports collection makefile for:	coldsync
# Date created:		27 January 2000
# Whom:			Andrew Arensburger <arensb+freebsd-ports@ooblick.com>
#
# $FreeBSD: ports/palm/coldsync/Makefile,v 1.35 2006/08/15 00:56:21 clsung Exp $
# $MidnightBSD: mports/palm/coldsync/Makefile,v 1.1 2007/01/24 20:29:12 laffer1 Exp $
#

PORTNAME=	coldsync
PORTVERSION=	2.2.5
PORTREVISION=	5
CATEGORIES=	palm comms
MASTER_SITES=	http://www.coldsync.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synchronize a PalmPilot with a Unix workstation
LICENSE=	artistic

FAKE_OPTS=	prefixhack
FAKE_MAKEARGS+=	PREFIX=${FAKE_DESTDIR}${PREFIX} INFODIR=${FAKE_DESTDIR}${PREFIX}/info
USE_GETTEXT=	yes
REINPLACE_ARGS=	-i "" -E

USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes

MAN3=		libpconn.3 DlpAddSyncLogEntry.3 DlpCallApplication.3 \
		DlpCleanUpDataBase.3 DlpDeleteRecord.3 DlpEndOfSync.3 \
		DlpGetSysDateTime.3 DlpMoveCategory.3 DlpOpenConduit.3 \
		DlpOpenDB.3 DlpRPC.3 DlpReadAppBlock.3 \
		DlpReadAppPreference.3 DlpReadDBList.3 DlpReadFeature.3 \
		DlpReadNetSyncInfo.3 DlpReadOpenDBInfo.3 \
		DlpReadRecordByID.3 DlpReadRecordIDList.3 \
		DlpReadResourceByIndex.3 DlpReadStorageInfo.3 \
		DlpReadSysInfo.3 DlpReadUserInfo.3 DlpResetRecordIndex.3 \
		DlpResetSyncFlags.3 DlpResetSystem.3 DlpWriteRecord.3 \
		DlpWriteResource.3 PConnClose.3 PConn_bind.3 \
		RDLP_Backlight.3 RDLP_BatteryDialog.3 \
		RDLP_GetOSVersionString.3 RDLP_MemHandleNew.3 \
		RDLP_PluggedIn.3 RDLP_ROMToken.3 new_PConnection.3 \
		time_dlp2palmtime.3 libpdb.3 new_Record.3 \
		new_pdb.3 pdb_AppendRecord.3 pdb_CopyRecord.3 \
		pdb_DeleteRecordByID.3 pdb_FindRecordByID.3 \
		pdb_LoadHeader.3 pdb_Read.3
MAN8=		coldsync.8
MANCOMPRESSED=	no

INFO=		conduits

.include <bsd.port.pre.mk>

CFLAGS+=	-D__BSD_VISIBLE=1
CONFIGURE_ARGS+=	--with-i18n --disable-pedantic --without-perl

CONFIGURE_ARGS+=	--with-usb
post-patch:
	${REINPLACE_CMD} -e 's,udi\.([A-Za-z0-9]+),udi.udi_\1,g;' \
		-e 's,ur\.([A-Za-z0-9]+),ur.ucr_\1,g;' \
		${WRKSRC}/configure ${WRKSRC}/libpconn/PConnection_usb.c

post-configure:
	${REINPLACE_CMD} -e 's,-fpic,-fPIC,g' ${WRKSRC}/Make.rules

post-install:
	${MKDIR} ${PREFIX}/include/pconn
	${INSTALL_DATA} ${WRKSRC}/include/*.h ${PREFIX}/include/
	${INSTALL_DATA} ${WRKSRC}/include/pconn/*.h ${PREFIX}/include/pconn/

.include <bsd.port.post.mk>
