#include "Ticker.h"

#define LED_PIN 13

Ticker timer1(blink, 500);

void blink() {
  digitalWrite(LED_PIN, !digitalRead(LED_PIN));
}


void setup() {
  pinMode(LED_PIN, OUTPUT);
  timer.start();
}

void loop() {
  timer.update();
}
