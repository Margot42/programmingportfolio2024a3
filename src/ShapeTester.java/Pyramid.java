class Pyramid {

    int l;
    int w;
    int h;

    // Constructor
    Pyramid(int l, int w, int h) {
        this.l = l;
        this.w = w;
        this.h = h;
    }

    // Method to calculate volume
    public int calcVol() {
        return (l * w * h) / 3;
    }

    // Method to calculate surface area
    public int calcSurfArea() {
    // Calculate slant height, ensuring floating point division
    double slantHeight = Math.sqrt((l / 2.0) * (l / 2.0) + h * h);
    int baseArea = l * w;
    int perimeter = 2 * (l + w);
    double lateralArea = (perimeter * slantHeight) / 2;
    return (int) (baseArea + lateralArea); 
    
    }
}