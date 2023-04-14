package SorteosParcial2020;

public class Persona {
    private String nombre;
    private int dni;
    private double colaboracion;
    
    public Persona(String nombre, int dni, double colaboracion){
        this.nombre = nombre;
        this.dni = dni;
        this.colaboracion = colaboracion;
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public double getColaboracion() {
        return colaboracion;
    }
    
    @Override
    public String toString(){
        return "Nombre: "+nombre+"; DNI: "+dni+"; Colaboracion: $"+colaboracion;
    }
}
