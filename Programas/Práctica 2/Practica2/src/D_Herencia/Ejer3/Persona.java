
package D_Herencia.Ejer3;

public class Persona {
    private String nombre;
    private int DNI, edad;
    
    public Persona(String nombre, int DNI, int edad){
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    @Override
    public String toString(){
        return "Mi nombre es "+this.nombre+", mi DNI es "+this.DNI+" y tengo "+this.edad+" años. ";
    }
    
}
