package sportvereinrgb

class Turnier {

    String  Name
    Date    Startdatum
    Date    Enddatum
    String  Ort
    String  Beschaffenheit

    static hasMany = [ergebnisse: Ergebnis]

    String toString() {
        return "${name} ${ort}"
    }


    static constraints = {

        name            (blank:false, nullable:false, size:2..20)
        startdatum      (blank:false, nullable:false)
        enddatum        (blank:false, nullable:false)
        ort             (blank:false, nullable:false, size:2..20)
        beschaffenheit  (blank:false, nullable:false, size:2..20)



    }
}
