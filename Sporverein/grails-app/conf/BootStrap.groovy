import sportvereinrgb.*
import grails.util.GrailsUtil

class BootStrap {

    def init = { servletContext ->

        switch (GrailsUtil.environment) {
            case "test":
            case "development":
            createTestdata()
            break
        }
    }

    def void createTestdata() {
        def g = new Geschlecht(geschlecht: "m")
        g.save(flush: true)
        def a = new Altersklasse(Altersklasse: "jung", geschlechtHinzufuegen: g)
        a.save(flush:true)
        def d = new Disziplin(Disziplin: "laufen", Einheit: "sec", geschlechtHinzufuegen: g)
        d.save(flush: true)
        def s = new Sportler(Vorname: "hans", Nachname: "dampf", Email: "e@e.com", StrasseHausnummer: "street 5", Ort: "city", Postleitzahl: 12345, geschlechtHinzufuegen: g,
            gebDatum: new Date())
        s.save(flush: true)
        def t = new Turnier(Name: "Tournament1", Startdatum: new Date(25-05-2001), Enddatum: new Date(31-7-2002), Ort: "city1", Beschaffenheit: "open air")
        t.save(flush: true)
        def e = new Ergebnis(sportlerHinzufuegen: s, turnierHinzufuegen: t, altersklassehinzufüegen: a, ergebnisEintragen: "12,55sec", sportartAuswaehlen: d)
        e.save(flush: true)
    }

    def destroy = {
    }
} 