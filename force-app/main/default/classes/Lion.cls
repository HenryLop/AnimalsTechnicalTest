public class Lion extends Animal {
    public override void makeNoise() {
        roar();
    }
    public override void move() {
        run();
    }

    public override void swim() {
        doSwim();
    }

    public override void attack(){
        rawr();
    }
    private void roar() {
        // Roaring behavior
        System.debug('Lion is roaring!');
    }

    private void run() {
        // Running behavior
        System.debug('Lion is running!');
    }

    private void doSwim() {
        // Swimming behavior
        System.debug('Lion is swimming!');
    }
    private void rawr(){
        // Attacking behaviour
        System.debug('The Lion is rawring!');
    }    
}
