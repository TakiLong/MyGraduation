app.service("tableService", function($http, $filter){
  
 function filterData(data, filter){
  return $filter('filter')(data, filter);
 }
  
 function orderData(data, params){
  return params.sorting() ? $filter('orderBy')(data, params.orderBy()) : filteredData;
 }
  
 function sliceData(data, params){
  return data.slice((params.page() - 1) * params.count(), params.page() * params.count())
 }
  
 function transformData(data,filter,params){
  return sliceData( orderData( filterData(data,filter), params ), params);
 }
  
 var service = {
  cachedData:[],
  getData:function($defer, params, filter,resp){
   if(service.cachedData.length>0){
    console.log("using cached data")
    var filteredData = filterData(service.cachedData,filter);
    var transformedData = sliceData(orderData(filteredData,params),params);
    params.total(filteredData.length);
    if(filteredData.length<=params.count()){
    	params.page(1);
    }    
    $defer.resolve(transformedData);
   }
   else{
    console.log("fetching data")
    
     angular.copy(resp,service.cachedData)
     params.total(resp.length)
     var filteredData = $filter('filter')(resp, filter);
     var transformedData = transformData(resp,filter,params)
      
     $defer.resolve(transformedData);
    
   }
    
  }
 };
 return service; 
});