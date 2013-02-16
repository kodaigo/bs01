define [
    'js/bg.temple'
    'zepto'
    ],
    (Temple, $) ->

        class BgTower

            constructor: (id, cw, ch, option={}) ->

                @conf = {}

                if(!$)
                    console.error("no jquery or zept");
                    return;

                @conf = $.extend(@conf,option)

                @ch = ch;
                @cw = cw;
                
                @roofs = []

                #
                @canvas = document.getElementById(id)
                @ctx = @canvas.getContext("2d")
                @canvas.width = @cw;
                @canvas.height = @ch;
            #
            #
            #
            addOne : () ->
                roof  = new Temple (n)
                roofs.push roof
                
            #
            #
            #
            render : ()->
                #
                # TODO
                #
                @ctx.clearRect(0, 0, cw, ch)
                @ctx.save()

                
                @ctx.restore()

                return
            #
            #
            #
            update : () ->

                @render()
                return