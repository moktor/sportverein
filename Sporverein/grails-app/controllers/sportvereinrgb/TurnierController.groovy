package sportvereinrgb

class TurnierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [turnierInstanceList: Turnier.list(params), turnierInstanceTotal: Turnier.count()]
    }

    def create = {
        def turnierInstance = new Turnier()
        turnierInstance.properties = params
        return [turnierInstance: turnierInstance]
    }

    def save = {
        def turnierInstance = new Turnier(params)
        if (turnierInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'turnier.label', default: 'Turnier'), turnierInstance.id])}"
            redirect(action: "show", id: turnierInstance.id)
        }
        else {
            render(view: "create", model: [turnierInstance: turnierInstance])
        }
    }

    def show = {
        def turnierInstance = Turnier.get(params.id)
        if (!turnierInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
            redirect(action: "list")
        }
        else {
            [turnierInstance: turnierInstance]
        }
    }

    def edit = {
        def turnierInstance = Turnier.get(params.id)
        if (!turnierInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [turnierInstance: turnierInstance]
        }
    }

    def update = {
        def turnierInstance = Turnier.get(params.id)
        if (turnierInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (turnierInstance.version > version) {
                    
                    turnierInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'turnier.label', default: 'Turnier')] as Object[], "Another user has updated this Turnier while you were editing")
                    render(view: "edit", model: [turnierInstance: turnierInstance])
                    return
                }
            }
            turnierInstance.properties = params
            if (!turnierInstance.hasErrors() && turnierInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'turnier.label', default: 'Turnier'), turnierInstance.id])}"
                redirect(action: "show", id: turnierInstance.id)
            }
            else {
                render(view: "edit", model: [turnierInstance: turnierInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def turnierInstance = Turnier.get(params.id)
        if (turnierInstance) {
            try {
                turnierInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turnier.label', default: 'Turnier'), params.id])}"
            redirect(action: "list")
        }
    }
}
