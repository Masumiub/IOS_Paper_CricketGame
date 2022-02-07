//
//  ContentView.swift
//  MUBC Paper Cricket
//
//  Created by Md. Masum  on 29/1/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var winner = ""
    @State var teamArun = 0
    @State var teamAwicket = 0
    
    @State var teamBrun = 0
    @State var teamBwicket = 0
    
    @State var target = 0
    @State var remball = 25
    
    @State var randrun = 0
    
    @State var spin = false
    
    var animation: Animation {
        Animation.linear
            .repeatForever(autoreverses: false)
    }
    var body: some View {
        //NavigationView{
        ZStack{
            Image("background")
            VStack{
                Spacer()
                Text("MUBC Paper Cricket")
                    .padding(.top, 33.0).font(.system(size: 35))
                
                HStack{
                    Spacer()
                    HStack{
                        Text("Remaining Ball: ")
                        Text(String(remball))
                    }
                    Spacer()
                    HStack{
                        Text("Target: ")
                        Text(String(target))
                    }
                    Spacer()
                }
                Spacer()
                Image("stadium").resizable().frame(width: 300, height: 300).rotationEffect(Angle.degrees(spin ? 360 : 0))
                
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        
                        randrun = Int.random(in: 1...6)
                        
                            if(remball>0){
                                remball -= 1
                            }
                            
                            if(randrun == 1){
                                teamArun += 1
                            }
                            else if(randrun == 2){
                                teamArun += 2
                            }
                            else if(randrun == 3){
                                teamAwicket += 1
                            }
                            else if(randrun == 4){
                                teamArun += 4
                            }
                            else if(randrun == 5){
                                teamAwicket += 1
                            }
                            else{
                                teamArun += 6
                            }
                            
                            if(remball == 0 || teamAwicket == 10){
                                target = teamArun + 1
                                remball = 25
                            }
                        
                        
                    }, label: {
                        Text(" BAT ").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.red).cornerRadius(25)
                    })
                    /*NavigationLink(destination: balling(), label:{
                        Text("BALL")
                    })*/
                    Spacer()
                    
                    Button(action: {
                        randrun = Int.random(in: 1...6)
                        
                        if(remball > 0){
                            remball -= 1
                        }
                        if(remball > 0 && teamBwicket > 9){
                            winner = "TeamA"
                            //print("TeamA won the game")
                        }
                        if((remball > 0 && teamBrun > teamArun) || (teamBrun == target)){
                            winner = "TeamB"
                        }
                        if(remball == 0){
                            if(teamArun > teamBrun){
                                winner = "TeamA"
                                //print("TeamA Won The Game!")
                            }
                            else if(teamArun == teamBrun){
                                winner = "Match Tie"
                                //print("Match Tie!")
                            }
                            else{
                                winner = "TeamB"
                                //print("TeamB Won The Game!")
                            }
                        }
                        if(randrun == 1){
                            teamBrun += 1
                        }
                        else if(randrun == 2){
                            teamBrun += 2
                        }
                        else if(randrun == 3){
                            teamBwicket += 1
                        }
                        else if(randrun == 4){
                            teamBrun += 4
                        }
                        else if(randrun == 5){
                            teamBwicket += 1
                        }
                        else{
                            teamBrun += 6
                        }
                    }, label: {
                        Text("BALL").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.red).cornerRadius(25)
                    })
                    Spacer()
                    
                    Button(action: {
                        teamArun = 0
                        teamAwicket = 0
                        teamBrun = 0
                        teamBwicket = 0
                        target = 0
                        remball = 25
                        randrun = 0
                        winner = ""
                    }, label: {
                        Image(systemName: "arrow.2.circlepath.circle.fill").resizable().frame(width: 25, height: 25).foregroundColor(.white).padding().background(Color.red).cornerRadius(25)
                    })
                    
                    Spacer()
                }
                
                Group{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Score Board:").fontWeight(.heavy).foregroundColor(.white).padding().background(Color.blue).cornerRadius(25)
                        Spacer()
                        Text(String(randrun)).foregroundColor(.white).padding().background(Color.blue).cornerRadius(25).font(.system(size: 25))
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Team A").foregroundColor(.white).fontWeight(.heavy)
                        Spacer()
                        VStack{
                            Text("Run").foregroundColor(.white).fontWeight(.heavy)
                            Text(String(teamArun)).foregroundColor(.white)
                        }
                        Spacer()
                        VStack{
                            Text("Wicket").foregroundColor(.white).fontWeight(.heavy)
                            Text(String(teamAwicket)).foregroundColor(.white)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Team B").foregroundColor(.white).fontWeight(.heavy)
                        Spacer()
                        VStack{
                            Text("Run").foregroundColor(.white).fontWeight(.heavy)
                            Text(String(teamBrun)).foregroundColor(.white)
                        }
                        Spacer()
                        VStack{
                            Text("Wicket").foregroundColor(.white).fontWeight(.heavy)
                            Text(String(teamBwicket)).foregroundColor(.white)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Winner: ").foregroundColor(.white).fontWeight(.heavy)
                        Text(winner).foregroundColor(.white).fontWeight(.heavy)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
                
            }
        }
        
    }
    //}// nav ends
}
struct balling: View{
    var body: some View {
        Text("Balling")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
