//
//  NotificationHistroyView.swift
//  InterfaceCoLtd
//
//  Created by 김해린 on 2022/11/17.
//
import SwiftUI

struct NotificationHistoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 35) {
                    ForEach(0..<10) { _ in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("공지사항")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .padding(.leading)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 5.0) {
                                    
                                    Text("2학기 사물함 배정")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                    
                                    Text("22/07/21 21:33")
                                        .foregroundColor(.secondary)
                                        .font(.footnote)
                                }
                                
                                Spacer()
                            }
                            .padding(.all, 25)
                            .modifier(VersionedSubViewBackgroundModifier(color: Color("sub-view-bkg-accent")))
                        }
                    }
                }
                .padding()
            }
            .modifier(VersionedNavigationBarColorModifier(color: Color("bkg")))
            .navigationTitle("알림 내역")
            .background(Color("bkg").ignoresSafeArea())
        }
    }
}

struct NotificationHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationHistoryView()
    }
}


