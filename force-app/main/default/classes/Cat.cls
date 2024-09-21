public class Cat extends Animal {
    public override void makeNoise() {
        meow();
    }

    public override void move() {
        walk();
    }

    public override void swim() {
        // Cats typically don't swim
        System.debug('Cat cannot swim.');
    }

    private void meow() {
        // Meowing behavior
        System.debug('Cat is meowing!');
    }

    private void walk() {
        // Walking behavior
        System.debug('Cat is walking.');
    }
}
