define [
    'zepto'
    'iscroll'
    ],
    ($,lib) ->

        window.LIB = window.LIB || {}

        class LIB.HONEGUMI

            constructor: (option={}) ->

                @conf =
                    header : true
                    headerID : "uiHeader"
                    footer : true
                    footerID : "uiFooter"
                    contentsID : "uiContents"

                if(!$)
                    console.error("no jquery or zept");
                    return;

                @conf = $.extend(@conf,option)

                @device_h = $(window).height()
                @device_w = $(window).width()
                
                @header_h = if @conf.header then $("#"+@conf.headerID).height() else 0
                @footer_h = if @conf.footer then $("#"+@conf.footerID).height() else 0
            #
            #
            #

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


