//Unit Project
import queasycam.*;

float amountOfThings = 300, thing = 3.14;
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
  perspective(PI/thing, (float)width/height, 0.01, 10000);
  
  for(int i = 0; i < amountOfThings; i++)
  {
    particles.add(new Particles(random(-500,500),0,random(-500,500)));
  }
  
  color c1 = color(2, 32, 46);
  color c2 = color(1, 46, 62);
  color c3 = color(2, 40, 54);
  color c4 = color(23, 118, 105);
  
  surfaces.add(new Surfaces(0, 100, 0, 1000, 50, 1000, c1));
  surfaces.add(new Surfaces(0, -900, 475, 1000, 2000, 50, c2));
  surfaces.add(new Surfaces(0, -900, -475, 1000, 2000, 50, c2));
  surfaces.add(new Surfaces(475, -900, 0, 50, 2000, 1000, c3));
  surfaces.add(new Surfaces(-475, -900, 0, 50, 2000, 1000, c3));
  
  for (int i = 0; i < 3; i++)
  {
    surfaces.add(new Surfaces(0, i * -300, 375, 150, 150, 150, c4));
  }
 
  pAcceleration = new PVector(0, 0.1, 0);
  pVelocity = new PVector(1,1,1);
  pPosition = new PVector(1,1,1);
}

void draw()
{ 
  background(0);
  
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
  
  if (random(1) <= 1)
  {
    particles.add(new Particles (random(-500,500),0,random(-500,500)));
  }
  
  for(int i = 0; i < particles.size(); i++)
  {
    Particles entity = particles.get(i);
        
    if (entity._isADead())
    {
      particles.remove(i);
    }
    else
    {
   
    }
    
    entity.Display();
 
  }
  
  fill(100);
  
  for (int i = 0; i < surfaces.size(); i ++)
  {
    Surfaces entity = surfaces.get(i);
    entity.Display();
  }
}