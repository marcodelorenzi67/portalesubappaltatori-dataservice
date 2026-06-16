#input Blob fileIn, String nome, String cognome, String azienda, String pattern
import com.webratio.data.blob.BlobFactory

def estensione = ""

def nomeFile = fileIn.getName();
println "nomeFile " + nomeFile
println "nome " + nome
println "cognome " + cognome
println "azienda " + azienda

int indicePuntoFinale = nomeFile.lastIndexOf(".")

if (indicePuntoFinale >= 0) {
    estensione = nomeFile.substring(indicePuntoFinale)
}

def risultato = pattern
        .replace("##nome##", nome ?: "")
        .replace("##cognome##", cognome ?: "")
        .replace("##azienda##", azienda ?: "")
        
def nomeFileFinale = risultato + estensione

return nomeFileFinale