#include <fcntl.h>      // File control definitions
#include <errno.h>      // Error number definitions
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <netdb.h> 
#include <poll.h>
#include <stdlib.h>

#include <cc_beacon_iface.h>

static int InitClientSocket(char * sock_file)
{
	int fd;
	struct sockaddr_un addr;

	if ( (fd = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
		perror("socket error");
		exit(-1);
	}

	memset(&addr, 0, sizeof(addr));
	addr.sun_family = AF_UNIX;
	strncpy(addr.sun_path, sock_file, sizeof(addr.sun_path)-1);

	if (connect(fd, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
    	perror("connect error");
    	exit(-1);
	}

	return fd;
}

int BeaconConnect (char * sock_file)
{
	return InitClientSocket(sock_file);
}

void BeaconClose (int fd)
{
	close (fd);
}

/* Just to ensure is a 32 bits int -> int32_t */
int BeaconWrite (int fd, BYTE * msg, int32_t len)
{
	int ret = -1;
	/* if write returns -1, error */
	if (write(fd, &len, sizeof(int32_t)) > 0){
		ret = write(fd, msg, len);
	}
	return ret;
}


int BeaconRead (int fd, BYTE * msg, int32_t maxbuflen)
{
	int len = 0;
	int ret;
	/* blocking read waiting for a beacon */
	if (read(fd, &len, sizeof(int32_t)) > 0 ){
		if (len <= maxbuflen){
			ret = read(fd, msg, len);
			/* ensure the whole message has been readed */
			while (ret != len){
				ret += read(fd, msg+ret, len-ret);
			}
			return len;
		}else{
			return 0;
		}
	}else{
		/* End of socket */
		return -1;
	}
}



















