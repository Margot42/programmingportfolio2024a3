// Creating a Java class
class Box {
  // Declaring and initializing the attributes
  int l;
  int w;
  int h;
  
  //constructor
  Box(int l, int w, int h) 
  {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods to set 
  public int calcVol() 
  {
    int vol= l*w*h;
    return vol;
  }
  
  public int calcSurfArea()
    {
    // Formula for surface area of a rectangular box
   int sa = 2 * (l * w + w * h + h * l);
   return sa;
   
    }
}