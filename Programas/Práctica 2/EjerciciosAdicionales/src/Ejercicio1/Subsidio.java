package Ejercicio1;

public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado = false;
    
    public Subsidio(double monto, String motivo){
        this.monto = monto;
        this.motivo = motivo;
    }

    public double getMonto() {
        return monto;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
}
