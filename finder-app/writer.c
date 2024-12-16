
#include <stdio.h>
#include <string.h>
#include <syslog.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    //Check for arguments
    if (argc != 3)
    {

        syslog(LOG_ERR, "All arguments were not given, chet for path and text to write");
        closelog();
        return 1;

    }

    char *file_to_write = argv[1];
    char *text_to_write = argv[2];

    if (text_to_write == NULL)
    {

        syslog(LOG_ERR,"text to write wwas not given");
        closelog();
        return 1;

    }


    FILE *archive;
    archive = fopen(file_to_write, "w");
    
    if (archive == NULL)
    {

        syslog(LOG_ERR,"failed to open %s",file_to_write);
        closelog();
        return 1;

    }

    else
    {

        syslog(LOG_DEBUG, "file open correctly");

    }
    
    syslog(LOG_DEBUG,"Writing %s to %s",text_to_write,file_to_write);
    size_t NumberOfElements = fwrite(text_to_write, sizeof(char), strlen(text_to_write), archive);
    
    if (NumberOfElements < strlen(text_to_write))
    {
        
        syslog(LOG_ERR,"Failed to write on the file");
        closelog();
        return 1;
    
    }

    syslog(LOG_DEBUG,"File written correctly");
    fclose(archive);
    closelog();
    return 0;

}

