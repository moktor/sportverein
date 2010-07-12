package sportvereinrgb

import grails.converters.*

class SportlerController {

    def scaffold = Sportler

    def ajaxGetSportler = {
       def Sportler = Sportler.findAllByNachname(params.nachname)

       if (!Sportler){
          Sportler = new Sportler (id:-1, vorname:"NOT FOUND" , nachname: "NOT FOUND")


       }

       render Sportler as JSON
   }
}
