void setup() {
  Serial.begin(115200);
}

double y=0;
double u=50;
  
void loop() {
  delay(100);
  y = 0.99736*y + 0.0019800*u;
  Serial.println(y);
}
