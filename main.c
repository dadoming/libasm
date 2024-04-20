#include <libasm.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <unistd.h>

#define BUF_SIZE 128
#define INVALID_FD -1
#define VALID_FD STDOUT_FILENO
#define FT_STRLEN(s) ((s == YES) ? (printf("\nFT_STRLEN\n"), 1) : 0)
#define FT_WRITE(s) ((s == YES) ? (printf("\nFT_WRITE\n"), 1) : 0)
#define FT_READ(s) ((s == YES) ? (printf("\nFT_READ\n"), 1) : 0)
#define FT_STRCPY(s) ((s == YES) ? (printf("\nFT_STRCPY\n"), 1) : 0)
#define FT_STRCMP(s) ((s == YES) ? (printf("\nFT_STRCMP\n"), 1) : 0)
#define FT_STRDUP(s) ((s == YES) ? (printf("\nFT_STRDUP\n"), 1) : 0)

enum show
{
    NO,
    YES
};

int main(void)
{
    if (FT_STRLEN(YES))
    {
        char *str = "Hello World!\n";
        char *empty = "";

        int len = strlen(str);
        int ft_len = ft_strlen(str);
        printf("%d\n", len);
        printf("%d\n", ft_len);
        len = strlen(empty);
        ft_len = ft_strlen(empty);
        printf("%d\n", len);
        printf("%d\n", ft_len);
    }

    if (FT_WRITE(YES))
    {
        char *str = "Hello World!\n";
        int len = ft_strlen(str);
        int bytes_written = ft_write(VALID_FD, str, len);
        if (bytes_written < 0)
        {
            perror("ft_write failed");
        }
        printf("bytes_written: %d\n", bytes_written);

        bytes_written = ft_write(INVALID_FD, str, len);
        if (bytes_written < 0)
        {
            perror("ft_write failed");
        }
        printf("bytes_written: %d\n", bytes_written);
    }

    if (FT_READ(YES))
    {
        char s1[BUF_SIZE];
        int bytes_read = ft_read(VALID_FD, s1, BUF_SIZE);
        printf("\n");
        if (bytes_read < 0)
        {
            perror("ft_read failed");
        }
        s1[bytes_read] = '\0';
        printf("s1: %sn: %d\n", s1, bytes_read);

        char s2[BUF_SIZE];
        bytes_read = ft_read(INVALID_FD, s2, BUF_SIZE);
        if (bytes_read < 0)
        {
            perror("ft_read failed");
        }
        printf("s2: %sn: %d\n", s2, bytes_read);
    }

    if (FT_STRCPY(YES))
    {
        char *dest = malloc(13);
        char *str = "Hello World!";
        ft_strcpy(dest, str);
        printf("dest: %s\n", dest);
        free(dest);
    }

    if (FT_STRCMP(YES))
    {
        char *s1 = "ABC";
        char *s2 = "ABC";
        int cmp = ft_strcmp(s1, s2);
        printf("cmp: %d\n", cmp);
        printf("strcmp: %d\n", strcmp(s1, s2));
        char *s3 = "ABC";
        char *s4 = "AB";
        cmp = ft_strcmp(s3, s4);
        printf("cmp: %d\n", cmp);
        printf("strcmp: %d\n", strcmp(s3, s4));
        char *s5 = "AB";
        char *s6 = "ABC";
        cmp = ft_strcmp(s5, s6);
        printf("cmp: %d\n", cmp);
        printf("strcmp: %d\n", strcmp(s5, s6));
    }

    if (FT_STRDUP(YES))
    {
        char *dup = ft_strdup("Hello World!\n");
        if (dup == NULL)
        {
            perror("ft_strdup failed");
            return 1;
        }
        printf("dup: %s\n", dup);
        free(dup);

        char *empty = "";
        dup = ft_strdup(empty);
        if (dup == NULL)
        {
            printf("ft_strdup failed\n");
            return 1;
        }
        printf("dup: %s\n", dup);
        free(dup);
    }
}
