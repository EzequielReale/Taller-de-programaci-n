package D_Herencia.Ejer4;

public class ClaseA {

    public int dos(){
        return 2;
    }
    
    public int tres(){
        return this.dos() + this.siete();
    }
    
    public int siete(){
        return 9;
    }
}