'use strict'
App.controller('LoginController',['$scope','LoginService',function($scope,LoginService) {
 $scope.feedbacks=false;
 $scope.forgotP=false;
 $scope.categoryList = [{name:'--Category--',value:"-"} ,
 {name:'Like',value:'Like'},
 {name:'Suggestion',value:'Suggestion'},
 {name:'Question',value:'Question'},
 {name:'Problem',value:'Problem'},
 {name:'Page Improvement',value:'Page Improvement'}];
 $scope.category = $scope.categoryList[0].value;
 $scope.refressPage=function(){
 window.location.reload();
 }
 $scope.code="+91";
 $scope.feedback=function(){
 $scope.feedbacks=true;
 $scope.hideMe="";
 $scope.results="";
 $scope.feedbackValues=[];
 var name= $scope.names;
 var Email= $scope.Email;
 var category = $scope.category;
 var message = $scope.messages;
 /*$scope.feedbackValues.push(name,Email,category,message);
 var feedbackData = $scope.feedbackValues;
 alert("Controller : "+feedbackData)
  */
 LoginService
 .feedbackSubmit(name,Email,category,message)
 .then(
 function(response) {	
 $scope.i = response;
 if ($scope.i == 0) {
 $scope.results="Something went wrong please try later.";
 } else {
 $scope.results="Feedback successfully sent... Thank you.";
	 }
 $scope.messages=" ";
 $scope.feedbacks=false;
 $scope.hideMe="hideMe";
 } ); }
 $scope.responseFlag=true;
 $scope.forgotPassword=function(){
 var userName= $scope.userName;
 $scope.error="";
 var email= $scope.emailid;
 if ($scope.userName==null || $scope.emailid==null) {
 alert("Please fill both fields!!!")
 }else{
 $scope.forgotP=true;
 LoginService
 .forgotServices(userName,email)
 .then(
 function(response) {
 $scope.forgotP=false;
 if (response==0) {
 $scope.error="Username / Email is incorrect";
 $scope.success="";
 } else {
 $scope.success="Your password is send in your mail id.. please check your email id..";
 $scope.error="";
 $scope.responseFlag=false;
 } }); } }
 $scope.emailUp=false;
 $scope.updateEmail=function(){
 var email=$scope.emailAddress;
 $scope.emailUp=true;
 LoginService
 .updateEmailServices(email)
	.then(
 function(response) {
 if (response==0) {
 $scope.emailmessage="Something went wrong please try again latter...";
 }else{
 $scope.emailmessage="Your email Id is successfully updated... ";
 }
 $scope.emailUp=false;
	 }) }
$scope.mobileUp=false;
 $scope.updateMobile=function(){
 var mobileNo=$scope.phoneNo;
 var code= $scope.code.substr(1,3);
 var mobile = code+mobileNo;
$scope.mobileUp=true;
 LoginService
 .updateMobileServices(mobile)
 .then(
 function(response) {
 if (response==0) {
 $scope.mobilemessage="Something went wrong please try again latter...";
 }else{
 $scope.mobilemessage="Your Mobile Number is successfully updated... ";
 }
 $scope.mobileUp=false;
 })}
 $scope.changePass=false;
 $scope.changePassword=function(){
 $scope.ErrorMsg="";
 var old_password=$scope.old_password;
 var new_password=$scope.password;
 $scope.changePass=true;
 LoginService
 .changePasswordServices(old_password,new_password)
 .then(
 function(response) {
 if (response==1) {
 $scope.successMsg="Your Password change successfully...";
 $scope.ErrorMsg="";
 }else if(response==2){
 $scope.ErrorMsg="Your entered old password is not correct... ";
 $scope.successMsg="";
 }else{
 $scope.ErrorMsg="Something went wrong please try again latter...";
 $scope.successMsg="";
 }
 $scope.changePass=false;
 }) } }]);



App.directive('usernameAvailable', function($timeout, $q, $http) {
return {
restrict: 'AE',
require: 'ngModel',
link: function(scope, elm, attr, model) { 
model.$asyncValidators.usernameExists = function(modelValue, viewValue) { 
var value= modelValue || viewValue;
return $http.post('username?userName=' + value).then(function(res){+
$timeout(function(){
model.$setValidity('usernameExists', !!res.data); 
}, 100);
}); };}} });
App.directive('emailAvailable', function($timeout, $q, $http) {
return {
restrict: 'AE',
require: 'ngModel',
link: function(scope, elm, attr, model) { 
model.$asyncValidators.emailExists = function(modelValue, viewValue) { 
var value= modelValue || viewValue;
return $http.post('email?emailAddress=' + value).then(function(res){+
$timeout(function(){
model.$setValidity('emailExists', !!res.data); 
}, 100);
}); };}}});
App.directive('phoneAvailable', function($timeout, $q, $http) {
return {
restrict: 'AE',
require: 'ngModel',
link: function(scope, elm, attr, model) { 
model.$asyncValidators.phoneExists = function(modelValue, viewValue) { 
var value= modelValue || viewValue;
return $http.post('phone?phoneNO=' + value).then(function(res){+
$timeout(function(){
model.$setValidity('phoneExists', !!res.data); 
}, 100);
});};}} });
App.directive('ngCompare', function() {
return {
require: 'ngModel',
link: function (scope, currentEl, attrs, ctrl) {
currentEl.on('keyup', function () {
var password=scope.password;
var confirmpassword=scope.confirmPassword;
if (confirmpassword != "") {
var isMatch = confirmpassword === password;
ctrl.$setValidity('compare', isMatch);
scope.$digest();
}});}}});
