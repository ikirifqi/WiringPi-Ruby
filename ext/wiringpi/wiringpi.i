%module wiringpi

%{
#include "WiringPi/wiringPi/wiringPi.h"
#include "WiringPi/wiringPi/wiringPiI2C.h"
#include "WiringPi/wiringPi/wiringPiSPI.h"
#include "WiringPi/wiringPi/wiringSerial.h"
#include "WiringPi/wiringPi/wiringShift.h"
#include "WiringPi/wiringPi/drcSerial.h"
#include "WiringPi/wiringPi/ads1115.h"
#include "WiringPi/wiringPi/max31855.h"
#include "WiringPi/wiringPi/max5322.h"
#include "WiringPi/wiringPi/mcp23008.h"
#include "WiringPi/wiringPi/mcp23016.h"
#include "WiringPi/wiringPi/mcp23016reg.h"
#include "WiringPi/wiringPi/mcp23017.h"
#include "WiringPi/wiringPi/mcp23s08.h"
#include "WiringPi/wiringPi/mcp23s17.h"
#include "WiringPi/wiringPi/mcp23x0817.h"
#include "WiringPi/wiringPi/mcp23x08.h"
#include "WiringPi/wiringPi/mcp3002.h"
#include "WiringPi/wiringPi/mcp3004.h"
#include "WiringPi/wiringPi/mcp3422.h"
#include "WiringPi/wiringPi/mcp4802.h"
#include "WiringPi/wiringPi/pcf8574.h"
#include "WiringPi/wiringPi/pcf8591.h"
#include "WiringPi/wiringPi/sn3218.h"
#include "WiringPi/wiringPi/softPwm.h"
#include "WiringPi/wiringPi/softServo.h"
#include "WiringPi/wiringPi/softTone.h"
#include "WiringPi/wiringPi/sr595.h"
#include "WiringPi/wiringPi/bmp180.h"
#include "WiringPi/wiringPi/drcNet.h"
#include "WiringPi/wiringPi/ds18b20.h"
#include "WiringPi/wiringPi/htu21d.h"
#include "WiringPi/wiringPi/pseudoPins.h"
#include "WiringPi/wiringPi/rht03.h"
#include "WiringPi/wiringPi/wpiExtensions.h"
#include "WiringPi/devLib/ds1302.h"
#include "WiringPi/devLib/font.h"
#include "WiringPi/devLib/gertboard.h"
#include "WiringPi/devLib/lcd128x64.h"
#include "WiringPi/devLib/lcd.h"
#include "WiringPi/devLib/maxdetect.h"
#include "WiringPi/devLib/piGlow.h"
#include "WiringPi/devLib/piNes.h"
#include "WiringPi/devLib/scrollPhat.h"
#include "WiringPi/devLib/piFace.h"
%}

%apply unsigned char { uint8_t };

%typemap(in) (unsigned char *data, int len) {
 $1 = StringValuePtr($input);
 $2 = strlen($1);
};

%include "bindings.i"
