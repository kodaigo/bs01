define [
    'zepto'
    ],
    ($) ->

        class BgTempleTower

            constructor: (id, cw, ch, option={}) ->

                @conf = {}

                if(!$)
                    console.error("no jquery or zept");
                    return;

                @conf = $.extend(@conf,option)

                @ch = ch;
                @cw = cw;
                
                #
                @canvas = document.getElementById(id)
                @ctx = canvas.getContext("2d")
                @canvas.width = @cw;
                @canvas.height = @ch;
            #
            #
            #
            start : ()->
                #$("#"+@conf.headerID).

                #コンテンツ
                @contents_h = @device_h - @header_h - @footer_h

                $("#"+@conf.contentsID).height(@contents_h)
                @iScroll = new lib.iScroll @conf.contentsID
                return
            #
            #
            #
            refresh : () ->
                @iScroll.refresh()


