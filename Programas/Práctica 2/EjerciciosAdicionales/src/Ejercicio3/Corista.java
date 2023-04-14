package Ejercicio3;

public class Corista {
    private String nombre;
    private int dni, edad, tonoFundamental;
    
    public Corista(String nombre, int dni, int edad, int tonoFundamental){
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    @Override
    public String toString(){
        return nombre+"(DNI: "+dni+", edad: "+edad+", tono fundamental: "+tonoFundamental+") | ";
    }
}
