@isTest
public class AnimalTest {
    @isTest
    public static void testAnimals() {
        List<String> animalTypes = new List<String>{'Lion', 'Cat', 'Horse', 'Alligator', 'Bear', 'Cow', 'Dog'};
        for (String type : animalTypes) {
            Animal animal = AnimalFactory.createAnimal(type);
            System.debug('Animal Type: ' + type);
            animal.makeNoise();
            animal.move();
            animal.swim();
            animal.attack();
            System.debug('-----------------------');
        }
    }
}
