package C_Desarrollo_de_Clases;

public class Balanza {
    private double monto;
    private int cant;


    public Balanza(){
        this.monto = 0;
        this.cant = 0;
    }
    
    public void registrarProducto(double peso, double precioKg){
        double precio = precioKg * peso;
        this.monto += precio;
        this.cant++;
    }
    
    public double getMonto(){
        return this.monto;
    }
    
    public int getCant(){
        return this.cant;
    }
    
    @Override
    public String toString(){
        return "Total a pagar por la compra de "+this.getCant()+" productos: "+this.getMonto();
    }
}
