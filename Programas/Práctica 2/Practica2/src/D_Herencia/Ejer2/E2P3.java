package D_Herencia.Ejer2;

import PaqueteLectura.Lector;

public class E2P3 {

    public static void main(String[] args) {
        String nombre;
        double sueldoBasico;
        int goles, partidos, campeonatos;
        
        System.out.print("Ingrese el nombre del jugador: "); nombre = Lector.leerString();
        System.out.print("Ingrese el sueldo básico del jugador: "); sueldoBasico = Lector.leerDouble();
        System.out.print("Ingrese la cantidad de partidos del jugador: "); partidos = Lector.leerInt();
        System.out.print("Ingrese la cantidad de goles del jugador: "); goles = Lector.leerInt();
        Jugador j = new Jugador(partidos,goles,nombre,sueldoBasico);
        
        System.out.print("Ingrese el nombre del entrenador: "); nombre = Lector.leerString();
        System.out.print("Ingrese el sueldo básico del entrenador: "); sueldoBasico = Lector.leerDouble();
        System.out.print("Ingrese la cantidad de campeonatos ganados por el entrenador: "); campeonatos = Lector.leerInt();
        Entrenador e = new Entrenador(campeonatos,nombre,sueldoBasico);
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}
