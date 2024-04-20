#ifndef LIBASM_H
#define LIBASM_H

#include <stdio.h>

extern size_t ft_strlen(const char *str);
extern size_t ft_write(int fd, const void *buf, size_t count);
extern size_t ft_read(int fd, void *buf, size_t count);
char *ft_strcpy(char *dest, const char *src);
char *ft_strdup(const char *str);
int ft_strcmp(const char *s1, const char *s2);

#endif
