package C_Desarrollo_de_Clases;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulo(){
        
    }
    
    public Triangulo(double ladoUno, double ladoDos, double ladoTres, String unColorRelleno, String unColorLinea){
        this.lado1 = ladoUno;
        this.lado2 = ladoDos;
        this.lado3 = ladoTres;
        this.colorRelleno= unColorRelleno;
        this.colorLinea = unColorLinea;
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

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(){
       double perimetro = (this.lado1 + this.lado2 + this.lado3) / 2;
       return perimetro;
    }
    
    public double calcularArea(){
        double area, perimetro; 
        perimetro = this.calcularPerimetro();
        area = Math.sqrt(perimetro * (perimetro - this.lado1) * (perimetro - this.lado2) * (perimetro - this.lado3));
        return area;
    }
    
    @Override
    public String toString(){
        return "Hola! Soy un triángulo! Mis lados son :"+this.lado1+", "+this.lado2+" y "+this.lado3
                +". Mi color de relleno es "+this.colorRelleno+" y el color de línea es "+this.colorLinea
                +". Mi perímetro es "+this.calcularPerimetro()+" y mi área es "+this.calcularArea();
    }
}
