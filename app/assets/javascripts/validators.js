/* Miscellaneous validation functions */

function isDate(value) {
    try {
        //Change the below values to determine which format of date you wish to check. It is set to dd/mm/yyyy by default.
		//Is currently set to mm/dd/yyyy
        var DayIndex = 1;
        var MonthIndex = 0;
        var YearIndex = 2;
 
        value = value.replace(/-/g, "/").replace(/\./g, "/"); 
        var SplitValue = value.split("/");
        var OK = true;
        if (!(SplitValue[DayIndex].length == 1 || SplitValue[DayIndex].length == 2)) {
            OK = false;
        }
        if (OK && !(SplitValue[MonthIndex].length == 1 || SplitValue[MonthIndex].length == 2)) {
            OK = false;
        }
        if (OK && SplitValue[YearIndex].length != 4) {
            OK = false;
        }
        if (OK) {
            var Day = parseInt(SplitValue[DayIndex], 10);
            var Month = parseInt(SplitValue[MonthIndex], 10);
            var Year = parseInt(SplitValue[YearIndex], 10); 
 
            if (OK = ((Year > 1900) && (Year <= new Date().getFullYear()))) {
                if (OK = (Month <= 12 && Month > 0)) {
                    var LeapYear = (((Year % 4) == 0) && ((Year % 100) != 0) || ((Year % 400) == 0));
 
                    if (Month == 2) {
                        OK = (LeapYear)?(Day <= 29 && Day >= 0):( Day <= 28 && Day >= 0);
                    }
                    else {
                        if ((Month == 4) || (Month == 6) || (Month == 9) || (Month == 11)) {
                            OK = (Day >= 0 && Day <= 30);
                        }
                        else {
                            OK = (Day >= 0 && Day <= 31);
                        }
                    }
                }
            }
        }
        return OK;
    }
    catch (e) {
        return false;
    }
}

function isFunction(functionName) {
/* Taken from http://stackoverflow.com/questions/85815/how-to-tell-if-a-javascript-function-is-defined
Checks if a function is defined in such a way that no error is thrown if the function isn't defined. */
	if(eval("typeof(" + functionName + ") == typeof(Function)")) {
        return true;
	}
	return false;
}
