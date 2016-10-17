function enroll() {
	$("#output").html("");
	$.ajax({
		url : 'http://ph.ioetest.qualcomm.com/v1/user/enroll',
		type : 'POST',
		contentType : 'application/json; charset=utf-8',
		crossDomain: true,
		headers : {
				"Authorization" : "Basic b25seWZyb21xdWFsbmV0OnRoMXMxc2ZyMG1xdWFsbmV0",
				"Mti-Passcode" : $('#passCode').val(),
				"Mti-Username" : $('#userName').val(),
				"Mti-First-Name" : $('#firstName').val(),
				"Mti-Last-Name" : $('#lastName').val(),
				"Mti-Email" : $('#mail').val(),
				"Mti-Group-Id" : "100"
		}
	}).done( function( data ) {
		console.log("Sample of data:", data);
		$("#passCode").val("");
		
		var strData = JSON.stringify(data);
		strData = strData.replace(/,/gi, ", </br>");
		
		strData = strData.replace(/\":\"/gi, "<span style='color:red'><b> :: </b></span>");
		strData = strData.replace(/\"/gi, "");
		strData = strData.substring(2, strData.length-2);
		$("#output").html(" <b> Result </b> <br>" + strData);
	}).fail( function( jqXHR, textStatus ) {
		console.log("Request failed: " + textStatus);
		$("#output").html("Please check the inputs.");
	});
	
	
	
}

function myOwnRestService() {
	$.ajax({
		url : 'http://localhost:3000/sendPasscode',
		type : 'POST'		
	}).done( function( data ) {
	    console.log( "Sample of data:", data);
    }).fail(function( jqXHR, textStatus ) {
    	console.log( "Request failed: " + textStatus);
    });
}
    
function passCode() {

	$.ajax({
		url : 'http://ph.ioetest.qualcomm.com/v1/user/passcode',
		type : 'POST',		
		headers : {
			"Mti-Device-Id" : "12345"
		}
		
	}).done( function( data ) {
	    console.log( "Sample of data:", data);
    }).fail(function( jqXHR, textStatus ) {
    	console.log( "Request failed: " + textStatus );
    });
}

$( document ).ready(function() {
	$("#passCode").keyup(function(event){
	    if(event.keyCode == 13){
	        $("#Submit").click();
	    }
	});
});
