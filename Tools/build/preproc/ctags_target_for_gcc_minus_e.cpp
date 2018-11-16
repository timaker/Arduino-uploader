# 1 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
# 1 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino"
# 2 "D:\\Faynman\\Desktop\\Arduino_uploader\\a_sample_sketch\\a_sample_sketch.ino" 2



void blink() {
  digitalWrite(13, !digitalRead(13));
}

Ticker timer(blink, 500);

void setup() {
  pinMode(13, 0x1);
  timer.start();
}

void loop() {
  timer.update();
}
