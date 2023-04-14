package D_Herencia.Ejer4;

public class ClaseB extends ClaseA{

    @Override
    public int dos(){
        return 5;
    }

    public int cuatro(){
        return this.dos() + super.tres();
    }

    public int seis(){
        return this.dos();
    }
}