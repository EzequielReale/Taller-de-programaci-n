package D_Herencia.Ejer1;

public class Triangulo extends Figura{
    private double lado1, lado2, lado3;
    
    public Triangulo(double lado1, double lado2, double lado3, String colorLinea, String colorRelleno){
        super(colorRelleno, colorLinea);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3; 
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    @Override
    public double calcularArea() {
        double area, perimetro; 
        perimetro = this.calcularPerimetro();
        area = Math.sqrt(perimetro * (perimetro - this.lado1) * (perimetro - this.lado2) * (perimetro - this.lado3));
        return area;
    }

    @Override
    public double calcularPerimetro() {
        double perimetro = (this.lado1 + this.lado2 + this.lado3) / 2;
       return perimetro;
    }
    
    @Override
    public String toString(){
        return super.toString()+
                " - Lado 1: " +this.lado1+
                " - Lado 2: " +this.lado2+
                " - Lado 3: " +this.lado3;
    }
}
