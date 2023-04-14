package D_Herencia.Ejer4;

public class ClaseC extends ClaseB{

    public int uno(){
        return this.cuatro();
    }

    @Override
    public int dos(){
        return 9;
    }

    public int cinco(){
        return super.seis();
    }
}