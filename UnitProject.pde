//Unit Project
import queasycam.*;

int amountOfThings = 300;
PVector pAcceleration, pVelocity, pPosition;
ArrayList<Particles> particles; ArrayList <Surfaces> surfaces;

QueasyCam cam;

void setup()
{
  fullScreen(P3D);
  particles = new ArrayList<Particles>();
  surfaces = new ArrayList<Surfaces>();
  
  noCursor();
  cam = new QueasyCam(this);
  cam.speed = 3;
  cam.sensitivity = 1;
  perspective(PI/2.25, (float)width/height, 0.01, 10000);
  
  for(int i = 0; i < amountOfThings; i++)
  {
    particles.add(new Particles(0, 0, 0));
  }
  
  for(int i = 0; i < 1; i++)
  {
    surfaces.add(new Surfaces(1, 100, 1, 1000, 50, 1000));
  }
  
  pAcceleration = new PVector(0, 0.1, 0);
  pVelocity = new PVector(1,1,1);
  pPosition = new PVector(1,1,1);
}

void draw()
{
  background(255);
  
  Controls();
  World();  
}

void Controls()
{
  if(keyPressed == true && key == ' ')
  {
    pAcceleration.y = pAcceleration.y * 0;
    pVelocity.y = pVelocity.y * 0;
    pAcceleration.y = -10;
  }
  else
  {
    pAcceleration.y = 1;
  }
   
  pVelocity.add(pAcceleration);
  pPosition.add(pVelocity);
  cam.position.y = pPosition.y; 
}

void World()
{
  for(int i = 0; i < amountOfThings; i ++)
  {
    Particles entity = particles.get(i);
    entity.Display();
  }
  
  stroke(1);
  fill(100);
  
  for (int i = 0; i < 1; i ++)
  {
    Surfaces entity = surfaces.get(i);
    entity.Display();
  }
}