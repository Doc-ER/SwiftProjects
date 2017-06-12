//Creating an Empty Dictionary
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
//namesOfIntegers now contains one key-value pair

namesOfIntegers = [:]// once again becomes an empty dictionary

//Creating a Dictionary with a Dictionary Literal
var chinaProvince:[String: String] = ["苏": "江苏", "沪":"上海", "浙": "浙江", "湘": "湖南"]
//或者：
var chinasProvince = ["苏": "江苏", "沪":"上海", "浙": "浙江", "湘": "湖南"]

//检测字典是否为空
if chinaProvince.isEmpty {
    print("The chinaProvince dictionary is empty.")
} else {
    print("The dictionary is not empty.")
}

//在字典中加入新成员：
chinaProvince["渝"] = "重庆"
print(chinaProvince)

//将字典中元素改变：
chinaProvince["沪"] = "小气地方"
print(chinaProvince)

//打印出字典中一共有几对：
print("这个字典里面目前有\(chinaProvince.count)对成员。")

//用updateValue(_:forKey:)方法来更新字典中某key的value值：
/*As an alternative to subscripting, use a dictionary’s updateValue(_:forKey:) method to set
or update the value for a particular key. Like the subscript examples above, the 
updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value
if that key already exists. Unlike a subscript, however, the updateValue(_:forKey:) method 
returns the old value after performing an update. This enables you to check whether or not 
an update took place.
The updateValue(_:forKey:) method returns an optional value of the dictionary’s value type. 
For a dictionary that stores String values, for example, the method returns a value of type 
String?, or “optional String”. This optional value contains the old value for that key if
one existed before the update, or nil if no value existed:
*/
if let oldValue = chinaProvince.updateValue("据说是国际化大都市", forKey: "沪") {
    print("The old value for 沪 是\(oldValue).")
}
print(chinaProvince)

//可以用subscript语法从字典里去retrieve对应的value。如果有这个key，那value就会返回，如果没有这个key
//则返回了nil
if let provinceName = chinaProvince["川"] {
    print("The name is \(provinceName)。")
} else {
    print("这个字典里没有这玩意！")
}

//利用subscript语法移除字典里的某一对:将value设置为nil,则就移除了。
//也可以用removeValue(forKey:) 方法来移除某一对
chinaProvince["沪"] = nil 
print(chinaProvince)

if let removedValue = chinaProvince.removeValue(forKey: "皖") {
    print("去除掉的是: \(removedValue)。")
} else {
    print("字典里没这个皖")
}

//Iterating Over a Dictionary
for (provinceShort, provinceLong) in chinaProvince {
    print("\(provinceShort) ：\(provinceLong)")
}

//Iterating  Over the keys
for provinceShort in chinaProvince.keys {
    print("key: \(provinceShort)")
}

for provinceLong in chinaProvince.values {
    print("values: \(provinceLong)")
}

//可以将字典里的key或者value们拆开，各自组成一个Array
let provinceNames = [String](chinaProvince.keys)
let provinceFullNames = [String](chinaProvince.values)
print(provinceNames)
print(provinceFullNames)

