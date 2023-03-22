//
//  Countdown.swift
//  xiv-turnins
//
//  Created by Jared on 3/17/23.
//

import SwiftUI

struct TimerView: View {
    
    // MARK: - Properties
    
    @State var timeRemaining: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // MARK: - View
    
    var body: some View {
        Text("Daily Reset in \(timeString(time: timeRemaining))")
            .padding()
            .background(.thickMaterial)
            .foregroundColor(timeRemaining > 3600 ? .primary : .red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.timeRemaining = getTimeRemaining()
                }
            }
    }
    
    init() {
        _timeRemaining = State(wrappedValue: getTimeRemaining())
    }
    
    // MARK: - Functions
    
    func timeString(time: Int) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        return String(format: "%02ih %02im", hours, minutes)
    }
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

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TimerView()
        }
    }
}
