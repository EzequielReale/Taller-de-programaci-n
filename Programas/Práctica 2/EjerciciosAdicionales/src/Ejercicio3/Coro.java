package Ejercicio3;

public abstract class Coro {
    private String nombre;
    private Director director;
    
    public Coro(String nombre, Director director){
        this.nombre = nombre;
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista unCorista);
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    
    @Override
    public String toString(){
        return "El coro "+nombre+" está compuesto por el honrado director "+director.toString()+" y por sus coristas: ";
    }
}
