#input String originalValue
#output String result

import com.webratio.rtx.beans.BeanHelper

String value = (BeanHelper.isNullOrEmptyString(originalValue)) ? '' : originalValue
//value = value.toLowerCase().trim()
value = value.toLowerCase().replaceAll(' ', '');

return [
	"result": value
]