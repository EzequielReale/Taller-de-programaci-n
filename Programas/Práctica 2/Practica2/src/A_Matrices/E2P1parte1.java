package A_Matrices;

/**
 *
 * @author Ezequiel
 */
public class E2P1parte1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        int num=1;
        
        while (num != 10){
            
            int numTot = 1;
            
                for (int i = 1; i <= num; i++){  
                    numTot *= i;    
                }
                num++;
                System.out.println("Factorial de " +num+": " +numTot);   
            }
    }
}
