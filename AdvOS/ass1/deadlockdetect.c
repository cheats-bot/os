#include <stdio.h>

int main() {
    int n = 5, m = 3;

    int allocation[5][3] = {
        {0,1,0},
        {2,0,0},
        {3,0,2},
        {2,1,1},
        {0,0,2}
    };

    int request[5][3] = {
        {0,0,0},
        {2,0,2},
        {0,0,0},
        {1,0,0},
        {0,0,2}
    };

    int available[3] = {0,0,0};

    int finish[5] = {0};
    int i,j;

    int changed = 1;

    while(changed) {
        changed = 0;

        for(i=0;i<n;i++){
            if(!finish[i]){
                int flag = 1;

                for(j=0;j<m;j++){
                    if(request[i][j] > available[j]){
                        flag = 0;
                        break;
                    }
                }

                if(flag){
                    for(j=0;j<m;j++)
                        available[j] += allocation[i][j];

                    finish[i] = 1;
                    changed = 1;
                }
            }
        }
    }

    int deadlock = 0;

    printf("Processes in Deadlock:\n");

    for(i=0;i<n;i++){
        if(!finish[i]){
            printf("P%d ", i);
            deadlock = 1;
        }
    }

    if(!deadlock)
        printf("No Deadlock\n");

    return 0;
}