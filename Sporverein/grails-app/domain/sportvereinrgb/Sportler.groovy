package sportvereinrgb

class Sportler {

    // Properties

    String      Vorname
    String      Nachname
    String      Email
    String      StrasseHausnummer
    String      Ort
    Integer     Postleitzahl
    Date        GebDatum
    Geschlecht  geschlechtHinzufuegen


    
    static hasMany = [geschlecht:Geschlecht, ergebnisse:Ergebnis]

     String toString() {

        return "${vorname} ${nachname} ${GebDatum.format("dd.MM.yyyy")}"
    }

    // Properties constraints


    static constraints = {
        vorname                     (blank:false, nullable:false, size:2..20)
        nachname                    (blank:false, nullable:false, size:2..20)
        email                       (email:true)
        strasseHausnummer           (blank:false, nullable:false, size:2..20)
        ort                         (blank:false, nullable:false, size:2..20)
        postleitzahl                (blank:false, nullable:false, size:4..5)
        geschlechtHinzufuegen       (blank:false, nullable:false)
    }
}
