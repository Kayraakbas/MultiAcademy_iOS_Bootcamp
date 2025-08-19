import Foundation
//Ödev 1.1
var name: String? = "Kayra"
var lastName: String? = "Akbaş"
var company: String? = "Apple"
var title: String? = "iOS Developer"
var phoneNnum: Int? = 5304216690
var officeMail: String? = "kayra@gmail.com"

func showcard(name: String?, lastName: String?, company: String?, title: String?, phoneNum: Int?, officeMail: String?){
    print("Personal Card:")
    print(name ?? "")
    print(lastName ?? "")
    print(company ?? "")
    print(title ?? "")
    print(phoneNum ?? "")
    print(officeMail ?? "")
    print("----------------")
}

showcard(name: name, lastName: lastName, company: company, title: title, phoneNum: phoneNnum, officeMail: officeMail)
