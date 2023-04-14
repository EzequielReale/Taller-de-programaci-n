package C_Desarrollo_de_Clases;

public class BalanzaPro {
    private double monto;
    private int cant;
    private String resumen;


    public BalanzaPro(){
        this.monto = 0;
        this.cant = 0;
        this.resumen = "";
    }
    
    public void registrarProductoPro(double precioKg, Producto p){
        double precio = precioKg * p.getPesoEnKg();
        this.resumen += " - "+p.getDescripcion()+" $"+precio;
        this.monto += precio;
        this.cant++;
    }
    
    public double getMontoPro(){
        return this.monto;
    }
    
    public int getCantPro(){
        return this.cant;
    }
    
    public String toStringPro(){
        return this.resumen+". Total a pagar por la compra de "+this.getCantPro()+" productos: "+this.getMontoPro();
    }
}
