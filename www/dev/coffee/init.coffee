require.config {
	baseUrl: 'js/lib'
	shim :
		"zepto" :
			exports : '$'
		# "jquery.mobile" :
		# 	deps: ['jquery']
		"underscore" :
			exports: '_'
		"backbone" :
			deps: ['underscore', 'zepto'],
			exports: 'Backbone'
		"backbone.localstorage" :
			deps: ['backbone'],
			#exports: 'Backbone'
	paths :
		js : '../'
		model : '../model'
		view : '../view'
	urlArgs: "bust=" +  (new Date()).getTime()
}

####################

require [
	'js/view.app',
	'zepto',
	'js/lib.honegumi'
	],
	 (AppView,$,Honegumi) ->

	 	window.app = window.app || {}

	 	#TODO
	 	#ローカルストレージ
	 	#完了タスク数保存

	 	$(->
	 		#レイアウト初期化
	 		app.layout = new Honegumi(
	 			header : false
	 		)
	 		app.layout.start()
	 		#アプリ起動
	 		app.view = new AppView()
	 		return
	 	)

	 	return