package SorteosParcial2020;

import PaqueteLectura.GeneradorAleatorio;

public abstract class Sorteo {
    private double premio;
    private Persona[] bono;
    private int dimF;
    
    public Sorteo(double premio){
        this.premio = premio;
        this.dimF = 99;
        bono = new Persona[dimF];
        for (int i = 0; i < dimF; i++) {
            bono[i] = null;
        }
    }
   
    public int agregarPersona(Persona unaPersona){
        int num = GeneradorAleatorio.generarInt(dimF);
        if (bono[num] == null){
            bono[num] = unaPersona;
        }
        else{
           agregarPersona(unaPersona);
        }
        return num;
    }
    
    public Persona comproBonoB(int b){
        if (bono[b] != null){
            return bono[b];
        }
        else{
            return null;
        }
    }
    
    public abstract Persona elGanador();

    public double getPremio() {
        return premio;
    }

    public int getDimF() {
        return dimF;
    }

    public Persona getBono(int i) {
        return bono[i];
    }
}
