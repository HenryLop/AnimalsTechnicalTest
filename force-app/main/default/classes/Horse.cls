// Horse.cls
public class Horse extends Animal {
    public override void makeNoise() {
        neigh();
    }

    public override void move() {
        slide();
    }

    public override void swim() {
        // Horses typically don't swim
        System.debug('Horse cannot swim.');
    }

    private void neigh() {
        // Neighing behavior
        System.debug('Horse is neighing!');
    }

    private void slide() {
        // Sliding behavior
        System.debug('Horse is sliding.');
    }
}
