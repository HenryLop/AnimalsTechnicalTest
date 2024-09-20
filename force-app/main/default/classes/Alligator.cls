// Alligator.cls
public class Alligator extends Animal {
    public override void makeNoise() {
        hiss();
    }

    public override void move() {
        hiss(); // Based on the original code
    }

    public override void swim() {
        doSwim();
    }

    private void hiss() {
        // Hissing behavior
        System.debug('Alligator is hissing!');
    }

    private void doSwim() {
        // Swimming behavior
        System.debug('Alligator is swimming!');
    }
}
