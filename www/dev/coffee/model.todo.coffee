define [
    'zepto'
    'underscore'
    'backbone'
    ],
    ($, _, Backbone) ->

        Todo = Backbone.Model.extend {
            #el : $('#app')
            defaults : ->
                return {
                    title : "empty todo..."
                    #order : Todos.nextOrder(),
                    initDate : new Date().toLocaleString()
                    done : false
                    #complete : false
                }
            initialize : ->
                if !@get "title"
                    @set {
                        "title" : @defaults().title
                    }
                return
            toggle : ->
                @save {
                    done : !@get "done"
                }
                return
            # complete : ->
            #     @save {
            #         complete : true
            #     }
            validate : (val) ->
        }

        return Todo