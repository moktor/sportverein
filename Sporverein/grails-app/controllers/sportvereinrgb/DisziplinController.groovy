package sportvereinrgb

class DisziplinController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [disziplinInstanceList: Disziplin.list(params), disziplinInstanceTotal: Disziplin.count()]
    }

    def create = {
        def disziplinInstance = new Disziplin()
        disziplinInstance.properties = params
        return [disziplinInstance: disziplinInstance]
    }

    def save = {
        def disziplinInstance = new Disziplin(params)
        if (disziplinInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), disziplinInstance.id])}"
            redirect(action: "show", id: disziplinInstance.id)
        }
        else {
            render(view: "create", model: [disziplinInstance: disziplinInstance])
        }
    }

    def show = {
        def disziplinInstance = Disziplin.get(params.id)
        if (!disziplinInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [disziplinInstance: disziplinInstance]
        }
    }

    def edit = {
        def disziplinInstance = Disziplin.get(params.id)
        if (!disziplinInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [disziplinInstance: disziplinInstance]
        }
    }

    def update = {
        def disziplinInstance = Disziplin.get(params.id)
        if (disziplinInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (disziplinInstance.version > version) {
                    
                    disziplinInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'disziplin.label', default: 'Disziplin')] as Object[], "Another user has updated this Disziplin while you were editing")
                    render(view: "edit", model: [disziplinInstance: disziplinInstance])
                    return
                }
            }
            disziplinInstance.properties = params
            if (!disziplinInstance.hasErrors() && disziplinInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), disziplinInstance.id])}"
                redirect(action: "show", id: disziplinInstance.id)
            }
            else {
                render(view: "edit", model: [disziplinInstance: disziplinInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def disziplinInstance = Disziplin.get(params.id)
        if (disziplinInstance) {
            try {
                disziplinInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'disziplin.label', default: 'Disziplin'), params.id])}"
            redirect(action: "list")
        }
    }
}
