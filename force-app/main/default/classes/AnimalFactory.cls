// AnimalFactory.cls
public class AnimalFactory {
    public static Animal createAnimal(String animalType) {
        if (animalType == 'Lion') {
            return new Lion();
        } else if (animalType == 'Cat') {
            return new Cat();
        } else if (animalType == 'Horse') {
            return new Horse();
        } else if (animalType == 'Alligator') {
            return new Alligator();
        } else if (animalType == 'Bear') {
            return new Bear();
        } else if (animalType == 'Cow') {
            return new Cow();
        } else if (animalType == 'Dog') {
            return new Dog();
        } else {
            throw new IllegalArgumentException('Unknown animal type: ' + animalType);
        }
    }
}
