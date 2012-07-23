#include <stddef.h>

void *my_memcpy(void * restrict s1, const void * restrict s2, size_t n)
{
    char *a;
    const char *b;

    a = s1;
    b = s2;

    for(; n > 0; --n)
        *a++ = *b++;

    return s1;
}

int main(int argc, char **argv)
{
    return 0;
}
