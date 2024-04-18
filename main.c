// You must write 64 bits ASM. Beware of the "calling convention".
// You can’t do inline ASM, you must do ’.s’ files.
// You must compile your assembly code with nasm.
// You must use the Intel syntax, not the AT&T.
// It is forbidden to use the compilation flag: -no-pie.
// Your file will have to be called libasm.a

// in my main i shall test the ft_strlen function
// but i need the include the header file
// and i need to compile the libasm.a file

#include "inc/libasm.h"

int main(void)
{
// ft_strlen
printf("\nFT_STRLEN\n");
    char *str = "Hello World!";
    printf("%ld\n", ft_strlen(str));

printf("\nFT_WRITE\n");
// ft_write
    int n1 = ft_write(1, "Hello World!\n", 13);
    printf("n: %d\n", n1);

printf("\nFT_READ\n");
// ft_read
#define BUF_SIZE 128
    char s[BUF_SIZE];
    int n2 = ft_read(0, s, BUF_SIZE);
    s[n2] = '\0';
    printf("s: %sn: %d\n", s, n2);

printf("\nFT_STRCPY\n");
// ft_strcpy
    char dest[BUF_SIZE];
    ft_strcpy(dest, str);
    printf("dest: %s\n", dest);

printf("\nFT_STRDUP\n");
// ft_strdup
    char *dup = ft_strdup(str);
    printf("dup: %s\n", dup);

    return 0;

}
