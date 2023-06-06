# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the DB"
User.destroy_all
Game.destroy_all
Participation.destroy_all
Review.destroy_all
GameType.destroy_all

puts "DB clean. Creating Game Type"

gt = GameType.new(
  name: "Tarot",
  rules: "Pour jouer au Tarot à 5, il vous faut :
  Le jeu de cartes de Tarot composé de 78 cartes.
  Être 5 joueurs.
  Comment jouer au tarot à 5 joueurs :
  La principale différence avec le tarot à 4 est que le tarot à 5 joueurs se joue en équipe. En effet, le preneur appelle un autre joueur à jouer avec lui. Cette équipe affrontera alors les 3 autres joueurs formant également une équipe. Ces équipes ne sont formées que le temps d’une partie.

  Le déroulement d’une partie de tarot à 5 joueurs :
  Lors de la distribution des cartes, le chien n’est plus composé de 6 cartes mais de 3 cartes. Lorsque l’un des joueurs décide de prendre, il doit avant que le chien ne soit retourné, appeler un roi. Celui qui possède le roi devient alors son partenaire pour la partie. A savoir que le joueur appelé doit gardé pour lui le fait qu’il soit avec le preneur jusqu’à bien entendu qu’il est posé le roi appelé.

  Dans le cas ou le preneur possède les 4 rois, il peut :

  S’appeler lui-même et donc jouer contre 4 joueurs
  Appeler à la place une dame.
  Si le preneur est le premier joueur à commencer, il n’a pas le droit de jouer la couleur du roi appelé.

  La partie se déroule ensuite avec les mêmes règles traditionnelles du tarot.

  Répartition des points au Tarot à 5 :
  Si l’équipe du preneur réussit son pari, le preneur prend les 2/3 des points et le joueur appelé 1/3. L’équipe adverse reçoit alors en négatif 1/3 chacun.  Dans le cas ou le pari n’est pas réussi, la répartition des points négatifs et positifs se fait de la même façon.

  Exemple :

  L’équipe du preneur réussit son pari a hauteur de 50 points.

  L’équipe défensive prend :

  Joueur 1 : -50 points (1/3 des points)
  Joueur 2 : -50 points (1/3 des points)
  Joueur 3 : -50 points (1/3 des points)
  L’équipe du preneur :

  Le preneur prend : +100 points ( 2/3 des points)
  Le joueur appelé : +50 points (1/3 des points)
  Dans le cas ou le preneur est tout seul, il prend en plus ou en moins tous les points."
)
gt.save!

# To create an other GameType

# gt = GameType.new(
#   name: "Tarot",
#   rules:
# )
# gt.save!

puts "#{GameType.all.count} Game types created"

u = User.new(
  email: "arnaud@wagon.org",
  password: "azerty",
  username: "CardMaster",
  first_name: "arnaud",
  last_name: "lejade",
  bio: "Freshly finished business school at ESCP with a specialization in Applied Data Science, and having experienced two jobs in entrepreneurship (Data Analyst and VC Analyst), I want to develop my coding skills and build a complete profile to find a job in Product in a startup !",
  tags: [1, 3],
  address: "19 Avenue de Villars, 75007 Paris",
  game_type_id: 1
)
u.save!

u = User.new(
  email: "javier@wagon.org",
  password: "azerty",
  username: "ElGuapo",
  first_name: "Javier",
  last_name: "Alvarez Salvado",
  bio: "¡Hola!
  I'm from Spain and I've been living in France since 2017.
  After coursing studies in communication, I've worked in MarCom positions for 6 years. I quit my last job looking for a change on my professional path.
  Coding has intrigued me since I first heard about it. So today, I'm looking forward to learn and improve web developing techniques.
  My main objective is to find new job opportunities in the tech.",
  tags: [0, 2],
  address: "20 Rue des Annelets, 75019 Paris",
  game_type_id: 1
)
u.save!

u = User.new(
  email: "youval@wagon.org",
  password: "azerty",
  username: "MBappéOfCards",
  first_name: "Youval",
  last_name: "AKOUKA",
  bio: "Hello, I am Youval. I am a business app functional consultant, specialized in Microsoft solutions. I want to learn code to acquire new skills.",
  tags: [0, 1, 2, 3],
  address: "26 Rue de Constantinople, 75008 Paris",
  game_type_id: 1
)
u.save!

u = User.new(
  email: "maxime@wagon.org",
  password: "azerty",
  username: "Albathar",
  first_name: "MAxime",
  last_name: "MoReIrA",
  bio: "Before being a Le Wagon's alumni, I was ergonomist in an occupational health service. I wanted to change to have more challenge and I tried to code when I was student (15 years ago) and don't understand why I stopped!",
  tags: [4, 5],
  address: "53 Rue Olivier de Serres, 75015 Paris",
  game_type_id: 1
)
u.save!

u = User.new(
  email: "Lee@wagon.org",
  password: "azerty",
  username: "ShortestName",
  first_name: "Lee",
  last_name: "Wu",
  bio: "Shortest bio",
  tags: [0, 1, 2],
  address: "27 Rue Didot, 75014 Paris",
  game_type_id: 1
)
u.save!

u = User.new(
  email: "jpa@wagon.org",
  password: "azerty",
  username: "TheLongestUsernameYouLlEverSeeInYourFuckingLife",
  first_name: "Jean-Pierre-Albert",
  last_name: "Pernety du Port du Mistral Gagnant",
  bio: "Lorem ipsum dolor sit amet. Aut galisum deserunt id molestiae voluptatibus aut nulla iste ut mollitia amet. Et nesciunt illo et pariatur impedit et recusandae suscipit sit veniam quasi eos quidem iusto. Et corporis assumenda hic itaque impedit et voluptatem quia et ullam obcaecati.

  Ea asperiores nostrum vel praesentium dicta rem voluptas voluptas ab quas nisi in nihil magnam ea nulla cupiditate aut voluptatem deserunt. Et tenetur provident id voluptatem blanditiis qui modi natus hic voluptas quasi qui voluptas velit et totam incidunt?",
  tags: [5],
  address: "162 bis Avenue du Général Michel Bizot, 75012 Paris",
  game_type_id: 1
)
u.save!

# To create other users

# u = User.new(
#   email: "",
#   password: "",
#   username: "",
#   first_name: "",
#   last_name: "",
#   bio: "",
#   tags: [],
#   address: "",
#   game_type_id:
# )
# u.save!

puts "#{User.all.count} users created"
