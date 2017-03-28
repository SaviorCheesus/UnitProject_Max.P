//Particle Systems
import queasycam.*;

int amountOfThings = 300;

ArrayList<Particles> particles;

QueasyCam cam;

void setup()
{
  fullScreen(P3D);
  particles = new ArrayList<Particles>();
  
  noCursor();
  cam = new QueasyCam(this);
  cam.speed = 3;
  cam.sensitivity = 1;
  perspective(PI/2.25, (float)width/height, 0.01, 10000);
  
  for(int i = 0; i < amountOfThings; i++)
  {
    particles.add(new Particles(0, 0, 0));
  }
  
}

void draw()
{
  background(255);
  for(int i = 0; i < amountOfThings; i ++)
  {
    Particles entity = particles.get(i);
    entity.Display();
  }
}