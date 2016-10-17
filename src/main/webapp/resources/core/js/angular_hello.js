var app = angular.module("app", []);
app.controller("helloController", function ($scope, $http) {

    $scope.myOwnfn = function () {
    	
       // use $.param jQuery function to serialize data from JSON 
        var data = {};
    
        var config = {
          
        }

        $http.post('http://localhost:3000/sendPasscode', data, config)
        .success(function (data, status, headers, config) {
            console.log(data);
        })
        .error(function (data, status, header, config) {
          console.log("Error occured")
        });
    };

});
