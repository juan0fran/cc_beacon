#include <stdio.h>
#include <cc_beacon_iface.h>
#include <stdlib.h>

int main (void)
{
	char socket_file[] = "b.sock";
	int fd = BeaconConnect(socket_file);
	printf("fd is: %d\n", fd);
	exit(0);
}