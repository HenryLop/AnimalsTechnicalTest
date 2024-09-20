public class Alligator extends Animal {
    public override void makeNoise() {
        hiss();
    }

    public override void move() {
        hiss();
    }

    public override void swim() {
        doSwim();
    }

    public override void attack(){
        bite();
    }

    private void hiss() {
        // Hissing behavior
        System.debug('Alligator is hissing!');
    }

    private void doSwim() {
        // Swimming behavior
        System.debug('Alligator is swimming!');
    }

    private void bite(){
        // Attacking behaviour
        System.debug('The Alligator is Biting!');
    }
}
