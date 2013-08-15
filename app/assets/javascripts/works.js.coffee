# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
featuredImgWrapper = " "
featuredTitleWrapper = " "
featuredSubtitleWrapper = " "
menyFirst = " "
menyFirstId = " "
featuredImgElement = " "

window.onload = ->
	menyFirst = $('.meny-control li:first-child')
	menyFirstId = menyFirst.data("id")

	#for starting preview window
	featuredTitleWrapper = $(".featured-info h1")
	featuredImgElement = $(".featured-img img")
	featuredSubtitleWrapper = $(".featured-info p")

	#animating preview window
	featuredTitleWrapper.addClass "fadeInLeft"
	featuredSubtitleWrapper.addClass "fadeInLeft"

	featuredImgElement.hide().fadeIn(1500)
	#adds active styles to first list-item in meny
	$(menyFirst).trigger('click.grabId').addClass('active');
	featuredImgWrapper = $(".featured-img")
	#init ajax call to set default frame

	
	#adds the first list-item id to enter button
	#$(enter).data("id")

	


$(document).ready ->

	enter = $(".enter")
	meny = $(".meny-control")
	modalClose = $(".modal-controls")
	modalBg = $(".modal-bg")

	innerModalImg = $(".show-img")
	innerModalTitle = $(".modal-info h1")
	innerModalSubtitle = $(".modal-info h2")
	innerModalpost = $(".post")
	#end of selectors

	#ajax returned vars
	featuredImg = " "
	featuredTitle = " "
	featuredSubtitle = " "
	featuredpost = " "
	#end of ajax returned vars

	toggleActive = (root, activeSwitch) ->
		$(root).find(".active").removeClass "active"
		$(activeSwitch).toggleClass "active"

	#creates the bg and panel of modal
	createModal = () ->
		#animate css solution
		$(modalClose).addClass "on"
		$(modalBg).addClass "on animated fadeInUpBig"

		#populates the inner modal
		$(innerModalImg).html(featuredImg)
		$(innerModalTitle).text(featuredTitle)
		$(innerModalSubtitle).text(featuredSubtitle)
		$(innerModalpost).html(featuredpost)

	
	closeModal = () ->
		#closes the bg and panel of modal
		#$(".modal-bg").addClass "animated fadeOutDownBig"  this works! but needs latency
		$(modalClose).removeClass "on"
		$(modalBg).removeClass "on animated fadeInUpBig"
		$(meny).find(".active").addClass "visited"


	
	$(modalClose).on "click", (event) ->
		#close modal
		hasActive = $(enter).hasClass "active"

		if hasActive
			toggleActive  $(enter), $(enter)
			closeModal()


	
	$(enter).on "click", (event) ->
		#click set modal
		hasActive = $(this).hasClass "active"

		unless hasActive
			toggleActive  $(enter), $(this)

			createModal()




	#click to get id	
	$(meny).on "click.grabId", "li", (event) ->
		event.stopPropagation();
		hasActive = $(this).hasClass "active"
		projectId = $(this).data("id")

		if hasActive
			#animate css solution
			$(enter).addClass "pulse"
			newone = $(enter).clone(true)
			$(enter).before newone
			$("." + enter.attr("class") + ":first-child").remove()

		else
			toggleActive  $(meny), $(this)
			getProject projectId
			
					

		
	

	
	getProject = (project) ->
		#init ajax to get post
	    $.ajax
	    	type: "GET"
	    	url: "/works/" + project
	    	success: previewProject

	
	previewProject = (data, status) ->
		#sets Preview vars
	    featuredImg = $(data).find('.show-img').html()
	    featuredTitle = $(data).find('.modal-info h1').html()
	    featuredSubtitle = $(data).find('.modal-info h2').html()
	    featuredpost = $(data).find('.post').html()

	    #posts to preview window
	    $(featuredImgWrapper).hide().html(featuredImg).fadeIn(1500)
	    $(featuredTitleWrapper).hide().html(featuredTitle).fadeIn()
	    $(featuredSubtitleWrapper).hide().html(featuredSubtitle).fadeIn()

    	


	    #console.log featuredImg
	   