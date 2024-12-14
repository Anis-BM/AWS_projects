#Class 5
#Lab 1 - Creating our first list


anime = ["Naruto", "Shingeki No Kyojin", "Bleach", "Yu Yu Hakusho", "DragonBall Z"]
print(anime)



#Lab 2 - Print specific values from list


cars = ["Tesla", "BMW","Nissan GTR", "Ferrari", "Ford"]
#Tesla is 0 on the list BMW is 1 and so forth and so on
print(cars[0])
#you can work either way 0-4 or -1--5
print(cars[-4])

#lab 3 - Printing Multiple Elements from the list


laptops = ["Lenovo", "Apple", "HP", "Dell", "Samsung"]
print(laptops[1:])
print(laptops[:2])
# Allows to print a range [1:] will be 1 to the end
print(laptops[1:4])

#Lab 4 - Modifying a value in the list and updating it


anime =["Bleach", "Naruto", "Captain Tsubasa", "Onepiece", "Dragonball"]
anime[1] = "Slamdunk"
#anime[1] changes the value of naruto to Slamdunk
anime[5] = "Hunter X Hunter"
print(anime)