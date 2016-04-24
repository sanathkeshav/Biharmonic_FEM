#include<stdio.h>
#include<math.h>
#include<stdlib.h>
int main()
{  
    int nel;
    int m;
    int n;
    m=2;
    n=2;
    int i,j,k;
    nel=2*m*n;
    int cnt[nel][21];
    for(int i=0;i<13;i++)
    {
        cnt[0][i]=i+1;
       
    }
    j = 9*n+15;
    for(int i=0;i<6;i++)
    {
	cnt[1][i]=j;
	j++;
    }
    cnt[1][6] = 9*n+14;
    j=0;
    for(int i=7;i<13;i++)
    {
	cnt[1][i]= 9*n+8+j;
	j++;
    }
    cnt[1][13]= 7*n+8;
    j = 0;
    for(int i=14;i<20;i++)
    {
	cnt[1][i]= 8+j;
	j++;
    }
    cnt[1][20]= 7*n+9;
    cnt[0][13]=7*n+8;
    j=0;
    for(int i=14;i<20;i++)
    {    
	cnt[0][i]=9*n+8+j;
        j++;
    }
    cnt[0][20]=7*n+7;



// generating the first row of elements


    for(k=2;k<2*n-1;k+=2)
	{
		for(i =0;i<21;i++)
		{
			cnt[k][i] = cnt[k-2][i]+7;    
    		}
		cnt[k][13]-=5;
		cnt[k][20]-=5;
	}
     for(k=3;k<2*n;k+=2)
	{
		for(i=0;i<21;i++)
		{
			cnt[k][i] = cnt[k-2][i]+7;
		}
		cnt[k][13]-=5;
		cnt[k][20]-=5;
	}
     

//Using recursion to generate the rest of the matrix by comparing with the elements right below
	for(i=1;i<m;i++)
	{	
		for(j=0;j<2*n-1;j+=2)
		{	for(k =0;k<21;k++)
			{
				cnt[2*i*n+j][k] = cnt[2*(i-1)*n+j][k]+9*n+7;    
    		}
			/*cnt[2*i*n+j][13]-=5;
			cnt[2*i*n+j][20]-=5;
			*/
		}
		for(j=1;j<2*n;j+=2)
		{	for(k =0;k<21;k++)
			{
				cnt[2*i*n+j][k] = cnt[2*(i-1)*n+j][k]+9*n+7;    
    		}
			/*cnt[2*i*n+j][13]-=5;
			cnt[2*i*n+j][20]-=5;
			*/
		}
	}




    
// printing out the connectivity matrix


/*
printf("Connectivity Matrix \n");

    for(i=0;i<2*m*n;i++)
	{
	
    		for(int k=0;k<21;k++)
    		{
			printf("%d	",cnt[i][k]);
    		}
		printf("\n");
	}
*/

// Importing Element Stiffness matrix from a Text file from MATLAB

FILE *fp;
char *num_string;
num_string = (char*)malloc(20*sizeof(char));
float element_stiffness[21][21];
fp = fopen("stiffness_proper.txt","r");

//Reading one number to test if it works
for(i=0;i<21;i++) {
	for(j=0;j<21;j++) {
 		k = 0;
		num_string[k] = fgetc(fp);
		while(num_string[k]!='\n') {
			k++;
			num_string[k] = fgetc(fp);
		}
		element_stiffness[i][j] = strtof(num_string,NULL);		 
	//	printf("Read the number %s\n", num_string);
	}
}
		
fclose(fp);
/*
for(i=0;i<21;i++)
{
	for(j=0;j<21;j++)
	{
		printf("%.8f \t ",element_stiffness[i][j]);
	}
	printf("\n");
}
*/

// Assembly of Global Stiffness matrix




    return 0;
}
