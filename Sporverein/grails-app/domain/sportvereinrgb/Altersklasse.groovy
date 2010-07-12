package sportvereinrgb

class Altersklasse {

    String      Altersklasse
    Geschlecht  geschlechtHinzufuegen



    static hasMany = [geschlechter:Geschlecht]


    String toString() {
        return "${altersklasse} ${geschlechtHinzufuegen}"
    }



    static constraints = {

    altersklasse            (blank:false, nullable:false, size:2..20)
    geschlechtHinzufuegen   (blank:false, nullable:false)

    }
}
