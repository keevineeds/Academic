public class ControladorDeErros implements Cloneable
{
    private int qtdMax, qtdErr=0;

    public ControladorDeErros(int qtdMax) throws Exception
    {
        if(qtdMax < 0)
            throw new Exception("A quantidade de erros não pode ser negativa.");
        else
            this.qtdMax = qtdMax;
    }

    public void registreUmErro() throws Exception
    {
        if(this.qtdErr == this.qtdMax)
            throw new Exception("Quantidade maxima de erros já atingida.");
        else
            this.qtdErr = this.qtdErr + 1;
    
    }

    public boolean isAtingidoMaximoDeErros()
    {
        if(this.qtdErr == this.qtdMax)
            return true;
        else
            return false;
        
    }

    @Override
    public String toString()
    {
        return this.qtdErr + "/" + this.qtdMax;
    }

    @Override
    public boolean equals(Object obj)
    {
        if(this == obj)
            return true;
        else
            return false;
    }

    @Override
    public int hashCode ()
    {
		int ret = 666;
		
		ret = ret * 13 + Integer.valueOf(this.qtdMax).hashCode();
		ret = ret * 13 + Integer.valueOf(this.qtdErr).hashCode();
		
		if (ret < 0) ret = -ret;
		
		return ret;
    }

    public ControladorDeErros (ControladorDeErros c) throws Exception
    {
        if(c == null){
            throw new Exception("Modelo ausente.");
        } 
        else{
            this.qtdMax = c.qtdMax;
            this.qtdErr = c.qtdErr;
        }
    }

    public Object clone ()
    {        
        ControladorDeErros ret = null;
        try{
            ret = new ControladorDeErros(this);
        }catch(Exception err){}

        return ret;
    }
}
