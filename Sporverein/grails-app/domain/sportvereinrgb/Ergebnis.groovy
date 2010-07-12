package sportvereinrgb

import java.util.regex.Matcher
import java.util.regex.Pattern

class Ergebnis {


static belongsTo = [sportlerHinzufuegen:Sportler, sportartAuswaehlen:Disziplin, turnierHinzufuegen:Turnier, altersklassehinzufüegen:Altersklasse]

    Sportler        sportlerHinzufuegen
    Turnier         turnierHinzufuegen
    Disziplin       sportartAuswaehlen
    Altersklasse    altersklassehinzufüegen
    String          ergebnisEintragen
    Long            sortierWert




    static constraints = {
        sportlerHinzufuegen     (blank:false, nullable:false)
        turnierHinzufuegen      (blank:false, nullable:false)
        sportartAuswaehlen      (blank:false, nullable:false)
        altersklassehinzufüegen (blank:false, nullable:false)
        ergebnisEintragen       (blank:false, nullable:false)
        sortierWert             (nullable:true)


    }



    // Methode zur Umrechnung von Meter in cm
    int toEinheitenUmwandlungMeter(String countStr, String unitStr) {
                    int countInt = countStr.toInteger()
                    return (unitStr == ',')? 100 * countInt : countInt


       
        }
    // Methode zur Umrechnung von Sekunden in Millisekunden
    int toEinheitenUmwandlungSekunden(String countStr, String unitStr) {
                    int countInt = countStr.toInteger()
                    return (unitStr == ',')? 100 * countInt : countInt


        }

    // Methode zur Umrechnung von Stunden in Millisekunden
    int toEinheitenUmwandlungStunden(String countStr, String unitStr) {
                    int countInt = countStr.toInteger()
                    


                    if (unitStr == ':'){
                        return 3600 * countInt
                    }

                    if (unitStr == ','){
                        return 60 * countInt
                    }

                    else {return countInt}


        }
// beforeInsert = abfangen des Objekts bevor es in die DB geschrieben wird

      transient beforeInsert = {

           String s = ergebnisEintragen


        // Meterumrechnung

        if (sportartAuswaehlen.einheit == 'm'){

           def PATSTR = /\s*(\d+)([,]|(?:m))/
           def PAT = ~PATSTR
           def S3 = ergebnisEintragen
        
            def temp
            def matcher
            def sum = 0
            if ((matcher = (S3 =~ PAT))) {
               matcher.each {matchedString, group1, group2 ->
                    sum += toEinheitenUmwandlungMeter(group1, group2)
                   
                }
            }
            

            def sortierterWert = sum
            sortierWert = Long.valueOf(sum)
           }


           //Sekundenumrechnung
           if (sportartAuswaehlen.einheit == 'sec'){

           def PATSTR = /\s*(\d+)([,]|(?:sec))/
           def PAT = ~PATSTR
           def S3 = ergebnisEintragen

            def temp
            def matcher
            def sum = 0
            if ((matcher = (S3 =~ PAT))) {
               matcher.each {matchedString, group1, group2 ->
                    sum += toEinheitenUmwandlungSekunden(group1, group2)

                }
            }


            def sortierterWert = sum
            sortierWert = Long.valueOf(sum)
           }

        // Stundenumrechnung
        if (sportartAuswaehlen.einheit == 'h'){

           def PATSTR = /\s*(\d+)([:]|(?:[,])|(?:h))/
           def PAT = ~PATSTR
           def S3 = ergebnisEintragen

            def temp
            def matcher
            def sum = 0
            if ((matcher = (S3 =~ PAT))) {
               matcher.each {matchedString, group1, group2 ->
                    sum += toEinheitenUmwandlungStunden(group1, group2)

                }
            }


            def sortierterWert = sum
            sortierWert = Long.valueOf(sum)
           }

      }



}








