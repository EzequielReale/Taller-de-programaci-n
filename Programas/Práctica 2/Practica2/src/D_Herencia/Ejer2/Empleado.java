package D_Herencia.Ejer2;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    
    public Empleado(String nombre, double sueldoBasico){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    public abstract double calcularSueldoACobrar();
    
    
    public String toString(){
        return "¡Hola! Mi nombre es "+this.nombre+" y cobro $"+this.sueldoBasico+" de base. ";
    }
}
