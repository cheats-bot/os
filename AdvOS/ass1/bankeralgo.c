#include <stdio.h>

int main() {
    int n = 4, m = 4;
    
    int allocation[4][4] = {
        {2,0,1,1},
        {1,1,0,1},
        {1,0,1,0},
        {0,1,0,1}
    };

    int max[4][4] = {
        {3,2,1,1},
        {1,2,0,2},
        {3,2,1,0},
        {2,1,0,1}
    };

    int available[4] = {6,4,4,2};
    int need[4][4];

    int i,j,k;
    
    // Calculate Need matrix
    printf("Need Matrix:\n");
    for(i=0;i<n;i++){
        for(j=0;j<m;j++){
            need[i][j] = max[i][j] - allocation[i][j];
            printf("%d ", need[i][j]);
        }
        printf("\n");
    }

    // Safety Algorithm
    int finish[4] = {0};
    int safeSeq[4];
    int work[4];

    for(i=0;i<m;i++)
        work[i] = available[i];

    int count = 0;

    while(count < n) {
        int found = 0;

        for(i=0;i<n;i++){
            if(!finish[i]){
                int flag = 1;

                for(j=0;j<m;j++){
                    if(need[i][j] > work[j]){
                        flag = 0;
                        break;
                    }
                }

                if(flag){
                    for(k=0;k<m;k++)
                        work[k] += allocation[i][k];

                    safeSeq[count++] = i;
                    finish[i] = 1;
                    found = 1;
                }
            }
        }

        if(!found){
            printf("\nSystem is NOT in safe state (Deadlock possible)\n");
            return 0;
        }
    }

    printf("\nSystem is in SAFE state\nSafe Sequence: ");
    for(i=0;i<n;i++)
        printf("P%d ", safeSeq[i]);

    return 0;
}