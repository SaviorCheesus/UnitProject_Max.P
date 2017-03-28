class Particles
{
  PVector _location, _velocity, _acceleration;
  float _lifeSpan;
  
  Particles(float x, float y,float z)
  {
    _location = new PVector(x, y, z);
    _velocity = new PVector(0,0,0);
    _acceleration = new PVector(0,0, 0);
    
    
    _lifeSpan = 100;
  }
  
  void Display()
  { 
    Movement();
    
    fill(_lifeSpan);
    noStroke();
    
    if (_isAlive())
    {        
      translate(_location.x, _location.y, _location.z);
      box(1);
      translate(-_location.x, -_location.y, -_location.z);
    }
    else
    {
      
    }

    _lifeSpan += random(1);
  }
  
  void Movement()
  {
    //Physics
    _velocity.x = random(-0.1,0.1);
    _velocity.y = random(-0.1,0.1);
    _velocity.z = random(-0.1,0.1);
    
    _velocity.add(_acceleration);
    _location.add(_velocity);
  }
  
  boolean _isAlive()
  {
    if (_lifeSpan > 0)
    {
      return true;
    }
    return false;
  }
}