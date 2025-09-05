//
//  ListView.swift
//  MultiAcademy-iOS-Bootcamp-4
//
//  Created by Kayra Akbaş on 5.09.2025.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var listVM: ListViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Title")
                Text(listVM.list.content ?? "")
                Image(systemName: listVM.list.symbol ?? "")
            }

                
        }
        .navigationTitle(listVM.list.title ?? "")
    }
}

#Preview {
    ListView(listVM: ListViewModel(list: ListObj(title: "prova", content: "prova",symbol: "arrow",isDone: true)))
}
