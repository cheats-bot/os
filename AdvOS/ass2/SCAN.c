#include <stdio.h>
#include <stdlib.h>

int main() {
    int req[] = {70, 140, 50, 125, 30, 25, 160};
    int n = 7;
    int head = 60;
    int seek = 0;
    int disk_size = 200;

    // Sort requests
    for(int i=0;i<n;i++){
        for(int j=i+1;j<n;j++){
            if(req[i] > req[j]){
                int temp = req[i];
                req[i] = req[j];
                req[j] = temp;
            }
        }
    }

    printf("SCAN Disk Scheduling:\n");
    printf("Sequence: %d ", head);

    // Move right
    for(int i=0;i<n;i++){
        if(req[i] >= head){
            seek += abs(head - req[i]);
            head = req[i];
            printf("-> %d ", head);
        }
    }

    // Go to end
    seek += abs(head - (disk_size - 1));
    head = disk_size - 1;

    // Move left
    for(int i=n-1;i>=0;i--){
        if(req[i] < head){
            seek += abs(head - req[i]);
            head = req[i];
            printf("-> %d ", head);
        }
    }

    printf("\nTotal Seek Time = %d\n", seek);

    return 0;
}