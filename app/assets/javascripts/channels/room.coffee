document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#direct_messages').data('room_id') },
    connected: ->

    disconnected: ->

    received: (data) ->
      $('#direct_messages').append data['message']

    speak: (message) ->
      @perform 'speak', message: message

    #   # returnキーでデータを受け取る処理
    # $('#bms_send_message').on 'keypress', (event) ->
    #   if event.ctrlKey
    #     if event.keyCode is 13
    #       event.preventDefault()
    #       # コンソールで接続確認で使ったコード
    #       App.room.speak event.target.value
    #       event.target.value = ''

    $(document).on 'click', '.chat_submit', ->
      event.preventDefault()
      App.room.speak $('#bms_send_message').val()
      $('#bms_send_message').val('')
