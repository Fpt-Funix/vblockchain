#include "stdio.h";

int main()
{
   FILE *cmd=popen("curl -s http://localhost:8888", "r");
    char result[24]={0x0};
    while (fgets(result, sizeof(result), cmd) !=NULL)
           printf("%s\n", result);
    pclose(cmd);
   
}