// Generated by CoffeeScript 1.4.0
(function() {

  define(['zepto', 'iscroll'], function($, lib) {
    window.LIB = window.LIB || {};
    return LIB.HONEGUMI = (function() {

      function HONEGUMI(option) {
        if (option == null) {
          option = {};
        }
        this.conf = {
          header: true,
          headerID: "uiHeader",
          footer: true,
          footerID: "uiFooter",
          contentsID: "uiContents"
        };
        if (!$) {
          console.error("no jquery or zept");
          return;
        }
        this.conf = $.extend(this.conf, option);
        this.device_h = $(window).height();
        this.device_w = $(window).width();
        this.header_h = this.conf.header ? $("#" + this.conf.headerID).height() : 0;
        this.footer_h = this.conf.footer ? $("#" + this.conf.footerID).height() : 0;
      }

      HONEGUMI.prototype.start = function() {
        this.contents_h = this.device_h - this.header_h - this.footer_h;
        $("#" + this.conf.contentsID).height(this.contents_h);
        this.iScroll = new lib.iScroll(this.conf.contentsID);
      };

      HONEGUMI.prototype.refresh = function() {
        return this.iScroll.refresh();
      };

      return HONEGUMI;

    })();
  });

}).call(this);
