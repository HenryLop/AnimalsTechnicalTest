// Dog.cls
public class Dog extends Animal {
    public override void makeNoise() {
        bark();
    }

    public override void move() {
        run();
    }

    public override void swim() {
        doSwim();
    }

    private void bark() {
        // Barking behavior
        System.debug('Dog is barking!');
    }

    private void run() {
        // Running behavior
        System.debug('Dog is running!');
    }

    private void doSwim() {
        // Swimming behavior
        System.debug('Dog is swimming!');
    }
}
