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
	'js/view.app'
	'zepto'
	],
	 (AppView,$) ->

	 	window.app = window.app || {}

	 	#TODO
	 	#ローカルストレージ
	 	#完了タスク数保存

	 	$(->
	 		#アプリ起動
	 		app.view = new AppView()
	 		return
	 	)

	 	return