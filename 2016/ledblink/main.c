#include <stdint.h>

#define GPFSEL4 (uint32_t *)0x20200010
#define GPSET1  (uint32_t *)0x20200020
#define GPCLR1  (uint32_t *)0x2020002C

const int hoge = 100;
volatile const int fuga = 200;

int main(void){

  // set GPIO47 Output
  *GPFSEL4 = 0x01 << (3 * (47 % 10));

  while(1){
    // set GPIO47 High
    *GPSET1 = 1 << (47 - 32);
    //wait
    for(volatile uint32_t i = 0; i < 1000000; i++);
    // set GPIO47 Low
    *GPCLR1 = 1 << (47 - 32);
    //wait
    for(volatile uint32_t i = 0; i < 1000000; i++);
  }

	return 0;
}
