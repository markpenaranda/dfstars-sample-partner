var DfStarsAPI = (function($) {

  var config = {
    authorization_key: 'VG9pkhtmtXo5WHFRmVi0ZMHjIo8fDkjGFN6ipa9eVQk=',   // replace with authorization key.
    base_url: 'https://dev.dfstars.com'   // replace this with production.
  }

  return {
    authenticate : authenticate,
    test:test,
    config: config
  }

  function test() {
    console.log('test');
  }
  /* Initial Login */
  function authenticate (name, username, email, birthdate, callback) {
      var data = { name: name, username: username, birthdate: birthdate, email: email};
      $.ajax({
            url: config.base_url + "/users",
            method: 'post',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            headers: {
                    "Authorization": "key " + config.authorization_key
             },
            success: function (data) {
                console.info(data);
                callback(data);
            }
        });
  }

})($);
