define [
    'js/collection.todos'
    'js/view.todolist'
    'js/lib.honegumi'
    'js/bg.tower'
    'zepto'
    'underscore'
    'backbone'
    ],
    (Todos, TodoView, Honegumi, Temple, $, _, Backbone) ->

        #
        # app view
        #
        AppView = Backbone.View.extend {
            #
            el : $("#app")
            #
            #templete: _.templete $("#item-temp").html()
            #
            events :
                #"keypress #new-todo":  "createOnEnter"
                #"click #clear-completed": "clearCompleted"
                #"click #toggle-all": "toggleAllComplete"
                "click #btnAddTask" : "addTask"
                "click #openDialog": "toggleDialog"

            #
            initialize : ->
                console.log "--view app--"

                @input = @.$("#AddTask")

                @listenTo(Todos, 'add', @addOne)
                @listenTo(Todos, 'reset', @addAll)
                @listenTo(Todos, 'remove', @completeTask)
                @listenTo(Todos, 'all', @render)

                @main = $('#Main')
                @dialogFlg = 0;

                #レイアウト初期化
                app.layout = new Honegumi(
                    header : false
                )
                app.layout.start()

                @Temple = new Temple("backImage", app.layout.contents_w, app.layout.contents_h)
                #@footer = @.$('footer')

                Todos.fetch();
                return
            render : ->
                console.log(arguments)
                console.log "--view app - render"
                # @count = _.countBy(
                #     Todos.models,
                #     (model) ->
                #         console.log 
                #         return if model.get 'complete' then 'complete' else 'do'
                # )                
                # if !@count.complete
                #     @count.complete = 0
                # if !@count.do
                #     @count.do = 0

                $("#TodoNumber").html(Todos.length)
                #$("#completeTask").html(@count.complete)

                return
            #
            #
            #
            addOne : (todo)->
                console.log "--view app - addOne"
                #if !todo.get('complete')
                view = new TodoView ({ model : todo})
                @$("#TodoList").append(view.render().el)
                view.$el
                .width(()=>
                    @$("#TodoList").width() - 6
                ).animate(
                    { marginLeft : 6 }
                    300,
                    'swing',
                    =>
                        app.layout.refresh()
                        return
                )
                return
            #
            #
            #
            addAll : ->
                Todos.each(@addOne, @)
                return
            #
            #
            #
            addTask : (e) ->
                if !@input.val()
                    return  
                Todos.create({title: @input.val()})
                @input.val('')
                return false
            #
            #
            #
            completeTask : () ->
                console.log "--view app - complete"
                # TODO CANVASアクション
                #　.add
                return
            # clearCompleted : ->
            #     _.invoke(Todos.done(),'destroy')
            #     return false
            # toggleAllComplete : ->
            #     done = this.allCheckbox.checked
            #     Todos.each(
            #         (todo)->
            #             todo.save({'done': done})
            #     )

            toggleDialog : () ->
                console.log(@dialogFlg)
                if @dialogFlg == 0
                    @dialogFlg = 1
                    $("#dialog").css('display','block')
                    $("#dialog").animate({
                        opacity:1
                        },
                        500,
                        "swing"
                    )
                else
                    @dialogFlg = 0
                    $("#dialog").animate({
                        opacity:0
                        },
                        500,
                        "swing",
                        ->
                            $("#dialog").css('display','none')
                            return
                    )
                return

        }

        return AppView