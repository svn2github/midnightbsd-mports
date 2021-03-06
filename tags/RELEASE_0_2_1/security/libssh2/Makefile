# New ports collection makefile for:	libssh2
# Date created:		May 11 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	libssh2
PORTVERSION=	0.18
CATEGORIES=	security devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library implementing the SSH2 protocol
LICENSE=	bsd3

USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

PLIST_FILES=	include/libssh2.h \
		include/libssh2_publickey.h \
		include/libssh2_sftp.h \
		lib/libssh2.so \
		lib/libssh2.so.1 \
		lib/libssh2.la \
		lib/libssh2.a

MAN3=	libssh2_banner_set.3 libssh2_channel_close.3 \
	libssh2_channel_direct_tcpip_ex.3 libssh2_channel_eof.3 \
	libssh2_channel_flush_ex.3 libssh2_channel_forward_accept.3 \
	libssh2_channel_forward_cancel.3 libssh2_channel_forward_listen_ex.3 \
	libssh2_channel_free.3 libssh2_channel_get_exit_status.3 \
	libssh2_channel_handle_extended_data.3 \
	libssh2_channel_handle_extended_data2.3 libssh2_channel_open_ex.3 \
	libssh2_channel_process_startup.3 libssh2_channel_read_ex.3 \
	libssh2_channel_request_pty_ex.3 libssh2_channel_send_eof.3 \
	libssh2_channel_set_blocking.3 libssh2_channel_setenv_ex.3 \
	libssh2_channel_wait_eof.3 libssh2_channel_x11_req_ex.3 \
	libssh2_hostkey_hash.3 libssh2_scp_recv.3 libssh2_scp_send_ex.3 \
	libssh2_session_abstract.3 libssh2_session_free.3 \
	libssh2_session_callback_set.3 libssh2_session_disconnect_ex.3 \
	libssh2_session_init.3 libssh2_session_last_errno.3 \
	libssh2_session_last_error.3 libssh2_session_method_pref.3 \
	libssh2_session_methods.3 libssh2_session_set_blocking.3 \
	libssh2_session_startup.3 libssh2_poll.3 libssh2_poll_channel_read.3 \
	libssh2_sftp_close_handle.3 libssh2_sftp_fstat_ex.3 \
	libssh2_sftp_last_error.3 libssh2_sftp_init.3 libssh2_sftp_open_ex.3 \
	libssh2_sftp_mkdir_ex.3 libssh2_sftp_read.3 libssh2_sftp_readdir.3 \
	libssh2_sftp_rename_ex.3 libssh2_sftp_rmdir_ex.3 libssh2_sftp_seek.3 \
	libssh2_sftp_shutdown.3 libssh2_sftp_stat_ex.3 \
	libssh2_sftp_symlink_ex.3 libssh2_sftp_tell.3 \
	libssh2_sftp_unlink_ex.3 libssh2_sftp_write.3 \
	libssh2_userauth_authenticated.3 libssh2_userauth_list.3 \
	libssh2_userauth_password_ex.3 libssh2_userauth_publickey_fromfile.3

post-patch:
	@${REINPLACE_CMD} -e '/ssh2_sample\.o/d' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|SHLIB_SUFFIX_NAME@ |SHLIB_SUFFIX_NAME@.0 |g' \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
