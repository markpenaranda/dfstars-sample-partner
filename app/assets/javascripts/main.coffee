# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@DfStarsFunctions = {}

class DfStarsFunctions.CommonFunctions
    @play = (name, username, birthdate, email) ->
        $.ajax
            url: 'http://api.dfstars.com/users'
            method: 'post'
            dataType: 'json',
            contentType: 'application/json; charset=utf-8'
            headers: {
                    "Authorization": "key VG9pkhtmtXo5WHFRmVi0ZMHjIo8fDkjGFN6ipa9eVQk="
             }
            data: JSON.stringify({ name: name, username: username, birthdate: birthdate, email: email }),
            success: (data, textStatus, jqXHR)->
                console.log(data);
                $.ajax
                    url: 'http://api.dfstars.com/sessions'
                    method: 'post'
                    dataType: 'json'
                    contentType: 'application/json; charset=utf-8'
                    headers: {
                    "Authorization": "key VG9pkhtmtXo5WHFRmVi0ZMHjIo8fDkjGFN6ipa9eVQk="
                    }
                    data: JSON.stringify({userId: data.id, logoutUrl: 'http://samplecasino.heroku.com'})
                    success: (data, textStatus, jqXHR)->
                        console.log(data)
                        window.open(data.loginUrl, '_blank');