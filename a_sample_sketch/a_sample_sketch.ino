#include "Ticker.h"

#define LED_PIN 13

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
