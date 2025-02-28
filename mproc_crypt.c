#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

void usage(void);

void usage(void) {
    fprintf(stderr, "mproc_crypt p:d:o:P:N:T:vh\n");
    fprintf(stderr, "-p passwords file name  : hashed passwords file\n");
    fprintf(stderr, "-d dictionary file name : plain text passwords file\n");
    fprintf(stderr, "-o output file name     : send output to the given file name\n");
    fprintf(stderr, "-P #                    : number of child processes to create\n");
    fprintf(stderr, "-T #                    : number seconds to wait for a timeout\n");
    fprintf(stderr, "-N #                    : increment for nice()\n");
    fprintf(stderr, "-v                      : verbose output, to stderr\n");
    fprintf(stderr, "-h                      : this marvelous help\n");
}


int main(int argc, char **argv){
    int opt = -1;

    int verbose_flag, num_child_processes, nice_increment, timeout_seconds = -1; // Int arguments
    char *passwords_file_name = NULL;
    char *dictionary_file_name = NULL;
    char *output_file_name = NULL;

    while ((opt = getopt(argc, argv, "p:d:o:P:N:T:vh")) != -1) {
        switch (opt) {
            case 'p':
                passwords_file_name = optarg;
                break;
            case 'd':
                dictionary_file_name = optarg;
                break;
            case 'o':
                output_file_name = optarg;
                break;
            case 'P':
                num_child_processes = atoi(optarg);
                break;
            case 'N':
                nice_increment = atoi(optarg);
                break;
            case 'T':
                timeout_seconds = atoi(optarg);
                break;
            case 'v':   
                verbose_flag = 1;
                break;
            case 'h':
                usage();
                break;
            default:
                fprintf(stderr, "Invalid option: %c\n", optopt);
                exit(EXIT_FAILURE); // What about the h flag case?
        }
    }
}