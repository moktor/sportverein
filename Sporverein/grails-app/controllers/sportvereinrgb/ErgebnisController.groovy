package sportvereinrgb

class ErgebnisController {

   static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   def index = {
       redirect(action: "list", params: params)
   }

   def list = {
       params.max = Math.min(params.max ? params.int('max') : 10, 100)
       [ergebnisInstanceList: Ergebnis.list(params), ergebnisInstanceTotal: Ergebnis.count()]
   }

   def create = {
       def ergebnisInstance = new Ergebnis()
       ergebnisInstance.properties = params
       return [ergebnisInstance: ergebnisInstance]
   }

   def save = {
       def ergebnisInstance = new Ergebnis(params)
       if (ergebnisInstance.save(flush: true)) {
           flash.message = "${message(code: 'default.created.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), ergebnisInstance.id])}"
           redirect(action: "show", id: ergebnisInstance.id)
       }
       else {
           render(view: "create", model: [ergebnisInstance: ergebnisInstance])
       }
   }

   def show = {
       def ergebnisInstance = Ergebnis.get(params.id)
       if (!ergebnisInstance) {
           flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
           redirect(action: "list")
       }
       else {
           [ergebnisInstance: ergebnisInstance]
       }
   }

   def edit = {
       def ergebnisInstance = Ergebnis.get(params.id)
       if (!ergebnisInstance) {
           flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
           redirect(action: "list")
       }
       else {
           return [ergebnisInstance: ergebnisInstance]
       }
   }

   def update = {
       def ergebnisInstance = Ergebnis.get(params.id)
       if (ergebnisInstance) {
           if (params.version) {
               def version = params.version.toLong()
               if (ergebnisInstance.version > version) {

                   ergebnisInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ergebnis.label', default: 'Ergebnis')] as Object[], "Another user has updated this Ergebnis while you were editing")
                   render(view: "edit", model: [ergebnisInstance: ergebnisInstance])
                   return
               }
           }
           ergebnisInstance.properties = params
           if (!ergebnisInstance.hasErrors() && ergebnisInstance.save(flush: true)) {
               flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), ergebnisInstance.id])}"
               redirect(action: "show", id: ergebnisInstance.id)
           }
           else {
               render(view: "edit", model: [ergebnisInstance: ergebnisInstance])
           }
       }
       else {
           flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
           redirect(action: "list")
       }
   }

   def delete = {
       def ergebnisInstance = Ergebnis.get(params.id)
       if (ergebnisInstance) {
           try {
               ergebnisInstance.delete(flush: true)
               flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
               redirect(action: "list")
           }
           catch (org.springframework.dao.DataIntegrityViolationException e) {
               flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
               redirect(action: "show", id: params.id)
           }
       }
       else {
           flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ergebnis.label', default: 'Ergebnis'), params.id])}"
           redirect(action: "list")
       }
   }


   def bestenliste = {



        


               flash.message = params.long('sportartAuswaehlen_id')
               flash.message = params.long('altersklassehinzufüegen.id')
               def ak = params.long('altersklassehinzufüegen.id')
               def sa = params.long('sportartAuswaehlen_id')
               def az = params.int('anzahl')




        if (request.method == 'POST'){
            
            def query = Ergebnis.executeQuery ("select res.sportlerHinzufuegen.vorname , res.sportlerHinzufuegen.nachname from Ergebnis as res where sportartAuswaehlen.id ="+sa.toString()+" and altersklassehinzufüegen.id= "+ak.toString()).toList()
            //query.setResultSetMapping()

            flash.message = query.toString()

            //flash.message = query.toString()

        ([ergebnisInstanceList : query])


   }}
 
   




     def bestenlistensportler = {

        flash.message = params.long('sportlerHinzufuegen.id')
        flash.message = params.long('sportartAuswaehlen_id')




        if (request.method == 'POST'){

               def criteria = Ergebnis.createCriteria();
               def results = criteria {


                and{
                      if(params.sportartAuswaehlen_id && params.sportartAuswaehlen_id != ''){


                       sportlerHinzufuegen {
                           eq("id", params.long('sportlerHinzufuegen.id'))

                       }
                      }

                        sportartAuswaehlen {
                           eq("id", params.long('sportartAuswaehlen_id'))

                       }


                     }


               maxResults( params.int('anzahl') )

                def einheitentemp = Disziplin.get(params.long('sportartAuswaehlen_id'))

                    if(einheitentemp.einheit == 'm'){

                    order("sortierWert" , "desc" )
                    }
                    if (einheitentemp.einheit == 'sec'){
                    order("sortierWert" , "asc" )
                    }
                    if (einheitentemp.einheit == 'h'){
                    order("sortierWert" , "asc" )
                    }





               }
               render(view:'bestenlistensportler',model:[ergebnisInstanceList : results])

    }




}


}





