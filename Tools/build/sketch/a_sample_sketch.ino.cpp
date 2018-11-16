#include <Arduino.h>
#line 1 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
#line 1 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
#include "Ticker.h"

#define LED_PIN 13

#line 5 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
void blink();
#line 11 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
void setup();
#line 16 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
void loop();
#line 5 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
void blink() {
  digitalWrite(LED_PIN, !digitalRead(LED_PIN));
}

Ticker timer(blink, 500);

void setup() {
  pinMode(LED_PIN, OUTPUT);
  timer.start();
}

void loop() {
  timer.update();
}

