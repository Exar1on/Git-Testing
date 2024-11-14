#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int main(){
	int fd_of;
	int fd_sock;
	char buffer[4096];
	memset(buffer, 0, 4096);
	
	char httpMsg[] = "HEAD / HTTP/1.1\r\nHost: example.com\r\n\r\n";
	fd_of =  open ("test.txt",O_RDWR|O_CREAT|O_TRUNC, 0644);
	struct sockaddr_in addr;
	
	if (fd_of<0){
		perror("open");
		return 1;
	}

	fd_sock = socket(AF_INET, SOCK_STREAM, 0);
	if (fd_sock<0){
	       perror("socket");
	       return 1;
	}
	
	addr.sin_family = AF_INET;
	addr.sin_port = htons(80);
	addr.sin_addr.s_addr = inet_addr("93.184.216.34");
	connect(fd_sock, (struct sockaddr*)&addr, sizeof(addr));	
	
	
	write(fd_sock, httpMsg, sizeof(httpMsg)-1);

	int resp = read(fd_sock, buffer, sizeof(buffer)-1);
	resp[buffer] = '\0';
	
	
	ssize_t write_data = write(fd_of, buffer, sizeof(buffer)-1);
	if (write_data <0){
		perror("Write");
		close(fd_of);
		return 1;
	}
	
	close(fd_of);
	close(fd_sock);

	return 0;
}
