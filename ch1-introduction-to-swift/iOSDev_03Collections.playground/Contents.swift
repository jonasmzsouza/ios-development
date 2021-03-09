//ARRAY
///Creating empty String Array
var emptyArray: [String] = []
///Creating a String Array and feeding values on creation
var shoppingList: [String] = ["Milk","Bread","Butter","Sugar"]
///Testing if an Array is empty
if shoppingList.isEmpty{
    print("The shopping list is empty")
} else{
    print("The shopping list is NOT empty")
}
///Retrieving the total elements of the Array
print("Our shopping list has \(shoppingList.count) items")

///Adding elements to the array
shoppingList.append("Banana")
var inferredShoppingList: [String] = ["Coffee","Apple","Pear"]
shoppingList += inferredShoppingList
print(shoppingList)

///Revemoving the element in position 3 and assigning it to a variable
let banana = shoppingList.remove(at:3)
///Removing the first and last elements
let milk = shoppingList.removeFirst()
let pear = shoppingList.removeLast()
///Removing the last 2 and the first 2
shoppingList.removeLast(2)
shoppingList.removeFirst(2)
///Checking if the list contains an element
print(shoppingList.contains("Coffee"))
///Searching the index of an element. Note that the return of this methos is an Int? That is, to work with this index, we nedd to unwrap it
if let coffeeIndex = shoppingList.firstIndex(of: "Sugar"){
    print("The Sugar Index in the Array is \(coffeeIndex)")
}

//DICTIONARY
///Creating a dictionary whose key is a String and the values (elements) are String too
var states: [String: String] = ["PA":"Pará","BA":"Bahia","SP":"São Paulo","RJ":"Rio de Janeiro"]
/// Creating an empty dictionary
var emptyStates: [String: String] = [:]
///Checking if the dictionary is empty
if states.isEmpty{
    print("The dicitionary is empty")
}
///Retrieving the value assigned to a key
let rj = states["RJ"]
print(rj)
///A dicitionary always returns Optional, so we need to unwreap your content to use
if let rj = states["RJ"]{
    print(rj)
}

///Inserting elements
states["MG"] = "Minas Gerais"
///Checking if an element is present in the dicitionary
if states["MG"] != nil {
    print("There is Minas Gerais in the dictionary")
}
///2 ways to remove elements
states["RJ"] = nil
states.removeValue(forKey: "BA")

//SET
///Creating a String Set
var movies: Set<String> = [
    "Matrix",
    "Avengers",
    "Jurassic Park",
    "Back to the Future",
]

///Create an empty set
var movies2 = Set<String>()
///Inserting elements
movies.insert("Spider-Man: Back Home")
print(movies.count)
///Note that the code below does not change the quantity of items in the Set as it does not accept repeated items.
movies.insert("Spider-Man: Back Home")
print(movies.count)
///We can know if the item was inserted or not if we assign it to operation to include a variable and check if the inserted property is true
let result = movies.insert("Spider-Man: Back Home")
print(result.inserted)

///Removing elements
movies.remove("Spider-Man: Back Home")
print(movies)
///Scroll through a Set
for movie in movies{
    print(movie)
}
///Cheking if a certain element is contained in the set
if movies.contains("Matrix"){
    print("Matrix is on my list of favorite movies!")
}
///Let's create a new Set to perform somo operations
var myWifeMovies: Set<String>=[
    "Suddenly 30",
    "Message For You",
    "Tune of Love",
    "Back to the Future",
    "Jurassic Park",
]
///Below, we are creating a new Set (favorite movies) which will consist of the intersectiuon of the films present in movies with the gifts myWifeMovies
let favoriteMovies = movies.intersection(myWifeMovies)
print(favoriteMovies)
///Creating a Set with all the films
let allMovies = movies.union(myWifeMovies)
print(allMovies)
///Removing a Set from another
movies = movies.subtracting(myWifeMovies)
print(movies)
