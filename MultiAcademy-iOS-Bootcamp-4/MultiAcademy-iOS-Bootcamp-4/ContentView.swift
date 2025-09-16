//
//  ContentView.swift
//  MultiAcademy-iOS-Bootcamp-4
//
//  Created by Kayra Akbaş on 5.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentVM = ContentViewModel()
    @State var showAddList: Bool = false
    @State var title: String = ""
    @State var content: String = ""
    @State var symbol: String = ""
    
    var body: some View {
        NavigationStack {
            List{
                Section(header: Text("Tamamlanmayanlar").font(.title2).bold()) {
                    ForEach(contentVM.listData) { item in
                        if !item.isDone{
                            NavigationLink {
                                ListView(listVM: ListViewModel(list: item))
                            } label: {
                                HStack {
                                    Image(systemName: item.symbol ?? "")
                                    LazyVStack(alignment: .leading) {
                                        Text(item.title ?? "")
                                            .font(.headline)
                                        Text(item.content ?? "")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }.onDelete { item in
                        
                    }
                }
                
                Section(header: Text("Tamamlananlar").font(.title2).bold()) {
                    ForEach(contentVM.listData) { item in
                        if item.isDone{
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    Image(systemName: item.symbol ?? "")
                                        .foregroundColor(.secondary)
                                    LazyVStack(alignment: .leading) {
                                        Text(item.title ?? "")
                                            .font(.headline)
                                            .strikethrough()
                                            .foregroundColor(.secondary)
                                        Text(item.content ?? "")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .strikethrough()
                                    }
                                }
                            }
                        }
                        
                    }.onDelete { item in
                        
                    }
                }
            }
          
            Text("")
                .navigationTitle("prova")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            showAddList.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }.sheet(isPresented: $showAddList) {
                        VStack(spacing: 20){
                        TextField("Title", text: $title)
                            .padding()
                        TextField("Content:", text: $content)
                            .padding()
                        TextField("Give an icon", text: $symbol)
                            .padding()
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                            
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                    .padding()
                    Button{
                        if !title.isEmpty && !content.isEmpty && !symbol.isEmpty{
                            contentVM.addList(title: title, content: content, symbol: symbol)
                            showAddList.toggle()
                        }
                        
                    } label: {
                        Text("Add To List")
                            .tint(.secondary)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    
                }
        }
    }
    
}


#Preview {
    ContentView()
}
