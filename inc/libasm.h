#ifndef LIBASM_H
#define LIBASM_H

#include <stdio.h>

extern size_t ft_strlen(char *str);
extern size_t ft_write(int fd, const void *buf, size_t count);
extern size_t ft_read(int fd, void *buf, size_t count);
char *ft_strcpy(char *dest, char *src);
char *ft_strdup(const char *str);
//int ft_strcmp(char *s1, char *s2);
//unsigned int ft_write(int fd, char *buf, unsigned int nbyte);
//unsigned int ft_read(int fd, char *buf, unsigned int nbyte);

#endif
