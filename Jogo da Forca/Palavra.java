public class Palavra implements Comparable<Palavra>
{
    private String texto;
    private int ultimaLetra = 0;

    public Palavra (String texto) throws Exception
    {
        if(texto == null || texto.length() == 0)
            throw new Exception("O texto não pode ser nulo.");
        else
            this.texto = texto;
    }

    public int getQuantidade (char letra)
    {
        int qtd = 0;
        for(int i = 0; i < this.texto.length(); i++){
            if(this.texto.charAt(i) == letra)
                qtd++;
        }
        return qtd;
    }

    private String getPalavra(){
        return this.texto;
    }


    public int getPosicaoDaIezimaOcorrencia (int i, char letra) throws Exception
    { 
        int qtd = this.getQuantidade(letra);

        if(qtd > 1){
            if(this.ultimaLetra >= this.getTamanho() -1){
               this.ultimaLetra = 0;
            }
            while(this.texto.charAt(this.ultimaLetra) != letra){
                this.ultimaLetra++;
            }
            this.ultimaLetra++;

            return this.ultimaLetra - 1;
        }else{
            while(this.texto.charAt(i) != letra){
                i++;
            }
            this.ultimaLetra = 0;
            return i;

        }
    }
    

    public int getTamanho ()
    {
        return this.texto.length();
    }

    public int revelarPosDica(){
        int random = (int) (Math.random() * this.texto.length());
        return random;
    }

    public char revelarLetraDica(){
        String palavra = this.getPalavra();
        char letra = palavra.charAt(this.revelarPosDica());
        return letra;
    }

    @Override
    public String toString ()
    {
        return this.texto;
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
		
		ret = ret * 13 + this.texto.hashCode();
		
		if (ret < 0) ret = -ret;
		
		return ret;
    }

    @Override
    public int compareTo (Palavra palavra)
    {
        return this.texto.compareTo(palavra.texto);
    }

}
