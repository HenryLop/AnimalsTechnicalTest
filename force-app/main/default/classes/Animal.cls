public abstract class Animal {
    public abstract void makeNoise();
    public abstract void move();
    public abstract void swim();
    public virtual void attack(){} //For new complexity add method whose functionality is not universal
}
