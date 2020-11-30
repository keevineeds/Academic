public class ControladorDeLetrasJaDigitadas implements Cloneable
{
    private String letrasJaDigitadas;

    public ControladorDeLetrasJaDigitadas ()
    {
       this.letrasJaDigitadas = new String();
    }

    public boolean isJaDigitada (char letra)
    {
        String x = new String();
        x = Character.toString(letra);

           if(letrasJaDigitadas.contains(x))
                return true;
           else
                return false;
    }

    public void registre (char letra) throws Exception
    {

        if(!this.isJaDigitada(letra))
            this.letrasJaDigitadas += letra;
        else
            throw new Exception("A letra já foi digitada!");

    }
    
    @Override
    public String toString ()
    {
        String x = new String();
        for(int i = 0; i < this.letrasJaDigitadas.length(); i++)
        {
            x +=  letrasJaDigitadas.charAt(i) + ", " ;
        }
        return x;
    }

    @Override
    public boolean equals (Object obj)
    {
        if(this == obj)
                return true;
        
        if(this.getClass() != obj.getClass())
                return false;


        return false;
        
    }

    @Override
    public int hashCode ()
    {
        int ret = 666;
		
		ret = ret * 13 + this.letrasJaDigitadas.hashCode();
		
		if (ret < 0) ret = -ret;
		
		return ret;
    }

    public ControladorDeLetrasJaDigitadas(
    ControladorDeLetrasJaDigitadas controladorDeLetrasJaDigitadas)
    throws Exception
    {
        if(controladorDeLetrasJaDigitadas == null)
            throw new Exception("Modelo ausente");
        else
            this.letrasJaDigitadas = controladorDeLetrasJaDigitadas.letrasJaDigitadas;
    }

    public Object clone ()
    {
        ControladorDeLetrasJaDigitadas ret = null;
        try{
            ret = new ControladorDeLetrasJaDigitadas(this);
            
        }catch(Exception err){}

        return ret;
    }
}
