#input String stringa1IN, String stringa2IN
#output String risultato

import com.webratio.rtx.beans.BeanHelper

String stringa1 = (BeanHelper.isNullOrEmptyString(stringa1IN)) ? '' : stringa1IN
String stringa2 = (BeanHelper.isNullOrEmptyString(stringa2IN)) ? '' : stringa2IN
String risultato = stringa1 + stringa2
return [
	"risultato": risultato
]