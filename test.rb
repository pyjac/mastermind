
require 'json'

a = {"beginner":[{"name":"jaco","guess_time":5.010656906,"guesses":1},{"name":"jacv","guess_time":4.67902877,"guesses":1},{"name":"hhh","guess_time":4.993501882,"guesses":1},{"name":"Pyjac_sweet","guess_time":5.53804817,"guesses":1},{"name":"kkk","guess_time":5.245630969,"guesses":1},{"name":"ooo","guess_time":4.677955463,"guesses":1},{"name":"love","guess_time":5.671641838,"guesses":1},{"name":"lover","guess_time":4.604330376,"guesses":1},{"name":"lover","guess_time":3.547423848,"guesses":1},{"name":"looooov","guess_time":9.168545073,"guesses":1}],"intermediate":[{"name":"Pyjac","guess_time":2621000.0,"guesses":5},{"name":"Jac","guess_time":2621000.0,"guesses":13}],"advanced":[{"name":"Mayowa","guess_time":2621000.0,"guesses":5},{"name":"Sunday","guess_time":2621000.0,"guesses":9}]}

hash = JSON.parse(a.to_json)

hash["beginner"].reduce do |memo, ele|
     result = nil
    if memo["guesses"] > ele["guesses"]
        result = memo 
    end
    if memo["guesses"] < ele["guesses"]
        result = ele
    end
    
    if memo["guesses"] == ele["guesses"]
        memo["guess_time"] <=  ele["guess_time"] ? result=ele : result=memo
    end
    result
end

hash["beginner"] = hash["beginner"].sort do |memo, ele|
    result= 0
    if memo["guesses"] > ele["guesses"]
        result = 1
    end
    if memo["guesses"] < ele["guesses"]
        result = -1
    end
    
    if memo["guesses"] == ele["guesses"]
        memo["guess_time"] <=  ele["guess_time"] ? result=-1 : result=1
    end
    result
   
end

p hash["beginner"]
