define [
    'js/model.todo'
    'zepto'
    'underscore'
    'backbone'
    'backbone.localstorage'
    ],
    (Todo, $, _, Backbone) ->

        # console.log Backbone.LocalStorage
        #console.log 

        TodoList = Backbone.Collection.extend {
            #
            # モデル定義
            #
            model : Todo
            #
            # local stoega
            #
            localStorage : new Backbone.LocalStorage("todo-app")
            #
            # 
            #
            done : ->
                return @filter(
                    (todo)->
                        return todo.get('done')
                )
            #
            #
            #
            remaining : ->
                return @without.apply(@, @.done())
            nextOrder : ->
                if !@length
                    return 1
                return @last().get('order') + 1
        }

        return new TodoList