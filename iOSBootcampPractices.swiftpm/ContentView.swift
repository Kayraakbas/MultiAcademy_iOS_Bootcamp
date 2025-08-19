import SwiftUI
enum Ops{
    case SUM
    case SUBTRACT
    case MULTIPLY
    case DIVIDE
    case Idle
}

struct ContentView: View {
    @State private var firstNum: String = ""
    @State private var operation: Ops = Ops.Idle
    @State private var secondNum: String = ""
    @State private var result: Int = 0
    
    var body: some View {
        VStack (spacing: 20){
        
            Text("Calculator")
                
            
            ZStack{
                Text("\(result)")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(.gray)
                
        
                VStack{
                    Rectangle()
                        .frame(width: 300, height: 100, alignment: .center)
                        .opacity(0.05)
                        .cornerRadius(30)
                        .padding()
                    Divider()
                }
            }
            
            Spacer()
            TextField(
                "Enter first number",
                text: $firstNum
                
                
            )
            .padding()
            .frame(width: 200, height: 40, alignment: .center)
            .disableAutocorrection(true)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            HStack(spacing: 12){
                Button{
                    operation = Ops.SUM
                    result = calculate(firstNum: firstNum, secondNum: secondNum, op: operation)
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                
                Button{
                    operation = Ops.SUBTRACT
                    result = calculate(firstNum: firstNum, secondNum: secondNum, op: operation)
                } label: {
                    Image(systemName: "minus")
                        .imageScale(.large)
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                
                Button{
                    operation = Ops.MULTIPLY
                    result = calculate(firstNum: firstNum, secondNum: secondNum, op: operation)
                } label: {
                    Image(systemName: "multiply")
                        .imageScale(.large)
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                
                Button{
                    operation = Ops.DIVIDE
                    result = calculate(firstNum: firstNum, secondNum: secondNum, op: operation)
                } label: {
                    Image(systemName: "divide")
                        .imageScale(.large)
                        .frame(width: 30, height: 30, alignment: .center)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                
            }
            
            TextField(
                "Enter Second number",
                text: $secondNum
                
                
            )
            .padding()
            .frame(width: 200, height: 40, alignment: .center)
            .disableAutocorrection(true)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        Spacer(minLength: 40)
    }
    
    func calculate(firstNum: String, secondNum: String, op: Ops) -> Int{
        guard !firstNum.isEmpty || !secondNum.isEmpty  else {return 0}
        var ans: Int = 0
    
        if (op == Ops.SUM){
            guard let num1 = Int(firstNum), let num2 = Int(secondNum) else{return 0}
            ans = num1 + num2
            
        }else if (op == Ops.SUBTRACT){
            guard let num1 = Int(firstNum), let num2 = Int(secondNum) else{return 0}
            ans = num1 - num2
            
        }else if (op == Ops.MULTIPLY){
            guard let num1 = Int(firstNum), let num2 = Int(secondNum) else{return 0}
            ans = num1 * num2
            
        }else if (op == Ops.DIVIDE){
            guard let num1 = Int(firstNum), let num2 = Int(secondNum) else{return 0}
            ans = num1 / num2
        }
        return ans
    }

    
}


#Preview {
    ContentView()
}
