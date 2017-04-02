class Particles
{
  PVector _location, _velocity, _acceleration;
  float _lifeSpan;
  
  Particles(float x, float y, float z)
  {
    _location = new PVector(x, y, z);
    _velocity = new PVector(0,0,0);
    _acceleration = new PVector(0,0,0);
    
    
    _lifeSpan = 0;
  }
  
  void Display()
  { 
    Movement();
    noStroke();
    fill(_lifeSpan-40, _lifeSpan, _lifeSpan);
  
    System();

    _lifeSpan += random(0.1);
    
    _location.y -= 1;
  }
  
  void System()
  {
    translate(_location.x, _location.y, _location.z);
    box(1);
    translate(-_location.x, -_location.y, -_location.z);
  }
  
  void Movement()
  {
    _velocity.x = random(-0.1,0.1);
    _velocity.y = random(-0.1,0.1);
    _velocity.z = random(-0.1,0.1);
    
    _velocity.add(_acceleration);
    _location.add(_velocity);
  }
  
  boolean _isADead()
  {
    if (_lifeSpan > 255)
    {
      return true;
    }
    else
    {
    return false;
    }
  }
}