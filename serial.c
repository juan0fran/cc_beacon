/******************************************************************************/
/* PiCC1101  - Radio serial link using CC1101 module and Raspberry-Pi         */
/*                                                                            */
/* Serial definitions                                                         */
/*                                                                            */
/*                      (c) Edouard Griffiths, F4EXB, 2015                    */
/*                                                                            */
/******************************************************************************/

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

#include "main.h"
#include "serial.h"

/* Have to be rewritten:
    - set_serial_parameters -> this opens the UNIX SOCKET
    - write_serial -> write to socket
    - read_serial -> read non block using POLL
*/

// ------------------------------------------------------------------------------------------------
// Get serial speed
speed_t get_serial_speed(uint32_t speed, uint32_t *speed_n)
// ------------------------------------------------------------------------------------------------
{
    printf("Get serial speed has no sense, now is a UNIX SOCKET\n");
    return B0;
}

int openUnixSocket(char * sock_path){
    struct sockaddr_un addr;
    int fd;
    int client_fd;
    if ( (fd = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
        perror("socket error");
        exit(EXIT_FAILURE);
    }
    memset(&addr, 0, sizeof(addr));
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, sock_path, sizeof(addr.sun_path)-1);

    unlink(sock_path);

    if (bind(fd, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
        perror("bind error");
        exit(EXIT_FAILURE);
    }

    /** Give permission to the file, so others can access without SUDO in case if needed */

    if (listen(fd, 5) == -1) {
        perror("listen error");
        exit(EXIT_FAILURE);
    }

    if ( (client_fd = accept(fd, NULL, NULL)) == -1) {
        perror("accept error");
        exit(-1);
    }
    return client_fd;
}

void set_serial_parameters(serial_t *serial_parameters, arguments_t *arguments)
{
    /* socket init */
    serial_parameters->sock_fd = openUnixSocket(arguments->serial_device);
}

#define __USE_SOCAT__

int check_serial(serial_t *serial_parameters)
{
    struct pollfd pfd;
    int rv;
    int len = 256;
    char buf[256];
    pfd.fd = serial_parameters->sock_fd;
    pfd.events = POLLIN;
    rv = poll(&pfd, 1, 0);
    if (rv == -1){
        perror("Poll error: ");
        return -1;
    }else if (rv == 0){
        return 1;
    }else{
        return read(pfd.fd, buf, len);
    }
}

int write_serial(serial_t *serial_parameters, char *msg, int msglen)
// ------------------------------------------------------------------------------------------------
{
    /* write msglen as int32_t, then write the message */
    int32_t len = (int32_t) msglen;
    #ifdef __USE_SOCAT__
    return write(serial_parameters->sock_fd, msg, len);
    #else
    int ret = write(serial_parameters->sock_fd, &len, sizeof(int32_t));
    if (ret > 0){
        return write(serial_parameters->sock_fd, msg, len);
    }else{
        printf("Error writing\n");
        return 0;
    }
    #endif
}

// ------------------------------------------------------------------------------------------------
// Read from serial interface
int read_serial(serial_t *serial_parameters, char *buf, int buflen)
// ------------------------------------------------------------------------------------------------
{
    struct pollfd pfd;
    int rv;
    int32_t len;
    int readed;
    pfd.fd = serial_parameters->sock_fd;
    pfd.events = POLLIN;
    rv = poll(&pfd, 1, -1); /* read without timeout */
    if (rv == -1){
        perror("Poll error: ");
        return -1;
    }else if (rv == 0){
        printf("Error reading\n");
        return -1;
    }else{
        if (pfd.revents & POLLIN){
            #ifdef __USE_SOCAT__
            return read(pfd.fd, buf, buflen);
            #else
            if (read(pfd.fd, &len, sizeof(int32_t)) > 0){
                if (len <= buflen){
                     readed = read(pfd.fd, buf, len);
                     while(readed != len){
                        readed += read(pfd.fd, buf+readed, len-readed);
                     }
                     return len;
                }else{
                    return 0;
                }
            }else{
                return 0;
            }
            #endif
        }
    }
} 