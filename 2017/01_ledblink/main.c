#include <stdint.h>

int main(void)
{
    // set GPIO47 to Output(0b001)
    *((volatile uint32_t *)0x20200010) &= ~((uint32_t)(0x07 << (7 * 3)));
    *((volatile uint32_t *)0x20200010) |= (uint32_t)(0x01 << (7 * 3));

    // LED blink
    while(1) {
        *((volatile uint32_t *)0x20200020) = 1 << (47 - 32);
        for(volatile uint32_t i = 0; i < 1000000; i++);
        *((volatile uint32_t *)0x2020002C) = 1 << (47 - 32);
        for(volatile uint32_t i = 0; i < 1000000; i++);
    }

    return 0;
}