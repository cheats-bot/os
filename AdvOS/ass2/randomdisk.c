#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n = 8, head = 50;
    int req[8];
    int seek = 0;

    srand(time(0));

    printf("Random Requests:\n");
    for(int i=0;i<n;i++){
        req[i] = rand() % 200;
        printf("%d ", req[i]);
    }

    printf("\nSequence: %d ", head);

    for(int i=0;i<n;i++){
        seek += abs(head - req[i]);
        head = req[i];
        printf("-> %d ", head);
    }

    printf("\nTotal Seek Time = %d\n", seek);
    return 0;
}