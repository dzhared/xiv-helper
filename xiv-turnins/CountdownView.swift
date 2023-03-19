//
//  Countdown.swift
//  xiv-turnins
//
//  Created by Jared on 3/19/23.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("Daily Reset in \(timeString(time: timeRemaining))")
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.timeRemaining = getTimeRemaining()
                }
            }
    }
    
    func timeString(time: Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        return String(format: "%02ih %02im", hours, minutes)
    }
    
    func getTimeRemaining() -> Int {
        let now = Date()
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let resetTime = calendar
            .date(
                bySettingHour: 20,
                minute: 0,
                second: 0,
                of: now)!
        
        let timeDifference = resetTime.timeIntervalSinceNow
        
        if timeDifference > 0 {
            return Int(timeDifference)
        } else {
            return Int(timeDifference + 86400)
        }
    }
    
    init() {
        _timeRemaining = State(wrappedValue: getTimeRemaining())
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TimerView()
        }
    }
}
