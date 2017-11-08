func chooseBestSum(_ t: Int, _ k: Int, _ ls: [Int]) -> Int {//take all powersets and reduce 
    var sum = 0
    var perms = [[Int]]()
    var sumsList = [Int]()
    perms = ls.powerset
     for sets in perms{
     
       if sets.count==k{
         
         for num in sets{
           sum = sum + num
         }
         if sum <= t{
           sumsList.append(sum)
         }
         sum = 0
       }
     
     }
      sumsList.sort()
      if sumsList.count==0{
        return -1
        }
      return sumsList[sumsList.count-1]
}

extension Array {//borrowed powerset function from GIT
    var powerset: [[Element]] {
        if count == 0 {
            return [self]
        }
        else {
            let tail = Array(self[1..<endIndex])
            let head = self[0]

            let withoutHead = tail.powerset
            let withHead = withoutHead.map { $0 + [head] }

            return withHead + withoutHead
        }
    }
}
