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
	featuredTitleWrapper = $(".featured-info h1")
	featuredImgElement = $(".featured-img img")
	featuredSubtitleWrapper = $(".featured-info p")
	featuredTitleWrapper.addClass "fadeInLeft"
	featuredSubtitleWrapper.addClass "fadeInLeft"

	featuredImgElement.hide().fadeIn(1500)
	#adds active styles to first list-item in meny
	$(menyFirst).addClass('active')
	featuredImgWrapper = $(".featured-img")
	#init ajax call to set default frame

	
	#adds the first list-item id to enter button
	#$(enter).data("id")

	


$(document).ready ->

	enter = $(".enter")
	meny = $(".meny-control")

	toggleActive = (root, activeSwitch) ->
		$(root).find(".active").removeClass "active"
		$(activeSwitch).toggleClass "active"

	#creates the bg and panel of modal
	createModal = () ->
		#animate css solution
		$(".modal-bg").removeClass("animated fadeInUpBig").addClass "on animated fadeInUpBig"
		#$(".show-img").html(featuredImg)
		console.log($(featuredTitle))

	#click set modal
	$(enter).on "click", (event) ->
		event.stopPropagation();
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
			
					

		
	

	#sets project and ajax to show page
	getProject = (project) ->
	    $.ajax
	    	type: "GET"
	    	url: "/works/" + project
	    	success: previewProject

	#sets Preview panel
	previewProject = (data, status) ->
	    featuredImg = $(data).find('.show-img').html()
	    featuredTitle = $(data).find('.modal-info h1').html()
	    featuredSubTitle = $(data).find('.modal-info h2').html()
	    featuredpost = $(data).find('.post').html()

	    $(featuredImgWrapper).hide().html(featuredImg).fadeIn(1500)
	    $(featuredTitleWrapper).hide().html(featuredTitle).fadeIn()
	    $(featuredSubtitleWrapper).hide().html(featuredSubTitle).fadeIn()

    	


	    #console.log featuredImg
	   