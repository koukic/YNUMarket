# document.addEventListener 'turbolinks:load', ->
#   App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#direct_messages').data('room_id') },
#     connected: ->
#
#     disconnected: ->
#
#     received: (data) ->
#       $('#direct_messages').append data['message']
#       alert data['message']
#
#     speak: (message) ->
#       @perform 'speak', message: message
#
#   # $('#chat-input').on 'keypress', (event) ->
#   #   if event.keyCode is 13
#   #     App.room.speak event.target.value
#   #     event.target.value = ''
#   #     event.preventDefault()
#
#       # returnキーでデータを受け取る処理
#     $(document).on 'keypress', '[data-behavior~=room_speak]', (event) ->
#     if event.keyCode is 13
#       # コンソールで接続確認で使ったコード
#       App.room.speak event.target.value
#       event.target.value = ''
#       event.preventDefault()

document.addEventListener 'turbolinks:load', ->
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room: $('#direct_messages').data('room_id') },

  # 省略

  received: (data) ->
    # alertを表示させる処理
    alert data['message']

  speak: (message) ->
    @perform 'speak', message: message

  # returnキーでデータを受け取る処理
  $(document).on 'keypress', '[data-behavior~=room_speak]', (event) ->
  if event.keyCode is 13
    # コンソールで接続確認で使ったコード
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
