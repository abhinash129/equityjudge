'use strict'
App.controller('GraphController',['$scope','GraphService','$filter','WatchListService',function($scope,GraphService,$filter,WatchListService) {
	$scope.load1=false;
	var id;

	$scope.reviewSubmited = true;
	
	$scope.insertUserReview = function(review){
		GraphService.insertUserReview(review) .then(function(response) {
			$scope.reviewSubmited = false;
		});
	}


	$scope.sc_code;
	$scope.sc_id;
	$scope.optionss = [ {
		name : '15 DMA',
		id : 15,
		value : false,
	}, {
		name : '30 DMA',
		id : 30,
		value : false,
	}, {
		name : '100 DMA',
		id : 100,
		value : false,
	}, {
		name : '200 DMA',
		id : 200,
		value : false,
	} ];
	
	
	$scope.year = '1 Year';
	$scope.name;
	$scope.suggestions = [];
	$scope.selectedIndex = -1;
	// AutoComplete search() function
	$scope
	.$watch(
			'selectedIndex',
			function(val) {
				if (val !== -1) {
					$scope.companyNameList = $scope.suggestions[$scope.selectedIndex];
				}});
	$scope.niraj={formingDate:""};
	$scope.checkDate=function(formingDate){
		var forming_Date = new Date(formingDate);
		//$scope.niraj.formingDate=new Date(formingDate);
		//$scope.niraj.formingDate.setDate($scope.niraj.formingDate.getDate()-1);
		//$scope.niraj.formingDate=new Date($scope.niraj.formingDate.setDate($scope.niraj.formingDate.getDate()-1));
		
		//$scope.niraj.formingDate=$filter('formingDate')(new Date(s));
		var today_Date = new Date();
		if (forming_Date.getDate() == today_Date.getDate()) {
			
			return false; 
		}else{
			return true;
		} }
	// function for keyboard keys
	$scope.checkKeyDown = function(event) {
		if (event.keyCode === 40) {// down key
			event.preventDefault();
			if ($scope.selectedIndex + 1 !== $scope.suggestions.length) {
				$scope.selectedIndex++;
			} } else if (event.keyCode === 38) {// up key
				event.preventDefault();
				if ($scope.selectedIndex - 1 !== -1) {
					$scope.selectedIndex--;
				} } }
	$scope.buydate;
	$scope.buyprice;
	$scope.shares;
	$scope.addStock = true;
	$scope.addStockPortfolio = function addStockPortfolio() {
		$scope.form.$invalid=true;
		$scope.addStockLoad = true;
		var companyCode = $scope.sc_code;
		var buyDateFrm =$scope.buydate;
		var buyDate = buyDateFrm;	            
		var buyPrice = $scope.buyprice;
		var totalShares = $scope.shares;
		$scope.addStockFail="";
		$scope.addStockSuccess="";
		$scope.stockDataFromTrend = [];
		$scope.stockDataFromTrend.push(companyCode,buyDate,buyPrice,totalShares)
		var stocksFromTrendToPorfolio = $scope.stockDataFromTrend;
		GraphService .addToPortfolio(stocksFromTrendToPorfolio) .then(function(response) {
			var i=response;
			if (i==0) {
				$scope.addStockFail="Sorry Something went wrong.. Please try after some time..";
			}else{
				$scope.sc_code=null;
				$scope.buydate=null;
				$scope.buyprice=null;
				$scope.shares=null;
				$scope.addStockSuccess="Your Stock is successfully added.";
			}
			$scope.addStockLoad = false;
			$scope.addStock = false;
		});}
	$scope.checkKeyUp = function(event) {
		event.preventDefault();
		if (event.keyCode !== 8 || event.keyCode !== 46) {
			if ($scope.companyName == "") {
				$scope.suggestions = [];
			}}}
	// AutoComplete search() function
	$scope.search = function() {
		$scope.addStockFail="";
		$scope.addStockSuccess="";
		$scope.addStock = true;
		var companyNameList = $scope.companyName;
		if ($scope.companyName == 0) {
			$scope.labelName=$scope.name;
			$scope.sc_id = id;
		}
		if (companyNameList.length >= 2) {
			GraphService.getCompanyName(companyNameList).then(function(response) {
				$scope.suggestions = [];
				var maxSuggestionListLength = 0;
				$scope.suggestionList = response;
				if ($scope.suggestionList.length == 0) {
					$scope.labelName="No CompanyFound!!!!"
						$scope.sc_id = null;
				} else {
					for (var i = 0; i < $scope.suggestionList.length; i++) {
						var companyListSuggestions = $scope.suggestionList[i];
						$scope.suggestions.push(companyListSuggestions.companyName+"("+companyListSuggestions.companyId+") {"+companyListSuggestions.companyCode+"}");
						maxSuggestionListLength += 1;
						if (maxSuggestionListLength == 6) {
							break;
						}}}
				$( "#automplete-1" ).autocomplete({
					source: $scope.suggestions,
					select: function( event , ui ) {
						$scope.companyNamewithBrc = ui.item.label;
						var cmpny = $scope.companyNamewithBrc;
						id =  cmpny.substring(cmpny.lastIndexOf('('),cmpny.length);
						$scope.sc_id = id;
						var sc_code = cmpny.substring(cmpny.lastIndexOf('{'),cmpny.length);
						sc_code = sc_code.replace(/[{}]/g, '');
						$scope.sc_code = sc_code;
						cmpny = cmpny.substring(0, cmpny.lastIndexOf('('));
						if (cmpny.indexOf("&") != -1) {
							$scope.companyName= cmpny.replace(/&/g,"%26");
						}else{
							$scope.companyName = cmpny;
						}
						$scope.sug=false;
						$scope.ompanyName(null,null,null);
					} });},
					function(errResponse) {
						console.error('Error while fetching company');
					}); } }
	$scope.MovingAvarage=function(){
		$scope.mv=false;
		$scope.cmpny='disabled';
	}
	$scope.Company=function(){
		$scope.cmpny=false;
		$scope.mv='disabled';
		$scope.average="0";
		$scope.BSE_SNX=true;
	}
	$scope.changetoma = function(){
		$scope.mv=false;
		$scope.cmpny='disabled';
	}
	$scope.changetocmpny=function(){
		$scope.cmpny=false;
		$scope.mv='disabled';
		$scope.average="0";
	}


	// function for passing searchbox value for chart
	$scope.passCompanyName = function(firstCompany,companyCode,companyId) {
		$scope.average = [];
		$scope.companyNameList = [];
		
		if (firstCompany != null && firstCompany != -2 && firstCompany != -3) {
//			console.log("1")
			$scope.sc_id="("+companyId+") {"+companyCode+"}";
			$scope.sc_code=companyCode;
			$scope.companyName = firstCompany;
			$scope.name = $scope.companyName;
			$scope.year = "1 Year";
			$scope.average = "0";
		$scope.calculation($scope.companyName);
		} else if (firstCompany == -2) {
			$scope.companyName = $scope.labelName;
			$scope.name = $scope.companyName;
		} else {
			$scope.companyName = $scope.companyName;
			if ($scope.companyName.indexOf("%26") != -1) {
				$scope.name = $scope.companyName.replace(/%26/g, "&");
			} else {
				$scope.name = $scope.companyName;
				if(firstCompany!=-3)
			$scope.calculation($scope.name);
			} }
		$scope.bseflag=false;
		if ($scope.sc_code=="999901") {
			$scope.bseflag=true;	
		}
		
		console.log($scope.average)
		if ($scope.cmpny == 'disabled') {
			$scope.optionss.forEach(function(option) {
				if (option.value) {
					// If this is not the first item
					if (average) {
						average += ','
					}
					$scope.average.push(option.id);
				} });	 }
		if ($scope.average.length < 1) {
			$scope.average.push(0);
		}
		
		console.log($scope.average)
		
		var CompanyNameFromSearchBox = $scope.companyName;
		var year = $scope.year;
		var average = $scope.average;
		
		
		if (CompanyNameFromSearchBox.length < 3) {
			alert("Please provide minimum 3 charecters");
		}
		$scope.DurationLable = "Stock Price Chart - "
			+ $scope.year;
		$scope.load = true;

		//Added For Adding Company code
		$scope.companyNameList.push(CompanyNameFromSearchBox,$scope.sc_code);
		if ($scope.mv == 'disabled') {
			if ($scope.BSE_SNX) {
				$scope.companyNameList.push(999901);
			} }



		var compnyList = $scope.companyNameList;
		GraphService.getValue(compnyList, year, average).then(
				function(response) {
					$scope.companyDetailsLists = response;
					$scope.stockDetails = [];
					var flagforEmpty;
					$scope.data = DataGenarator();

					if (!($scope.companyName == 'BSE SENSEX')) {
						$scope.getSuggestion(CompanyNameFromSearchBox);
					}
					/* Data Generator */
					function DataGenarator() {
						var ClosedPrice = [];
						var BSEPrice = [];
						var movingAverage15 = [];
						var movingAverage30 = [];
						var movingAverage100 = [];
						var movingAverage200 = [];
						var avarageList = [];
						var colorlist = [];
						$scope.flag = true;
						for (var int = 0; int < $scope.companyDetailsLists.length; int++) {
							$scope.companyDetailsList = $scope.companyDetailsLists[int];
							flagforEmpty = $scope.companyDetailsList.length;
							for (var i = 0; i < $scope.companyDetailsList.length; i++) {
								var companyWholeDetails = $scope.companyDetailsList[i];
								if ($scope.flag) {
									if ($scope.BSE_SNX
											&& $scope.mv == 'disabled') {
										ClosedPrice.push({
											x : new Date(companyWholeDetails.stockDate),
											y : companyWholeDetails.movingAverage
										});
									} else {
										ClosedPrice.push({
											x : new Date(
													companyWholeDetails.stockDate),
													y : companyWholeDetails.companyClosePrice
										}); }
								} else if ($scope.BSE_SNX
										&& $scope.mv == 'disabled') {
									BSEPrice.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '15') {
									movingAverage15.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '30') {
									movingAverage30.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '100') {
									movingAverage100.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '200') {
									movingAverage200.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									}); }}
							colorlist.push('#5159F3');
							colorlist.push('#38F60D');
							colorlist.push('#BA4A00');
							colorlist.push('#000000');
							if ($scope.average[int] == '15') {
								avarageList.push(movingAverage15);
							}
							if ($scope.average[int] == '30') {
								avarageList.push(movingAverage30);
							}
							if ($scope.average[int] == '100') {
								avarageList.push(movingAverage100);
							}
							if ($scope.average[int] == '200') {
								avarageList.push(movingAverage200);
							}
							$scope.flag = false;
						}
						var list = [];

						var closePrice = {
								values : ClosedPrice, // values
								key : $scope.name, // key
								color : '#FF0000', // color
								strokeWidth : 1 };

						list.push(closePrice);
						if ($scope.BSE_SNX
								&& $scope.mv == 'disabled') {
							var BSEClosePrice = {
									values : BSEPrice, 
									key : "BSE SENSEX", // key
									color : '#5159F3', // color
									strokeWidth : 1
							};
							list.push(BSEClosePrice);
						}
						for (var int2 = 0; int2 < avarageList.length; int2++) {
							var movingAvarageMap = {
									values : avarageList[int2], // values
									key : average[int2]
							+ " DMA", // key
							color : colorlist[int2], // color
							strokeWidth : 1
							};
							list.push(movingAvarageMap);
						}
						return list;
					} ;
					
					$scope.labelName = angular.uppercase($scope.name);
					$scope.companyName = [];
					$scope.load = false;
					if (flagforEmpty==0) {
						$scope.options = {
								chart : {
									type : 'lineWithFocusChart',
									height : 435,
									margin : {
										top : 20,
										right : 30,
										bottom : 70,
										left : 55
									},
									x : function(d) {
										return d.x;
									},
									y : function(d) {
										return d.y;
									},
									transitionDuration : 300,
									useInteractiveGuideline : true,
									dispatch : {
										stateChange : function(e) {
										},
										changeState : function(e) {
										},
										tooltipShow : function(e) {
										},
										tooltipHide : function(e) {
										}},
										xAxis : {
											tickFormat : function(d) {
												return d3.time.format('%d-%b-%y')
												(new Date(d));
											}},
											yAxis : {
												tickFormat : function(d) {
													return d3.format('.02f')(d);
												},},
												callback : function() {
												}},
												title : {
													enable : true,
													text : $scope.DurationLable
												},
												subtitle : {
													enable : false,
												}};
					} else {
						$scope.options = {
								chart : {
									type : 'lineWithFocusChart',
									height : 435,
									margin : { top : 20,right : 30,bottom : 70,left : 55},
									x : function(d) {
										return d.x;
									},
									y : function(d) {
										return d.y;
									},
									transitionDuration : 300,
									useInteractiveGuideline : true,
									dispatch : {
										stateChange : function(e) {
										},
										changeState : function(e) { },
										tooltipShow : function(e) {
										},
										tooltipHide : function(e) {}},
										xAxis : {
											tickFormat : function(d) {
												return d3.time.format('%d-%b-%y')
												(new Date(d));
											}},
											x2Axis : {
												tickFormat : function(d) { return d3.time.format('%d-%b-%y')
													(
															new Date(d));
												}},yAxis : { tickFormat : function(d) {
													return d3.format('.02f')(d);
												},},
												callback : function(
														chart) {
												}},
												title : {
													enable : true,
													text : $scope.DurationLable
												},
												subtitle : {
													enable : false,
												}};}
				
				},
												function(errResponse) {
													console.error('Error while fetching company');
												}); }
	// Calculation of quteos....
	$scope.close=false;
	$scope.calculation = function(cmpnynames){

		var companyname = $scope.companyName;
		var companCode = $scope.sc_code;
		$scope.averages = [];
		$scope.averages.push(0);
		$scope.listcompny = [];
		$scope.listcompny.push(companyname,companCode);
		var avrg = $scope.averages;
		var cmpny = $scope.listcompny;
		GraphService.getQuotesValue(cmpny, '1 Year', avrg).then(
				function(response) {
					$scope.data = response;
					if ($scope.data.length!=0) {
						$scope.ClosePrice=$scope.data[0]
						$scope.OpenPrice=$scope.data[1]
						$scope.HighPrice=$scope.data[2]
						$scope.LowPrice=$scope.data[3]
						$scope.Variation=$scope.data[4]
						$scope.Volume=$scope.data[5]
						$scope.Value=$scope.data[6]
						$scope.High=$scope.data[7]
						$scope.Low=$scope.data[8]
						$scope.date = $scope.data[9]
						$scope.close=false;
						if ($scope.date.length >= 22) {
							var datesub = $scope.date;
							var day=datesub.substring(8,10);
							var month=datesub.substring(4,7);
							var year=datesub.substring(24);
							$scope.date = day+"-"+month+"-"+year;
							$scope.close=true;
						}
						if ($scope.Variation < 0) {
							$scope.nagative=true;
							$scope.positive=false;
						} else {
							$scope.nagative=false;
							$scope.positive=true;
						}
						if (companyname == 'BSE SENSEX') {
							$scope.BSE=true;
							$scope.others=false;
						} else {
							$scope.BSE=false;
							$scope.others=true;
						}
						$scope.nodata=false;
					} else {
						$scope.date=null;
						$scope.nodata=true;
					}
					});}
	//Function for getting pattern suggestion
	$scope.sug=false;
	$scope.getSuggestion= function(CompanyNameFromSearchBox){
		$scope.load1=true;
		$scope.labelName = CompanyNameFromSearchBox
		var suggestedCompanyName=CompanyNameFromSearchBox;
		GraphService.getPatternSuggestion(suggestedCompanyName).then(
				function (response){
					var patternResult=response;
					$scope.list=patternResult;
					$scope.load1=false;
					$scope.sug=true;	
				});}
	$scope.passCompanyNameMain = function(firstCompany,companyCode,companyId) {
		$scope.average = [];
		$scope.companyNameList=[];
		$scope.companyName =firstCompany;
		$scope.name = $scope.companyName;
		$scope.year = "9 Month";
		$scope.average.push(0);
		
		if (firstCompany == -3){
			$scope.companyName ="BSE SENSEX";
			$scope.year = "9 Month";
			companyCode="999901"
				$scope.name=$scope.companyName
				$scope.average.pop();
				$scope.optionss.forEach(function(option) {
					if (option.value) {
						// If this is not the first item
						if (average) {
							average += ','
						}
						$scope.average.push(option.id);
					} });
		}
		
		var CompanyNameFromSearchBox = $scope.companyName;
		var year= $scope.year;
		var average = $scope.average;
		$scope.companyNameList.push(CompanyNameFromSearchBox,companyCode);
		var compnyList = $scope.companyNameList;
		console.log(compnyList+","+year+"-"+average)
		GraphService.getValue(compnyList,year, average).then(
				function(response) {
					$scope.companyDetailsLists = response;
					$scope.stockDetails = [];
					var flagforEmpty;
					$scope.data = DataGenarator();
					function DataGenarator(){

						var ClosedPrice = [];
						var BSEPrice = [];
						var movingAverage15 = [];
						var movingAverage30 = [];
						var movingAverage100 = [];
						var movingAverage200 = [];
						var avarageList = [];
						var colorlist = [];
						$scope.flag = true;
						for (var int = 0; int < $scope.companyDetailsLists.length; int++) {
							$scope.companyDetailsList = $scope.companyDetailsLists[int];
							flagforEmpty = $scope.companyDetailsList.length;
							for (var i = 0; i < $scope.companyDetailsList.length; i++) {
								var companyWholeDetails = $scope.companyDetailsList[i];
								if ($scope.flag) {
									if ($scope.BSE_SNX
											&& $scope.mv == 'disabled') {
										ClosedPrice.push({
											x : new Date(companyWholeDetails.stockDate),
											y : companyWholeDetails.movingAverage
										});
									} else {
										ClosedPrice.push({
											x : new Date(
													companyWholeDetails.stockDate),
													y : companyWholeDetails.companyClosePrice
										}); }
								} else if ($scope.BSE_SNX
										&& $scope.mv == 'disabled') {
									BSEPrice.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '15') {
									movingAverage15.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '30') {
									movingAverage30.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '100') {
									movingAverage100.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									});}
								if ($scope.average[int] == '200') {
									movingAverage200.push({
										x : new Date(
												companyWholeDetails.stockDate),
												y : companyWholeDetails.movingAverage
									}); }}
							colorlist.push('#5159F3');
							colorlist.push('#38F60D');
							colorlist.push('#BA4A00');
							colorlist.push('#000000');
							if ($scope.average[int] == '15') {
								avarageList.push(movingAverage15);
							}
							if ($scope.average[int] == '30') {
								avarageList.push(movingAverage30);
							}
							if ($scope.average[int] == '100') {
								avarageList.push(movingAverage100);
							}
							if ($scope.average[int] == '200') {
								avarageList.push(movingAverage200);
							}
							$scope.flag = false;
						}
						var list = [];
						// Line chart data // should be sent as an // array of series // objects.
						var closePrice = {
								values : ClosedPrice, // values
								//  // represents// the// array// of// {x,y}// data// points
								key : $scope.name, // key
								// -// the// name// of// the// series.
								color : '#FF0000', // color
								// -
//								optional: // choose
								// your
								// own
								// line
								// color.
								strokeWidth : 1 };
						list.push(closePrice);
						if ($scope.BSE_SNX
								&& $scope.mv == 'disabled') {
							var BSEClosePrice = {
									values : BSEPrice, // values
									// -
									// represents
									// the
									// array
									// of
									// {x,y}
									// data
									// points
									key : "BSE SENSEX", // key
									// -
									// the
									// name
									// of
									// the
									// series.
									color : '#5159F3', // color
									// -
									// optional:
									// choose
									// your
//									own
									// line// color.
									strokeWidth : 1
							};
							list.push(BSEClosePrice);
						}
						for (var int2 = 0; int2 < avarageList.length; int2++) {
							var movingAvarageMap = {
									values : avarageList[int2], // values
									// -
									// represents
									// the
									// array
									// of
									// {x,y}
									// data
//									points
									key : average[int2]
							+ " DMA", // key
							// -
//							the
							// name
							// of
//							the
							// series.
							color : colorlist[int2], // color
							// -
							// optional:
//							choose
//							your
//							own
							// line
//							color.
							strokeWidth : 1
							};
							list.push(movingAvarageMap);
						}
						if (!($scope.companyName == 'BSE SENSEX')) {
							$scope.getSuggestion(CompanyNameFromSearchBox);
						}
						return list;
					
						
					}
					/*Data Generator */
			/*		function DataGenarator() {
						
						var ClosedPrice = [];
						for (var int = 0; int <  $scope.companyDetailsLists.length; int++) {
							$scope.companyDetailsList = $scope.companyDetailsLists[int];
							for( var i = 0; i < $scope.companyDetailsList.length; i++) {
								var companyWholeDetails = $scope.companyDetailsList[i];
								ClosedPrice.push({x: new Date(companyWholeDetails.stockDate), y: companyWholeDetails.companyClosePrice });
							}}
						var list =  [];
						//Line chart data should be sent as an array of series objects.
						var closePrice= {
								values: ClosedPrice,      //values - represents the array of {x,y} data points
								key: $scope.name, //key  - the name of the series.
								color: '#FF0000',  //color - optional: choose your own line color.
								strokeWidth: 1
						};
						list.push(closePrice);
						return list;
					};*/
					
					console.log($scope.data)
					$scope.labelName=angular.uppercase($scope.name);
					$scope.companyName=[];
					$scope.options = {
							chart: {
								type: 'lineChart',
								height: 260,
								width:450,
								margin : {
									top: 20,
									right: 100,
									bottom: 40,
									left: 55
								},
								x: function(d){ return d.x; },
								y: function(d){ return d.y; },
								transitionDuration: 300,
								useInteractiveGuideline : true,
								showLegend: false,
								dispatch : {
									stateChange : function(e) {
									},
									changeState : function(e) {
									},
									tooltipShow : function(
											e) {
									},
									tooltipHide : function(e) {
									}},xAxis : {
										tickFormat : function(d) {
											return d3.time.format('%d-%b-%y')
											(new Date(d));
										} },
										yAxis : { tickFormat : function(d) {
											return d3.format('.02f')(d); },
										},
										callback : function(
												chart) {
										}},
										subtitle: {
											enable: false,
										}};});}
	/*Adding stocks to watchlist*/
	$scope.addWatchList = function (labelName,sc_code){
		var companyName=labelName;
		var companyCode = sc_code;
		$scope.watchListMsg = [];
		WatchListService.addToWatchList(companyName,companyCode).then(
				function(response){
					var resp= response;
					if(resp!=0){
						alert("Successfully Added To Watchlist");
					}else{
						alert("Company Already Existing In Watchlist");
					}});}}]);
//This is for Datepicker... Added by Sunil Gauswami
App.directive('uiDate', function() {
	return {
		require: '?ngModel',
		link: function($scope, element, attrs, controller) {
			var originalRender, updateModel, usersOnSelectHandler;
			if ($scope.uiDate == null) $scope.uiDate = {};
			if (controller != null) {
				updateModel = function(value, picker) {
					return $scope.$apply(function() {
						return controller.$setViewValue(element.datepicker("getDate"));
					});};
					if ($scope.uiDate.onSelect != null) {
						usersOnSelectHandler = $scope.uiDate.onSelect;
						$scope.uiDate.onSelect = function(value, picker) {
							updateModel(value);
							return usersOnSelectHandler(value, picker);
						};
					} else {
						$scope.uiDate.onSelect = updateModel;
					}
					originalRender = controller.$render;
					controller.$render = function() {
						originalRender();
						return element.datepicker("setDate", controller.$viewValue);
					};}
			return element.datepicker($scope.uiDate);
		}};});

