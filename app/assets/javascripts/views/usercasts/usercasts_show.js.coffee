class Hahacast.Views.UsercastsShow extends Backbone.View
  template: JST['usercasts/show']

  initialize: ->
    this.options.usercast.on('change', @render, this)
    current_page = 1

  render: ->
    $(@el).html(@template(usercast: this.options.usercast))
    #@decorateByDepth()
    registerAudioPlayEvents()
    @registerClickEvents(this)
    @registerShowNextPageEvent(this.options.usercast)
    console.log "state:" + window.playState
    if window.playState == "playing"
      console.log "it's playing"
      $(@el).find(".play-btn").hide()
      $(@el).find(".stop-btn").show()

    if $(@el).find("div#mention-param").length > 0
      mentionId = $("div#mention-param").data("mention_id")
      window.index = Number($(".playlist[data-mention_id=#{mentionId}]").attr("id"))
      console.log "new index :" + window.index
    else
      window.index = 0
      $(@el).find(".play-btn").trigger("click")

    $(".nav-collapse").removeClass('in')
    $(".nav-collapse").css("height", "0px")

    this


  initSoundPlayer: ->
    audioPlayerElement = this.$("audio#player")
    fileList = []
    $("div.playlist").each((index, element)->
      fileUrl = $(element).data("file")
      fileList.push(fileUrl)
    )
    listElements =  $("div.playlist")
    if listElements.length > 0
      player = new Hahacast.SoundPlayer(audioPlayerElement, fileList, listElements, {listRepeat: true}) 
      player.playFirst() 


  decorateByDepth: ->
    $("div.playlist").each((index,element)->
      margin = Number($(element).data("depth")) * 20
      $(element).css("margin-left", "#{margin}px")
    )

  registerClickEvents: (context)->
    $("#friendRequestButton").click((event)->
      parent = $(this).parent()
      $(this).hide()

      parent.html("<img src='/loading.gif' />")
      usercast = context.options.usercast
      event.preventDefault()
      dataToSend = {}
      dataToSend["friend_id"] = usercast.get('user')["id"]
      dataToSend["user_id"] = usercast.get('current_user')["id"]
      $.post("/friendships", dataToSend, (data, textStatus)->
        parent.html("Friend request is sent")
      )
    )

  registerShowNextPageEvent: (usercast)->

    #$(window).scroll ->
      #next_page = usercast.get("page_number") + 1
      #if $("div.mention-list").data("page_state") == "last_page"
        #isItLastPage = true
      #else
        #isItLastPage = false
      #if !isItLastPage && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        #context = this
        #$.ajax(url: "/usercasts/#{usercast.get('id')}.json?page=#{next_page}", 
          #context: this,
          #dateType: 'json',
          #success: (data)->
          #if usercast.get('mentions')
            #$("div.mention-list").append(JST['usercasts/_mention'](usercast: usercast))
            #next_page
        #)


