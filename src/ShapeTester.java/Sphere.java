class Sphere {
    // Declaring and initializing the attributes
  int r;
  
  // Constructor
  Sphere(int r) 
  {
      this.r = r;
  }

  // Method to calculate volume
  public double calcVol() 
  {
    return (4.0 / 3.0) * Math.PI * Math.pow(r, 3);
  }
  
  // Method to calculate surface area
  public double calcSurfArea() 
  {
    return 4 * Math.PI * Math.pow(r, 2);
  }
    
}