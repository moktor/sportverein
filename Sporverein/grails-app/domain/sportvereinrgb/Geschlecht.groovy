package sportvereinrgb

class Geschlecht {

    String geschlecht


        static belongsTo = Altersklasse, Sportler, Diziplin

        String toString() {
            return "${geschlecht}"
    }
    

        static constraints = {


        geschlecht     (blank:false, nullable:false, size:1..20)


    }
}
