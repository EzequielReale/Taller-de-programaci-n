package Ejercicio3;

public class Semicircular extends Coro{
    private Corista[] coristas;
    private int dimL, dimF;
    
    public Semicircular(String nombre, Director director, int dimF){
        super(nombre, director);
        this.dimF = dimF;
        this.dimL = 0;
        coristas = new Corista[this.dimF];
    }
    
    @Override
    public void agregarCorista(Corista unCorista){
        if (dimL < dimF){
            coristas[dimL] = unCorista;
            dimL++;
        }
        else{
            System.out.println("El coro está lleno.");
        }
    }
    
    @Override
    public boolean estaLleno(){
        return (dimL == dimF);
    }
    
    @Override
    public boolean estaBienFormado(){
        boolean bien = true;
        int i = 0;
        while ((i < dimF-1) && (bien)){
            if (coristas[i].getTonoFundamental() < coristas[i+1].getTonoFundamental()){
                bien = false;
            }
            i++;
        }
        return bien;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        for (int i = 0; i < dimL; i++) {
            if (coristas[i] != null){
                aux += coristas[i].toString();
            } 
        }
        return aux;
    }
}
