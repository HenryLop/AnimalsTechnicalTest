public class Bear extends Animal {
    public override void makeNoise() {
        growl();
    }

    public override void move() {
        walk();
    }

    public override void swim() {
        doSwim();
    }

    public override void attack(){
        useClaws();
    }

    private void growl() {
        // Growling behavior
        System.debug('Bear is growling!');
    }

    private void walk() {
        // Walking behavior
        System.debug('Bear is walking.');
    }

    private void doSwim() {
        // Swimming behavior
        System.debug('Bear is swimming!');
    }

    private void useClaws(){
        // Attacking behaviour
        System.debug('The Bear is scratching!');
    }
}
