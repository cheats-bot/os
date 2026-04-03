#include <stdio.h>
#include <stdlib.h>

int main() {
    int n = 7;
    int req[] = {70, 140, 50, 125, 30, 25, 160};
    int head = 60;
    int seek = 0;

    printf("FCFS Disk Scheduling:\n");
    printf("Sequence: %d ", head);

    for(int i = 0; i < n; i++) {
        seek += abs(req[i] - head);
        head = req[i];
        printf("-> %d ", head);
    }

    printf("\nTotal Seek Time = %d\n", seek);

    return 0;
}