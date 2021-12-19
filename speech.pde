String[] words = {};

String tokens = " .,!?\":;()-/[]~&";

String main = "dream";
PImage img;
PFont[] fonts = new PFont[10];
PImage pal;

float jit = 10;


void setup(){
  size(746, 930); 
  img = loadImage("mlk.PNG");
  pal = loadImage("p4.png");
  
  loadSpeech();
  loadFonts();
  
  textAlign(CENTER, CENTER);
  colorMode(HSB, 255);
  
  img.filter(POSTERIZE, 10);
  image(img, 0, 0);
  for(int i = 0; i < 12; i++){
    printWords(100);
  }
  
  for(int i = 0; i < 15; i++){
    printWords(30);
  }
  printMain(100);
  for(int i = 0; i < 2; i++){
    printWords(30);
  }
 
  //printWords(80);
  
  save("out/mlk6.png");
  
  

}



void printWords(float size){
  for(int i = 0; i < words.length; i++){
    float x = random(0, width);
    float y = random(0, height);
    textFont(fonts[round(random(0, 9))]);
    textSize(random(1, size));
    fill(getColor(x, y, false));
    
    translate(x, y);
    rotate(random(-TWO_PI, TWO_PI)); 
    text(words[i], 0, 0);
    resetMatrix();
  }
  
}


void printMain(int size){
  String[] word = {"I", "Have", "A", "Dream"};
 
  for(int i = 0; i < word.length; i++){
    float x = random(50, width-50);
    float y = (i+1)*200+random(-30, 30);
    textFont(fonts[round(random(0, 9))]);
    textSize(random(85, 100));
    fill(getColor(x, y, true));//check(words[i])));
    
    
    translate(x, y);
    rotate(random(-PI/8, PI/8));
     
    //if(check(words[i]) && random(0, 1) > 0.3){
      text(word[i], 0, 0);
    //}
    resetMatrix();
  }
  
}



void loadSpeech(){
  String[] lines = loadStrings("mlk.txt");
  
  
  for(int i = 0; i < lines.length; i++){
      String[] temp = splitTokens(lines[i], tokens);
      //println(temp);
      if(temp.length > 0){
        words = (String[])concat(words, temp);
      }
  }
  
  //for(int i = 0; i < words.length; i++){
  //    println(words[i]);
  //}
  //println(words.length);
}

void loadFonts(){
  fonts[0] = loadFont("fancy.vlw");
  fonts[1] = loadFont("peak.vlw");
  fonts[2] = loadFont("straight.vlw");
  fonts[3] = loadFont("type.vlw");
  fonts[4] = loadFont("square.vlw");
  fonts[5] = loadFont("r1.vlw");
  fonts[6] = loadFont("r2.vlw");
  fonts[7] = loadFont("r3.vlw");
  fonts[8] = loadFont("r4.vlw");
  fonts[9] = loadFont("r5.vlw");
}

color getColor(float x, float y, boolean main){
   int r = int(random(0, pal.width));
   float h = hue(img.get(round(x), round(y)))+ random(-jit, jit);
   //float h = hue(pal.get(r, 100)) + random(-jit, jit);
   float s = saturation(img.get(round(x), round(y))) ;
   float b = brightness(img.get(round(x), round(y)))+ random(-jit, jit);
   if(main){
      return color(#FF0009);
     //s = 255;
     //b = 255;
   }
   return color(h, s, b);
}

boolean check(String w){
  String[] temp = splitTokens(main, tokens);
  for(int i = 0; i < temp.length; i ++){
    if(w.equals(temp[i])){
      return true;  
    }
  }
  
  return false;
  
}
