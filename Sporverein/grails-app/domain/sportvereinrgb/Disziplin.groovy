package sportvereinrgb

class Disziplin {


    String          Disziplin
    String          Einheit
    Geschlecht      geschlechtHinzufuegen





    static hasMany = [geschlechter:Geschlecht, ergebnisse:Ergebnis]

    

    String toString() {
        def beispielString
        if (einheit == 'm')     {beispielString = '  Beispieleingabe 10,10m'}
        if (einheit == 'sec')   {beispielString = '  Beispieleingabe 10,10sec'}
        if (einheit == 'h')     {beispielString = '  Beispieleingabe 1:10,10h'}
     
        return "${disziplin} ${geschlechtHinzufuegen} " + beispielString
        
    }




    
    static constraints = {
        disziplin               (blank:false, nullable:false, size:1..20)
        einheit                 (inList:["m", "sec", "h"])
        geschlechtHinzufuegen   (blank:false, nullable:false)
       
    }
}



