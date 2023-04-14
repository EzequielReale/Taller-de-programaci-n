package Ejercicio3;

public class Hilera extends Coro{
    private Corista[][] coristas;
    private int dimLhilera, dimLcolumna, dimFhilera, dimFcolumna;
    
    public Hilera(String nombre, Director director, int dimFhilera, int dimFcolumna){
        super(nombre, director);
        this.dimFhilera = dimFhilera;
        this.dimFcolumna = dimFcolumna;
        this.dimLhilera = 0;
        this.dimLcolumna = 0;
        coristas = new Corista[this.dimFcolumna][this.dimFhilera];
    }
    
    @Override
    public void agregarCorista(Corista unCorista){
        if ((dimLhilera < dimFhilera) && (dimLcolumna < dimFcolumna)){
            coristas[dimLcolumna][dimLhilera] = unCorista;
            dimLhilera++;
            if (dimLhilera == dimFhilera){
                dimLhilera = 0;
                dimLcolumna++;
            }
        }
        else{
            System.out.println("El coro está lleno.");
        }      
    }
    
    @Override
    public boolean estaLleno(){
        return (dimLcolumna == dimFcolumna);
    }
    
    @Override
    public boolean estaBienFormado(){
        boolean bien = true;
        int i = 0, j = 0;
        while ((j < dimFcolumna) && (bien)){
            while ((i < dimFhilera-1) && (bien)){
                if (coristas[j][i].getTonoFundamental() != coristas[j][i+1].getTonoFundamental()){
                    bien = false;
                }
                i++;
            }
            j++;
            i = 0;
            if (coristas[j][i].getTonoFundamental() < coristas[j-1][i].getTonoFundamental()){
                bien = false;
            }  
        }
        return bien;
    }
    
    @Override
    public String toString(){
        String aux = super.toString();
        for (int i = 0; i < dimFcolumna; i++) {
            for (int j = 0; j < dimFhilera; j++) {
                if (coristas[i][j] != null){
                    aux += coristas[i][j].toString(); 
                }
            }  
        }
        return aux;
    }
}
