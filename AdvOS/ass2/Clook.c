#include <stdio.h>
#include <stdlib.h>

int main() {
    int req[] = {98, 183, 37, 122, 14, 124, 65, 67};
    int n = 8, head = 53;
    int seek = 0;

    // Sort
    for(int i=0;i<n;i++){
        for(int j=i+1;j<n;j++){
            if(req[i] > req[j]){
                int temp = req[i];
                req[i] = req[j];
                req[j] = temp;
            }
        }
    }

    printf("C-LOOK:\nSequence: %d ", head);

    // Move right
    for(int i=0;i<n;i++){
        if(req[i] >= head){
            seek += abs(head - req[i]);
            head = req[i];
            printf("-> %d ", head);
        }
    }

    // Jump to lowest request
    head = req[0];

    for(int i=0;i<n;i++){
        if(req[i] < head){
            seek += abs(head - req[i]);
            head = req[i];
            printf("-> %d ", head);
        }
    }

    printf("\nTotal Seek Time = %d\n", seek);
    return 0;
}