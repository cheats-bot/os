#include <stdio.h>
#include <unistd.h>

int main() {
    int pipe1[2], pipe2[2];
    char buf[10];

    pipe(pipe1);
    pipe(pipe2);

    if (fork() == 0) {
        // Child Process
        write(pipe1[1], "Hello", 6);
        sleep(1);
        read(pipe2[0], buf, 6);
        printf("Child received: %s\n", buf);
    } else {
        // Parent Process
        write(pipe2[1], "World", 6);
        sleep(1);
        read(pipe1[0], buf, 6);
        printf("Parent received: %s\n", buf);
    }
    return 0;
}