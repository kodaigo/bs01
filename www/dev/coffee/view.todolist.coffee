define [
    'zepto'
    'underscore'
    'backbone'
    ],
    ($, _, Backbone) ->

        TodoView = Backbone.View.extend {
            #
            tagName : 'div',
            className : 'task'
            #
            template: _.template $("#tmpl-task").html()
            #
            events :
                "click .title a" : "showDetail"
                "click .close a" : "hideDetail"
                "click .complete a" : "clear"
                "click .edit a" : "edit"
            #
            initialize : ->
                @listenTo(@model, 'change', @render)
                @listenTo(@model, 'destroy', @remove)
                return
            render : ->
                # TODO ??
                @$el.html(@template(@model.toJSON()))
                @$el.toggleClass('done', @model.get('done'))
                @elDetail = @$('.detail')

                # @input = @$('.edit')
                #this　返す？
                return @
            toggleDone : ->
                @model.doggle()
                return
            clear : (e) ->
                @$el
                .animate(
                    { marginLeft : "100%" }
                    300,
                    'swing',
                    =>
                        @$el.animate(
                            { 
                                height : 0
                                marginTop : 0
                            }
                            300,
                            'swing',
                            =>
                                #@model.complete()
                                #@remove()
                                @model.destroy();
                                app.layout.refresh()
                        )

                        return
                )
                return false
            showDetail : (e)->
                @elDetail.show()
                app.layout.refresh()
                return false
            hideDetail : (e)->
                @elDetail.hide()
                app.layout.refresh()
                return false
            edit : ->
                @$el.addClass("editing");
        }

        return TodoView