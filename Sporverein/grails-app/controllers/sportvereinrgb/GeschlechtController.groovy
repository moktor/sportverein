package sportvereinrgb

class GeschlechtController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [geschlechtInstanceList: Geschlecht.list(params), geschlechtInstanceTotal: Geschlecht.count()]
    }

    def create = {
        def geschlechtInstance = new Geschlecht()
        geschlechtInstance.properties = params
        return [geschlechtInstance: geschlechtInstance]
    }

    def save = {
        def geschlechtInstance = new Geschlecht(params)
        if (geschlechtInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), geschlechtInstance.id])}"
            redirect(action: "show", id: geschlechtInstance.id)
        }
        else {
            render(view: "create", model: [geschlechtInstance: geschlechtInstance])
        }
    }

    def show = {
        def geschlechtInstance = Geschlecht.get(params.id)
        if (!geschlechtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
            redirect(action: "list")
        }
        else {
            [geschlechtInstance: geschlechtInstance]
        }
    }

    def edit = {
        def geschlechtInstance = Geschlecht.get(params.id)
        if (!geschlechtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [geschlechtInstance: geschlechtInstance]
        }
    }

    def update = {
        def geschlechtInstance = Geschlecht.get(params.id)
        if (geschlechtInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (geschlechtInstance.version > version) {
                    
                    geschlechtInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'geschlecht.label', default: 'Geschlecht')] as Object[], "Another user has updated this Geschlecht while you were editing")
                    render(view: "edit", model: [geschlechtInstance: geschlechtInstance])
                    return
                }
            }
            geschlechtInstance.properties = params
            if (!geschlechtInstance.hasErrors() && geschlechtInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), geschlechtInstance.id])}"
                redirect(action: "show", id: geschlechtInstance.id)
            }
            else {
                render(view: "edit", model: [geschlechtInstance: geschlechtInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def geschlechtInstance = Geschlecht.get(params.id)
        if (geschlechtInstance) {
            try {
                geschlechtInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'geschlecht.label', default: 'Geschlecht'), params.id])}"
            redirect(action: "list")
        }
    }
}
