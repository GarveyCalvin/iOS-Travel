//
//  ViewController.swift
//  GCCodableDemo
//
//  Created by GarveyCalvin on 2023/4/10.
//

import UIKit

class ViewController: UIViewController {

    private let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        textView.isEditable = false
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textView]-|", metrics: nil, views: ["textView": textView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[textView(300)]", metrics: nil, views: ["textView": textView]))

        encodePerson()
        decodePerson()
        encodeAddress()
        decodeAddress()
        encodeActivity()
        decodeActivity()
        encodeDog()
        decodeDog()
    }

    func encodePerson() {
        let person = GCPerson(name: "XiaoMing", age: 16, height: 160.5, isGoodGrades: true)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // 优雅永不过时，json会好看点哟
        do {
            let data = try encoder.encode(person)
            let jsonStr = String(data: data, encoding: .utf8)
            textView.text = textView.text.appending(jsonStr ?? "")
            print(jsonStr as Any)
        } catch let err {
            print("err", err)
        }
    }

    func decodePerson() {
        let jsonStr = "{\"age\":16,\"isGoodGrades\":false,\"name\":\"XiaoMing\",\"height\":160.5}"
        guard let data = jsonStr.data(using: .utf8) else {
            print("get data fail")
            return
        }
        let decoder = JSONDecoder()
        do {
            let person = try decoder.decode(GCPerson.self, from: data)
            print(person)
        } catch let err {
            print("err", err)
        }
    }
    
    func encodeAddress() {
        let address = Address(zipCode: 528000, fullAddress: "don't tell you")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // 优雅永不过时，json会好看点哟
        do {
            let data = try encoder.encode(address)
            let jsonStr = String(data: data, encoding: .utf8)
            textView.text.append("\n\n")
            textView.text = textView.text.appending(jsonStr ?? "")
            print(jsonStr as Any)
        } catch let err {
            print("err", err)
        }
    }

    func decodeAddress() {
        let jsonStr = "{\"zip_code\":528000,\"full_address\":\"don't tell you\"}"
        guard let data = jsonStr.data(using: .utf8) else {
            print("get data fail")
            return
        }
        let decoder = JSONDecoder()
        do {
            let address = try decoder.decode(Address.self, from: data)
            print(address)
        } catch let err {
            print("err", err)
        }
    }
    
    func encodeActivity() {
        let activity = Activity(time: Date(), url: URL(string: "https://www.baidu.com"))
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // 优雅永不过时，json会好看点哟
        encoder.dateEncodingStrategy = .secondsSince1970 // 秒
        do {
            let data = try encoder.encode(activity)
            let jsonStr = String(data: data, encoding: .utf8)
            textView.text.append("\n\n")
            textView.text = textView.text.appending(jsonStr ?? "")
            print(jsonStr as Any)
        } catch let err {
            print("err", err)
        }
    }

    func decodeActivity() {
//        let jsonStr = "{\"time\":528000,\"url\":111}" // 即便是 Optional 的属性也要对应的数据类型，否则还是会解析失败
        let jsonStr = "{\"time\":702804857.36988497}" // Optional类型的属性字段，直接不传也是nil
//        let jsonStr = "{\"time\":528000,\"url\":null}" // 以下三种也能被解析为nil，\"null\" / \"nil\" / null
        guard let data = jsonStr.data(using: .utf8) else {
            print("get data fail")
            return
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970 // 秒
        do {
            let activity = try decoder.decode(Activity.self, from: data)
            print(activity)
        } catch let err {
            print("err", err)
        }
    }
    
    func encodeDog() {
        let dog = Dog(name: "Max", sex: true)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // 优雅永不过时，json会好看点哟
        do {
            let data = try encoder.encode(dog)
            let jsonStr = String(data: data, encoding: .utf8)
            textView.text.append("\n\n")
            textView.text = textView.text.appending(jsonStr ?? "")
            print(jsonStr as Any)
        } catch let err {
            print("err", err)
        }
    }

    func decodeDog() {
        let jsonStr = "{\"name\":\"Max\",\"sex\":1}"
        guard let data = jsonStr.data(using: .utf8) else {
            print("get data fail")
            return
        }
        let decoder = JSONDecoder()
        do {
            let dog = try decoder.decode(Dog.self, from: data)
            print(dog)
        } catch let err {
            print("err", err)
        }
    }

}

