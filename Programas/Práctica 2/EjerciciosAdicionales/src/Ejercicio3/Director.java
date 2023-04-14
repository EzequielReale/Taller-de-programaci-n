package Ejercicio3;

public class Director {
    private String nombre;
    private int dni, edad, antiguedad;
    
    public Director(String nombre, int dni, int edad, int antiguedad){
        this.nombre = nombre;
        this.dni = dni;
        this.antiguedad = antiguedad;
        this.edad = edad;
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString(){
        return nombre+"(DNI: "+dni+", edad: "+edad+", antiguedad: "+antiguedad+"). ";
    }
}
