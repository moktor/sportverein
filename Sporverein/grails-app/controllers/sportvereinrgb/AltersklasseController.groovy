package sportvereinrgb

class AltersklasseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [altersklasseInstanceList: Altersklasse.list(params), altersklasseInstanceTotal: Altersklasse.count()]
    }

    def create = {
        def altersklasseInstance = new Altersklasse()
        altersklasseInstance.properties = params
        return [altersklasseInstance: altersklasseInstance]
    }

    def save = {
        def altersklasseInstance = new Altersklasse(params)
        if (altersklasseInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), altersklasseInstance.id])}"
            redirect(action: "show", id: altersklasseInstance.id)
        }
        else {
            render(view: "create", model: [altersklasseInstance: altersklasseInstance])
        }
    }

    def show = {
        def altersklasseInstance = Altersklasse.get(params.id)
        if (!altersklasseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
            redirect(action: "list")
        }
        else {
            [altersklasseInstance: altersklasseInstance]
        }
    }

    def edit = {
        def altersklasseInstance = Altersklasse.get(params.id)
        if (!altersklasseInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [altersklasseInstance: altersklasseInstance]
        }
    }

    def update = {
        def altersklasseInstance = Altersklasse.get(params.id)
        if (altersklasseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (altersklasseInstance.version > version) {
                    
                    altersklasseInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'altersklasse.label', default: 'Altersklasse')] as Object[], "Another user has updated this Altersklasse while you were editing")
                    render(view: "edit", model: [altersklasseInstance: altersklasseInstance])
                    return
                }
            }
            altersklasseInstance.properties = params
            if (!altersklasseInstance.hasErrors() && altersklasseInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), altersklasseInstance.id])}"
                redirect(action: "show", id: altersklasseInstance.id)
            }
            else {
                render(view: "edit", model: [altersklasseInstance: altersklasseInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def altersklasseInstance = Altersklasse.get(params.id)
        if (altersklasseInstance) {
            try {
                altersklasseInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'altersklasse.label', default: 'Altersklasse'), params.id])}"
            redirect(action: "list")
        }
    }
}
