class Torus {
    double R; // Major radius
    double r; // Minor radius

    // Constructor
    Torus(double R, double r) {
        this.R = R;
        this.r = r;
    }

    // Method to calculate volume
    public double calcVol() {
        return 2 * Math.PI * Math.PI * R * r * r;
    }

    // Method to calculate surface area
    public double calcSurfArea() {
        return 4 * Math.PI * Math.PI * R * r;
    }
}