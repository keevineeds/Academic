public class Tracinhos implements Cloneable
{
    private char texto [];


    public Tracinhos (int qtd) throws Exception
    {
        if(qtd < 0){
            throw new Exception("A quantidade de tracinhos nao pode ser negativa.");
        }
        else{
            this.texto = new char[qtd];
            for(int i = 0; i <= this.texto.length -1; i++){
                texto[i] = '_';
            }
        }
    }

    public void revele (int posicao, char letra) throws Exception
    {
        
        if(posicao < 0 || posicao > this.texto.length){
            throw new Exception("A posição não pode ser negativa e nem maior que o tamanho do texto.");
        }else{
            this.texto[posicao] = letra;
        }
    }

    public boolean isAindaComTracinhos()
    {
        boolean resultado = false;

        int contadorTracinhos = 0;
        for(int i = 0 ; i < this.texto.length; i++)
        {
            if(texto[i] == '_'){
            contadorTracinhos++; 
            resultado = true;
            }
        }
        if(contadorTracinhos == 0){
            resultado = false;
        }

        return resultado;
    }

    @Override
    public String toString()
    {
        String valor = new String();
        for(int i = 0; i < this.texto.length; i++){
            
            valor += this.texto[i] + " ";
        }
         return valor;
    }

    @Override
    public boolean equals(Object obj)
    {
        if(this == obj)
            return true;
            

        if(this.getClass() != obj.getClass())
            return false;

        
        return false;
    }

    @Override
    public int hashCode()
    {
		int ret = 666;
		
		ret = ret * 13 + this.texto.hashCode();

		if (ret < 0) ret = -ret;
		
		return ret;
    }

    public Tracinhos (Tracinhos t) throws Exception
    {
        if(t == null)
            throw new Exception("Modelo ausente");
        else
            this.texto = t.texto;
    }

    public Object clone()
    {
        Tracinhos ret = null;
        try{
            ret = new Tracinhos(this);
        }catch(Exception err){}

        return ret;
    }


}
