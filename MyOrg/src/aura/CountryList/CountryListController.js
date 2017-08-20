({
	myAction : function(component, event, helper) {
		var opts = [  { class: "optionClass", label: "--None--", value: "", selected: "true" }];
      	var countries=["AUD","BGN","BRL","CAD","CHF","CNY","CZK","DKK","GBP","HKD","HRK","HUF","IDR","ILS","JPY","KRW","MXN","MYR","NOK","NZD","PHP","PLN","RON","RUB","SEK","SGD","THB","TRY","USD","ZAR","EUR","INR"];
        for(var i=0;i<countries.length;i++){
            opts.push({class: "optionClass", label: countries[i], value: countries[i]});
            
        }
        component.find("InputSelectDynamic").set("v.options", opts);
	},
    
    getselectedCounty:function(component,event,helper){
        
        console.log(component.find("InputSelectDynamic").get("v.value"));
        
        var action = component.get("c.getCurrenyRate");
        action.setParams({
            "BaseCountry":component.find("InputSelectDynamic").get("v.value")
        });
        
        action.setCallback(this,function(response){
            
         //   console.log(response.getReturnValue());
            var countryVales = response.getReturnValue()["rates"];
            var CurrencyList = [];
                // play a loop on rates object 
                for (var key in countryVales) {
                    // push all rates with there Name in CurrencyList variable.        
                    CurrencyList.push(key + ' = ' + countryVales[key]); // i.e : INR = 67.919  
                }
            console.log(response.getReturnValue());
            component.set("v.conversionData",CurrencyList);
        });
        $A.enqueueAction(action);
        
        
    }
})