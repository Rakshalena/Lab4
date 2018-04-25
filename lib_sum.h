#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

struct SumArgs{
  int *array;
  int begin;
  int end;
  };
  
int Sum(const struct SumArgs *args);
void *ThreadSum(void *args);