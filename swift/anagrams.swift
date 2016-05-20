import Foundation

func generatePermutations(inout a : [Character], upTo n: Int) {
    if n == 0 {
        print(String(a))
    } else {
        for i in 0..<n {
            generatePermutations(&a, upTo: n-1)
            swap(&a[n % 2 == 0 ? 0 : i], &a[n])
        }
        generatePermutations(&a, upTo: n-1)
    }
}

if Process.arguments.count != 2 {
    fputs("Exactly one argument is required\n", __stderrp)
    exit(1)
}
let word = Process.arguments[1]
var charArray = Array(word.characters)
generatePermutations(&charArray, upTo: charArray.count-1)
