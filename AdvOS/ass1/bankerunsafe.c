#include <stdio.h>

int main() {
    int allocation[3] = {5,2,3};
    int max[3] = {10,4,9};
    int need[3];
    int available = 12;

    int i;

    printf("Process\tAllocation\tMax\tNeed\n");

    for(i=0;i<3;i++){
        need[i] = max[i] - allocation[i];
        printf("P%d\t%d\t\t%d\t%d\n", i, allocation[i], max[i], need[i]);
    }

    printf("\nAvailable = %d\n", available);

    // Checking unsafe condition
    for(i=0;i<3;i++){
        if(need[i] > available){
            printf("System is in UNSAFE state\n");
            return 0;
        }
        available += allocation[i];
    }

    printf("System is in SAFE state\n");
    return 0;
}