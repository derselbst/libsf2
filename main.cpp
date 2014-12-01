#include <cstdio>
#include <cstdlib>
#include "sf2.hpp"

int main()
{
  SF2 sf(22050);
  
  FILE * sample = fopen("./B00I28S00.wav", "rb");
  if (!sample)
  {
    puts("error sample");
    exit(-1);
  }
  
  sf.add_new_sample(sample, SampleType::SIGNED_16, "someSample", 2000, 2288/sizeof(int16_t), true, 1000, 1100, 10, 55, 31183);
  
  FILE* sfout = fopen("./sftest.sf2", "wb");
  if (!sfout)
  {
    puts("error sfout");
    exit(-1);
  }
  
  sf.write(sfout);
}