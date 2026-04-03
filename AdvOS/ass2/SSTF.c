#include <stdio.h>
#include <stdlib.h>

int main() {
    int req[] = {70, 140, 50, 125, 30, 25, 160};
    int n = 7;
    int head = 60;
    int visited[7] = {0};
    int seek = 0;

    printf("SSTF Disk Scheduling:\n");
    printf("Sequence: %d ", head);

    for(int i = 0; i < n; i++) {
        int min = 9999, index = -1;

        for(int j = 0; j < n; j++) {
            if(!visited[j]) {
                int dist = abs(head - req[j]);
                if(dist < min) {
                    min = dist;
                    index = j;
                }
            }
        }

        visited[index] = 1;
        seek += min;
        head = req[index];

        printf("-> %d ", head);
    }

    printf("\nTotal Seek Time = %d\n", seek);

    return 0;
}