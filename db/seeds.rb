questions_seed = [
 {title: "Why is the sky blue?", description: "I am so befuddled. Why isn’t it green or yellow or indigo?"},
 {title: "Which bear is best?", description: "Bears, beets, Battlestar Galactica. MICHAEL!!??"},
 {title: "Why did the chicken cross the road?", description: "Cause it\’s a free country? Cause he can do whatever he wants?"},
 {title: "What is the meaning of life?", description: "Me tiny brain can\’t handle. I\’m too dumb. :/"},
 {title: "Who am I? Why am I here?", description: "Do I even exist? Is the universe even there? What do I do with my life?"}
]

questions_seed.each do |seed|
 Question.create(seed)
end
