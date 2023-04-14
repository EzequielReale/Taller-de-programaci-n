package SorteosParcial2020;

import PaqueteLectura.GeneradorAleatorio;

public class Comun extends Sorteo{
    
    public Comun(double premio){
        super(premio);
    }

    @Override
    public Persona elGanador() {
        int num = GeneradorAleatorio.generarInt(this.getDimF());
        while (this.getBono(num) == null){
            num = GeneradorAleatorio.generarInt(this.getDimF());
        }
        return this.getBono(num);
    }
}
