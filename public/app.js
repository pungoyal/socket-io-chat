var socket = io();

$('form').submit(function (event) {
    event.preventDefault();
    var form = $(event.target);
    var chatMessage = form.children('#m')[0];
    socket.emit('chat message', chatMessage.value)
    chatMessage.value = '';
    return false;
});


socket.on('chat message', function (message) {
    $('#messages').append($('<li>').text(message));
});