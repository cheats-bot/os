#include <stdio.h>
#include <stdlib.h>

int main() {
    int req[] = {98, 183, 37, 122, 14, 124, 65, 67};
    int n = 8, head = 53;
    int seek = 0;

    printf("LIFO:\nSequence: %d ", head);

    for(int i=n-1;i>=0;i--){
        seek += abs(head - req[i]);
        head = req[i];
        printf("-> %d ", head);
    }

    printf("\nTotal Seek Time = %d\n", seek);
    return 0;
}