# BouncyCountdown

Applies bouncy countdown effect to text with SwiftUI

https://github.com/usagimaru/BouncyCountdown/assets/1835776/186a9aaa-8ef7-422e-8905-d91969e1d45e

https://github.com/usagimaru/BouncyCountdown/assets/1835776/948c0e4c-cba0-464d-be56-4ab1a75467bc

https://github.com/usagimaru/BouncyCountdown/assets/1835776/df6c8501-c95f-4066-9b1f-2fa8ae3d8bf9


## Core

```
let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

Text("\(count)")
  .contentTransition(.numericText(countsDown: true))
  .onReceive(timer){ _ in
  	withAnimation() {
  		count += 1
  	}
  }
```
