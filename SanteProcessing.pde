import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

String texto = "";
float velocidad;
float longitud;
int borra;
PFont f; 

float b = 20;
float c = 10;
float d = 30;


void setup() {
  //println(PFont.list());
  f = createFont("Courier New",30);
  fullScreen();
  //size(400,400);
  frameRate(100);
  oscP5 = new OscP5(this,9010);
 
  myRemoteLocation = new NetAddress("127.0.0.1",9010);
  background(0); 
  
}



void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.addrPattern().equals("/borra")) {
    borra = theOscMessage.get(0).intValue();
  }
  if (theOscMessage.addrPattern().equals("/velocidad")) {
    velocidad = theOscMessage.get(0).floatValue();
  }
   if (theOscMessage.addrPattern().equals("/length")) {
    longitud = theOscMessage.get(0).floatValue();
  }
    
  if (theOscMessage.addrPattern().equals("/textprocessing")) {
    texto = theOscMessage.get(0).stringValue();
  }
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
}

void draw() {
  background(velocidad,longitud,0);
  
  if (borra == 1) {
    b = b + 0.4;
    c = c + 0.2;
    d = d + 0.3;
    if (b >= 40) {
      b = 0;
    }
    if (c >= 70) {
      c = 0;
    }
    if (d >= 30) {
      d = 0;
    }
    background(b,c,d);
  }
  if (borra == 0) {
    textFont(f);
    textAlign(CENTER);
    textSize(longitud);
    text(texto,0,height/2,width, height);
  }
   }
