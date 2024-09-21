public class Cow extends Animal {
    public override void makeNoise() {
        moo();
    }

    public override void move() {
        walk();
    }

    public override void swim() {
        // Cows typically don't swim
        System.debug('Cow cannot swim.');
    }

    private void moo() {
        // Mooing behavior
        System.debug('Cow is mooing!');
    }

    private void walk() {
        // Walking behavior
        System.debug('Cow is walking.');
    }
}
